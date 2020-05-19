using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;
using WebAPI_PragueParking_Domain.Repository;

namespace WebAPI_PragueParking_Domain.Service
{
    public class VehicleTypesService : IVehicleTypesService
    {
        private readonly IVehicleTypesRepository _vehicleTypesRepository;

        public VehicleTypesService(IVehicleTypesRepository vehicleTypesRepository)
        {
            _vehicleTypesRepository = vehicleTypesRepository;
        }

        public async Task<IEnumerable<VehicleTypes>> GetVehicleTypes()
        {
            return await _vehicleTypesRepository.GetVehicleTypes();
        }
    }
}
