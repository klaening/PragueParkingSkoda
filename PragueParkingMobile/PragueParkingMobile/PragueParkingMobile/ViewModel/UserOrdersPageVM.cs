using PPMobile.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Text;

namespace PPMobile.ViewModel
{
    public class UserOrdersPageVM : BaseViewModel
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

        public UserOrdersPageVM()
        {
            TicketList = new ObservableCollection<Ticket>(TicketRepository.TicketList);
        }
    }
}
