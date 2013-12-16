using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Service;

namespace Business
{
    public class AuthenticationWSMgr : Manager
    {
        public Boolean authenticateUser(String username, String password)
        {
            IAuthenticationSvc authWSService = (IAuthenticationSvc)getService("AuthenticationWS");
            return authWSService.authenticateUser(username, password);
        }
    }
}
