﻿using Newtonsoft.Json;
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

namespace PP_Desktop.ViewModels
{
    public class StaffPageViewModel : BindableBase
    {
        private ObservableCollection<Staff> _items;
        private Staff _selectedItem;

        public ObservableCollection<Staff> Items 
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
            var path = "staff";

            var response = Database.GetRequest(path);
            string result = response.Content.ReadAsStringAsync().Result;

            var resultList = JsonConvert.DeserializeObject<List<Staff>>(result);

            ObservableCollection<Staff> staffList = new ObservableCollection<Staff>(resultList);

            Items = staffList;
        }
    }
}
