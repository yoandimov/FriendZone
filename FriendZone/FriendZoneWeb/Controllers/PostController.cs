using FriendZoneData.Model;
using FriendZoneWeb.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace FriendZoneWeb.Controllers
{
    public class PostController : Controller
    {
        // GET: Post
        public async Task<ActionResult>  Index()
        {
            var response = await HttpClientUtility.Get(ApiUrls.ALL_POSTS_URL);
            List<Post> model = HttpClientUtility.JsonConverterClass<List<Post>>.JsonToObject(response);
            return View(model);
        }

        // GET: Post/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Post/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Post/Create
        [HttpPost]
        public async Task<ActionResult> Create(Post post)
        {
            try
            {
                // TODO: Add insert logic here
                var file = Request.Files["ImageFile"];
                MemoryStream ms = new MemoryStream();
               
                file.InputStream.CopyTo(ms);
                byte[] bytes = ms.ToArray();
                string b64 = Convert.ToBase64String(bytes);
                post.Image = b64;
                string json = HttpClientUtility.JsonConverterClass<Post>.ObjectToJsonString(post);
                string response = await HttpClientUtility.Post(ApiUrls.CREATE_POST_URL, json, Login.AuthorizationHeader(), false);
                
                return View();
            }
            catch(Exception e)
            {

                return View();
            }
        }

        // GET: Post/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            var response = await HttpClientUtility.Get($"{ApiUrls.GET_POST_URL}{id}");
            Post model = HttpClientUtility.JsonConverterClass<Post>.JsonToObject(response);
            return View(model);
        }

        // POST: Post/Edit/5
        [HttpPost]
        public async Task<ActionResult> Edit(int id, Post post)
        {
            try
            {

                var file = Request.Files["ImageFile"];
                if (file != null)
                {
                    MemoryStream ms = new MemoryStream();

                    file.InputStream.CopyTo(ms);
                    byte[] bytes = ms.ToArray();
                    string b64 = Convert.ToBase64String(bytes);
                    post.Image = b64;
                }

                string json = HttpClientUtility.JsonConverterClass<Post>.ObjectToJsonString(post);
                string response = await HttpClientUtility.Post(ApiUrls.EDIT_POST_URL, json, Login.AuthorizationHeader(), false);
                // return RedirectToAction("Index");
                return View(post);
            }
            catch
            {
                return View(post);
            }
        }

        // GET: Post/Delete/5
        public async Task<ActionResult> Delete(int id)
        {
            string res = await  HttpClientUtility.Get($"{ApiUrls.DELETE_POST_URL}{id}", Login.AuthorizationHeader());
            return Json(new { response=res}, JsonRequestBehavior.AllowGet);
        }

        // POST: Post/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
