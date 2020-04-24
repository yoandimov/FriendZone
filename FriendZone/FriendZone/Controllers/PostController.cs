using FriendZoneData.Services.InterfaceData;
using System;
using FriendZoneData.Services.SqlData;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using FriendZoneData.Model;
using FriendZone.Models;

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
            post.UserId = AuthorizationServerProvider.getUserId();
            source.Add(post);
        }

        [Authorize(Roles = Roles.ADMIN_ROLE)]
        [HttpPost]
        public void AdminCreate([FromBody] Post post)
        {
            source.Add(post);
        }

        [Authorize(Roles = Roles.ADMIN_ROLE)]
        [HttpPost]
        public  bool AdminUpdate([FromBody] Post post)
        {
            return source.Update(post);
        }

        [HttpPost]
        public bool update([FromBody] Post post)
        {
            if(post.UserId == AuthorizationServerProvider.getUserId())
            {
                return false;
            }
            return source.Update(post);
        }

        [Authorize(Roles = Roles.ADMIN_ROLE)]
        [HttpGet]
        public bool AdminDelete(int id)
        {
            return source.Delete(id);

        }

        [HttpGet]
        public bool Delete(int id)
        {
            return source.DeleteUserPost(AuthorizationServerProvider.getUserId(),id);
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
