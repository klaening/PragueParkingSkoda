using PPMobile.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Text;

namespace PPMobile.APIServices
{
    public interface ITicketDataService
    {
        List<Ticket> GetAllTickets();
    }
}
