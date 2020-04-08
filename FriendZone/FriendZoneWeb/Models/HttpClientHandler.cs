using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using Newtonsoft.Json;

namespace FriendZoneWeb.Models
{
    public class HttpClientHandler<String> : IHttpClientHandler
    {
        private static readonly HttpClient Client = new HttpClient();
        /// <summary>
        /// For getting a single item from a web api uaing GET
        /// </summary>
        /// <param name="apiUrl">Added to the base address to make the full url of the 
        ///     api get method, e.g. "products/1" to get a product with an id of 1</param>
        /// <param name="cancellationToken"></param>
        /// <returns>The item requested</returns>
        public async Task<string> GetSingleItemRequest(string apiUrl, CancellationToken cancellationToken)
        {
            var result = default(string);
            var response = await Client.GetAsync(apiUrl, cancellationToken).ConfigureAwait(false);
            if (response.IsSuccessStatusCode)
            {
                await response.Content.ReadAsStringAsync().ContinueWith(x =>
                {
            
                        result = x.Result;
                    
                }, cancellationToken);
            }
            else
            {
                var content = await response.Content.ReadAsStringAsync();
                response.Content?.Dispose();
                throw new HttpRequestException($"{response.StatusCode}:{content}");
            }
            return result;
        }

        /// <summary>
        /// For getting multiple (or all) items from a web api using GET
        /// </summary>
        /// <param name="apiUrl">Added to the base address to make the full url of the 
        ///     api get method, e.g. "products?page=1" to get page 1 of the products</param>
        /// <param name="cancellationToken"></param>
        /// <returns>The items requested</returns>
        public async Task<string> GetAllRequest(string apiUrl)
        {
            string result = null;
            var response = await Client.GetAsync(apiUrl).ConfigureAwait(false);
            if (response.IsSuccessStatusCode)
            {
                await response.Content.ReadAsStringAsync().ContinueWith((Task<string> x) =>
                {
                    result = x.Result;
                });
            }
            else
            {
                var content = await response.Content.ReadAsStringAsync();
                response.Content?.Dispose();
                throw new HttpRequestException($"{response.StatusCode}:{content}");
            }
            return result;
        }

        /// <summary>
        /// For creating a new item over a web api using POST
        /// </summary>
        /// <param name="apiUrl">Added to the base address to make the full url of the 
        ///     api post method, e.g. "products" to add products</param>
        /// <param name="postObject">The object to be created</param>
        /// <param name="cancellationToken"></param>
        /// <returns>The item created</returns>
        public async Task<string> PostRequest(string apiUrl, string postObject)
        {
            string result = default(string);
            var json = new StringContent(postObject, System.Text.Encoding.UTF8, "application/json");
            json.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            var response = await Client.PostAsync(apiUrl, json).ConfigureAwait(false);
            if (response.IsSuccessStatusCode)
            {
                await response.Content.ReadAsStringAsync().ContinueWith((Task<string> x) =>
                {
                    result =x.Result;
                });
            }
            else
            {
                var content = await response.Content.ReadAsStringAsync();
                response.Content?.Dispose();
                throw new HttpRequestException($"{response.StatusCode}:{content}");
            }
            return result;
        }

        /// <summary>
        /// For updating an existing item over a web api using PUT
        /// </summary>
        /// <param name="apiUrl">Added to the base address to make the full url of the 
        ///     api put method, e.g. "products/3" to update product with id of 3</param>
        /// <param name="putObject">The object to be edited</param>
        /// <param name="cancellationToken"></param>
        public async Task PutRequest(string apiUrl, String putObject, CancellationToken cancellationToken)
        {
            var json = new StringContent(JsonConvert.SerializeObject(putObject), System.Text.Encoding.UTF8, "application/json");
            json.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            var response = await Client.PutAsync(apiUrl, json, cancellationToken).ConfigureAwait(false);
            if (!response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadAsStringAsync();
                response.Content?.Dispose();
                throw new HttpRequestException($"{response.StatusCode}:{content}");
            }
        }

        /// <summary>
        /// For deleting an existing item over a web api using DELETE
        /// </summary>
        /// <param name="apiUrl">Added to the base address to make the full url of the 
        ///     api delete method, e.g. "products/3" to delete product with id of 3</param>
        /// <param name="cancellationToken"></param>
        public async Task DeleteRequest(string apiUrl, CancellationToken cancellationToken)
        {
            var response = await Client.DeleteAsync(apiUrl, cancellationToken).ConfigureAwait(false);
            if (!response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadAsStringAsync();
                response.Content?.Dispose();
                throw new HttpRequestException($"{response.StatusCode}:{content}");
            }
        }

        Task<string> IHttpClientHandler.GetAllRequest(string apiUrl)
        {
            throw new NotImplementedException();
        }

       

        public Task PutRequest(string apiUrl, string putObject, CancellationToken token = default)
        {
            throw new NotImplementedException();
        }
    }

}