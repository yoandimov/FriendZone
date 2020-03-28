using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using FriendZoneData.Model;
using FriendZoneData.Services.InterfaceData;

using FriendZoneData.Services.SqlData;

namespace FriendZone.Controllers
{

    public class UserController : ApiController
    {

        static IUserData source;

        public UserController()
        {

            source = new UserData();
        }

        [HttpGet]
        public IEnumerable<User> GetUsers()
        {
            return source.GetAll().ToList();
        }

        [HttpGet]
        public User getUser(int id)
        {
            return source.Get(id);
        }
        

        [HttpGet]
        public IEnumerable<Post> GetUserPost(int id)
        {
            return source.GetPostByUser(id);
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
        public Boolean DeleteUser(int id)
        {
            return source.Delete(id);
        }

        [HttpGet] 
           public int getNumberOfUsers()
        {
            return source.GetAll().ToList().Count();
        }        
    }
}
