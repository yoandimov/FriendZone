using FriendZoneData.Model;
using FriendZoneData.Services.InterfaceData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FriendZoneData.Services.SqlData
{
    public class CommentaireData : ICommentaire
    {
        private readonly FriendZoneDBContext db;

        public CommentaireData()
        {
            db = new FriendZoneDBContext();
        }

        public void Add(Commentaire c)
        {
            db.Commentaires.Add(c);
            db.SaveChanges();
        }

        public bool Delete(int id)
        {
            Commentaire c = Get(id);
            if (c != null)
            {
                db.Commentaires.Remove(c);
                return db.SaveChanges() >= 0;
            }
            else
                return false;

        }

        public Commentaire Get(int id)
        {
            return db.Commentaires.FirstOrDefault(c => c.userId == id);
        }

        public List<Commentaire> GetAll()
        {
            return db.Commentaires.ToList();
        }

        public List<Commentaire> GetCommentairesByPost(int id)
        {
            return db.Posts.FirstOrDefault(p => p.PostId == id).PostCommentaires.ToList();
        }

        public bool Update(Commentaire c)
        {
            var entry = db.Entry(c);
            entry.State = System.Data.Entity.EntityState.Modified;
            return db.SaveChanges() >= 0;
        }
    }
}
