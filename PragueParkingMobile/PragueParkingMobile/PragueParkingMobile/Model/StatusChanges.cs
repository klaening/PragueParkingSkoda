using System;
using System.Collections.Generic;
using System.Text;

namespace PPMobile.Model
{
    class StatusChanges
    {
        public int Id { get; set; }
        public DateTime TimeOfStatusChange { get; set; }

        //Foreign keys
        public int TicketsId { get; set; }
        public int TicketStatusesId { get; set; }
        public int StaffId { get; set; }
    }
}
