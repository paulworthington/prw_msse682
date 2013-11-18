using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace Service
{
    public class Factory
    {

        private static Factory factory = new Factory();

        public static Factory GetInstance()
        {
            return factory;
        }

        public IService getService(String serviceName)
        {
            IService serviceInstance = null;
            switch (serviceName)
            {
                case "Item":
                    serviceInstance = (IService)new ItemSvcImpl();
                    break;
                case "ItemDescription":
                    serviceInstance = (IService)new ItemDescriptionSvcImpl();
                    break;
                case "User":
                    serviceInstance = (IService)new UserSvcImpl();
                    break;
                default:
                    throw new System.ArgumentException("Unimplemented Service type: " + serviceName);
            }
            return serviceInstance;
        }


        public IGenericRepository getRepository(string repositoryName)
        {
            IGenericRepository repositoryInstance = null;
            switch (repositoryName)
            {
                case "Item":
                    repositoryInstance = (IGenericRepository)new GenericRepository<Item>();
                    break;
                case "ItemDescription":
                    repositoryInstance = (IGenericRepository)new GenericRepository<ItemDescription>();
                    break;
                case "User":
                    repositoryInstance = (IGenericRepository)new GenericRepository<User>();
                    break;
                default:
                    throw new System.ArgumentException("Unimplemented Repository type: " + repositoryName);
            }
            return repositoryInstance;
        }
    }
}