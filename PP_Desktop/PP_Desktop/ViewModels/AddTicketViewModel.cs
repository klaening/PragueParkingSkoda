﻿using GalaSoft.MvvmLight.Command;
using Newtonsoft.Json;
using PP_Desktop.Models;
using PP_Desktop.Services;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Windows.UI.Popups;

namespace PP_Desktop.ViewModels
{
    public class AddTicketViewModel : BindableBase
    {
        private ObservableCollection<ParkingSpots> _availableParkingSpots;
        private ParkingSpots _selectedParkingSpot;
        private NavigationService _navigationService;

        private int ID;
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
        public ParkingSpots SelectedParkingSpot
        {
            get => _selectedParkingSpot;
            set => SetProperty(ref _selectedParkingSpot, value);
        }

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

            AddCommand = new RelayCommand(AddTicketCommand, () => true);
        }

        public RelayCommand AddCommand
        {
            get;
            private set;
        }

        private async void AddTicketCommand()
        {
            Tickets ticket = new Tickets()
            {
                RegNo = this.RegNo,
                RetrievalCode = this.RetrievalCode,
                PhoneNo = this.PhoneNo,
                PID = this.PID,
                //EstimatedParkingTime = this.EstimatedParkingTime,
                Comment = this.Comment,
                ParkingSpotsID = SelectedParkingSpot.ID,
                VehicleTypesID = this.VehicleTypesID,
                TicketStatusesID = this.TicketStatusesID
            };

            try
            {
                var response = await Requests.PostRequestAsync(Paths.Tickets, ticket);
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
