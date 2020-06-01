using Newtonsoft.Json.Schema;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;

namespace PPMobile.ViewModel.OrdersPageVM
{
    public class AcceptOrderPageVM : BaseViewModel
    {

        private string _regNo;
        
        public string RegNo
        {
            get => _regNo;
            set
            {
                _regNo = value;
                OnPropertyChanged();
            }
        }

    }
}
