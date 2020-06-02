using GalaSoft.MvvmLight.Command;
using Newtonsoft.Json;
using PP_Desktop.Helpers;
using PP_Desktop.Models;
using PP_Desktop.Services;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection.Metadata;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using Windows.System.UserProfile;
using Windows.UI.Popups;

namespace PP_Desktop.ViewModels
{
    public class AddTicketViewModel : BindableBase
    {
        private ObservableCollection<ParkingSpots> _availableParkingSpots;
        private ObservableCollection<ParkingSpots> _filteredAvailableParkingSpots;
        private ObservableCollection<VehicleTypes> _vehicleTypes;
        private ParkingSpots _selectedParkingSpot;
        private ParkingSpots _suggestedParkingSpot;
        private VehicleTypes _selectedVehicleType;
        private NavigationService _navigationService;

        private string _regNo;
        private string _retrievalCode;
        private string _phoneNo;
        private string _PID;
        private decimal _estimatedParkingTime;
        private string _comment;
        private int _parkingSpotsID;
        private int _vehicleTypesID;
        private int _ticketStatusesID;

        #region Properties
        public string RegNo
        {
            get => _regNo;
            set => SetProperty(ref _regNo, value);
        }
        public string RetrievalCode
        {
            get => _retrievalCode;
            set => SetProperty(ref _retrievalCode, value);
        }
        public string PhoneNo
        {
            get => _phoneNo;
            set => SetProperty(ref _phoneNo, value);
        }
        public string PID
        {
            get => _PID;
            set => SetProperty(ref _PID, value);
        }
        //public decimal EstimatedParkingTime
        //{
        //    get => _estimatedParkingTime;
        //    set => SetProperty(ref _estimatedParkingTime, value);
        //}
        public string Comment
        {
            get => _comment;
            set => SetProperty(ref _comment, value);
        }
        public int ParkingSpotsID
        {
            get => _parkingSpotsID;
            set => SetProperty(ref _parkingSpotsID, value);
        }
        public int VehicleTypesID
        {
            get => _vehicleTypesID;
            set => SetProperty(ref _vehicleTypesID, value);
        }
        public int TicketStatusesID
        {
            get => _ticketStatusesID;
            set => SetProperty(ref _ticketStatusesID, value);
        }
        #endregion

        public ObservableCollection<ParkingSpots> AvailableParkingSpots
        {
            get => _availableParkingSpots;
            set => _availableParkingSpots = value;
        }
        public ObservableCollection<ParkingSpots> FilteredAvailableParkingSpots
        {
            get => _filteredAvailableParkingSpots;
            set => SetProperty(ref _filteredAvailableParkingSpots, value);
        }
        public ParkingSpots SelectedParkingSpot
        {
            get => _selectedParkingSpot;
            set 
            {
                if (_selectedParkingSpot != null && value != null)
                    _suggestedParkingSpot = value;
                SetProperty(ref _selectedParkingSpot, value);
            }
        }

        public ObservableCollection<VehicleTypes> AvailableVehicleTypes
        {
            get => _vehicleTypes;
            set => _vehicleTypes = value;
        }
        public VehicleTypes SelectedVehicleType
        {
            get => _selectedVehicleType;
            set 
            {
                _selectedVehicleType = value;

                //Ger en inte ett nytt förslag
                FilteredAvailableParkingSpots = AvailableParkingSpots.FilterList(SelectedVehicleType);
                SelectedParkingSpot = FilteredAvailableParkingSpots.AssignRandomParkingSpot(ref _suggestedParkingSpot);
            }
        }
        //public ObservableCollection<TicketStatuses> AvailableTicketStatuses
        //{
        //    get => _ticketStatuses;
        //    set => _ticketStatuses = value;
        //}
        //public ObservableCollection<decimal> TimeEstimates = new ObservableCollection<decimal>()
        //{
        //    0.5m, 1, 1.5m, 2, 4, 8, 24 
        //};

        public AddTicketViewModel()
        {
            _navigationService = new NavigationService();

            var result = Requests.GetRequest(Paths.AvailableParkingSpots);
            var availableParkingSpotList = JsonConvert.DeserializeObject<ObservableCollection<ParkingSpots>>(result);

            AvailableParkingSpots = availableParkingSpotList;

            result = Requests.GetRequest(Paths.VehicleTypes);
            var vehicleTypes = JsonConvert.DeserializeObject<ObservableCollection<VehicleTypes>>(result);

            AvailableVehicleTypes = vehicleTypes;

            AddCommand = new RelayCommand(AddTicketCommand, () => true);
        }

        public RelayCommand AddCommand
        {
            get;
            private set;
        }

        private async void AddTicketCommand()
        {
            int staffID = 3; //Ska tas bort och ersättas med inloggade kundens id
            string path = $"{Paths.Tickets}{staffID}";

            Tickets ticket = new Tickets()
            {
                RegNo = this.RegNo,
                RetrievalCode = this.RetrievalCode,
                PhoneNo = this.PhoneNo,
                PID = this.PID,
                //EstimatedParkingTime = this.EstimatedParkingTime,
                Comment = this.Comment,
                ParkingSpotsID = SelectedParkingSpot.ID,
                VehicleTypesID = SelectedVehicleType.ID,
                TicketStatusesID = (int)StatusNames.TicketCreated
            };

            try
            {
                var response = await Requests.PostRequestAsync(path, ticket);
                var statusCode = response.StatusCode;

                if (response.StatusCode == HttpStatusCode.OK)
                {
                    var dialog = new MessageDialog("Ticket successfully saved", "Success");
                    await dialog.ShowAsync();

                    _navigationService.GoBack();
                }
            }
            catch (Exception)
            {
                var dialog = new MessageDialog("Something went wrong", "Error");
                await dialog.ShowAsync();
            }
        }
    }
}
