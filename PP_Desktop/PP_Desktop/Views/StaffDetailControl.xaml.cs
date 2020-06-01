using System;

using PP_Desktop.Models;

using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

// The User Control item template is documented at https://go.microsoft.com/fwlink/?LinkId=234236

namespace PP_Desktop.Views
{
    public sealed partial class StaffDetailControl : UserControl
    {
        public Staff MasterMenuItem
        {
            get { return GetValue(MasterMenuItemProperty) as Staff; }
            set { SetValue(MasterMenuItemProperty, value); }
        }

        public static readonly DependencyProperty MasterMenuItemProperty = DependencyProperty.Register("MasterMenuItem", typeof(Staff), typeof(StaffDetailControl), new PropertyMetadata(null, OnMasterMenuItemPropertyChanged));

        public StaffDetailControl()
        {
            InitializeComponent();
        }

        private static void OnMasterMenuItemPropertyChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var control = d as StaffDetailControl;
            control.ForegroundElement.ChangeView(0, 0, 1);
        }
    }
}
