using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WcfServiceLibrary1;
using System.ServiceModel;

namespace WcfHost1
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                Console.Out.WriteLine("Starting Host");
                ServiceHost host = new ServiceHost(typeof(WcfServiceLibrary1.Service1));
                host.Open();
                Console.Out.WriteLine("Service started; enter Return to exit application");
                Console.ReadLine();
                host.Close();
            }
            catch (Exception e)
            {
                Console.Out.WriteLine(e.Message);
                Console.ReadLine();
            }
        }
    }
}
