using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;

namespace WebAPI_PragueParking_Domain.Service
{
    public interface IParkingSpotsService
    {
        Task<IEnumerable<ParkingSpots>> GetParkingSpots();
        Task<ParkingSpots> GetParkingSpot(int id);
    }
}
