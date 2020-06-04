using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;

namespace WebAPI_PragueParking_Domain.Repository
{
    public class ParkingSpotsRepository : IParkingSpotsRepository
    {
        private readonly string _connectionString;

        public ParkingSpotsRepository(string connectionString)
        {
            _connectionString = connectionString;
        }
        public async Task<IEnumerable<ParkingSpots>> GetVacantParkingSpots()
        {
            using (var c = new SqlConnection(_connectionString))
            {
                try
                {
                    return await c.QueryAsync<ParkingSpots>("SELECT * FROM ParkingSpots WHERE ParkCapacity > 0 AND ParkingStatusesID = 1");
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }
        public async Task<IEnumerable<ParkingSpots>> GetParkingSpots()
        {
            using (var c = new SqlConnection(_connectionString))
            {
                try
                {
                    return await c.QueryAsync<ParkingSpots>("SELECT * FROM ParkingSpots");
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }
    }
}
