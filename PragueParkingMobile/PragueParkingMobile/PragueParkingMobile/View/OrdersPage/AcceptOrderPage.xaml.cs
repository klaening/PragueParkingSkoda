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
        public AcceptOrderPage()
        {
            InitializeComponent();
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