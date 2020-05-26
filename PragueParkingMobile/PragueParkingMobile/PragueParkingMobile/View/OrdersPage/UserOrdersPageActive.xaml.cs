using Newtonsoft.Json;
using PPMobile.Model;
using PPMobile.Utility;
using PPMobile.ViewModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace PPMobile.View.OrdersPage
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class UserOrdersPageActive : ContentPage
    {
        public UserOrdersPageActive()
        {
            InitializeComponent();
            GetAllTickets();
            //BindingContext = ViewModelLocator.UserOrdersPageVM;
        }

        private void ViewCell_Tapped(object sender, EventArgs e)
        {
            Navigation.PushAsync(new AcceptOrderPage());
        }
        
        private void GetAllTickets()
        {
            HttpClient client = new HttpClient();

            client.BaseAddress = new Uri("http://10.0.2.2:59893/api/");
            string path = "tickets/";

            var response = client.GetAsync(path);

            var statusCode = response.Result;
            string result = statusCode.Content.ReadAsStringAsync().Result;

            var dbTickets = JsonConvert.DeserializeObject<ObservableCollection<Tickets>>(result);

            TicketActiveList.ItemsSource = dbTickets;
        }

    }
}