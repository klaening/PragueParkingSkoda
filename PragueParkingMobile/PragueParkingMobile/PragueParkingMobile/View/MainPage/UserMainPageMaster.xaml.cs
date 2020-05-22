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
                    new UserMainPageMasterMenuItem { Id = 0, Title = "My Profile", TargetType = typeof(UserProfilePage)},
                    new UserMainPageMasterMenuItem { Id = 1, Title = "Company", TargetType = typeof(CompanyInfoPage)},
                    new UserMainPageMasterMenuItem { Id = 2, Title = "Sign Out", TargetType = typeof(LoginPage)},
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

        private void MenuItemsListView_ItemTapped(object sender, ItemTappedEventArgs e)
        {           
            //Kanske en ItemTapped för att navigera? 
        }
    }
}