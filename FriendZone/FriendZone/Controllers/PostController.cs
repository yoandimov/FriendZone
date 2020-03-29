using FriendZoneData.Services.InterfaceData;
using System;
using FriendZoneData.Services.SqlData;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using FriendZoneData.Model;

namespace FriendZone.Controllers
{
    public class PostController : ApiController
    {
        IPostData source;
       
        public PostController()
        {
            source = new PostData();
        }

 


        [HttpPost]
        public void Create([FromBody] Post post)
        {
            source.Add(post);
        }

        [HttpPost]
        public  bool update([FromBody] Post post)
        {
            return source.Update(post);
        }

        [HttpGet]
        public bool Delete(int id)
        {
            return source.Delete(id);

        }

        [HttpGet]
        public Post getPostByUrl(string url)
        {
            return source.GetPostByUrl(url);
        }

        public Post Get(int id)
        {
            return source.Get(id);
        }

        public IEnumerable<Post> GetAll()
        {
            return source.GetAll().ToList();
        }

       

    }
}
