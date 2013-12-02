using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;


namespace ThreadFirst
{
    public class ThreadAche
    {
        public void Demonstrate()
        {
            int counter = 1;
            int maxCount = 3;
            while (counter <= maxCount)
            {
                Console.WriteLine(counter);
                counter += 1;
                Thread.Sleep(5000);
            }
        }
    }

    public class ThreadMaster
    {
        static void Main(string[] args)
        {
            int threadCounter = 1;
            int maxThreadCount = 3;
            while (threadCounter <= maxThreadCount)
            {
                ThreadAche myThreadAche = new ThreadAche();
                Thread myThread = new Thread(new ThreadStart(myThreadAche.Demonstrate));
                myThread.Start();
                threadCounter += 1;
            }
        }
    }
}
