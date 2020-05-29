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
using System.Text;
using System.Threading.Tasks;
using Windows.UI.Popups;
using Windows.UI.Xaml.Navigation;

namespace PP_Desktop.ViewModels
{
    public class UpdateStaffViewModel : BindableBase
    {
        private ObservableCollection<Departments> _departments;
        private NavigationService _navigationService;
        private Staff _selectedStaff;
        private Departments _selectedDepartment;
        private string _PID;
        private string _firstName;
        private string _lastName;
        private string _staffAddress;
        private string _phoneNo;
        private string _email;
        private string _bankAccount;
        private string _ICE;
        private string _userName;
        private string _userPassword;

        #region Properties
        public Staff SelectedStaff
        {
            get => _selectedStaff;
            set
            {
                _selectedStaff = value;

                PID = _selectedStaff.PID;
                FirstName = _selectedStaff.FirstName;
                LastName = _selectedStaff.LastName;
                StaffAddress = _selectedStaff.StaffAddress;
                PhoneNo = _selectedStaff.PhoneNo;
                Email = _selectedStaff.Email;
                BankAccount = _selectedStaff.BankAccount;
                ICE = _selectedStaff.ICE;
                UserName = _selectedStaff.UserName;
                UserPassword = _selectedStaff.UserPassword;
                SelectedDepartment = Departments.FirstOrDefault(x => x.ID == _selectedStaff.ID);
            }
        }
        public Departments SelectedDepartment
        {
            get => _selectedDepartment;
            set => SetProperty(ref _selectedDepartment, value);
        }
        public string PID
        {
            get => _PID; 
            set => SetProperty(ref _PID, value);
        }
        public string FirstName
        {
            get => _firstName;
            set => SetProperty(ref _firstName, value);        
        }
        public string LastName
        {
            get => _lastName;
            set => SetProperty(ref _lastName, value);
        }
        public string StaffAddress
        {
            get => _staffAddress;
            set => SetProperty(ref _staffAddress, value);
        }
        public string PhoneNo
        {
            get => _phoneNo;
            set => SetProperty(ref _phoneNo, value);
        }
        public string Email
        {
            get => _email;
            set => SetProperty(ref _email, value);
        }
        public string BankAccount
        {
            get => _bankAccount;
            set => SetProperty(ref _bankAccount, value);
        }
        public string ICE
        {
            get => _ICE;
            set => SetProperty(ref _ICE, value);
        }
        public string UserName
        {
            get => _userName;
            set => SetProperty(ref _userName, value);
        }
        public string UserPassword
        {
            get => _userPassword;
            set => SetProperty(ref _userPassword, value);
        }
        #endregion

        public UpdateStaffViewModel()
        {
            _navigationService = new NavigationService();

            var result = Requests.GetRequest(Paths.Departments);
            var departmentList = JsonConvert.DeserializeObject<ObservableCollection<Departments>>(result);

            Departments = departmentList;

            UpdateCommand = new RelayCommand(UpdateStaffCommand, () => true);
        }

        public ObservableCollection<Departments> Departments
        {
            get => _departments;
            set
            {
                _departments = value;
            }
        }

        public RelayCommand UpdateCommand
        {
            get;
            private set;
        }

        private async void UpdateStaffCommand()
        {
            Staff staff = new Staff
            {
                PID = this.PID,
                FirstName = this.FirstName,
                LastName = this.LastName,
                StaffAddress = this.StaffAddress,
                PhoneNo = this.PhoneNo,
                Email = this.Email,
                BankAccount = this.BankAccount,
                ICE = this.ICE,
                UserName = this.UserName,
                UserPassword = this.UserPassword,
                DepartmentsID = SelectedDepartment.ID
            };

            try
            {
                var response = await Requests.PutRequestAsync(Paths.Staff, staff);
                var statusCode = response.StatusCode;

                if (response.StatusCode == HttpStatusCode.OK)
                {
                    var dialog = new MessageDialog("Staff successfully updated", "Success");
                    await dialog.ShowAsync();

                    _navigationService.GoBack();
                }
            }
            catch (Exception)
            {
                var dialog = new MessageDialog("Something went wrong", "Error");
                await dialog.ShowAsync();
            }
        }
    }
}
