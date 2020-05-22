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
    public class StaffPageViewModel : INotifyPropertyChanged
    {
        private ObservableCollection<Staff> staffList = new ObservableCollection<Staff>();

        public ObservableCollection<Staff> StaffList 
        { 
            get { return staffList; } 
        }

        public StaffPageViewModel()
        {
            this.StaffList.Add(new Staff { ID = 1, FirstName = "Fredrik", LastName = "Karlsson" });
            this.StaffList.Add(new Staff { ID = 2, FirstName = "Karl", LastName = "Fredriksson" });
        }

        //public StaffItem StaffItem { get; set; }

        //public StaffPageViewModel(StaffItem staffItem)
        //{
        //    StaffItem = staffItem;
        //}

        public event PropertyChangedEventHandler PropertyChanged;
    }
}
