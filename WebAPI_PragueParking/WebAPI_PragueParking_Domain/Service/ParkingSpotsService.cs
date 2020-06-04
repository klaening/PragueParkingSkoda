using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;
using WebAPI_PragueParking_Domain.Repository;

namespace WebAPI_PragueParking_Domain.Service
{
    public class ParkingSpotsService : IParkingSpotsService
    {
        private readonly IParkingSpotsRepository _parkingSpotsRepository;

        public ParkingSpotsService(IParkingSpotsRepository parkingSpotsRepository)
        {
            _parkingSpotsRepository = parkingSpotsRepository;
        }

        public async Task<IEnumerable<ParkingSpots>> GetVacantParkingSpots()
        {
            return await _parkingSpotsRepository.GetVacantParkingSpots();
        }

        public async Task<IEnumerable<ParkingSpots>> GetParkingSpots()
        {
            return await _parkingSpotsRepository.GetParkingSpots();
        }
    }
}
