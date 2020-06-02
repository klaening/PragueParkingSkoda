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
        private string _regNo;
        private string _spotNo;
        private string _statusName;
        public string RegNo
        {
            get { return _regNo; }
            set
            {
                _regNo = value;
                OnPropertyChanged("RegNo");
            }
        }

       public string SpotNo
       {
            get { return _spotNo; }
            set
            {
                _spotNo = value;
                OnPropertyChanged("SpotNo");
            }
       }
        
        public string StatusName
        {
            get { return _statusName; }
            set
            {
                _statusName = value;
                OnPropertyChanged("StatusName");
            }
        }


        private TicketInfoView _selectedTicket;
        public TicketInfoView SelectedTicket
        {
            get { return _selectedTicket; }
            set
            {
                _selectedTicket = value;

                RegNo = SelectedTicket.RegNo;
                SpotNo = SelectedTicket.SpotNo;
                StatusName = SelectedTicket.StatusName;
                OnPropertyChanged("SelectedTicket");
            }
        }

        public AcceptOrderPageVM()
        {
            AcceptCommand = new Command(AcceptPressedCommand);
        }

        public async void AcceptPressedCommand()
        {
           
        }
    }
}
