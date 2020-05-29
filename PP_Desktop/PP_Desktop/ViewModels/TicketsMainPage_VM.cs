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

        //Behöver nog ej ticketstatuses
        //private ObservableCollection<TicketStatuses> _ticketStatuses;

        //en join i databasen med 3 tabeller.
        private ObservableCollection<TicketInfoView> _ticketInfoView;

        private Tickets _selectedItem;
        
        private TicketInfoView _selectedItemView;


        public ObservableCollection<Tickets> TicketList
        {
            get => _tickets;
            set => SetProperty(ref _tickets, value);
        }
        public ObservableCollection<TicketInfoView> TicketInfoViews
        {
            get => _ticketInfoView;
            set => SetProperty(ref _ticketInfoView, value);
        }

        //public ObservableCollection<TicketStatuses> TicketStatusesList
        //{
        //    get => _ticketStatuses;
        //    set => SetProperty(ref _ticketStatuses, value);
        //}

        public Tickets SelectedItem
        {
            get => _selectedItem;
            set => SetProperty(ref _selectedItem, value);
        }

        public TicketInfoView SelectedItemView
        {
            get => _selectedItemView;
            set => SetProperty(ref _selectedItemView, value);
        }


        public TicketsMainPage_VM()
        {
            // Tickets
            var result = Requests.GetRequest(Paths.tickets);
            var ticketList = JsonConvert.DeserializeObject<ObservableCollection<Tickets>>(result);

            TicketList = ticketList;

            var result_ticketInfoView = Requests.GetRequest(Paths.ticketInfoView);
            var ticketInfoView = JsonConvert.DeserializeObject<ObservableCollection<TicketInfoView>>(result_ticketInfoView);

            TicketInfoViews = ticketInfoView;

            // TicketStatuses

            //var result_ticketStatuses = Requests.GetRequest(Paths.ticketStatuses);
            //var ticketStatusesList = JsonConvert.DeserializeObject<ObservableCollection<TicketStatuses>>(result_ticketStatuses);

            //TicketStatusesList = ticketStatusesList;

        }
            
        
    }
}
