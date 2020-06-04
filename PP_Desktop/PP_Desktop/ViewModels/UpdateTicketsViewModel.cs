﻿using PP_Desktop.Models;
using PP_Desktop.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GalaSoft.MvvmLight.Command;
using System.Net;
using Windows.UI.Popups;
using Newtonsoft.Json;
using System.Collections.ObjectModel;
using Windows.UI.Xaml.Shapes;

namespace PP_Desktop.ViewModels
{
    public class UpdateTicketsViewModel : BindableBase
    {
        private ObservableCollection<Tickets> _ticketInfo;
        private NavigationService _navigationService;
        private Tickets _selectedTicket;
        private int _ticketsID;
        private string _regNo;
        private string _retrievalCode;
        private string _phoneNo;
        private string _pID;
        private string _comment;
        private int _parkingSpotsID;
        private int _vehicleTypesID;
        private int _ticketStatusID;

        #region Properties
        public Tickets SelectedTicket
        {
           
            get => _selectedTicket;
            set
            {
                _selectedTicket = value;
                TicketsID = _selectedTicket.ID;
                RegNo = _selectedTicket.RegNo;
                RetrievalCode = _selectedTicket.RetrievalCode;
                PhoneNo = _selectedTicket.PhoneNo;
                PersonalID = _selectedTicket.PID;
                Comment = _selectedTicket.Comment;
                ParkingSpotsID = _selectedTicket.ParkingSpotsID;
                VehicleTypesID = _selectedTicket.VehicleTypesID;
                TicketStatusID = _selectedTicket.TicketStatusesID;

            }
        }

        public int TicketsID
        {
            get => _ticketsID;
            set => SetProperty(ref _ticketsID, value);
        }
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
        public string PersonalID
        {
            get => _pID;
            set => SetProperty(ref _pID, value);
        }
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
        public int TicketStatusID
        {
            get => _ticketStatusID;
            set => SetProperty(ref _ticketStatusID, value);
        }
        #endregion Properties

        public ObservableCollection<Tickets> TicketInfo
        {
            get => _ticketInfo;
            set => SetProperty(ref _ticketInfo, value);
        }

        public RelayCommand UpdateCommand { get; private set; }

        private async void UpdateTicketCommand()
        {
            //staff id för ej något inlogg för tillfället.
            var staffID = 1;
            Tickets ticket = new Tickets()
            {
                ID = TicketsID,
                RegNo = RegNo,
                RetrievalCode = RetrievalCode,
                PhoneNo = PhoneNo,
                PID = PersonalID,
                Comment = Comment,
                ParkingSpotsID = ParkingSpotsID,
                VehicleTypesID = VehicleTypesID,
                TicketStatusesID = TicketStatusID,
                StaffID = staffID

            };
            try
            {
                var response = await Requests.PutRequestAsync(Paths.Tickets, ticket);
                var responseCode = response;

                if(responseCode.StatusCode == HttpStatusCode.OK)
                {
                    var dialog = new MessageDialog("Ticket successfully updated", "Success");
                    await dialog.ShowAsync();
                    _navigationService.GoBack();
                }
            }
            catch (Exception)
            {
                var dialog = new MessageDialog("Something went wrong", "Error");
                await dialog.ShowAsync();
                throw;
            }
           
        }

        public UpdateTicketsViewModel()
        {
            _navigationService = new NavigationService();

            var result = Requests.GetRequest_ID(Paths.Tickets, TicketsID);
            var ticketList = JsonConvert.DeserializeObject<ObservableCollection<Tickets>>(result);

            TicketInfo = ticketList;

            UpdateCommand = new RelayCommand(UpdateTicketCommand, () => true);
        }



    }
}
