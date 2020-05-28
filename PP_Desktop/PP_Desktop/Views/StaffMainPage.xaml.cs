using Newtonsoft.Json;
using PP_Desktop.Models;
using PP_Desktop.Services;
using PP_Desktop.ViewModels;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Security.Cryptography.X509Certificates;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.WindowManagement;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Hosting;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;

// The Blank Page item template is documented at https://go.microsoft.com/fwlink/?LinkId=234238

namespace PP_Desktop.Views
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class StaffMainPage : Page
    {
        private readonly StaffPageViewModel _viewModel;


        public StaffMainPage()
        {
            this.InitializeComponent();

            _viewModel = new StaffPageViewModel();
            DataContext = _viewModel;
        }

        private void GoBack_Btn_Click(object sender, RoutedEventArgs e)
        {

        }

        private async void AddStaff_Btn_Click(object sender, RoutedEventArgs e)
        {
            AppWindow appWindow = await AppWindow.TryCreateAsync();
            Frame appWindowContentFrame = new Frame();
            appWindowContentFrame.Navigate(typeof(AddStaffPage));
            ElementCompositionPreview.SetAppWindowContent(appWindow, appWindowContentFrame);
            await appWindow.TryShowAsync();

            appWindow.Closed += delegate
            {
                appWindowContentFrame.Content = null;
                appWindow = null;
            };
        }

        //private void ClosePopupClicked(object sender, RoutedEventArgs e)
        //{
        //    if (AddStaff_PopUp.IsOpen) { AddStaff_PopUp.IsOpen = false; }
        //}

        //private void AddStaffToDB_Btn_Click(object sender, RoutedEventArgs e)
        //{
        //    Staff newStaff = new Staff 
        //    { 
        //        PID = AddStaff_PopUp
        //    };
        //}
    }
}
