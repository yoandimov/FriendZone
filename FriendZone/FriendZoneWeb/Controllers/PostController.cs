using FriendZoneData.Model;
using FriendZoneWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace FriendZoneWeb.Controllers
{
    public class PostController : Controller
    {
        // GET: Post
        public async Task<ActionResult>  ()
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
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Post/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Post/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
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
