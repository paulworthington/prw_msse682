using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Net;
using System.Net.Sockets;
using AuthenticationServer;
using DAL;

namespace Service
{
    public class AuthenticationSvcSocketImpl : IAuthenticationSvc
    {
        public Boolean authenticateUser(String username, String password)
        {
            Int32 PORT = 8000;
            Boolean result = false;

            Socket socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

            try
            {
                IPEndPoint ipEndPoint = new IPEndPoint(IPAddress.Parse("127.0.0.1"), PORT);
                socket.Connect(ipEndPoint);
                NetworkStream stream = new NetworkStream(socket);
                BinaryWriter writer = new BinaryWriter(stream);
                BinaryReader reader = new BinaryReader(stream);
                writer.Write(username);
                writer.Write(password);
                result = reader.ReadBoolean();
            }
            catch (Exception e)
            {
                Console.WriteLine("PRW: Socket Communication Exception. Message: " + e.Message);
            }
            finally
            {
                socket.Shutdown(SocketShutdown.Both);
                socket.Close();
            }

            return result;

        }
    }
}
