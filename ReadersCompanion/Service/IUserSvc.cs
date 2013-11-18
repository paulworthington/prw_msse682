using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace Service
{
    public interface IUserSvc : IService
    {
        void addUser(User myUser);
        void deleteUser(User myUser);
        List<User> getAllUsers();
        void updateUser(User myUser);
        User getUser(String keyName, String keyValue);
        User getUser(String keyName, int keyValue);
        Boolean authenticate(User myUser);
    }
}

