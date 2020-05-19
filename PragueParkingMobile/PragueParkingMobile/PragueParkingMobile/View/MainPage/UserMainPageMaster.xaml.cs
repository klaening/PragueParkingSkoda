using PPMobile.View.OrdersPage;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace PPMobile.View.MainPage
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class UserMainPageMaster : ContentPage
    {
        public ListView ListView;

        public UserMainPageMaster()
        {
            InitializeComponent();

            BindingContext = new UserMainPageMasterViewModel();
            ListView = MenuItemsListView;
        }

        class UserMainPageMasterViewModel : INotifyPropertyChanged
        {
            public ObservableCollection<UserMainPageMasterMenuItem> MenuItems { get; set; }

            public UserMainPageMasterViewModel()
            {
                MenuItems = new ObservableCollection<UserMainPageMasterMenuItem>(new[]
                {
                    new UserMainPageMasterMenuItem { Id = 0, Title = "My Profile", TargetType= typeof(UserTabbedPage)},
                    new UserMainPageMasterMenuItem { Id = 1, Title = "Company" },
                    new UserMainPageMasterMenuItem { Id = 2, Title = "Sign Out" },
                });
            }

            #region INotifyPropertyChanged Implementation
            public event PropertyChangedEventHandler PropertyChanged;
            void OnPropertyChanged([CallerMemberName] string propertyName = "")
            {
                if (PropertyChanged == null)
                    return;

                PropertyChanged.Invoke(this, new PropertyChangedEventArgs(propertyName));
            }
            #endregion
        }
    }
}