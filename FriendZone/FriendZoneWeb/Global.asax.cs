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
      
            
           
        }

        protected void Application_AcquireRequestState(object sender, EventArgs e)
        {
            const string LOGIN_PATH = "/auth/login";
            const string lOGIN = "login";
            string urlR = HttpContext.Current.Request.RawUrl;
            string url = HttpContext.Current.Request.Path;
            if (!url.EndsWith(lOGIN))
            {
                if (this.Session["AccessToken"] == null)
                {
                    Response.Redirect(LOGIN_PATH, true);
                    Response.End();
                    return;
                }
                
            }

        }



    }
}
