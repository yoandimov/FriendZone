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
        public IEnumerable<Post> GetUserPost(int id)
        {
            return source.GetPostByUser(id);
        }
    }
}
