using PP_Desktop.ViewModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Security.Cryptography.X509Certificates;
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

        private void AddStaff_Btn_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
