using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PP_Desktop.Models;

namespace PP_Desktop.ViewModels
{
    public class TicketsMainPage_VM
    {
        private ObservableCollection<Tickets> tickets_;
        public ObservableCollection<Tickets> Ticketss
        {
            get
            {
                return tickets_;
            }
            set
            {
                tickets_ = value;
            }
        }

        public TicketsMainPage_VM()
        {
            tickets_ = new ObservableCollection<Tickets>(Tickets.TicketsList());
        }
            
        
    }
}
