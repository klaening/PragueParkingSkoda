﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using WebAPI_PragueParking_Domain.Models;

namespace WebAPI_PragueParking_Domain.Repository
{
    public interface IDepartmentsRepository
    {
        Task<IEnumerable<Departments>> GetDepartments();
        Task<Departments> GetDepartment(int id);
    }
}
