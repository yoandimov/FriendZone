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
    [Table("post")]
    public class Post
    {

        [Key]
        [Column("post_id")]
        public int PostId { get; set; }

        [Column("user_id")]
        public int UserId { get; set; }

        [Column("post_url")]
        public string PostUrl { get; set; }

        [Column("caption")]
        public string Caption { get; set; }
        

    }
}
