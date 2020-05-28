using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace PP_Desktop.Services
{
    public class Requests
    {
        public const string HOST = "http://localhost:59893/api/";

        //Mycket möjligt att vi inte kommer att ha det såhär!

        public static async Task<HttpResponseMessage> PostRequestAsync(string path, Object objectclass)
        {
            var client = new HttpClient();
            var json = JsonConvert.SerializeObject(objectclass, new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Ignore
            });

            HttpContent content = new StringContent(json, Encoding.UTF8, "application/json");

            var response = await client.PostAsync(HOST + path, content);

            return response;
        }

        public static string GetRequest(string path)
        {
            var client = new HttpClient();

            var response = client.GetAsync(HOST + path);
            var statusCode = response.Result;

            string result = statusCode.Content.ReadAsStringAsync().Result;

            return result;
        }
    }
}
