using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PP_Desktop.Models
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
