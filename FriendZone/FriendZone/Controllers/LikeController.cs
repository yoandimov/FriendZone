using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using FriendZoneData.Services.SqlData;
using FriendZoneData.Model;
using FriendZoneData.Services.InterfaceData;

namespace FriendZone.Controllers
{
    public class LikeController : ApiController
    {
        ILikeData source;
        const string POST_TOTAL_LIKE = "likes";
        public LikeController()
        {
            source = new LikeData();
        }

        [HttpPost]
        public Boolean CreateLike([FromBody] Like like)
        {
            if (like != null)
            {
                
                return source.Add(like); ;
            }
            else
            {
                return false;
            }
        }

        [HttpGet]
        public IDictionary<string, int> GetTotalLikes(int id)
        {
            return new Dictionary<string, int>()
            {
                {POST_TOTAL_LIKE, source.getPostTotalLike(id)}
            };
        }

        [HttpGet]
        public Boolean DeleteLike(int postId, int userId)
        {
            return source.Delete(postId, userId);
        }

    }
}
