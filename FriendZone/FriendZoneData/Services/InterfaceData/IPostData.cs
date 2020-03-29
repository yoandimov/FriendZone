using FriendZoneData.Model;
using System;
using System.Collections.Generic;
using System.Linq;

using System.Text;
using System.Threading.Tasks;

namespace FriendZoneData.Services.InterfaceData
{
    public interface IPostData
    {
            
        IEnumerable<Post> GetAll();
        Post Get(int id);

        void Add(Post p);
        bool Update(Post p);

        bool Delete(int id);

        Post GetPostByUrl(string url);


    }
}
