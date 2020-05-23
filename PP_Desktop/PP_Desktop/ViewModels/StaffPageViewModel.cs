using PP_Desktop.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace PP_Desktop.ViewModels
{
    public class StaffPageViewModel : BindableBase
    {
        private List<Staff> _items;
        private Staff _selectedItem;

        public List<Staff> Items 
        {
            get => _items;
            set => SetProperty(ref _items, value);
        }

        public Staff SelectedItem
        {
            get => _selectedItem;
            set => SetProperty(ref _selectedItem, value);
        }

        public StaffPageViewModel()
        {
            Items = new List<Staff>()
            {
                new Staff { ID = 1, PID = "851220-2342", FirstName = "Fredrik", LastName = "Karlsson", UserName = "f.karlsson", PhoneNo = "(+420)745263712", Email = "f.karlsson@gmail.com" },
                new Staff { ID = 2, PID = "740312-6423", FirstName = "Karl", LastName = "Fredriksson", UserName = "k.fredriksson", PhoneNo = "(420)738492153", Email = "k.fredriksson@hotmail.com" },
                new Staff { ID = 3, PID = "760312-6423", FirstName = "Sven", LastName = "Svensson", UserName = "s.svensson", PhoneNo = "(420)763549201", Email = "s.svensson@outlook.com" }
            };
        }
    }
}
