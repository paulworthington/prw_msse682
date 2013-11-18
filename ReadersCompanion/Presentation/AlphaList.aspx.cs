using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Service;
using Business;

public partial class AlphaList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
            return;

        if (!string.IsNullOrEmpty(Request.QueryString["letter"]))
        {
            string letter = Request.QueryString["letter"];
            ItemMgr myItemMgr = new ItemMgr();
            List<Item> myItemList = myItemMgr.GetAlphaList(letter);

            // how do I get the list of items to display on the web page instead of the console?
            foreach (Item itemListMember in myItemList)
            {
                Console.WriteLine(itemListMember.itemName);
            }
            contentLabel.Text = "You selected the letter <strong>" + letter + "</strong>.<br>This is where the query results will be displayed when this feature is implemented.";
        }
    }
}