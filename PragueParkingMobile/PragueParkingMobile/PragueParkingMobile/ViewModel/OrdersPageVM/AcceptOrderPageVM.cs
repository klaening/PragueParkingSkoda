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
using PPMobile.View.OrdersPage;

namespace PPMobile.ViewModel.OrdersPageVM
{
    public class AcceptOrderPageVM : BaseViewModel
    {
        public ICommand AcceptCommand { get; }
        public INavigation Navigation { get; set; }
        public string ButtonText 
        { 
            get
            {
                if (SelectedTicket != null)
                {
                    if (SelectedTicket.TicketStatusesId == (int)StatusNameEnum.ParkAccepted || SelectedTicket.TicketStatusesId == (int)StatusNameEnum.ReturnAccepted)
                    {
                        return "Done";
                    }
                    return "Accept";
                }
                return "";
            } 
        
        }
        private TicketInfoView _selectedTicket;
        public TicketInfoView SelectedTicket
        {
            get { return _selectedTicket; }
            set
            {
                _selectedTicket = value;

                OnPropertyChanged("SelectedTicket");
                OnPropertyChanged("ButtonText");
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

            if (ticket.TicketStatusesID == (int)StatusNameEnum.Parked || ticket.TicketStatusesID == (int)StatusNameEnum.Returned)
            {
                Navigation.PushAsync(new UserTabbedPage());
            }           
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

            ticket.TicketStatusesID += 1;

            string path = "tickets/";
            int staffId = 2;

            await APIServices.PutRequestAsync(path, ticket, staffId);
        }
    }
}
