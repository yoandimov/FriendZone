using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using FriendZoneData.Model;
using FriendZoneData.Services;
using FriendZoneData.Services.InterfaceData;
using FriendZoneData.Services.SqlData;

namespace FriendZone.Controllers
{
    public class CommentaireController : ApiController
    {
        static ICommentaire source;

        public CommentaireController()
        {
            source = new CommentaireData();
        }

        [HttpGet]
        public IEnumerable<Commentaire> GetCommentaires()
        {
            return source.GetAll().ToList();
        }

        [HttpGet]
        public Commentaire getCommentaire(int id)
        {
            return source.Get(id);
        }

        [HttpPost]
        public Boolean CreateCommentaire([FromBody] Commentaire commentaire)
        {
            if (commentaire != null)
            {
                source.Add(commentaire);
                return true;
            }
            else
            {
                return false;
            }
        }

        [HttpPost]
        public Boolean UpdateCommentaire([FromBody] Commentaire commentaire)
        {
            if (commentaire != null)
            {
                source.Update(commentaire);
                return true;
            }
            else
            {
                return false;
            }
        }

        [HttpPost]
        public Boolean DeleteCommentaire(int id)
        {
            return source.Delete(id);
        }

        [HttpGet]
        public IEnumerable<Commentaire> GetCommentairesByPost(int id)
        {
            return source.GetCommentairesByPost(id);
        }
    }

}