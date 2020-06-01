using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WebAPI_PragueParking_Domain.Repository;
using WebAPI_PragueParking_Domain.Service;

namespace WebAPI_PragueParking.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class DepartmentsController : Controller
    {
        private readonly IDepartmentsService _departmentsService;
        
        public DepartmentsController(IDepartmentsService departmentsService)
        {
            _departmentsService = departmentsService;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            return Ok(await _departmentsService.GetDepartments());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            return Ok(await _departmentsService.GetDepartment(id));
        }
    }
}