using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Runtime.Remoting.Contexts;
using System.Security.Claims;
using System.Web;
using System.Web.Http;
using FriendZone.Models;
using FriendZoneData.Model;
using FriendZoneData.Services.InterfaceData;

using FriendZoneData.Services.SqlData;

namespace FriendZone.Controllers
{
    [Authorize]
    public class UserController : ApiController
    {

        static IUserData source;

        public UserController()
        {

            source = new UserData();
        }

        [Authorize(Roles = Roles.ADMIN_ROLE)]
        [HttpGet]
        public IEnumerable<User> GetUsers()
        {
            return source.GetAll().ToList();
        }

        [HttpGet]
        public User getUser()
        {
            return source.Get(AuthorizationServerProvider.getUserId());
        }

        [Authorize(Roles = Roles.ADMIN_ROLE)]
        [HttpGet]
        public User getUser(int id)
        {
            return source.Get(id);
        }



        [Authorize(Roles = Roles.ADMIN_ROLE)]
        [HttpGet]
        public IEnumerable<Post> GetUserPost(int id)
        {
            return source.GetPostByUser(id);
        }


        [HttpGet]
        public IEnumerable<Post> GetUserPost()
        {
            return source.GetPostByUser(AuthorizationServerProvider.getUserId());
        }


        [HttpPost]
        public Boolean CreateUser([FromBody] User user)
        {
            if (user != null)
            {
                source.Add(user);
                return true;
            }
            else
            {
                return false;
            }
        }

        [Authorize(Roles = Roles.ADMIN_ROLE)]
        [HttpPost]
        public Boolean UpdateUser([FromBody] User user)
        {
            if (user != null)
            {
                source.Update(user);
                return true;
            }
            else
            {
                return false;
            }
        }

        [HttpPost]
        public Boolean UpdateProfile([FromBody] User user)
        {
            if(user.userId != AuthorizationServerProvider.getUserId())
            {
                return false;
            }
            if (user != null)
            {
                user.permision = Roles.USER_ROLE;
               
                return source.Update(user);
            }
            else
            {
                return false;
            }
        }

        [Authorize(Roles = Roles.ADMIN_ROLE)]
        [HttpPost]
        public Boolean DeleteUser(int id)
        {
            return source.Delete(id);
        }

        [HttpPost]
        public Boolean DeleteUser()
        {
            return source.Delete(AuthorizationServerProvider.getUserId());
        }


        [HttpGet] 
        public int getNumberOfUsers()
        {
            return source.GetAll().ToList().Count();
        }        
    }
}
