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

namespace FriendZoneWeb.Controllers
{
    public class HomeController : Controller
    {
        //BaseApiUrl Pour faire le call
        readonly string apiBaseUrl = ConfigurationManager.AppSettings["ApiBaseUrl"];
        readonly HttpClientHandler<User> h;
        public HomeController()
        {
           h = new HttpClientHandler<User>();
        }
        
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
          

            return View();
        }

    

        public async Task<ActionResult> ListStudent()
        {
            try
            {
                string url = $"{apiBaseUrl}user/getStudents";
                IEnumerable<User> model = await h.GetAllRequest(url);
                return View(model);
            }
            catch (HttpRequestException e)
            {
                return View("Error", new HandleErrorInfo(e, "Home", "List"));
            }

        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}