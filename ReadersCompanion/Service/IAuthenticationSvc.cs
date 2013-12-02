using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace Service
{
    public interface IAuthenticationSvc : IService
    {
        Boolean authenticateUser(String username, String password);
    }
}
