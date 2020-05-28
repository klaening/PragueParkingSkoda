using Newtonsoft.Json;
using PP_Desktop.Models;
using PP_Desktop.Services;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using Windows.Networking.Proximity;

namespace PP_Desktop.ViewModels
{
    public class StaffPageViewModel : BindableBase
    {
        private ObservableCollection<Staff> _items;
        private Staff _selectedItem;
        private ObservableCollection<Departments> _departments;
        private Departments _selectedDepartment;

        public ObservableCollection<Staff> StaffItems 
        {
            get => _items;
            set => SetProperty(ref _items, value);
        }

        public Staff SelectedItem
        {
            get => _selectedItem;
            set => SetProperty(ref _selectedItem, value);
        }

        public ObservableCollection<Departments> DepartmentItems
        {
            get => _departments;
            set
            {
                _departments = value;
            }
        }

        public StaffPageViewModel()
        {
            var result = Requests.GetRequest(Paths.staff);
            var staffList = JsonConvert.DeserializeObject<ObservableCollection<Staff>>(result);

            StaffItems = staffList;

            result = Requests.GetRequest(Paths.departments);
            var departmentList = JsonConvert.DeserializeObject<ObservableCollection<Departments>>(result);

            DepartmentItems = departmentList;
        }
    }
}
