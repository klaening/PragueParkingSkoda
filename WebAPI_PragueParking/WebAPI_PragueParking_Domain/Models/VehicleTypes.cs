using System;
using System.Collections.Generic;
using System.Text;

namespace WebAPI_PragueParking_Domain.Models
{
    public class VehicleTypes
    {
        public int ID { get; set; }
        public string TypeName { get; set; }
        public int ParkSize { get; set; }
    }
}
