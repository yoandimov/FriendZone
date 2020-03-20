using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace FriendZoneWeb.Models
{
    public interface IHttpClientHandler<T>
    {
        Task<T> GetSingleItemRequest(string apiUrl, CancellationToken token = default(CancellationToken));
        Task<T[]> GetAllRequest(string apiUrl);
        Task<T> PostRequest(string apiUrl, T postObject, CancellationToken token = default(CancellationToken));
        Task PutRequest(string apiUrl, T putObject, CancellationToken token = default(CancellationToken));
        Task DeleteRequest(string apiUrl, CancellationToken token = default(CancellationToken));
    }
}
