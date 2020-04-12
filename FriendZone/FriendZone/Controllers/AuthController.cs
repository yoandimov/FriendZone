using FriendZone.Models;
using FriendZoneData.Model;
using FriendZoneData.Services.InterfaceData;
using FriendZoneData.Services.SqlData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace FriendZone.Controllers
{
    public class AuthController : ApiController
    {
        static IUserData source;
        public AuthController()
        {
            source = new UserData();
        }
        [HttpPost]
        public bool SignUp([FromBody] User user)
        {
            if(user == null)
            {
                return false;
            } else {
                user.permision = Roles.USER_ROLE;
                return source.Add(user);

            }
        
        }

        [Authorize(Roles = Roles.ADMIN_ROLE)]
        [HttpPost]
        public bool SignUpAdmin([FromBody] User user)
        {
            if (user == null)
            {
                return false;
            }
            else
            {
                user.permision = Roles.ADMIN_ROLE;
                return source.Add(user);

            }

        }
    }
}
