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
        static IStudentData sourceS;

        public UserController()
        {
            source = new SqlUserData();
            sourceS = new SqlStudentData();
        }

        [HttpGet]
        public IEnumerable<User> Get()
        {
            return source.GetAll().ToList();
        }

        [HttpGet]
        public IEnumerable<Student> GetStudents()
        {
            return sourceS.GetAll().ToList();
        }
    }
}
