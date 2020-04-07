using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FriendZoneData.Model
{
    [JsonObject(IsReference = true)]
    [Table("user")]
    public class User
    {
        [Key]
        [Column("user_id")]
        public int userId { get; set; }

        [Column("first_name")]
        public String firstName { get; set; }

        [Column("last_name")]
        public String lastName { get; set; }

        [Column("city")]
        public String city { get; set; }

        [Column("gender")]
        public string gender { get; set; }

        [Column("country")]
        public string country { get; set; }

        [Column("description")]
        public string description { get; set; }

        [Column("profile_image")]
        public string profileImage { get; set; }

        [Column("Username")]
        public string username { get; set; }

        [Column("password")]
        public string password { get; set; }

        [Column("email")]
        public string email { get; set; }

        [Column("permision")]
        public string permision { get; set; }
        public virtual ICollection<Post> userPost { get; set; }
   

    }
}

