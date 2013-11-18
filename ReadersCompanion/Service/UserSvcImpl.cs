using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace Service
{
    class UserSvcImpl : IUserSvc
    {
        // class data members
        public GenericRepository<User> userRepository;

        // constructor
        public UserSvcImpl()
        {
            userRepository = new GenericRepository<User>();
        }

        // methods
        public void addUser(User myUser)
        {
            userRepository.Insert(myUser);
        }

        public void deleteUser(User myUser)
        {
            userRepository.Delete(myUser);
        }

        public List<User> getAllUsers()
        {
            return userRepository.GetAll().ToList<User>();
        }

        public void updateUser(User myUser)
        {
            userRepository.Update(myUser);
        }

        public User getUser(String keyName, String keyValue)
        {
            return userRepository.GetByKey(keyName, keyValue).FirstOrDefault<User>();
        }

        public User getUser(String keyName, int keyValue)
        {
            return userRepository.GetByKey(keyName, keyValue).FirstOrDefault<User>();
        }

        public Boolean authenticate(User myUser)
        {
            Boolean authenticated = false;
            String searchName = "userName";
            String searchValue = myUser.userName;
            User foundUser = null;

            // search userRepository for myUser.userName
            // if/when a match is found, compare myUser.userPass and foundUser.userPass
            // if/when those values match, then the login is valid. Set authenticated to true.

            foundUser = getUser(searchName, searchValue);
            if (foundUser != null)
            {
                if (foundUser.userPass.Equals(myUser.userPass))
                {
                    authenticated = true;
                }
            }

            return authenticated;
        }
    }
}
