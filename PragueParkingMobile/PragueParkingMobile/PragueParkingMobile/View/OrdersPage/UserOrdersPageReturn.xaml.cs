﻿using PPMobile.Model;
using PPMobile.Utility;
using PPMobile.ViewModel;
using PPMobile.ViewModel.OrdersPageVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace PPMobile.View.OrdersPage
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class UserOrdersPageReturn : ContentPage
    {
        public UserOrdersPageReturn()
        {
            InitializeComponent();
            BindingContext = new UserOrdersPageReturnVM();
        }

        private async void OrdersReturnPage_ItemSelected(object sender, SelectedItemChangedEventArgs e)
        {
            await Navigation.PushAsync(new AcceptOrderPage(e.SelectedItem as Tickets));
        }
    }
}