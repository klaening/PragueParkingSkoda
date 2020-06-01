using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;

namespace WebAPI_PragueParking_Domain.Repository
{
    public class StaffRepository : IStaffRepository
    {
        private readonly string _connectionString;

        public StaffRepository(string connectionString)
        {
            _connectionString = connectionString;
        }

        public async Task<bool> AddStaff(Staff staff)
        {
            using (var c = new SqlConnection(_connectionString))
            {
                try
                {
                    await c.ExecuteAsync("INSERT INTO Staff (PID, FirstName, LastName, StaffAddress, PhoneNo, Email, BankAccount, ICE, UserName, UserPassword, DepartmentsID) VALUES (@PID, @FirstName, @LastName, @StaffAddress, @PhoneNo, @Email, @BankAccount, @ICE, @UserName, @UserPassword, @DepartmentsID)",
                        new { staff.PID, staff.FirstName, staff.LastName, staff.StaffAddress, staff.PhoneNo, staff.Email, staff.BankAccount, staff.ICE, staff.UserName, staff.UserPassword, staff.DepartmentsID });

                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }

        public async Task<IEnumerable<Staff>> GetStaff()
        {
            using (var c = new SqlConnection(_connectionString))
            {
                try
                {
                    return await c.QueryAsync<Staff>("SELECT * FROM Staff");
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }

        public async Task<Staff> GetStaff(int id)
        {
            using (var c = new SqlConnection(_connectionString))
            {
                try
                {
                    return await c.QueryFirstOrDefaultAsync<Staff>("SELECT * FROM Staff WHERE ID = @id", new { id });
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }

        public async Task<bool> UpdateStaff(Staff staff)
        {
            using (var c = new SqlConnection(_connectionString))
            {
                try
                {
                    await c.ExecuteAsync("UPDATE Staff SET PID = @PID, FirstName = @FirstName, LastName = @LastName, StaffAddress = @StaffAddress, PhoneNo = @PhoneNo, Email = @Email, BankAccount = @BankAccount, ICE = @ICE, UserName = @UserName, UserPassword = @UserPassword, DepartmentsID = @DepartmentsID WHERE ID = @id",
                        new { staff.PID, staff.FirstName, staff.LastName, staff.StaffAddress, staff.PhoneNo, staff.Email, staff.BankAccount, staff.ICE, staff.UserName, staff.UserPassword, staff.DepartmentsID, staff.ID });

                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }

        public async Task<bool> DeleteStaff(int id)
        {
            using (var c = new SqlConnection(_connectionString))
            {
                try
                {
                    await c.ExecuteAsync("DELETE Staff WHERE ID = @id", new { id });

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
