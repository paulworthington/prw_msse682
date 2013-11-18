using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DAL;
using Service;

namespace Business
{
    public class UserMgr : Manager
    {

        public void Insert(User user)
        {
            IUserSvc userService = (IUserSvc)getService("User");
            userService.addUser(user);
        }

        //public void Delete(Item item)
        //{
        //    IItemSvc itemService = (IItemSvc)getService("User");
        //    itemService.deleteItem(item);
        //}

        public void Update(User user)
        {
            IUserSvc userService = (IUserSvc)getService("User");
            userService.updateUser(user);
        }

        public List<User> GetAll()
        {
            IUserSvc userService = (IUserSvc)getService("User");
            return userService.getAllUsers();
        }

        public User GetUser(String keyName, String keyValue)
        {
            IUserSvc userService = (IUserSvc)getService("User");
            return userService.getUser(keyName, keyValue);
        }

        public Boolean authenticate(User user)
        {
            IUserSvc userService = (IUserSvc)getService("User");
            return userService.authenticate(user);
        }

    }
}