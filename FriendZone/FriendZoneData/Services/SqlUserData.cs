using FriendZoneData.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FriendZoneData.Services
{
    public class SqlUserData : IUserData
    {
        private readonly FriendZoneDBContext db;

        public SqlUserData()
        {
            db = new FriendZoneDBContext();
        }
        public IEnumerable<User> GetAll()
        {
            return db.Users;
        }

        public User Get(int id)
        {
            return db.Users.FirstOrDefault(it => it.user_id == id);
        }

        public void Add(User u)
        {
            db.Users.Add(u);
            db.SaveChanges();
        }

        public bool Update(User u)
        {
            var entry = db.Entry(u);
            entry.State = System.Data.Entity.EntityState.Modified;
            return db.SaveChanges() >= 0;
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




    }
}
