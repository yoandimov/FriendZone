using FriendZoneData.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FriendZoneData.Services
{
    class FriendZoneDBContext : DbContext
    {
        public DbSet<User> Users { get; set; }

        public DbSet<Student> Students { get; set; }

    }
}
