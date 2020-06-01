using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PP_Desktop.Models
{
    public class Staff
    {
        public int ID { get; set; }
        public string PID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string StaffAddress { get; set; }
        public string PhoneNo { get; set; }
        public string Email { get; set; }
        public string BankAccount { get; set; }
        public string ICE { get; set; }
        public string UserName { get; set; }
        public string UserPassword { get; set; }
        public int DepartmentsID { get; set; }

        public string FullName
        {
            get
            {
                return $"{FirstName} {LastName}";
            }
        }
        
        public string StaffInfo
        {
            get
            {
                return $"{PID} {FullName}";   
            }
        }
    }
}
