﻿using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;

namespace WebAPI_PragueParking_Domain.Repository
{
    public class DepartmentsRepository : IDepartmentsRepository
    {
        private readonly string _connectionString;

        public DepartmentsRepository(string connectionString)
        {
            _connectionString = connectionString;
        }

        public async Task<IEnumerable<Departments>> GetDepartments()
        {
            using (var c = new SqlConnection(_connectionString))
            {
                try
                {
                    return await c.QueryAsync<Departments>("SELECT * FROM Departments ORDER BY ID");
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }

        public async Task<Departments> GetDepartment(int id)
        {
            using (var c = new SqlConnection(_connectionString))
            {
                try
                {
                    return await c.QueryFirstOrDefaultAsync<Departments>("SELECT * FROM Departments WHERE ID = @id", new { id });
                }
                catch (Exception)
                {
                    
                    throw;
                }
            }
        }
    }
}
