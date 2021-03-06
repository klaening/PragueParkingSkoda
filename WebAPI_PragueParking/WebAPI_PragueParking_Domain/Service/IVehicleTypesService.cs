﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;

namespace WebAPI_PragueParking_Domain.Service
{
    public interface IVehicleTypesService
    {
        Task<IEnumerable<VehicleTypes>> GetVehicleTypes();
        Task<VehicleTypes> GetVehicleType(int id);

    }
}
