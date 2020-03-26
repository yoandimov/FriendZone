using FriendZoneData.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FriendZoneData.Services.InterfaceData
{
    public interface IUserData
    {
        List<User> GetAll();
        User Get(int id);

        void Add(User u);
        bool Update(User u);

        bool Delete(int id);

        List<Post> GetPostByUser(int userId);
    }
}
