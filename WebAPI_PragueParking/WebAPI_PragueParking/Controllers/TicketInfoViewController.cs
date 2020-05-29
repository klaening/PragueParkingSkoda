using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WebAPI_PragueParking_Domain.Service;

namespace WebAPI_PragueParking.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class TicketInfoViewController : Controller
    {
        private readonly ITicketInfoViewService _ticketInfoViewService;

        public TicketInfoViewController(ITicketInfoViewService ticketInfoViewService)
        {
            _ticketInfoViewService = ticketInfoViewService;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            return Ok(await _ticketInfoViewService.GetTicketInfoView());
        }
    }
}
