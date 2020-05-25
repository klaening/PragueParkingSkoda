using PPMobile.Model;
using PPMobile.Utility;
using PPMobile.ViewModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
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
            BindingContext = new UserOrdersPageVM(Navigation);
        }

        private void ListView_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            AcceptOrderPage acceptOrderPage = new AcceptOrderPage(e.Item as Ticket);
            Navigation.PushAsync(acceptOrderPage);
        }
    }
}