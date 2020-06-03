using System;
using System.Collections.Generic;
using System.Text;

namespace WebAPI_PragueParking_Domain.Models
{
    public class ParkingSpots
    {
        public int ID { get; set; }
        public string SpotNo { get; set; }
        public int ParkCapacity { get; set; }
        public int ParkingStatusesID { get; set; }
        public int CarParksID { get; set; }
    }
}
