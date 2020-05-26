﻿using PPMobile.View.OrdersPage;
using PPMobile.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace PPMobile.View.MainPage
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class UserMainPageDetail : ContentPage
    {
        public UserMainPageDetail()
        {
            InitializeComponent();
            BindingContext = new UserMainPageVM();
        }

        private async void Button_Clicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new UserTabbedPage());
        }
    }
}