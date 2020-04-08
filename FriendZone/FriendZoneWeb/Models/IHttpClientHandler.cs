using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace FriendZoneWeb.Models
{
    public interface IHttpClientHandler
    {
        Task<String> GetSingleItemRequest(string apiUrl, CancellationToken token = default(CancellationToken));
        Task<String> GetAllRequest(string apiUrl);
        Task<String> PostRequest(string apiUrl, string postObject);
        Task PutRequest(string apiUrl, String putObject, CancellationToken token = default(CancellationToken));
        Task DeleteRequest(string apiUrl, CancellationToken token = default(CancellationToken));
    }
}
