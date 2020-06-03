using PP_Desktop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PP_Desktop.ViewModels
{
    public class UpdateTicketViewModel : BindableBase
    {
        private Tickets _selectedTicket;
        public Tickets SelectedTicket
        {
            get => _selectedTicket;
            set => SetProperty(ref _selectedTicket, value);
        }
        public UpdateTicketViewModel()
        {

        }
    }
}
