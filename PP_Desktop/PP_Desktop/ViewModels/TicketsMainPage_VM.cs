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
        //lista av info från tabellen tickets.
        private ObservableCollection<Tickets> _tickets;

        private Tickets _selectedTicket;

        //en join i databasen med 3 tabeller.
        private ObservableCollection<TicketInfoView> _ticketInfoView;

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


        public Tickets SelectedTicket
        {
            get => _selectedTicket;
            set
            {
                _selectedTicket = value;
            }
        }

        public TicketInfoView SelectedTicketInfoView
        {
            get => _selectedTicketInfoView;
            set => SetProperty(ref _selectedTicketInfoView, value);
        }


        public TicketsMainPage_VM()
        {
            // Tickets
            var result = Requests.GetRequest(Paths.Tickets);
            var tickets = JsonConvert.DeserializeObject<ObservableCollection<Tickets>>(result);

            Tickets = tickets;

            var result_ticketInfoView = Requests.GetRequest(Paths.TicketInfoView);
            var ticketInfoView = JsonConvert.DeserializeObject<ObservableCollection<TicketInfoView>>(result_ticketInfoView);

            TicketInfoView = ticketInfoView;

            // TicketStatuses

            //var result_ticketStatuses = Requests.GetRequest(Paths.ticketStatuses);
            //var ticketStatusesList = JsonConvert.DeserializeObject<ObservableCollection<TicketStatuses>>(result_ticketStatuses);

            //TicketStatusesList = ticketStatusesList;

        }
            
        
    }
}
