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
        private ObservableCollection<Ticket> _ticketList;
        public ObservableCollection<Ticket> TicketList
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
            var path = "tickets";

            var response = Services.GetRequest(path);
            string result = response.Content.ReadAsStringAsync().Result;

            var resultList = JsonConvert.DeserializeObject<List<Ticket>>(result);

            ObservableCollection<Ticket> dbTicketList = new ObservableCollection<Ticket>(resultList);

            TicketList = dbTicketList;
        }
    }
}
