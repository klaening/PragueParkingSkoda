using PPMobile.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Text;

namespace PPMobile.APIServices
{
    public class TicketDataService : ITicketDataService
    {
        public List<Ticket> GetAllTickets()
        {
            return TicketRepository.TicketList;
        }
    }
}
