using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FriendZoneWeb.Models
{
    public class ApiUrls
    {
        public const string LOGIN_TOKEN_URL = "login/getToken";

        public const string REGISTER_ADMIN_URL = "api/auth/SignUpAdmin";

        public const string ALL_POSTS_URL = "api/post/getall";

        public const string DELETE_POST_URL = "api/post/AdminDelete/";

        public const string CREATE_POST_URL = "api/post/AdminCreate";

        public const string GET_POST_URL = "api/post/get/";

        public const string EDIT_POST_URL = "api/post/AdminUpdate";
    }
}