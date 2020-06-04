using PPMobile.View;
using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Input;
using Xamarin.Forms;

namespace PPMobile.ViewModel
{
    class SignOutPageVM : BaseViewModel
    {
        public ICommand SignOutCommand { get; }
        public INavigation Navigation { get; set; }
        public SignOutPageVM()
        {
            SignOutCommand = new Command(SignOut);
        }

        private void SignOut(object obj)
        {
            Navigation.PopModalAsync();
        }
    }
}
