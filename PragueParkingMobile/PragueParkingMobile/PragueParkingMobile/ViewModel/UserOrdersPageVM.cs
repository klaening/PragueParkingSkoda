using PPMobile.Model;
using PPMobile.View;
using PPMobile.View.OrdersPage;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace PPMobile.ViewModel
{
    public class UserOrdersPageVM : BaseViewModel
    {
        public INavigation Navigation { get; set; }

        private ObservableCollection<Ticket> _ticketList;

        private Ticket _selectedTicket;
        public Ticket SelectedTicket
        {
            get { return _selectedTicket; }
            set
            {
                if(_selectedTicket != value)
                {
                    _selectedTicket = value;
                    HandleSelectedItem();
                }
            }
        }

        private void HandleSelectedItem()
        {
        }

        public ObservableCollection<Ticket> TicketList
        {
            get => _ticketList;
            set
            {
                _ticketList = value;
                OnPropertyChanged("TicketList");
            }
        }

        public UserOrdersPageVM(INavigation navigation)
        {
            this.Navigation = navigation;
            TicketList = new ObservableCollection<Ticket>(TicketRepository.TicketList);
        }
    }
}
