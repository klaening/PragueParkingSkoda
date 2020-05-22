using PPMobile.View.OrdersPage;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Xamarin.Forms;

namespace PPMobile.ViewModel
{
    public class UserMainPageVM : BaseViewModel
    {
        public INavigation Navigation { get; set; }
        public ICommand OrdersBtnClicked { get; set; }

        public UserMainPageVM(INavigation navigation)
        {
            this.Navigation = navigation;
            this.OrdersBtnClicked = new Command(async () => await OrdersPageNav());
        }

        public async Task OrdersPageNav()
        {
            await Navigation.PushAsync(new UserTabbedPage());
        }

        
    }
}
