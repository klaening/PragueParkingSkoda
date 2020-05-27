using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;
using WebAPI_PragueParking_Domain.Repository;

namespace WebAPI_PragueParking_Domain.Service
{
    public class DepartmentsService : IDepartmentsService
    {
        private readonly IDepartmentsRepository _departmentsRepository;

        public DepartmentsService(IDepartmentsRepository departmentsRepository)
        {
            _departmentsRepository = departmentsRepository;
        }

        public async Task<IEnumerable<Departments>> GetDepartments()
        {
            return await _departmentsRepository.GetDepartments();
        }

        public async Task<Departments> GetDepartment(int id)
        {
            return await _departmentsRepository.GetDepartment(id);
        }
    }
}
