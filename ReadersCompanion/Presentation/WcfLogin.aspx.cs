using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using DAL;
using Service;
using Business;
using System.ServiceModel;
using ServiceReference1;

public partial class WcfLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        Boolean authenticated = false;

        String username = this.UsernameBox.Text;
        String password = this.PasswordBox.Text;

        try
        {
            ServiceReference1.Service1Client proxy = new ServiceReference1.Service1Client();
            if ((username.Equals("")) || (password.Equals("")))
            {
                loginLabel.Text = "Please enter both name and password";
                this.UsernameBox.Text = null;
                this.PasswordBox.Text = null;
            }
            else
            {
                authenticated = proxy.authenticateUser(username, password);
                if (authenticated.Equals(true))
                {
                    Session["authenticated"] = "true";
                    loginLabel.Text = "User authenticated! Welcome back, " + username + "!";
                    this.UsernameBox.Text = null;
                    this.PasswordBox.Text = null;
                }
                else
                {
                    loginLabel.Text = "Incorrect name or password";
                    this.UsernameBox.Text = null;
                    this.PasswordBox.Text = null;
                }
            }
        } catch (Exception e2)
        {
            Console.WriteLine("PRW: WCF exception from WcfLogin. Message: " + e2.Message);
        }
    }
}