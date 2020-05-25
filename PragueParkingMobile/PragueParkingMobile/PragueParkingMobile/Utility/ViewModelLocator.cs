using PPMobile.ViewModel;
using System;
using System.Collections.Generic;
using System.Text;
using Xamarin.Forms;

namespace PPMobile.Utility
{
    public static class ViewModelLocator
    {
        public static UserOrdersPageVM UserOrdersPageVM { get; set; } = new UserOrdersPageVM(Navigation);
        public static UserMainPageVM UserMainPageVM { get; set; } = new UserMainPageVM(Navigation);

        public static INavigation Navigation { get; set; }
    }
}
