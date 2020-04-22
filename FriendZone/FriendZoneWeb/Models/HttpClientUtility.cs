using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using Newtonsoft.Json;

namespace FriendZoneWeb.Models
{
    public class HttpClientUtility
    {
        private static readonly HttpClient _Client = new HttpClient();
        //private static JsonConverter = new JsonConverter();

     /*
        public static async Task<string> Run(string relativePath, string json)
        {
            string url = ConfigurationManager.AppSettings["ApiBaseUrl"] + relativePath;

            var response = await Request(HttpMethod.Post, url, json, new Dictionary<string, string>());
            string responseText = await response.Content.ReadAsStringAsync();


            Console.WriteLine(responseText);
            Console.ReadLine();
            return responseText;
        }
        */
        public static string objectToJsonString(object arr)
        {
            return JsonConvert.SerializeObject(arr);
        }

        public static async Task<string> Get(string relativePath, Dictionary<string, string> pHeaders = null)
        {
            string url = ConfigurationManager.AppSettings["ApiBaseUrl"] + relativePath;
            var response = await Request(HttpMethod.Get, url, pHeaders: pHeaders);
            string responseText = await response.Content.ReadAsStringAsync();
            return responseText;
        }


        public static async Task<string> Post(string relativePath, string json, Dictionary<string, string> pHeaders = null)
        {
            string url = ConfigurationManager.AppSettings["ApiBaseUrl"] + relativePath;
            var response = await Request(HttpMethod.Post, url, pHeaders, json);
            string responseText = await response.Content.ReadAsStringAsync();
            return responseText;
        }

        // Convert json to object T is the object Type
        public class JsonConverterClass<T>
        {
            public static string ObjectToJsonString(T arr)
            {
                return JsonConvert.SerializeObject(arr);
            }

            public static T JsonToObject(string json)
            {
                return JsonConvert.DeserializeObject<T>(json);
            }

        }


        /// <summary>
        /// Makes an async HTTP Request
        /// </summary>
        /// <param name="pMethod">Those methods you know: GET, POST, HEAD, etc...</param>
        /// <param name="pUrl">Very predictable...</param>
        /// <param name="pJsonContent">String data to POST on the server</param>
        /// <param name="pHeaders">If you use some kind of Authorization you should use this</param>
        /// <returns></returns>
        public static async Task<HttpResponseMessage> Request(HttpMethod pMethod, string pUrl, Dictionary<string, string> pHeaders, string pJsonContent = null)
        {
            var httpRequestMessage = new HttpRequestMessage();
            httpRequestMessage.Method = pMethod;
            httpRequestMessage.RequestUri = new Uri(pUrl);
            if (pHeaders != null)
            {
                foreach (var head in pHeaders)
                {
                    httpRequestMessage.Headers.Add(head.Key, head.Value);
                }
            }
            switch (pMethod.Method)
            {
                case "POST":
                    HttpContent httpContent = new FormUrlEncodedContent(
                        JsonConverterClass<Dictionary<string,string>>.JsonToObject(pJsonContent)
                        );
                     httpRequestMessage.Content = httpContent;
                    break;
         

            }

            return await _Client.SendAsync(httpRequestMessage);
        }
    }

}