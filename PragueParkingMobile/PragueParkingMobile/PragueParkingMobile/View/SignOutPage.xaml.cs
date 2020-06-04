using PPMobile.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace PPMobile.View
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class SignOutPage : ContentPage
    {
        SignOutPageVM _viewModel;
        public SignOutPage()
        {
            InitializeComponent();
            _viewModel = new SignOutPageVM();

            BindingContext = _viewModel;
            _viewModel.Navigation = Navigation;

        }
    }
}