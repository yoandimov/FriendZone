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
    
    public class HomeController : Controller
    {
        //BaseApiUrl Pour faire le call
        readonly string apiBaseUrl = ConfigurationManager.AppSettings["ApiBaseUrl"];
        public HomeController()
        {

        }
        
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
          

            return View();
        }

    
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}