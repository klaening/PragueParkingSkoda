using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;

namespace WebAPI_PragueParking_Domain.Repository
{
    public class TicketsRepository : ITicketsRepository
    {
        private readonly string _connectionString;

        public TicketsRepository(string connectionString)
        {
            _connectionString = connectionString;
        }

        public async Task<bool> AddTicket(Tickets ticket)
        {
            using (var c = new SqlConnection(_connectionString))
            {
                try
                {
                    await c.ExecuteAsync("INSERT INTO Tickets (RegNo, RetrievalCode, PhoneNo, PID, EstimatedParkingTime, Comment, ParkingSpotsID, VehicleTypesID) VALUES (@RegNo, @RetrievalCode, @PhoneNo, @PID, @EstimatedParkingTime, @Comment, @ParkingSpotsID, @VehicleTypesID)",
                        new { ticket.RegNo, ticket.RetrievalCode, ticket.PhoneNo, ticket.PID, ticket.EstimatedParkingTime, ticket.Comment, ticket.ParkingSpotsID, ticket.VehicleTypesID });
                    
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }

        public async Task<IEnumerable<Tickets>> GetTickets()
        {
            using (var c = new SqlConnection(_connectionString))
            {
                try
                {
                    return await c.QueryAsync<Tickets>("SELECT * FROM Tickets");
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }

        public Task<Tickets> GetTickets(int id)
        {
            throw new NotImplementedException();
        }
    }
}
