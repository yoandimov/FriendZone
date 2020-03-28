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

        void Add(Post u);
        bool Update(Post u);

        bool Delete(int id);

        Post GetPostByUrl(string url);

    }
}
