using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;
using WebAPI_PragueParking_Domain.Repository;

namespace WebAPI_PragueParking_Domain.Service
{
    public class StaffService : IStaffService
    {
        private readonly IStaffRepository _staffRepository;

        public StaffService(IStaffRepository staffRepository)
        {
            _staffRepository = staffRepository;
        }

        public async Task<bool> AddStaff(Staff staff)
        {
            return await _staffRepository.AddStaff(staff);
        }

        public async Task<IEnumerable<Staff>> GetStaff()
        {
            return await _staffRepository.GetStaff();
        }

        public async Task<Staff> GetStaff(int id)
        {
            return await _staffRepository.GetStaff(id);
        }

        public async Task<bool> UpdateStaff(Staff staff)
        {
            return await _staffRepository.UpdateStaff(staff);
        }

        public async Task<bool> DeleteStaff(int id)
        {
            return await _staffRepository.DeleteStaff(id);
        }
    }
}
