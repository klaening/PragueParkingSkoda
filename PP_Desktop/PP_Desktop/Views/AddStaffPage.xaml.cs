using PP_Desktop.Models;
using PP_Desktop.Services;
using PP_Desktop.ViewModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Core;
using Windows.UI.Popups;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;

// The Blank Page item template is documented at https://go.microsoft.com/fwlink/?LinkId=234238

namespace PP_Desktop.Views
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class AddStaffPage : Page
    {
        private readonly AddStaffPageViewModel _viewModel;

        public AddStaffPage()
        {
            this.InitializeComponent();

            _viewModel = new AddStaffPageViewModel();
            DataContext = _viewModel;
        }

        //private async void SaveToDB_Btn_Click(object sender, RoutedEventArgs e)
        //{
        //    var depChoice = (Departments)InputDepartmentsIDChoice.SelectedItem;

        //    Staff staff = new Staff
        //    {
        //        //PID = InputPID.Text,
        //        FirstName = InputFirstName.Text,
        //        //LastName = InputLastName.Text,
        //        //StaffAddress = InputStaffAddress.Text,
        //        //PhoneNo = InputPhoneNo.Text,
        //        //Email = InputEmail.Text,
        //        //BankAccount = InputBankAccount.Text,
        //        //ICE = InputICE.Text,
        //        //UserName = InputUserName.Text,
        //        //UserPassword = InputUserPassword.Text,
        //        DepartmentsID = depChoice.ID
        //    };

        //    HttpStatusCode statusCode = HttpStatusCode.BadRequest;

        //    try
        //    {
        //        var response = await Requests.PostRequestAsync(Paths.Staff, staff);
        //        statusCode = response.StatusCode;
        //    }
        //    catch (Exception)
        //    {
        //        var dialog = new MessageDialog("Something went wrong", "Error");
        //        await dialog.ShowAsync();
        //    }

        //    if (statusCode == HttpStatusCode.OK)
        //    {
        //        var dialog = new MessageDialog("Staff successfully saved", "Success");
        //        await dialog.ShowAsync();
                
        //        Frame.GoBack();
        //    }
        //}

        private void Cancel_Clicked(object sender, RoutedEventArgs e)
        {
            Frame.GoBack();
        }
    }
}
