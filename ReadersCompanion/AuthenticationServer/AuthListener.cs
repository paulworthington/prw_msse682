using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Configuration;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Runtime.Serialization.Formatters;
using System.Runtime.Serialization.Formatters.Binary;
using System.Web.Security;
using DAL;

namespace AuthenticationServer
{
    public class SocketServer
    {
        private Socket _socket = null;
        Boolean authenticated = false;

        public SocketServer(Socket socket)
        {
            _socket = socket;
        }

        public void run()
        {
            // 1. get a stream to read/write
            NetworkStream stream = new NetworkStream(_socket);

            // 2. read the data sent by the client (Strings)
            BinaryReader reader = new BinaryReader(stream);
            BinaryWriter writer = new BinaryWriter(stream);
            String username = reader.ReadString();
            String password = reader.ReadString();
            Console.WriteLine();
            Console.WriteLine("Username: " + username + " Password: " + password);

            // **************************************************************************
            // I'd like to read/write a User object, but ...
            // For some reason, the AuthenticationServer fails to launch if I switch to
            // reading and writing a User object. (See below.)

            // 2. get the object using a BinaryFormatter
            //BinaryFormatter bf = new BinaryFormatter();
            //bf.AssemblyFormat = FormatterAssemblyStyle.Simple;
            //object o = bf.Deserialize(stream);
            //User user = o as User;
            //Console.WriteLine();
            //Console.WriteLine("Username: " + user.userName + " Password: " + user.userPass);
            //BinaryWriter writer = new BinaryWriter(stream);
            // ***************************************************************************

            // ***************************************************************************
            // 3. process the credentials and return a true/false
            // NOTE: commenting this out until I find out why authenticateUser() isn't working
            //authenticated = authenticateUser(username, password);
            // ***************************************************************************

            // 3. process the credentials and return a true/false
            // NOTE: hard-coded for now to demonstrate the usage of sockets and threads
            authenticated = true;
            writer.Write(authenticated);

            // 4. close the socket
            _socket.Close();
        }
    }

    public class Listener
    {
        public Boolean authenticateUser(String username, String password)
        {
            Boolean authenticated = false;
            try
            {
                // *************************************************************************
                // this doesn't work right now - I think it's not connecting to the database
                // but I don't know why - I've got the right connection string and
                // other app.config settings (so far as I know). This SHOULD be working!
                authenticated = System.Web.Security.Membership.ValidateUser(username, password);
            }
            catch (Exception e)
            {
                Console.WriteLine("PRW: SocketException: {0}", e);
            }

            return authenticated;
        }

        public void Listen()
        {
            TcpListener listener= null;
            try
            {
                Int32 PORT = 8000;
                IPAddress IPADDR = IPAddress.Parse("127.0.0.1");

                listener = new TcpListener(IPADDR, PORT);
                listener.Start();

                while (true)
                {
                    Console.Write("Waiting for a connection on port " + PORT + "...");

                    // Block until a client connects
                    Socket socket = listener.AcceptSocket();

                    // when a client connects...

                    // instantiate a SocketServer and delegate the socket to it
                    // spin it off in a thread
                    SocketServer ss = new SocketServer(socket);
                    Thread thread = new Thread(new ThreadStart(ss.run));
                    thread.Start();
                }
            }
            catch (SocketException e)
            {
                Console.WriteLine("PRW: SocketException: {0}", e);
            }
            finally
            {
                // Stop listening for new clients
                listener.Stop();
            }
        }
    }

    public class AuthListener
    {
        static void Main(string[] args)
        {
            try
            {
                Listener myListener = new Listener();
                myListener.Listen();
            }
            catch (Exception e)
            {
                Console.WriteLine("PRW: Exception creating Listener: " + e.Message);
            }
        }
    }
}
