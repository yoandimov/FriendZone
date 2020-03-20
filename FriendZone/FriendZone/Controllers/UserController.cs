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
    
        static IStudentData source;

        public UserController()
        {

            source = new SqlStudentData();
        }


        [HttpGet]
        public IEnumerable<Student> GetStudents()
        {
            return source.GetAll().ToList();
        }
    }
}
