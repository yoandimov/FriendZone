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
        public const String ADMIN_ROLE = "ADMIN";
        readonly string apiBaseUrl = ConfigurationManager.AppSettings["ApiBaseUrl"];

        public AuthController()
        {
        }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public async Task<ActionResult> Login(string username, string password)
        {
          
            try
            {

               Dictionary<string, string> loginParams = FriendZoneWeb.Models.Login.getTokenRequestParams(username, password);
               string json = HttpClientUtility.JsonConverterClass<Dictionary<string, string>>.ObjectToJsonString(loginParams);
               string response = await HttpClientUtility.Post(ApiUrls.LOGIN_TOKEN_URL, json);
               Login res = HttpClientUtility.JsonConverterClass<Login>.JsonToObject(response);
                System.Diagnostics.Debug.WriteLine(res.roles);
                if (ADMIN_ROLE == res.roles)
                {
                    this.Session["AccessToken"] = res.access_token;
                    this.Session.Timeout = 120;
                    return RedirectToAction("index", "dashboard");
                } else
                {
                    if(Models.Login.INVALID_GRANT == res.error)
                    {
                        return View(model: Models.Login.INVALID_CREDIDENTIAL);
                    }
                    else
                    {
                        return View(model:Models.Login.UNKNOWN_ERROR);
                    }
                }

            }
            catch (HttpRequestException e)
            {
                return View(model: Models.Login.UNKNOWN_ERROR);
            }
          
        }
    }
}
