﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;

namespace WebAPI_PragueParking_Domain.Service
{
    public interface ITicketStatusesService
    {
        Task<IEnumerable<TicketStatuses>> GetTicketStatuses();
        Task<TicketStatuses> GetTicketStatus(int id);
    }
}
