using Newtonsoft.Json;
using PP_Desktop.Models;
using PP_Desktop.Services;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Net.Cache;
using System.Text;
using System.Threading.Tasks;

namespace PP_Desktop.ViewModels
{
    public class UpdateTicketViewModel : BindableBase
    {
        private Tickets _selectedTicket;
        public Tickets SelectedTicket
        {
            get => _selectedTicket;
            set => SetProperty(ref _selectedTicket, value);
        }

        public VehicleTypes SelectedVehicleType
        {
            get;
            set;
        }

        public ObservableCollection<VehicleTypes> VehicleTypeList
        {
            get;
            set;
        }
        public UpdateTicketViewModel()
        {
            var result = Requests.GetRequest(Paths.VehicleTypes);
            var vehicleTypeList = JsonConvert.DeserializeObject<ObservableCollection<VehicleTypes>>(result);

            VehicleTypeList = vehicleTypeList;

            SelectedVehicleType = VehicleTypeList.FirstOrDefault(x => x.ID == SelectedTicket.VehicleTypesID);
        }

        public void UpdateStaff()
        {
            Tickets ticket = new Tickets()
            {
                VehicleTypesID = SelectedVehicleType.ID
            };

            Requests.PutRequestAsync(Paths.Tickets, ticket);
        }
    }
}
