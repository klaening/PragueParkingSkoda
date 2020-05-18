using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;

namespace WebAPI_PragueParking_Domain.Repository
{
    public interface ITicketsRepository
    {
        Task<bool> AddTicket(Tickets ticket);
        Task<IEnumerable<Tickets>> GetTickets();
        Task<Tickets> GetTickets(int id);
    }
}
