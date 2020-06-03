using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using PP_Desktop.Models;
using PP_Desktop.Services;

namespace PP_Desktop.ViewModels
{
    public class TicketsMainPage_VM : BindableBase
    {
        private ObservableCollection<Tickets> _tickets;
        private ObservableCollection<TicketInfoView> _ticketInfoView;
        private Tickets _selectedTicket;
        private TicketInfoView _selectedTicketInfoView;

        public ObservableCollection<Tickets> Tickets
        {
            get => _tickets;
            set => SetProperty(ref _tickets, value);
        }
        public ObservableCollection<TicketInfoView> TicketInfoView
        {
            get => _ticketInfoView;
            set => SetProperty(ref _ticketInfoView, value);
        }
        public TicketInfoView SelectedTicketInfoView
        {
            get => _selectedTicketInfoView;
            set => SetProperty(ref _selectedTicketInfoView, value);
        }
        public Tickets SelectedTicket
        {
            get => _selectedTicket;
            set => _selectedTicket = value;
        }

        public TicketsMainPage_VM()
        {
            var result = Requests.GetRequest(Paths.Tickets);
            var ticketsFromDB = JsonConvert.DeserializeObject<ObservableCollection<Tickets>>(result);

            Tickets = ticketsFromDB;

            result = Requests.GetRequest(Paths.TicketInfoView);
            var infoViewFromDB = JsonConvert.DeserializeObject<ObservableCollection<TicketInfoView>>(result);

            TicketInfoView = infoViewFromDB;

            /*Test 1
                Jag har en lista med alla Tickets
                Jag har en lista med alla TicketInfoView med annan info såsom namn på saker
                Jag vill Binda till ett objekt som håller info från båda sakerna*/

            /*Test 2
                Jag vill Binda till en Tickets
                SelectedTicket returnerar annan info*/

            /*Test 3
                Jag vill Binda till TicketInfoView
                När man ska till nästa sida så hitta Ticket med samma id och skicka med den till nästa sida*/
        }
    }
}
