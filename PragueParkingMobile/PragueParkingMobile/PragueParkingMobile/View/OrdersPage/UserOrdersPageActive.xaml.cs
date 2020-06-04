using Newtonsoft.Json;
using PPMobile.Model;
using PPMobile.ViewModel;
using PPMobile.ViewModel.OrdersPageVM;
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
            BindingContext = new UserOrdersPageVM();
        }

        private async void OrdersActivePage_ItemSelected(object sender, SelectedItemChangedEventArgs e)
        {
            await Navigation.PushAsync(new AcceptOrderPage(e.SelectedItem as TicketInfoView));
        }
    }
}