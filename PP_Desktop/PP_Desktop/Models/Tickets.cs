using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PP_Desktop.Models;

namespace PP_Desktop.Models
{
    public class Tickets
    {
        public int ID { get; set; }
        public string RegNo { get; set; }
        public string RetrievalCode { get; set; }
        public string PhoneNo { get; set; }
        public string PID { get; set; }
        public decimal EstimatedParkingTime { get; set; }
        public string Comment { get; set; }
        public int ParkingSpotsID { get; set; }
        public int VehicleTypesID { get; set; }
        public int TicketStatusesID { get; set; }


        public static ObservableCollection<Tickets> GetTicketsList()
        {
            ObservableCollection<Tickets> ticket = new ObservableCollection<Tickets>()
            {


            };

            return ticket;
        }


    }
}
