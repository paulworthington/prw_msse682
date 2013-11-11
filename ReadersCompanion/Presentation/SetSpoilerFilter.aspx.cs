using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

public partial class SetSpoilerFilter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
            return;

        try
        {
            if (!Session["SpoilerFilter"].Equals(null))
            {
                int spoilerFilter = (int)Session["SpoilerFilter"];
                switch (spoilerFilter)
                {
                    case 1:
                        spoilerFilterLabel.Text = "The latest book you've read is <strong>Beyond The Pale</strong>.";
                        break;
                    case 2:
                        spoilerFilterLabel.Text = "The latest book you've read is <strong>The Keep of Fire</strong>.";
                        break;
                    case 3:
                        spoilerFilterLabel.Text = "The latest book you've read is <strong>The Dark Remains</strong>.";
                        break;
                    default:
                        spoilerFilterLabel.Text = "";
                        break;
                }
            }
        }
        catch (Exception myException)
        {
            Session["SpoilerFilter"] = null;
            spoilerFilterLabel.Text = "";
        }


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        // instantiate a SpoilerFilter object
        // populate the SpoilerFilter object from the dropdown list
        // store the spoiler filter information in the Session object

        SpoilerFilter mySpoilerFilter = new SpoilerFilter();
        mySpoilerFilter.latestBookRead = Convert.ToInt32(this.DropDownList2.SelectedValue);
        Session["SpoilerFilter"] = mySpoilerFilter.latestBookRead;

        //System.Web.UI.ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", "alert('" + "Spoiler Filter Set" + "')", true);

        int spoilerFilter = (int)Session["SpoilerFilter"];
        switch (spoilerFilter)
        {
            case 1:
                spoilerFilterLabel.Text = "The latest book you've read is <strong>Beyond The Pale</strong>.";
                break;
            case 2:
                spoilerFilterLabel.Text = "The latest book you've read is <strong>The Keep of Fire</strong>.";
                break;
            case 3:
                spoilerFilterLabel.Text = "The latest book you've read is <strong>The Dark Remains</strong>.";
                break;
            default:
                spoilerFilterLabel.Text = "";
                break;
        }
    }
}