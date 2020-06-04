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
    public class ParkingSpotsController : Controller
    {
        private readonly IParkingSpotsService _parkingSpotsService;

        public ParkingSpotsController(IParkingSpotsService parkingSpotsService)
        {
            _parkingSpotsService = parkingSpotsService;
        }

        [HttpGet("available")]
        public async Task<IActionResult> GetVacantSpots()
        {
            return Ok(await _parkingSpotsService.GetVacantParkingSpots());
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            return Ok(await _parkingSpotsService.GetParkingSpots());
        }
    }
}