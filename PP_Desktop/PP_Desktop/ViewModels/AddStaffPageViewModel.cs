using GalaSoft.MvvmLight.Command;
using Newtonsoft.Json;
using PP_Desktop.Models;
using PP_Desktop.Services;
using PP_Desktop.Views;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Windows.UI.Popups;
using Windows.UI.Xaml.Controls;

namespace PP_Desktop.ViewModels
{
    public class AddStaffPageViewModel : BindableBase
    {
        private ObservableCollection<Departments> _departments;
        private Departments _selectedDepartment;
        private NavigationService _navigationService;
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
        public string PID
        {
            get => _PID;
            set => SetProperty(ref _PID, value);
        }
        public string FirstName
        {
            get { return _firstName; }
            set => SetProperty(ref _firstName, value);
        }
        public string LastName
        {
            get { return _lastName; }
            set => SetProperty(ref _lastName, value);
        }
        public string StaffAddress
        {
            get { return _staffAddress; }
            set => SetProperty(ref _staffAddress, value);
        }
        public string PhoneNo
        {
            get { return _phoneNo; }
            set => SetProperty(ref _phoneNo, value);
        }
        public string Email
        {
            get { return _email; }
            set => SetProperty(ref _email, value);
        }
        public string BankAccount
        {
            get { return _bankAccount; }
            set => SetProperty(ref _bankAccount, value);
        }
        public string ICE
        {
            get { return _ICE; }
            set => SetProperty(ref _ICE, value);
        }
        public string UserName
        {
            get { return _userName; }
            set => SetProperty(ref _userName, value);
        }
        public string UserPassword
        {
            get { return _userPassword; }
            set => SetProperty(ref _userPassword, value);
        }
        #endregion
        public AddStaffPageViewModel()
        {
            _navigationService = new NavigationService();

            var result = Requests.GetRequest(Paths.Departments);
            var departmentList = JsonConvert.DeserializeObject<ObservableCollection<Departments>>(result);

            Departments = departmentList;

            AddCommand = new RelayCommand(AddStaffCommand, () => true);
        }

        public ObservableCollection<Departments> Departments
        {
            get => _departments;
            set
            {
                _departments = value;
            }
        }

        public Departments SelectedDepartment
        {
            get => _selectedDepartment;
            set => SetProperty(ref _selectedDepartment, value);
        }

        public RelayCommand AddCommand
        {
            get;
            private set;
        }

        private async void AddStaffCommand()
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
                var response = await Requests.PostRequestAsync(Paths.Staff, staff);
                var statusCode = response.StatusCode;

                if (response.StatusCode == HttpStatusCode.OK)
                {
                    var dialog = new MessageDialog("Staff successfully saved", "Success");
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
