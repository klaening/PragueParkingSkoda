using PPMobile.ViewModel;
using System;
using System.Collections.Generic;
using System.Text;

namespace PPMobile.Utility
{
    public static class ViewModelLocator
    {
        public static UserOrdersPageVM UserOrdersPageVM { get; set; } = new UserOrdersPageVM();  
    }
}
