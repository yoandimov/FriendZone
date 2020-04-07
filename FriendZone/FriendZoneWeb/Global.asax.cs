using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace FriendZoneWeb
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }


        protected void Application_AuthenticateRequest(Object sender, EventArgs e)
        {
            const string LOGIN_PATH = "/auth/login";
            string urlR = HttpContext.Current.Request.RawUrl;
            string url = HttpContext.Current.Request.Path;
            if (!LOGIN_PATH.Equals(url))
            {
                Response.Redirect(LOGIN_PATH, true);
                Response.End();
                return;
            }
           
        }



    }
}
