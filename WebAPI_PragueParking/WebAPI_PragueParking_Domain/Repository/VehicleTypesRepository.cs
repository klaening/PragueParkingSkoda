using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;

namespace WebAPI_PragueParking_Domain.Repository
{
    public class VehicleTypesRepository : IVehicleTypesRepository
    {
        private readonly string _connectionString;

        public VehicleTypesRepository(string connectionString)
        {
            _connectionString = connectionString;
        }

        public async Task<IEnumerable<VehicleTypes>> GetVehicleTypes()
        {
            using (var c = new SqlConnection(_connectionString))
            {
                try
                {
                    return await c.QueryAsync<VehicleTypes>("SELECT * FROM VehicleTypes");
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }
    }
}
