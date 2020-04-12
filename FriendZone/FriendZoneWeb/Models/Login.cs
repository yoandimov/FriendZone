using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FriendZoneWeb.Models
{
    public class Login
    {
        public string access_token { get; set; }

        public string token_type { get; set; }

        public string expires_in {get; set;}

        public string roles { get; set; }

        public string error { get; set;}

        public string error_description { get; set; }

        public const string INVALID_GRANT = "invalid_grant";
        public const string INVALID_CREDIDENTIAL = "Provided username and password is incorrect";
        public const string UNKNOWN_ERROR = "unknow error, please contact support";
        const string GRANT_TYPE_KEY = "grant_type";
        const string GRANT_TYPE_VALUE = "password";
        const string USERNAME_KEY = "username";
        const string PASSWORD_KEY = "password";

        public static Dictionary<string, string> getTokenRequestParams(string username, string password)
        {
            Dictionary<string, string> loginParams = new Dictionary<string, string>
            {
                {GRANT_TYPE_KEY, GRANT_TYPE_VALUE},
                {USERNAME_KEY, username },
                {PASSWORD_KEY, password }
            };
            return loginParams;
        }


    }
}