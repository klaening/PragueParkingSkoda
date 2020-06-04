using PP_Desktop.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace PP_Desktop.Helpers
{
    public static class ExtensionMethods
    {
        public static ObservableCollection<ParkingSpots> FilterList(this ObservableCollection<ParkingSpots> list, VehicleTypes selectedVehicle)
        {
            var filtered = list.Where(x => x.ParkCapacity >= selectedVehicle.ParkSize);
            return new ObservableCollection<ParkingSpots>(filtered);
        }

        public static ParkingSpots AssignRandomParkingSpot(this ObservableCollection<ParkingSpots> filteredAvailableParkingSpots, ref ParkingSpots selectedParkingSpot)
        {
            //Skriva om den till en generic???
            //Blir null varje gång
            if (selectedParkingSpot == null)
            {
                int randomNumber = Randomizer.GetRandomNumber(filteredAvailableParkingSpots);
                selectedParkingSpot = filteredAvailableParkingSpots[randomNumber];
                return selectedParkingSpot;
            }

            return selectedParkingSpot;
        }
    }
}
