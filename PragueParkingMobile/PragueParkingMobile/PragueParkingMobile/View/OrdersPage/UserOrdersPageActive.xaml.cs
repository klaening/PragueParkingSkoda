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
            BindingContext = new UserOrdersPageActiveVM();
        }

        private void ViewCell_Tapped(object sender, EventArgs e)
        {
            Navigation.PushAsync(new AcceptOrderPage());
        }
     

    }
}