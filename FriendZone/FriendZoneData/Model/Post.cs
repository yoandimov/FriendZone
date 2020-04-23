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

        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        [DataType(DataType.Date)]
        [Column("date_created")]
        public DateTime DateCreated { get; set; }

        [Column("image")]
        public string Image { get; set; } 

        [Column("content")]
        public string Content { get; set; }
        public virtual ICollection<Commentaire> PostCommentaires { get; set; }

    }
}
