using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace FriendZoneData.Model
{
    [Table("user")]
    public class User
    {
        [Key]
        public int user_id { get; set; }
        
        public string email { get; set; }

        public string username { get; set; }

        public string password { get; set; }

        public string first_name { get; set; }

        public string last_name { get; set; }

        public string gender { get; set; }

        public string city { get; set; }

        public string country { get; set; }

        public string profile_picture_url { get; set; }

        public string description { get; set; }


        
    }
}
