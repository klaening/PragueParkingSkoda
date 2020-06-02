using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;

namespace WebAPI_PragueParking_Domain.Repository
{
    public interface ITicketsRepository
    {
        Task<bool> AddTicket(Tickets ticket, int staffID);
        Task<IEnumerable<Tickets>> GetTickets();
        Task<Tickets> GetTicket(int id);
        Task<bool> UpdateTicket(Tickets ticket);
        Task<bool> DeleteTicket(int id);
    }
}
