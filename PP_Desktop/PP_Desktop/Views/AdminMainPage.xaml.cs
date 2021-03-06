﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;

// The Blank Page item template is documented at https://go.microsoft.com/fwlink/?LinkId=234238

namespace PP_Desktop.Views
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class AdminMainPage : Page
    {
        public AdminMainPage()
        {
            this.InitializeComponent();
        }

        private void Users_Btn_Click(object sender, RoutedEventArgs e)
        {
            Frame.Navigate(typeof(StaffMainPage));
            
        }

        private void Tickets_Btn_Click(object sender, RoutedEventArgs e)
        {
            Frame.Navigate(typeof(TicketsMainPage));
        }

        private void CarParks_Btn_Click(object sender, RoutedEventArgs e)
        {
            Frame.Navigate(typeof(CarParksMainPage));
        }
    }
}
