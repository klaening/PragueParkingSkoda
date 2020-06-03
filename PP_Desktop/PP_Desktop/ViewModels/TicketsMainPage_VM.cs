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
        //lista av info från tabellen Tickets.
        private ObservableCollection<Tickets> _tickets;
        private Tickets _selectedTickets;

        //lista av info från tabellen TicketStatuses.
        private ObservableCollection<TicketStatuses> _ticketStatuses;
        private TicketStatuses _selectedTicketStatuses;

        //lista av info från tabellen ParkingSpots.
        private ObservableCollection<ParkingSpots> _parkingSpots;
        private ParkingSpots _selectedParkingSpots;

        //lista av info från tabellen VehicleTypes.
        private ObservableCollection<VehicleTypes> _vehichleTypes;
        private VehicleTypes _selectedVehicleTypes;


        #region Tickets
        public ObservableCollection<Tickets> TicketList
        {
            get => _tickets;
            set => SetProperty(ref _tickets, value);
        }

        public Tickets SelectedTickets
        {
            get => _selectedTickets;
            set
            {
                SetProperty(ref _selectedTickets, value);
                //TicketStatuses = TicketStatuses.FirstOrDefault(x => x.ID == _selectedTickets.TicketsID);
            }
        }

        #endregion Tickets

        #region TicketStatuses
        public ObservableCollection<TicketStatuses> TicketStatusesList
        {
            get => _ticketStatuses;
            set => SetProperty(ref _ticketStatuses, value);
        }

        public TicketStatuses SelectedTicketStatuses
        {
            get => _selectedTicketStatuses;
            set => SetProperty(ref _selectedTicketStatuses, value);
        }

        #endregion TicketStatuses

        #region ParkingSpots
        public ObservableCollection<ParkingSpots> ParkingSpotsList
        {
            get => _parkingSpots;
            set => SetProperty(ref _parkingSpots, value);
        }
        public ParkingSpots SelectedParkingSpots
        {
            get => _selectedParkingSpots;
            set => SetProperty(ref _selectedParkingSpots, value);
        }
        #endregion ParkingSpots

        #region VehicleTypes
        public ObservableCollection<VehicleTypes> VehicleTypesList
        {
            get => _vehichleTypes;
            set => SetProperty(ref _vehichleTypes, value);
        }
        public VehicleTypes SelectedVehicleTypes
        {
            get => _selectedVehicleTypes;
            set => SetProperty(ref _selectedVehicleTypes, value);
        }
        #endregion VehicleTypes

        public TicketsMainPage_VM()
        {

            //Hämtar info från DB för Tickets
            var result = Requests.GetRequest(Paths.Tickets);
            var ticketList = JsonConvert.DeserializeObject<ObservableCollection<Tickets>>(result);

            TicketList = ticketList;

            //Hämtar info från DB för TicketStatuses
            result = Requests.GetRequest(Paths.TicketStatuses);
            var ticketStatusesList = JsonConvert.DeserializeObject<ObservableCollection<TicketStatuses>>(result);

            TicketStatusesList = ticketStatusesList;

            //Hämtar info från DB för ParkingSpots
            result = Requests.GetRequest(Paths.ParkingSpots);
            var parkingSpotsList = JsonConvert.DeserializeObject<ObservableCollection<ParkingSpots>>(result);

            ParkingSpotsList = parkingSpotsList;

            //Hämtar info från DB för VehicleTypes
            result = Requests.GetRequest(Paths.VehicleTypes);
            var vehicleTypesList = JsonConvert.DeserializeObject<ObservableCollection<VehicleTypes>>(result);

            VehicleTypesList = vehicleTypesList;
        }


    }
}
