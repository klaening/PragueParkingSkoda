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
    public class VehicleTypesController : Controller
    {
        private readonly IVehicleTypesService _vehicleTypesService;

        public VehicleTypesController(IVehicleTypesService vehicleTypesService)
        {
            _vehicleTypesService = vehicleTypesService;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            return Ok(await _vehicleTypesService.GetVehicleTypes());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            return Ok(await _vehicleTypesService.GetVehicleType(id));
        }
    }
}