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
    public class StaffController : Controller
    {
        private readonly IStaffService _staffService;

        public StaffController(IStaffService staffService)
        {
            _staffService = staffService;
        }

        [HttpPost]
        public async Task<IActionResult> Add([FromBody] Staff staff)
        {
            return Ok(await _staffService.AddStaff(staff));
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            return Ok(await _staffService.GetStaff());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            return Ok(await _staffService.GetStaff(id));
        }

        [HttpPut]
        public async Task<IActionResult> Update([FromBody] Staff staff)
        {
            return Ok(await _staffService.UpdateStaff(staff));
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            return Ok(await _staffService.DeleteStaff(id));
        }
    }
}