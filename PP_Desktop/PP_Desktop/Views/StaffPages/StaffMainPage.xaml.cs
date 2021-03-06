﻿using GalaSoft.MvvmLight.Messaging;
using Newtonsoft.Json;
using PP_Desktop.Models;
using PP_Desktop.Services;
using PP_Desktop.ViewModels;
using PP_Desktop.Views.StaffPages;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Security.Cryptography.X509Certificates;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Popups;
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
            Frame.GoBack();
        }

        private void AddStaff_Btn_Click(object sender, RoutedEventArgs e)
        {
            Frame.Navigate(typeof(AddStaffPage));
        }

        private void Update_Btn_Click(object sender, RoutedEventArgs e)
        {
            Frame.Navigate(typeof(UpdateStaff), _viewModel.SelectedStaff);
        }
    }
}
