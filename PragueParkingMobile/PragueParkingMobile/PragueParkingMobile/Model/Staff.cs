using System;
using System.Collections.Generic;
using System.Text;

namespace PPMobile.Model
{
    class Staff
    {
        public int Id { get; set; }
        public string PID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string StaffAddress { get; set; }
        public string PhoneNo { get; set; }
        public string Email { get; set; }
        public string BankAccount { get; set; }
        public string ICE { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }

        //Foreign Key
        public int DepartmentsId { get; set; }


    }
}
