using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FriendZoneData.Model
{
    [Table("like")]
    public class Like
    {

        [Key]
        [Column("user_id", Order = 0)]
        public int UserId { get; set; }

        [Key]
        [Column("post_id", Order = 1)]
        public int PostId { get; set; }
    }
}
