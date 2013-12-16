using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace Service
{
    class AuthenticationSvcWebServiceImpl : IAuthenticationSvc
    {
        public Boolean authenticateUser(String username, String password)
        {
            Boolean result = false;

            try
            {
                WebSite1.WebService ws = new WebSite1.WebService();
                result = ws.authenticateUser(username, password);
            }
            catch (Exception e)
            {
                Console.WriteLine("PRW: Web Service Communication Exception. Message: " + e.Message);
            }
            finally
            {
            }

            return result;
        }
    }
}


