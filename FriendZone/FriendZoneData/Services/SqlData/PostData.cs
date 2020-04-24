using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FriendZoneData.Services.InterfaceData;
using System.Threading.Tasks;
using FriendZoneData.Model;

namespace FriendZoneData.Services.SqlData
{
    public class PostData : IPostData
    {

        private readonly FriendZoneDBContext db;

        public PostData()
        {
            db = new FriendZoneDBContext();
        }

        public void Add(Post p)
        {
            db.Posts.Add(p);
            db.SaveChanges();
        }

        public bool Delete(int id)
        {
            Post p = Get(id);
            if (p != null)
            {
                db.Posts.Remove(p);
                return db.SaveChanges() >= 0;
            }
            else
            {
                return false;
            }
        }

        public bool DeleteUserPost(int userId, int postId)
        {
            Post p = Get(postId);
            if(userId != p.UserId)
            {
                return false;
            }

            if (p != null)
            {
                db.Posts.Remove(p);
                return db.SaveChanges() >= 0;
            }
            else
            {
                return false;
            }
        }

        public Post Get(int id)
        {
            return db.Posts.FirstOrDefault(c => c.PostId == id);
        }

        public IEnumerable<Post> GetAll()
        {
            return db.Posts;
        }

    

        public int GetPostTotalCommentaire(int postId)
        {
            return db.Posts.FirstOrDefault(p => p.PostId == postId).PostCommentaires.Count();
        }

        public bool Update(Post p)
        {
            var entry = db.Entry(p);
            entry.State = System.Data.Entity.EntityState.Modified;
            return db.SaveChanges() >= 0;
        }
    }
}
