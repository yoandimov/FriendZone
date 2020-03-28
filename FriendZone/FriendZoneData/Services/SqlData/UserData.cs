using FriendZoneData.Model;
using FriendZoneData.Services.InterfaceData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FriendZoneData.Services.SqlData
{
    public class UserData : IUserData
    {
        private readonly FriendZoneDBContext db;

        public UserData()
        {
            db = new FriendZoneDBContext();
        }

        public void Add(User u)
        {
            db.Users.Add(u);
            db.SaveChanges();
        }

        public bool Delete(int id)
        {

            User u = Get(id);
            if (u != null)
            {
                db.Users.Remove(u);
                return db.SaveChanges() >= 0;
            }
            else
                return false;

        }

        public User Get(int id)
        {
            return db.Users.FirstOrDefault(c => c.userId == id);
        }

        public List<User> GetAll()
        {
            return db.Users.ToList();
        }

        public List<Post> GetPostByUser(int userId)
        {
            return db.Users.FirstOrDefault(c => c.userId == userId).UserPost.ToList();
        }

        public bool Update(User u)
        {
            var entry = db.Entry(u);
            entry.State = System.Data.Entity.EntityState.Modified;
            return db.SaveChanges() >= 0;
        }
    }
}
