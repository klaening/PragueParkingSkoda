using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;

namespace WebAPI_PragueParking_Domain.Repository
{
    public class TicketStatusesRepository : ITicketStatusesRepository
    {
        private readonly string _connectionString;

        public TicketStatusesRepository(string connectionString)
        {
            _connectionString = connectionString;
        }

        public async Task<IEnumerable<TicketStatuses>> GetTicketStatuses()
        {
            using (var c = new SqlConnection(_connectionString))
            {
                try
                {
                    return await c.QueryAsync<TicketStatuses>("SELECT * FROM Ticketstatuses ORDER BY ID");
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }

        public async Task<TicketStatuses> GetTicketStatus(int id)
        {
            using (var c = new SqlConnection(_connectionString))
            {
                try
                {
                    return await c.QueryFirstOrDefaultAsync<TicketStatuses>("SELECT * FROM Ticketstatuses WHERE ID = @id", new { id });
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }

    }
}
