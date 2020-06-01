using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PP_Desktop.Models
{
    public class TicketInfoView
    {
        public int TicketsID { get; set; }
        public string RegNo { get; set; }
        public string StatusName { get; set; }
        public string SpotNo { get; set; }

        public static ObservableCollection<TicketInfoView> GetTicketInfoView()
        {
            ObservableCollection<TicketInfoView> ticketInfoView = new ObservableCollection<TicketInfoView>()
            {


            };

            return ticketInfoView;
        }
    }
}
