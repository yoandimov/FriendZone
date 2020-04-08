using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using FriendZoneWeb.Models;
using FriendZoneData.Model;
using System.Web.Mvc;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace FriendZoneWeb.Controllers
{
    public class AuthController : Controller
    {
        readonly string apiBaseUrl = ConfigurationManager.AppSettings["ApiBaseUrl"];
        readonly HttpClientHandler<Login> h;

        public AuthController()
        {
            h = new HttpClientHandler<Login>();
        }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public async Task<ActionResult> Login(string username, string password)
        {
            const string GRANT_TYPE_KEY = "grant_type";
            const string GRANT_TYPE_VALUE = "password";
            const string USERNAME_KEY = "username";
            const string PASSWORD_KEY = "password";

            Dictionary<string, string> loginParams = new Dictionary<string, string>
            {
                {GRANT_TYPE_KEY, GRANT_TYPE_VALUE},
                {USERNAME_KEY, username },
                {PASSWORD_KEY, password }
            };
            
            try
            {
               
               string url = $"{apiBaseUrl}login/getToken";
                string str = JsonConvert.SerializeObject(loginParams);
                string ser = await h.PostRequest(url, str);
                Login login = JsonConvert.DeserializeObject<Login>(ser);
                return View();
            }
            catch (HttpRequestException e)
            {

                return View("Error", new HandleErrorInfo(e, "Home", "List"));
            }
          
        }
    }
}
