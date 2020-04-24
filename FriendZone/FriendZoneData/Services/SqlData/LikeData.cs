using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FriendZoneData.Services.InterfaceData;
using FriendZoneData.Model;

namespace FriendZoneData.Services.SqlData
{
    public class LikeData : ILikeData
    {
        private readonly FriendZoneDBContext db;

        public LikeData()
        {
            db = new FriendZoneDBContext();
        }

        public bool Add(Like l)
        {
            db.Likes.Add(l);
            return db.SaveChanges() >= 0;
        }

        public bool Delete(int postId, int userId)
        {

            Like l = Get(userId, postId);
            if (l != null)
            {
                db.Likes.Remove(l);
                return db.SaveChanges() >= 0;
            }
            else
            {
                return false;
            }
        }

        public Like Get(int UserId, int PostId)
        {
            return db.Likes.FirstOrDefault(l => l.PostId == PostId && l.UserId == UserId);
        }

        public int getPostTotalLike(int postId)
        {
            return db.Likes.Where(l => l.PostId == postId).Count();
        }
    }
}
