using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;
using WebAPI_PragueParking_Domain.Repository;

namespace WebAPI_PragueParking_Domain.Service
{
    public class TicketsService : ITicketsService
    {
        private readonly ITicketsRepository _ticketsRepository;

        public TicketsService(ITicketsRepository ticketsRepository)
        {
            _ticketsRepository = ticketsRepository;
        }

        public async Task<bool> AddTicket(Tickets ticket, int staffID)
        {
            return await _ticketsRepository.AddTicket(ticket, staffID);
        }

        public async Task<IEnumerable<Tickets>> GetTickets()
        {
            return await _ticketsRepository.GetTickets();
        }

        public async Task<Tickets> GetTicket(int id)
        {
            return await _ticketsRepository.GetTicket(id);
        }

        public async Task<bool> UpdateTicket(Tickets ticket)
        {
            return await _ticketsRepository.UpdateTicket(ticket);
        }

        public async Task<bool> DeleteTicket(int id)
        {
            return await _ticketsRepository.DeleteTicket(id);
        }
    }
}
