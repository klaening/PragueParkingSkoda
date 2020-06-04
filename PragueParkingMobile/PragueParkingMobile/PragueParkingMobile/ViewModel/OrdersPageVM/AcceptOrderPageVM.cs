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
using PPMobile.View.MainPage;
using PPMobile.Utility;
using System.Collections.ObjectModel;
using System.Linq;

namespace PPMobile.ViewModel.OrdersPageVM
{
    public class AcceptOrderPageVM : BaseViewModel
    {
        private string _buttonText;
        public ICommand AcceptCommand { get; }
        public INavigation Navigation { get; set; }

        public ObservableCollection<TicketStatuses> Statuses { get; set; }
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
            set
            {
                _buttonText = value;
                OnPropertyChanged("ButtonText");
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

            var response = APIServices.GetRequest(ApiPaths.ticketStatuses);
            Statuses = JsonConvert.DeserializeObject<ObservableCollection<TicketStatuses>>(response);
        }

        public void AcceptPressedCommand()
        {
            var ticket = GetTicketFromId();
            UpdateTicket(ticket);

            SelectedTicket.TicketStatusesId = ticket.TicketStatusesID;

            //var status = Statuses.FirstOrDefault(x => x.Id == SelectedTicket.TicketStatusesId);

            //var tempTicket = SelectedTicket;
            //tempTicket.StatusName = status.StatusName;

            //SelectedTicket = tempTicket;
            
            if (ticket.TicketStatusesID == (int)StatusNameEnum.Parked || ticket.TicketStatusesID == (int)StatusNameEnum.Returned)
            {
                Navigation.PushAsync(new UserTabbedPage());
            }
            else
            {
                Application.Current.MainPage.DisplayAlert("Accepted","Ticket status have been updated!","Ok");
            }
        }

        public Tickets GetTicketFromId()
        {
            string source = SelectedTicket.TicketsID.ToString();

            var response = APIServices.GetRequest(ApiPaths.tickets, source);

            var ticket = JsonConvert.DeserializeObject<Tickets>(response);

            return ticket;
        }

        public async void UpdateTicket(Tickets ticket)
        {

            ticket.TicketStatusesID += 1;

            await APIServices.PutRequestAsync(ApiPaths.tickets, ticket);
        }
    }
}
