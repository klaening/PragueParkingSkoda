using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using GalaSoft.MvvmLight.Command;
using Newtonsoft.Json;
using PP_Desktop.Models;
using PP_Desktop.Services;
using Windows.UI.Popups;

namespace PP_Desktop.ViewModels
{
    public class TicketsMainPage_VM : BindableBase
    {
        private ObservableCollection<Tickets> _tickets;
        private ObservableCollection<TicketInfoView> _ticketInfoView;
        private Tickets _selectedTicket;
        private TicketInfoView _selectedTicketInfoView;
        private NavigationService _navigationService;

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

        public RelayCommand DeleteCommand { get; private set; }

        public TicketsMainPage_VM()
        {
            _navigationService = new NavigationService();

            var result = Requests.GetRequest(Paths.Tickets);
            var ticketsFromDB = JsonConvert.DeserializeObject<ObservableCollection<Tickets>>(result);

            Tickets = ticketsFromDB;

            result = Requests.GetRequest(Paths.TicketInfoView);
            var infoViewFromDB = JsonConvert.DeserializeObject<ObservableCollection<TicketInfoView>>(result);

            TicketInfoView = infoViewFromDB;

            DeleteCommand = new RelayCommand(DeleteTicketCommand, () => true);
        }

        private async void DeleteTicketCommand()
        {
            try
            {
                var response = await Requests.DeleteRequestAsync(Paths.Tickets, SelectedTicketInfoView.TicketsID);
                var statusCode = response.StatusCode;

                if (response.StatusCode == HttpStatusCode.OK)
                {
                    var dialog = new MessageDialog("Ticket successfully deleted", "Success");
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
