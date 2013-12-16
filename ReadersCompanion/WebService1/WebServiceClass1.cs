using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebService1
{
    public class WebServiceClass1
    {
    }
}



//using System;
//using System.Collections.Generic;
//using System.IO;
//using System.Linq;
//using System.Web;
//using System.Web.Services;
//using System.Xml;
//using SVC;

//namespace WSApplication
//{
//    /// <summary>
//    /// Summary description for Service1
//    /// </summary>
//    [WebService(Namespace = "http://tempuri.org/")]
//    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
//    [System.ComponentModel.ToolboxItem(false)]
//    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
//    // [System.Web.Script.Services.ScriptService]
//    public class Service1 : System.Web.Services.WebService
//    {
//        private bool logonFound, passwordFound;
//        private string verifiedLogon, xmlReader, lclXml, lclUsername, lclPassword;
//        private SVC_XMLHandler svcXMLHandler;
//        private SVC_AuthenticateUser svcAuthenticateUser;
 

//        [WebMethod]
//        public string AuthenticateUser(string xmlLogon, string xmlPassword)
//        {
//            svcXMLHandler = new SVC_XMLHandler();
//            svcAuthenticateUser = new SVC_AuthenticateUser();

//            lclUsername = svcXMLHandler.DecodeXML(xmlLogon);
//            lclPassword = svcXMLHandler.DecodeXML(xmlPassword);

//            logonFound = svcAuthenticateUser.AuthenticateLogon(lclUsername);
//            passwordFound = svcAuthenticateUser.AuthenticatePassword(lclPassword);

//            if ((logonFound && passwordFound) == true)
//            {
//                verifiedLogon = lclUsername;
//                return verifiedLogon;
//            }
//            else
//            {
//                return "User not verified";
//            }
//        }
//        public string GetData(int value)
//        {
//            return string.Format("You entered: {0}", value);
//        }
//    }
//}