﻿using FriendZoneData.Model;
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
        public DbSet<Post> Posts { get; set; }
        public DbSet<Commentaire> Commentaires { get; set; }
        public DbSet<Like> Likes { get; set; }

  
    }
}
