using GalaSoft.MvvmLight.Command;
using Newtonsoft.Json;
using PP_Desktop.Models;
using PP_Desktop.Services;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Net;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Windows.Networking.Proximity;
using Windows.UI.Popups;
using Windows.UI.Xaml;

namespace PP_Desktop.ViewModels
{
    public class StaffPageViewModel : BindableBase, INotifyPropertyChanged
    {
        private ObservableCollection<Departments> _departments;
        private Departments _department;
        private ObservableCollection<Staff> _staff;
        private Staff _selectedStaff;

        public ObservableCollection<Departments> Departments
        {
            get => _departments;
            set => SetProperty(ref _departments, value);
        }

        public Departments Department
        {
            get => _department;
            set => SetProperty(ref _department, value);
        }

        public ObservableCollection<Staff> Staff 
        {
            get => _staff;
            set => SetProperty(ref _staff, value);
        }

        public Staff SelectedStaff
        {
            get => _selectedStaff;
            set
            {
                SetProperty(ref _selectedStaff, value);
                Department = Departments.FirstOrDefault(x => x.ID == _selectedStaff.DepartmentsID);
            }
        }

        public RelayCommand DeleteCommand { get; private set; }

        public StaffPageViewModel()
        {
            var result = Requests.GetRequest(Paths.Staff);
            var staffFromDB = JsonConvert.DeserializeObject<ObservableCollection<Staff>>(result);

            result = Requests.GetRequest(Paths.Departments);
            var departmentsFromDB = JsonConvert.DeserializeObject<ObservableCollection<Departments>>(result);

            Staff = staffFromDB;
            Departments = departmentsFromDB;

            DeleteCommand = new RelayCommand(DeleteStaffCommand, () => true);
        }

        private async void DeleteStaffCommand()
        {
            int id = SelectedStaff.ID;

            try
            {
                var response = await Requests.DeleteRequestAsync(Paths.Staff, id);
                var statusCode = response.StatusCode;

                var dialog = new MessageDialog("Successfully deleted staff", "Success");
                await dialog.ShowAsync();
            }
            catch (Exception)
            {
                var dialog = new MessageDialog("Something went wrong", "Error");
                await dialog.ShowAsync();
            }
        }
    }
}
