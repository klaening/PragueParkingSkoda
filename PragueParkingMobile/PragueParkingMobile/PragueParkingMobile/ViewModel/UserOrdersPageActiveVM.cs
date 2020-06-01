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
        private ObservableCollection<TicketInfoView> _ticketList;
        public ObservableCollection<TicketInfoView> TicketList
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
            TicketList = new ObservableCollection<TicketInfoView>();

            var path = "ticketinfoview";

            var response = Services.GetRequest(path);
            
            var tempList = JsonConvert.DeserializeObject<ObservableCollection<TicketInfoView>>(response);

            foreach (var ticket in tempList)
            {
                if (ticket.StatusName == "Return Accepted")
                    TicketList.Add(ticket);
            }
        }
    }
}
