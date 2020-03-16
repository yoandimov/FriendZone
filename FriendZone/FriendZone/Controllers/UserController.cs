using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using FriendZoneData.Model;
using FriendZoneData.Services;

namespace FriendZone.Controllers
{
    
    public class UserController : ApiController
    {
        static IUserData source;

        public UserController()
        {
            source = new SqlUserData();
        }

        [HttpGet]
        public IEnumerable<User> Get()
        {
            return source.GetAll().ToList();
        }
    }
}
