using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Text;

namespace PPMobile.Model
{
    public static class TicketRepository
    {
        static TicketRepository()
        {
            if (TicketList == null)
            {
                TicketList = new List<Ticket>
                {
                    new Ticket
                    {
                        RegNo = "ÅÄÖ 987",
                        ParkingSpotNo = 53,
                        TimeCreated = "2020-05-20"
                    },
                    new Ticket
                    {
                        RegNo = "EFG 456",
                        ParkingSpotNo = 33,
                        TimeCreated = "2020-05-16"
                    },
                    new Ticket
                    {
                        RegNo = "HIJ 789",
                        ParkingSpotNo = 13,
                        TimeCreated = "2020-05-14"
                    }
                };
            }
        }

        public static List<Ticket> TicketList { get; set; }
    }
}
