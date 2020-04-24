using Microsoft.Owin.Security.OAuth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using FriendZoneData.Services.InterfaceData;
using FriendZoneData.Services.SqlData;
using FriendZoneData.Model;
using System.Security.Claims;
using Microsoft.Owin.Security;

namespace FriendZone.Models
{
    public class AuthorizationServerProvider : OAuthAuthorizationServerProvider
    {
        const String INVALID_LOGIN_INFO_ERROR = "invalid_grant";
        const String INVALID_LOGIN_INFO_MESSAGE = "Provided username and password is incorrect";
        public override async Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            context.Validated();
        }

        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context) 
        {
            IUserData source = new UserData();

            var user = source.ValidateUser(context.UserName, context.Password);
            if (user == null)
            {
                context.SetError(INVALID_LOGIN_INFO_ERROR, INVALID_LOGIN_INFO_MESSAGE);
                return;
            }
            var identity = new ClaimsIdentity(context.Options.AuthenticationType);
            identity.AddClaim(new Claim(ClaimTypes.Role, user.permision));
            identity.AddClaim(new Claim(ClaimTypes.Name, user.username));
            identity.AddClaim(new Claim(ClaimTypes.Email, user.email));
            identity.AddClaim(new Claim(ClaimTypes.NameIdentifier, user.userId.ToString()));
            AuthenticationProperties properties = CreateProperties(user.permision);
            AuthenticationTicket ticket = new AuthenticationTicket(identity, properties);
            context.Validated(ticket);


        }

        public static int getUserId()
        {
            var identity =(ClaimsIdentity) HttpContext.Current.User.Identity;
            return Int32.Parse(identity.Claims
                        .FirstOrDefault(c => c.Type == ClaimTypes.NameIdentifier).Value);

        }

        public static AuthenticationProperties CreateProperties(string Roles)
        {
            IDictionary<string, string> data = new Dictionary<string, string>
        {
            {"roles",Roles}
        };
            return new AuthenticationProperties(data);
        }

        public override Task TokenEndpoint(OAuthTokenEndpointContext context)
        {
            foreach (KeyValuePair<string, string> property in context.Properties.Dictionary)
            {
                context.AdditionalResponseParameters.Add(property.Key, property.Value);
            }

            return Task.FromResult<object>(null);
        }
    }
}