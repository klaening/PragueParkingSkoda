using PP_Desktop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PP_Desktop.ViewModels
{
    public class StaffItem
    {
        public int ID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public StaffItem(Staff staff)
        {
            ID = staff.ID;
            FirstName = staff.FirstName;
            LastName = staff.LastName;
        }
    }
}
