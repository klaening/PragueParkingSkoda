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
        private ObservableCollection<Staff> _staff;
        private Staff _selectedItem;
        private ObservableCollection<Staff> staffList;

        public StaffPageViewModel()
        {
            var result = Requests.GetRequest(Paths.Staff);
            staffList = JsonConvert.DeserializeObject<ObservableCollection<Staff>>(result);

            Staff = staffList;

            DeleteCommand = new RelayCommand(DeleteStaffCommand, () => true);
        }

        public ObservableCollection<Staff> Staff 
        {
            get => _staff;
            set => SetProperty(ref _staff, value);
        }

        public Staff SelectedItem
        {
            get => _selectedItem;
            set => SetProperty(ref _selectedItem, value);
        }

        public RelayCommand DeleteCommand
        {
            get;
            private set;
        }

        private async void DeleteStaffCommand()
        {
            int id = SelectedItem.ID;

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
