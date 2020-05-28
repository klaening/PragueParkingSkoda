using System;
using System.Collections.Generic;
using System.Text;

namespace WebAPI_PragueParking_Domain.Models
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
        public string TicketStatusesID { get; set; }
    }
}
