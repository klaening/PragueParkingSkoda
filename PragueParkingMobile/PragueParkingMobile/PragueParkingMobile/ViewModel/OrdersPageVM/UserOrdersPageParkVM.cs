using Newtonsoft.Json;
using PPMobile.APIServices;
using PPMobile.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Text;

namespace PPMobile.ViewModel.OrdersPageVM
{
    public class UserOrdersPageParkVM : BaseViewModel
    {
        private ObservableCollection<Tickets> _ticketList;
        public ObservableCollection<Tickets> TicketList
        {
            get => _ticketList;
            set
            {
                _ticketList = value;

                OnPropertyChanged("TicketList");
            }
        }
        public UserOrdersPageParkVM()
        {
            TicketList = new ObservableCollection<Tickets>();

            var path = "tickets";

            var response = Services.GetRequest(path);

            var tempList = JsonConvert.DeserializeObject<ObservableCollection<Tickets>>(response);

            foreach (var ticket in tempList)
            {
                if (ticket.RegNo == "EFG 456")
                    TicketList.Add(ticket);
            }
        }
    }
}
