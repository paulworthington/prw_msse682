using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Service;
using Business;

public partial class UserLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {

        // instantiate a User object
        // populate User object with username and password
        // instantiate a UserMgr object
        // use the UserMgr's authenticate() method to test user credentials

        Boolean authenticated = false;

        User myUser = new User();
        myUser.userName = this.UsernameBox.Text;
        myUser.userPass = this.PasswordBox.Text;

        UserMgr myUserMgr = new UserMgr();

        if ((myUser.userName.Equals("")) || (myUser.userPass.Equals("")))
        {
            loginLabel.Text = "Please enter both name and password";
            this.UsernameBox.Text = null;
            this.PasswordBox.Text = null;
            //System.Web.UI.ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", "alert('" + "Please enter both name and password" + "')", true);
        }
        else
        {
            authenticated = myUserMgr.authenticate(myUser);
            if (authenticated.Equals(true))
            {
                Session["authenticated"] = "true";
                loginLabel.Text = "User authenticated! Welcome back, " + myUser.userName + "!";
                this.UsernameBox.Text = null;
                this.PasswordBox.Text = null;
            }
            else
            {
                loginLabel.Text = "Incorrect name or password";
                this.UsernameBox.Text = null;
                this.PasswordBox.Text = null;
                //System.Web.UI.ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", "alert('" + "Please enter both name and password" + "')", true);
            }
        }
    }
}