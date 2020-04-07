using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FriendZoneWeb.Models
{
    public class Login
    {
        public String acces_token { get; set; }

        public string token_type { get; set; }

        public string expires_in {get; set;}

    }
}