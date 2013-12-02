using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Threading;
using System.Threading.Tasks;
using System.Configuration;
using System.IO;
using System.Net;
using System.Net.Sockets;
using AuthenticationServer;
using DAL;
using System.Runtime.Serialization.Formatters.Binary;
using System.Runtime.Serialization.Formatters;

namespace AuthenticationServerUnitTest
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void AuthenticationServerStringTest()
        {
            // NOTE: YOU MUST START THE AUTHENTICATION SERVER INDEPENDENTLY FIRST

            Int32 PORT = 8000;
            String USERNAME = "hsimpson";
            String PASSWORD = "12345678++";
            Boolean result = false;

            Socket socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

            try
            {
                IPEndPoint ipEndPoint = new IPEndPoint(IPAddress.Parse("127.0.0.1"), PORT);
                socket.Connect(ipEndPoint);
                NetworkStream stream = new NetworkStream(socket);
                BinaryWriter writer = new BinaryWriter(stream);
                BinaryReader reader = new BinaryReader(stream);
                writer.Write(USERNAME);
                writer.Write(PASSWORD);

                Console.WriteLine("Result before, should be false: " + result);
                result = reader.ReadBoolean();
                Console.WriteLine("Result after, should be true: " + result);
            }
            catch (Exception e)
            {
                Console.WriteLine("PRW: Socket Communication Exception from test. Message: " + e.Message);
            }
            finally
            {
                socket.Shutdown(SocketShutdown.Both);
                socket.Close();
            }

            Assert.IsTrue(result);

        }

        // Test for when AuthenticationServer is setup to read/write User objects
        // because when the AuthenticationServer is set up to read/write User objects,
        // it fails to launch. And the console window doesn't stay open long enough
        // for me to read the error message.

        //[TestMethod]
        //public void AuthenticationServerUserTest()
        //{
        //    // NOTE: YOU MUST START THE AUTHENTICATION SERVER INDEPENDENTLY FIRST

        //    User myTestUser = null;
        //    myTestUser.userName = "hsimpson";
        //    myTestUser.userPass = "12345678++";

        //    Int32 PORT = 8000;
        //    Boolean result = false;

        //    Socket socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

        //    try
        //    {
        //        IPEndPoint ipEndPoint = new IPEndPoint(IPAddress.Parse("127.0.0.1"), PORT);
        //        socket.Connect(ipEndPoint);
        //        NetworkStream stream = new NetworkStream(socket);
        //        BinaryFormatter formatter = new BinaryFormatter();
        //        formatter.AssemblyFormat = FormatterAssemblyStyle.Simple;

        //        formatter.Serialize(stream, myTestUser);

        //        Console.WriteLine("Result before, should be false: " + result);
        //        BinaryReader reader = new BinaryReader(stream);
        //        result = reader.ReadBoolean();
        //        Console.WriteLine("Result after, should be true: " + result);
        //    }
        //    catch (Exception e)
        //    {
        //        Console.WriteLine("PRW: Exception trying to communicate with server via socket. Message: " + e.Message);
        //    }
        //    Assert.IsTrue(result);

        //    socket.Shutdown(SocketShutdown.Both);
        //    socket.Close();

        //}
    }
}
