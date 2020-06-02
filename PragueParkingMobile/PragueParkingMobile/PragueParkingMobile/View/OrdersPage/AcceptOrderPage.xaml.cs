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
        AcceptOrderPageVM _viewModel;
        public AcceptOrderPage(TicketInfoView ticket)
        {
            InitializeComponent();
            _viewModel = new AcceptOrderPageVM();

            BindingContext = _viewModel;
            _viewModel.SelectedTicket = ticket;
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