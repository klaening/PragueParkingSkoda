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
    public class TicketsController : Controller
    {
        private readonly ITicketsService _ticketsService;

        public TicketsController(ITicketsService ticketsService)
        {
            _ticketsService = ticketsService;
        }

        [HttpPost]
        public async Task<IActionResult> Add([FromBody] Tickets ticket)
        {
            return Ok(await _ticketsService.AddTicket(ticket));
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            return Ok(await _ticketsService.GetTickets());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            return Ok(await _ticketsService.GetTicket(id));
        }

        [HttpPut]
        public async Task<IActionResult> Update([FromBody] Tickets ticket)
        {
            return Ok(await _ticketsService.UpdateTicket(ticket));
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            return Ok(await _ticketsService.DeleteTicket(id));
        }
    }
}