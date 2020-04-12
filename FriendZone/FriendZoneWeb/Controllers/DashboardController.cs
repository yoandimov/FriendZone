using FriendZoneData.Model;
using FriendZoneWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

using System.Web.Mvc;


namespace FriendZoneWeb.Controllers
{
    public class DashboardController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult RegisterAdmin()
        {
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> RegisterAdmin(User user)
        {
            if (user != null)
            {
                 var json = HttpClientUtility.JsonConverterClass<User>.ObjectToJsonString(user);

                string response = await HttpClientUtility.Post(ApiUrls.REGISTER_ADMIN_URL, json, Login.AuthorizationHeader());
            }
            return View();
        }
    }
}
