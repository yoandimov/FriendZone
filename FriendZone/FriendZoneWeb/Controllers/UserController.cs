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
    public class UserController : Controller
    {
        // GET: User
        public async Task<ActionResult> Index()
        {
            var response = await HttpClientUtility.Get(ApiUrls.ALL_USERS_URL, Login.AuthorizationHeader());
            IEnumerable<User> model = HttpClientUtility.JsonConverterClass<List<User>>.JsonToObject(response);
            return View(model);
        }

        // GET: User/Create
        public ActionResult Create()
        {
            return View();
        }

        // USER: USER/Create
        [HttpPost]
        public async Task<ActionResult> Create(User user)
        {
            try
            {
                string json = HttpClientUtility.JsonConverterClass<User>.ObjectToJsonString(user);
                string response = await HttpClientUtility.Post(ApiUrls.CREATE_USER_URL, json, Login.AuthorizationHeader(), false);
                if(response == "true" ) { 
                return View();
                  }
                else
                {
                    return View("NotFound");
                }
            } 
            catch (Exception e)
            {
                return View();
            }
        }

        // GET: User/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            var response = await HttpClientUtility.Get($"{ApiUrls.GET_USER_URL}{id}", Login.AuthorizationHeader());
            User model = HttpClientUtility.JsonConverterClass<User>.JsonToObject(response);
            return View(model);
        }

        // USER: User/Edit/5
        [HttpPost]
        public async Task<ActionResult> Edit(int id, User user)
        {
            try
            {
                string json = HttpClientUtility.JsonConverterClass<User>.ObjectToJsonString(user);
                string response = await HttpClientUtility.Post(ApiUrls.EDIT_USER_URL, json, Login.AuthorizationHeader(), false);
                // return RedirectToAction("Index");
                return RedirectToAction("Index");
            }
            catch
            {
                return View(user);
            }
        }

        // GET: Post/Delete/5
        public async Task<ActionResult> Delete(int id)
        {
            string res = await HttpClientUtility.Get($"{ApiUrls.DELETE_USER_URL}{id}", Login.AuthorizationHeader());
            return RedirectToAction("Index");
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