using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;

namespace WebAPI_PragueParking_Domain.Repository
{
    public class TicketInfoViewRepository : ITicketInfoViewRepository
    {
        private readonly string _connectionString;

        public TicketInfoViewRepository(string connectionString)
        {
            _connectionString = connectionString;
        }
        public async Task<IEnumerable<TicketInfoView>> GetTicketInfoView()
        {
            using (var c = new SqlConnection(_connectionString))
            {
                try
                {
                    return await c.QueryAsync<TicketInfoView>("Select Tickets.ID as TicketsID, Tickets.RegNo,TicketStatuses.StatusName, ParkingSpots.SpotNo From Tickets Inner join TicketStatuses on Tickets.TicketStatusesID = TicketStatuses.ID Inner join ParkingSpots on Tickets.ParkingSpotsID = ParkingSpots.ID");
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }
    }
}
