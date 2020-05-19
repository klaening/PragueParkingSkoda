using PPMobile.View;
using PPMobile.View.MainPage;
using System;
using Xamarin.Forms;

namespace PPMobile
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            MainPage = new UserMainPage();
        }

        //private void InitializeComponent()
        //{
        //    throw new NotImplementedException();
        //}

        protected override void OnStart()
        {
        }

        protected override void OnSleep()
        {
        }

        protected override void OnResume()
        {
        }
    }
}
