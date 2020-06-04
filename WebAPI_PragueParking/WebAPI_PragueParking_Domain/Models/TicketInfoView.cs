using System;
using System.Collections.Generic;
using System.Text;

namespace WebAPI_PragueParking_Domain.Models
{
    public class TicketInfoView
    {
        public int TicketsID { get; set; }
        public string RegNo{ get; set; }
        public string StatusName { get; set; }
        public string SpotNo { get; set; }
        public int TicketStatusesId { get; set; }
    }
}
