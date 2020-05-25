using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace PP_Desktop.Services
{
    public class Database
    {
        public const string HOST = "https://localhost:44364/api/";
        public const string JSONMEDIATYPE = "application/json";

        public static async Task PostRequestAsync(string path, Object objectclass)
        {
            var client = new HttpClient();
            var json = JsonConvert.SerializeObject(objectclass, new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Ignore
            });

            HttpContent content = new StringContent(json, Encoding.UTF8, JSONMEDIATYPE);

            var response = await client.PostAsync(HOST + path, content);
        }

        public static HttpResponseMessage GetRequestAsync(string path)
        {
            var client = new HttpClient();

            var response = client.GetAsync(HOST + path);
            var statusCode = response.Result;

            return statusCode;
        }
    }
}
