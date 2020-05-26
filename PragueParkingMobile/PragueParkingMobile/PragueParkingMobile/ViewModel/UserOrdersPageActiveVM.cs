using PPMobile.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Text;

namespace PPMobile.ViewModel
{
    public class UserOrdersPageActiveVM : BaseViewModel
    {
        private ObservableCollection<Ticket> _ticketList;
        public ObservableCollection<Ticket> TicketList
        {
            get => _ticketList;
            set
            {
                _ticketList = value;
                OnPropertyChanged("TicketList");
            }
        }

        public UserOrdersPageActiveVM()
        {
            TicketList = new ObservableCollection<Ticket>(App.TicketDataService.GetAllTickets());
        }
    }
}
