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
            identity.AddClaim(new Claim(ClaimTypes.Role, user.Permision));
            identity.AddClaim(new Claim(ClaimTypes.Name, user.Username));
            identity.AddClaim(new Claim(ClaimTypes.Email, user.Email));
            identity.AddClaim(new Claim(ClaimTypes.NameIdentifier, user.userId.ToString()));
            context.Validated(identity);


        }

        public static int getUserId()
        {
            var identity =(ClaimsIdentity) HttpContext.Current.User.Identity;
            return Int32.Parse(identity.Claims
                        .FirstOrDefault(c => c.Type == ClaimTypes.NameIdentifier).Value);

        }
    }
}