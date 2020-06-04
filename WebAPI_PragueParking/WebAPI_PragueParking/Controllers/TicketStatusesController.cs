using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WebAPI_PragueParking_Domain.Models;
using WebAPI_PragueParking_Domain.Service;

namespace WebAPI_PragueParking.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class TicketStatusesController : Controller
    {
        private readonly ITicketStatusesService _ticketStatusesService;

        public TicketStatusesController(ITicketStatusesService ticketStatusesService)
        {
            _ticketStatusesService = ticketStatusesService;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            return Ok(await _ticketStatusesService.GetTicketStatuses());
        }
      
    }
}
