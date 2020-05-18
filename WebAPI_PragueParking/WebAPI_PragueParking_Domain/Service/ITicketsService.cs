using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;

namespace WebAPI_PragueParking_Domain.Service
{
    public interface ITicketsService
    {
        Task<bool> AddTicket(Tickets ticket);
        Task<IEnumerable<Tickets>> GetTickets();
        Task<Tickets> GetTicket(int id);
    }
}
