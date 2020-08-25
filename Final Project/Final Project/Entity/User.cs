using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Final_Project
{
    class User
    {
        string userid;
        string password;
        string displayName;

        public string Userid { get => userid; set => userid = value; }
        public string Password { get => password; set => password = value; }
        public string DisplayName { get => displayName; set => displayName = value; }
    }
}
