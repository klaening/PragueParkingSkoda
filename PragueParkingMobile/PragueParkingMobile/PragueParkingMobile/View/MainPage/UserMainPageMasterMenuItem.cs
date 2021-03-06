﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace PPMobile.View.MainPage
{
    public class UserMainPageMasterMenuItem
    {
        public UserMainPageMasterMenuItem()
        {
            TargetType = typeof(UserMainPageMasterMenuItem);
        }
        public int Id { get; set; }

        public string Title { get; set; }

        public Type TargetType { get; set; }
        public Page navigation { get; set; }
    }
}