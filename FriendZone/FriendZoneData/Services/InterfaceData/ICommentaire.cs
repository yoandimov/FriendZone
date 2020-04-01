using FriendZoneData.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FriendZoneData.Services.InterfaceData
{
    public interface ICommentaire
    {
        List<Commentaire> GetAll();
        Commentaire Get(int id);
        void Add(Commentaire c);
        bool Update(Commentaire c);
        bool AdminDelete(int id);
        bool Delete(int userId, int id);
        List<Commentaire> GetCommentairesByPost(int id);
    }
}
