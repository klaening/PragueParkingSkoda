using PP_Desktop.Models;
using PP_Desktop.ViewModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;

// The Blank Page item template is documented at https://go.microsoft.com/fwlink/?LinkId=234238

namespace PP_Desktop.Views
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class UpdateTickets : Page
    {
        private int PassingCurrSpotID { get; set; }
        private readonly UpdateTicketsViewModel _viewModel;
        public UpdateTickets()
        {
            this.InitializeComponent();
            _viewModel = new UpdateTicketsViewModel();
            DataContext = _viewModel;
        }

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            _viewModel.SelectedTicket = (Tickets)e.Parameter;
        }


        private void Cancel_Btn_Click(object sender, RoutedEventArgs e)
        {
            Frame.Navigate(typeof(TicketsMainPage));
        }
    }

 
}
