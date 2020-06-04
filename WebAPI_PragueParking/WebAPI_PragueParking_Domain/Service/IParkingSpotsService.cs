using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;

namespace WebAPI_PragueParking_Domain.Service
{
    public interface IParkingSpotsService
    {
        Task<IEnumerable<ParkingSpots>> GetVacantParkingSpots();
        Task<IEnumerable<ParkingSpots>> GetParkingSpots();

    }
}
