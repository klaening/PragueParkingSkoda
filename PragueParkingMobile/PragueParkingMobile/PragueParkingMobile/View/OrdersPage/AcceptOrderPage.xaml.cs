using PPMobile.APIServices;
using PPMobile.Model;
using PPMobile.ViewModel.OrdersPageVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace PPMobile.View.OrdersPage
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class AcceptOrderPage : ContentPage
    {
        public AcceptOrderPage(TicketInfoView ticket)
        {
            InitializeComponent();
            BindingContext = new AcceptOrderPageVM();
            RegNo_Label.Text = ticket.RegNo;
            ParkingSpot_Label.Text = ticket.SpotNo;
            Order_Label.Text = ticket.StatusName;
        }

        public void AcceptOrderButton_Clicked(object sender, EventArgs e)
        {

        }

        void CarParkedButton_Clicked(object sender, EventArgs e)
        {

        }

        void CarReturnedButton_Clicked(object sender, EventArgs e)
        {

        }


    }
}