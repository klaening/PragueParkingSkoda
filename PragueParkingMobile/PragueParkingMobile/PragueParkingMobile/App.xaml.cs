using PPMobile.APIServices;
using PPMobile.View;
using PPMobile.View.MainPage;
using PPMobile.View.OrdersPage;
using System;
using Xamarin.Forms;

namespace PPMobile
{
    public partial class App : Application
    {
        public static TicketDataService TicketDataService { get; } = new TicketDataService();
        public App()
        {
            InitializeComponent();

            //MainPage = new UserTabbedPage();
            MainPage = new NavigationPage(new LoginPage());
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
