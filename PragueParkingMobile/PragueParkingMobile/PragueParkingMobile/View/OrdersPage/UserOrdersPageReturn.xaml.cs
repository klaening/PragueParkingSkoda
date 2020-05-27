using PPMobile.Utility;
using PPMobile.ViewModel;
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
            BindingContext = new UserOrdersPageActiveVM();
        }
    }
}