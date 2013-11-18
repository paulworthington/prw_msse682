using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DAL;
using Service;

namespace Business
{
    public abstract class Manager
    {
        protected static Factory factory = Factory.GetInstance();
        protected static IService getService(String name)
        {
            return factory.getService(name);
        }
    }
}