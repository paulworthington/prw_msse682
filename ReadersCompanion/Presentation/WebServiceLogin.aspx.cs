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

public partial class WebServiceLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        Boolean authenticated = false;
        String username = this.UsernameBox.Text;
        String password = this.PasswordBox.Text;
        AuthenticationWSMgr myAuthWSMgr = new AuthenticationWSMgr();
        try
        {
            //Console.WriteLine("UserLogin before, should be false: " + authenticated);
            authenticated = myAuthWSMgr.authenticateUser(username, password);
            //Console.WriteLine("UserLogin after, should be true: " + authenticated);

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
        catch (Exception e1)
        {
            Console.WriteLine("PRW: Web Service Communication Exception from UserLogin. Message: " + e1.Message);
        }
    }
}