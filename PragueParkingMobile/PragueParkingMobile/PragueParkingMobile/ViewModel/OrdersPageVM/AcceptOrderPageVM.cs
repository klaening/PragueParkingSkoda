using Newtonsoft.Json.Schema;
using PPMobile.APIServices;
using PPMobile.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Windows.Input;
using Xamarin.Forms;

namespace PPMobile.ViewModel.OrdersPageVM
{
    public class AcceptOrderPageVM : BaseViewModel
    {
        public ICommand AcceptCommand { get; }

        private TicketInfoView _selectedTicket;
        public TicketInfoView SelectedTicket
        {
            get { return _selectedTicket; }
            set
            {
                _selectedTicket = value;
                OnPropertyChanged("SelectedTicket");
            }
        }

        public AcceptOrderPageVM()
        {
            SelectedTicket = new TicketInfoView();
            AcceptCommand = new Command(AcceptPressedCommand);
        }

        public async void AcceptPressedCommand()
        {
            
        }
    }
}
