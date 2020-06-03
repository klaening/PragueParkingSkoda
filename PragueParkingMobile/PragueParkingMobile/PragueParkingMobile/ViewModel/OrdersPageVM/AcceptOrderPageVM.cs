using Newtonsoft.Json.Schema;
using PPMobile.Services;
using PPMobile.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Windows.Input;
using Xamarin.Forms;
using System.IO;
using Newtonsoft.Json;

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

        public void AcceptPressedCommand()
        {
            var ticket = GetTicketFromId();

            UpdateTicket(ticket);
        }

        public Tickets GetTicketFromId()
        {
            string path = "tickets/";
            string source = SelectedTicket.TicketsID.ToString();

            var response = APIServices.GetRequest(path, source);

            var ticket = JsonConvert.DeserializeObject<Tickets>(response);

            return ticket;
        }

        public async void UpdateTicket(Tickets ticket)
        {
            ticket.TicketStatusesID = (int)StatusNameEnum.Parked;
            
            string path = "tickets/";
            int staffId = 2;
            await APIServices.PutRequestAsync(path, ticket, staffId);
        }
    }
}
