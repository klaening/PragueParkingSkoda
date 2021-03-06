﻿using PP_Desktop.ViewModels;
using System;
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
using Windows.UI.Xaml.Navigation;

// The Blank Page item template is documented at https://go.microsoft.com/fwlink/?LinkId=234238

namespace PP_Desktop.Views
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class AddTicketPage : Page
    {
        private readonly AddTicketViewModel _viewModel;
        public AddTicketPage()
        {
            this.InitializeComponent();

            _viewModel = new AddTicketViewModel();
            DataContext = _viewModel;
        }

        private void Cancel_Clicked(object sender, RoutedEventArgs e)
        {
            Frame.GoBack();
        }
    }
}
