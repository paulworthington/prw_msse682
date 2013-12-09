using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using DAL;
using Service;
using Business;


namespace WcfServiceLibrary1
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in both code and config file together.
    public class Service1 : IService1
    {
        public string Hello(String name)
        {
            return "Hello " + name;
        }

        public Boolean authenticateUser(String username, String password)
        {
            Boolean authenticated = false;

            // authentication techniques, in descending order of preference

            // 1. authenticate using the .NET membership API
            // Note: not working?!
            // --
            //authenticated = Membership.ValidateUser(username, password);

            // 2. authenticate using the application database instead of membership
            // Note: not working?!
            // --
            //User myUser = new User();
            //myUser.userName = username;
            //myUser.userPass = password;
            //UserMgr myUserMgr = new UserMgr();
            //authenticated = myUserMgr.authenticate(myUser);

            // 3. authenticate using a hard-coded value
            // Note: last resort
            // --
            authenticated = true;

            return authenticated;
        }
    }
}
