﻿using System;
using System.Collections.Generic;
using System.Text;

namespace PPMobile.Model
{
    public class Tickets
    {
        public string RegNo { get; set; }
        public string RetrievalCode { get; set; }
        public string PhoneNo { get; set; }
        public string PID { get; set; }
        public decimal EstimatedParkingTime { get; set; }
        public string Comment { get; set; }

        public int ParkingSpotsId { get; set; }
    }
}