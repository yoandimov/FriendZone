using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FriendZoneData.Model
{
    [Table("commentaire")]
    public class Commentaire
    {
        [Key]
        [Column("commentaire_id")]
        public int commentaireId{ get; set; }

        [Column("user_id")]
        public int userId { get; set; }

        [Column("post_id")]
        public int postId { get; set; }

        [Column("tagged_user_id")]
        public int referenceId { get; set; }

        [Column("message")]
        public string message { get; set; }

        [Column("date_created")]
        public DateTime dateCreated { get; set; }

    }
}
