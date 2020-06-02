using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;
using WebAPI_PragueParking_Domain.Repository;

namespace WebAPI_PragueParking_Domain.Service
{
    public class TicketInfoViewService : ITicketInfoViewService
    {
        private readonly ITicketInfoViewRepository _ticketInfoViewRepository;

        public TicketInfoViewService(ITicketInfoViewRepository ticketInfoViewRepository)
        {
            _ticketInfoViewRepository = ticketInfoViewRepository;
        }

        public async Task<IEnumerable<TicketInfoView>> GetTicketInfoView()
        {
            return await _ticketInfoViewRepository.GetTicketInfoView();
        }
    }
}
