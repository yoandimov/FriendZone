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
        public String LirstName { get; set; }

        [Column("last_name")]
        public String LastName { get; set; }

        [Column("city")]
        public String City { get; set; }

        [Column("gender")]
        public string Gender { get; set; }

        [Column("country")]
        public string Country { get; set; }

        [Column("description")]
        public string Description { get; set; }

        [Column("profile_image")]
        public string ProfileImage { get; set; }

        [Column("Username")]
        public string Username { get; set; }

        [Column("password")]
        public string Password { get; set; }

        [Column("email")]
        public string Email { get; set; }

        [Column("permision")]
        public string Permision { get; set; }
        public virtual ICollection<Post> UserPost { get; set; }
   

    }
}

