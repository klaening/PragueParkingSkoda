using PPMobile.Model;
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
            RegNo_Label.Text = ticket.RegNo;
            ParkingSpot_Label.Text = ticket.SpotNo.ToString();
            Order_Label.Text = ticket.StatusName;
        }

        public void AcceptOrderButton_Clicked(object sender, EventArgs e)
        {
            AcceptOrderButton.IsVisible = false;
            CarParkedButton.IsVisible = true;
            RejectOrderButton.IsVisible = true;
        
        }

        void CarParkedButton_Clicked(object sender, EventArgs e)
        {

        }

        void CarReturnedButton_Clicked(object sender, EventArgs e)
        {

        }


    }
}