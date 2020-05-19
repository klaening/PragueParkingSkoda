using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;

namespace WebAPI_PragueParking_Domain.Repository
{
    public interface IVehicleTypesRepository
    {
        Task<IEnumerable<VehicleTypes>> GetVehicleTypes();
        Task<VehicleTypes> GetVehicleType(int id);
    }
}
