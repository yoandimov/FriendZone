using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FriendZoneData.Model
{
    [Table("student")]
    public class Student
    {
        [Key]
        public int student_id { get; set; }
       
        public string first_name { get; set; }

        public string last_name { get; set; }

        public string gender { get; set; }

        public string school { get; set; }
    }
}
