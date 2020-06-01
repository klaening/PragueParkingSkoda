using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PP_Desktop.Models
{
    public class TicketStatuses
    {
        public int ID { get; set; }
        public string StatusName { get; set; }

        //public string GetTicketStatus(int id)
        //{
        //    return this.StatusName;
        //}


        public static ObservableCollection<TicketStatuses> GetTicketsStatusesList()
        {
            ObservableCollection<TicketStatuses> ticketStatuses = new ObservableCollection<TicketStatuses>()
            {


            };

            return ticketStatuses;
        }
    }
}
