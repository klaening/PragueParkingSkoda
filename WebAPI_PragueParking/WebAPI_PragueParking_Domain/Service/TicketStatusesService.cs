using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;
using WebAPI_PragueParking_Domain.Repository;

namespace WebAPI_PragueParking_Domain.Service
{
    public class TicketStatusesService : ITicketStatusesService
    {
        private readonly ITicketStatusesRepository _ticketStatusesRepository;

        public TicketStatusesService(ITicketStatusesRepository ticketStatusesRepository)
        {
            _ticketStatusesRepository = ticketStatusesRepository;
        }

        public async Task<IEnumerable<TicketStatuses>> GetTicketStatuses()
        {
            return await _ticketStatusesRepository.GetTicketStatuses();
        }
        public async Task<TicketStatuses> GetTicketStatus(int id)
        {
            return await _ticketStatusesRepository.GetTicketStatus(id);
        }
    }
}
