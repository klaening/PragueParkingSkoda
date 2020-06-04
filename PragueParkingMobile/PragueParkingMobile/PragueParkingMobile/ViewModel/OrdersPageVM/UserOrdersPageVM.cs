using Newtonsoft.Json;
using PPMobile.Services;
using PPMobile.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Text;

namespace PPMobile.ViewModel
{
    public class UserOrdersPageVM : BaseViewModel
    {
        private ObservableCollection<TicketInfoView> _parkList;
        public ObservableCollection<TicketInfoView> ParkList
        {
            get => _parkList;
            set
            {
                _parkList = value;

                OnPropertyChanged("TicketList");
            }
        }
        private ObservableCollection<TicketInfoView> _returnList;
        public ObservableCollection<TicketInfoView> ReturnList
        {
            get => _returnList;
            set
            {
                _returnList = value;

                OnPropertyChanged("TicketList");
            }
        }
        private ObservableCollection<TicketInfoView> _activeList;
        public ObservableCollection<TicketInfoView> ActiveList
        {
            get => _activeList;
            set
            {
                _activeList = value;

                OnPropertyChanged("TicketList");
            }
        }

        public UserOrdersPageVM()
        {
            ParkList = new ObservableCollection<TicketInfoView>();
            ReturnList = new ObservableCollection<TicketInfoView>();
            ActiveList = new ObservableCollection<TicketInfoView>();

            var path = "ticketinfoview";

            var response = APIServices.GetRequest(path);

            var tempList = JsonConvert.DeserializeObject<ObservableCollection<TicketInfoView>>(response);

            foreach (var ticket in tempList)
            {
                if (ticket.TicketStatusesId == (int)StatusNameEnum.ParkPending)
                    ParkList.Add(ticket);
                if (ticket.TicketStatusesId == (int)StatusNameEnum.ParkAccepted || ticket.TicketStatusesId == (int)StatusNameEnum.ReturnAccepted)
                    ActiveList.Add(ticket);
                if (ticket.TicketStatusesId == (int)StatusNameEnum.ReturnPending)
                    ReturnList.Add(ticket);
            }
        }
    }
}
