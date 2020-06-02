using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
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

        public async Task<bool> AddTicket(Tickets ticket, int staffID)
        {
            using (var c = new SqlConnection(_connectionString))
            {
                try
                {
                    var p = new DynamicParameters();
                    p.Add("@RegNo", ticket.RegNo);
                    p.Add("@RetrievalCode", ticket.RetrievalCode);
                    p.Add("@PhoneNo", ticket.PhoneNo);
                    p.Add("@PID", ticket.PID);
                    p.Add("@EstimatedParkingTime", ticket.EstimatedParkingTime);
                    p.Add("@Comment", ticket.Comment);
                    p.Add("@ParkingSpotsID", ticket.ParkingSpotsID);
                    p.Add("@VehicleTypesID", ticket.VehicleTypesID);
                    p.Add("@TicketStatusesID", ticket.TicketStatusesID);
                    p.Add("@StaffID", staffID);

                    await c.ExecuteAsync("usp_NewTicket_Check", p, commandType: CommandType.StoredProcedure);

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

        public async Task<Tickets> GetTicket(int id)
        {
            using (var c = new SqlConnection(_connectionString))
            {
                try
                {
                    return await c.QueryFirstOrDefaultAsync<Tickets>("SELECT * FROM Tickets WHERE ID = @id", new { id });
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }

        public async Task<bool> UpdateTicket(Tickets ticket, int staffID)
        {
            using (var c = new SqlConnection(_connectionString))
            {
                try
                {
                    //await c.ExecuteAsync("UPDATE Tickets SET RegNo = @regNo, RetrievalCode = @retrievalCode, PhoneNo = @phoneNo, PID = @PID, EstimatedParkingTime = @estimatedParkingTime, Comment = @comment, ParkingSpotsID = @parkingSpotsID, VehicleTypesID = @vehicleTypesID, TicketStatusesID = @ticketStatusesID WHERE ID = @id", 
                    //    new { ticket.RegNo, ticket.RetrievalCode, ticket.PhoneNo, ticket.PID, ticket.EstimatedParkingTime, ticket.Comment, ticket.ParkingSpotsID, ticket.VehicleTypesID, ticket.TicketStatusesID, ticket.ID });
                    
                    //return true;

                    var p = new DynamicParameters();
                    p.Add("@TicketsID", ticket.ID);
                    p.Add("@TicketStatusesID", ticket.TicketStatusesID);
                    p.Add("@StaffID", staffID);

                    await c.ExecuteAsync("usp_UpdateTicket", p, commandType: CommandType.StoredProcedure);

                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }

        public async Task<bool> DeleteTicket(int id)
        {
            using (var c = new SqlConnection(_connectionString))
            {
                try
                {
                    await c.ExecuteAsync("DELETE Tickets WHERE ID = @id", new { id });

                    return true;
                }
                catch (Exception)
                {
                    return false;
                    throw;
                }
            }
        }
    }
}
