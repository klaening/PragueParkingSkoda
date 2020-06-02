using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;

namespace WebAPI_PragueParking_Domain.Service
{
    public interface IStaffService
    {
        Task<bool> AddStaff(Staff staff);
        Task<IEnumerable<Staff>> GetStaff();
        Task<Staff> GetStaff(int id);
        Task<bool> UpdateStaff(Staff staff);
        Task<bool> DeleteStaff(int id);
    }
}
