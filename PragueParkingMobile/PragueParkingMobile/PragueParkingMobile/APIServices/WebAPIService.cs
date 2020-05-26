using Newtonsoft.Json;
using PPMobile.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace PPMobile.APIServices
{
    class WebAPIService
    {
        public async void GetDataAsync()
        {
            HttpClient client = new HttpClient();

            var response = await client.GetStringAsync("http://localhost:59893/api/ticket");

            var dbTickets = JsonConvert.DeserializeObject<List<Tickets>>(response);
        }

    }
}
