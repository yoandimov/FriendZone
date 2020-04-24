using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FriendZoneData.Model;
using System.Threading.Tasks;

namespace FriendZoneData.Services.InterfaceData
{
    public interface ILikeData
    {
        bool Add(Like l);

        Like Get(int UserId, int PostId);
        int getPostTotalLike(int postId);

        bool Delete(int postId, int userId);
    }
}
