using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

public partial class Login : System.Web.UI.Page
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

        User myUser = new User();

        myUser.userName = this.UsernameBox.Text;
        myUser.userPass = this.PasswordBox.Text;

        // To be added in later weeks
        //UserMgr userManager = new UserMgr();
        //userManager.authenticate(myUser);

        // Temporary code in order to test UI
        if ((myUser.userName.Equals("")) || (myUser.userPass.Equals("")))
            System.Web.UI.ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", "alert('" + "Please enter name and password" + "')", true);
        else if ((myUser.userName.Equals("hsimpson")) && (myUser.userPass.Equals("12345678")))
            System.Web.UI.ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", "alert('" + "User authenticated" + "')", true);
        else
            System.Web.UI.ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", "alert('" + "Incorrect name or password" + "')", true);

    }
}