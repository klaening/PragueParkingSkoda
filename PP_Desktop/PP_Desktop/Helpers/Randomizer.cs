using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Text;
using System.Threading.Tasks;

namespace PP_Desktop.Helpers
{
    public static class Randomizer
    {
        public static int GetRandomNumber<T>(IEnumerable<T> list)
        {
            int length = list.Count();

            Random rnd = new Random();
            int number = rnd.Next(0, length);

            return number;
        }
    }
}
