using Newtonsoft.Json;
using PP_Desktop.Models;
using PP_Desktop.Services;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PP_Desktop.ViewModels
{
    public class AddStaffPageViewModel : BindableBase
    {
        private ObservableCollection<Departments> _items;
        private Departments _selectedItem;

        public AddStaffPageViewModel()
        {
            var result = Requests.GetRequest(Paths.Departments);
            var departmentList = JsonConvert.DeserializeObject<ObservableCollection<Departments>>(result);

            Items = departmentList;
        }

        public ObservableCollection<Departments> Items
        {
            get => _items;
            set
            {
                _items = value;
            }
        }

        public Departments SelectedItem
        {
            get => _selectedItem;
            set => SetProperty(ref _selectedItem, value);
        }
    }
}
