using Newtonsoft.Json;
using PPMobile.APIServices;
using PPMobile.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace PPMobile.ViewModel
{
    public class UserOrdersPageActiveVM : BaseViewModel
    {
        private ObservableCollection<TicketView> _ticketList;
        public ObservableCollection<TicketView> TicketList
        {
            get => _ticketList;
            set
            {
                _ticketList = value;
                
                OnPropertyChanged("TicketList");
            }
        }
        public UserOrdersPageActiveVM()
        {
            TicketList = new ObservableCollection<TicketView>();

            var path = "ticketview";

            var response = Services.GetRequest(path);
            
            var tempList = JsonConvert.DeserializeObject<ObservableCollection<TicketView>>(response);

            //foreach (var ticket in tempList)
            //{
            //    if (ticket.Reg == "Return Accepted")
            //        TicketList.Add(ticket);
            //}
        }
    }
}
