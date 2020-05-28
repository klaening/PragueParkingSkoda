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
        private ObservableCollection<Departments> _items;
        private Departments _selectedItem;
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
        private int _departmentsID;

        public AddStaffPageViewModel()
        {
            _navigationService = new NavigationService();

            var result = Requests.GetRequest(Paths.Departments);
            var departmentList = JsonConvert.DeserializeObject<ObservableCollection<Departments>>(result);

            Items = departmentList;

            AddCommand = new RelayCommand(AddStaffCommand, () => true);
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

        public RelayCommand AddCommand
        {
            get;
            private set;
        }

        public string PID
        {
            get { return _PID; }
            set
            {
                _PID = value;
                OnPropertyChanged(PID.ToString());
            }
        }
        public string FirstName
        {
            get { return _firstName; }
            set
            {
                _firstName = value;
                OnPropertyChanged(FirstName.ToString());
            }
        }
        public string LastName
        {
            get { return _lastName; }
            set
            {
                _lastName = value;
                OnPropertyChanged(LastName.ToString());
            }
        }
        public string StaffAddress
        {
            get { return _staffAddress; }
            set
            {
                _staffAddress = value;
                OnPropertyChanged(StaffAddress.ToString());
            }
        }
        public string PhoneNo
        {
            get { return _phoneNo; }
            set
            {
                _phoneNo = value;
                OnPropertyChanged(PhoneNo.ToString());
            }
        }
        public string Email
        {
            get { return _email; }
            set
            {
                _email = value;
                OnPropertyChanged(Email.ToString());
            }
        }
        public string BankAccount
        {
            get { return _bankAccount; }
            set
            {
                _bankAccount = value;
                OnPropertyChanged(BankAccount.ToString());
            }
        }
        public string ICE
        {
            get { return _ICE; }
            set
            {
                _ICE = value;
                OnPropertyChanged(ICE.ToString());
            }
        }
        public string UserName
        {
            get { return _userName; }
            set
            {
                _userName = value;
                OnPropertyChanged(UserName.ToString());
            }
        }
        public string UserPassword
        {
            get { return _userPassword; }
            set
            {
                _userPassword = value;
                OnPropertyChanged(UserPassword.ToString());
            }
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
                DepartmentsID = SelectedItem.ID
            };

            HttpStatusCode statusCode = HttpStatusCode.BadRequest;

            try
            {
                var response = await Requests.PostRequestAsync(Paths.Staff, staff);
                statusCode = response.StatusCode;
            }
            catch (Exception)
            {
                var dialog = new MessageDialog("Something went wrong", "Error");
                await dialog.ShowAsync();
            }

            if (statusCode == HttpStatusCode.OK)
            {
                var dialog = new MessageDialog("Staff successfully saved", "Success");
                await dialog.ShowAsync();

                _navigationService.GoBack();
            }
        }
    }
}
