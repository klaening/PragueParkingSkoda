using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PP_Desktop.Models;

namespace PP_Desktop.ViewModels
{
    public class TicketsMainPage_VM : BindableBase
    {
        private ObservableCollection<Tickets> _tickets;

        private Tickets _selectedItem;
        public ObservableCollection<Tickets> TicketList
        {
            get => _tickets;
            set => SetProperty(ref _tickets, value);
        }

        public Tickets SelectedItem
        {
            get => _selectedItem;
            set => SetProperty(ref _selectedItem, value);
        }

        public TicketsMainPage_VM()
        {
            TicketList = new ObservableCollection<Tickets>(Tickets.GetTicketsList());
        }
            
        
    }
}
