using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WcfClient1.ServiceReference1;

namespace WcfClient1
{
    class Program
    {
        static void Main(string[] args)
        {
            ServiceReference1.Service1Client proxy = new Service1Client();

            String s = proxy.Hello("John Doe");
            Console.Out.WriteLine(s);
            Console.ReadLine();
        }
    }
}
