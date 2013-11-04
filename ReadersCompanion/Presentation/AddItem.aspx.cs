using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

public partial class AddItem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        // instantiate an Item object
        // populate the Item object from the text boxes
        // instantiate an ItemManager object
        // call the ItemManager's Insert method and pass the Item

        Item myItem = new Item();

        myItem.itemName = this.TextBox1.Text;
        myItem.itemType = this.DropDownList1.SelectedValue;
        myItem.firstMentionBook = this.DropDownList2.SelectedIndex;
        myItem.firstMentionChapter = this.DropDownList3.SelectedIndex;

        // To be added in later weeks
        // NOTE: exception handling and/or database modification needed to prevent duplicate Items
        //ItemMgr itemManager = new ItemMgr();
        //itemManager.Insert(myItem);

        // Temporary code in order to test UI
        readerDB01Entities dbCntxt = new readerDB01Entities();
        dbCntxt.Items.Add(myItem);
        dbCntxt.SaveChanges();

        // Now the Item has been added, but we have to find its itemID in order to add the ItemDescription
        // NOTE: exception handling to be added in later weeks
        Item addedItem = (from rcrd in dbCntxt.Items where rcrd.itemName == myItem.itemName select rcrd).Single();

        // instantiate an ItemDescription object
        // populate the ItemDescription object from the text boxes
        // instantiate an ItemDescMgr object
        // call the ItemDescMgr's Insert method and pass the item description

        ItemDescription myItemDescription = new ItemDescription();

        myItemDescription.bookNumber = this.DropDownList4.SelectedIndex;
        myItemDescription.description = this.TextBox3.Text;
        myItemDescription.itemID = addedItem.itemID;

        // To be added in later weeks
        //ItemDescMgr itemDescManager = new ItemDescMgr();
        //itemDescMgr.Insert(myItemDescription);

        // Temporary code in order to test UI
        dbCntxt.ItemDescriptions.Add(myItemDescription);
        dbCntxt.SaveChanges();

        System.Web.UI.ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", "alert('" + "Item added" + "')", true);
    }

}