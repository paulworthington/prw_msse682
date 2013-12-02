using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Service;

namespace Business
{
    public class AuthenticationMgr : Manager
    {
        public Boolean authenticateUser(String username, String password)
        {
            IAuthenticationSvc authService = (IAuthenticationSvc)getService("Authentication");
            return authService.authenticateUser(username, password);
        }
    }
}
