﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace PPMobile.Services
{
    public class APIServices
    {
        private const string HOST = "http://10.0.2.2:59893/api/";
        public static async Task PostRequestAsync(string path, Object objectclass)
        {
            var client = new HttpClient();
            var json = JsonConvert.SerializeObject(objectclass, new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Ignore
            });

            HttpContent content = new StringContent(json, Encoding.UTF8, "application/json");

            var response = await client.PostAsync(HOST + path, content);
        }

        public static string GetRequest(string path, string source)
        {
            var client = new HttpClient();

            var response = client.GetAsync(HOST + path + source);
            var statusCode = response.Result;

            string result = statusCode.Content.ReadAsStringAsync().Result;

            return result;
        }
        public static string GetRequest(string path)
        {
            var client = new HttpClient();

            var response = client.GetAsync(HOST + path);
            var statusCode = response.Result;

            string result = statusCode.Content.ReadAsStringAsync().Result;

            return result;
        }

        public static async Task PutRequestAsync(string path, Object objectclass)
        {
            var client = new HttpClient();
            var json = JsonConvert.SerializeObject(objectclass, new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Ignore
            });

            HttpContent content = new StringContent(json, Encoding.UTF8, "application/json");

            var response = await client.PutAsync(HOST + path, content);
        }
    }
}
