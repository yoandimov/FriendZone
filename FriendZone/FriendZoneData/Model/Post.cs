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

        [Column("title")]
        public string Title {get;set; }

        [Column("Username")]
        public string username { get; set; }

        [Column("profile_image")]
        public string profileImage { get; set; }

        [Column("date_created")]
        public string DateCreated { get; set; }

        [Column("image")]
        public string Image { get; set; } 

        [Column("content")]
        public string Content { get; set; }
        public virtual ICollection<Commentaire> PostCommentaires { get; set; }

    }
}
