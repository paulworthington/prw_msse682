using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using System.Linq;
using DAL;
using Service;
using Business;

namespace BusinessUnitTest
{
    [TestClass]
    public class BusinessUnitTest
    {
        [TestMethod]
        public void AddItemUsingMgrTest()
        {
            // Steps:
            // Create a ItemMgr
            // Create an Item
            // Populate the Item
            // Add the Item using the ItemMgr
            // Create an ItemDescriptionMgr
            // Create an ItemDescription
            // Populate the ItemDescription
            // Add the ItemDescription using the ItemDescriptionMgr

            ItemMgr myItemMgr = new ItemMgr();
            Item myItem = new Item();
            Random randomNumber = new Random();
            int thingNumber = randomNumber.Next(1, 1000);
            myItem.itemName = "mgr test half-coin " + Convert.ToString(thingNumber);
            myItem.itemType = "thing";
            myItem.firstMentionBook = 0;
            myItem.firstMentionChapter = 3;

            myItemMgr.Insert(myItem);

            ItemDescriptionMgr myItemDescMgr = new ItemDescriptionMgr();
            ItemDescription myDesc = new ItemDescription();
            myDesc.bookNumber = 0;
            myDesc.description = "mgr test The half-coin given to Grace Beckett by Brother Cy " + Convert.ToString(thingNumber);
            myDesc.itemID = myItem.itemID;

            myItemDescMgr.Insert(myDesc);
        }


        [TestMethod]
        public void GetAllItemsWithMgrTest()
        {
            ItemMgr myItemMgr = new ItemMgr();

            List<Item> myItemList = myItemMgr.GetAll();
            Assert.IsTrue(myItemList.Count > 0);

            foreach (Item itemListMember in myItemList) // Loop through List with foreach
            {
                Console.WriteLine(itemListMember.itemName);
            }

            for (int i = 0; i < myItemList.Count; i++) // Loop through List with for
            {
                Console.WriteLine(myItemList[i].itemName);
            }
        }

        [TestMethod]
        public void GetAllItemsQueryableWithMgrTest()
        {
            ItemMgr myItemMgr = new ItemMgr();

            IQueryable<Item> myItemList = myItemMgr.GetAllAsQueryable();
            Assert.IsTrue(myItemList.Count<Item>() > 0);

            foreach (Item itemListMember in myItemList) // Loop through List with foreach
            {
                Console.WriteLine(itemListMember.itemName);
            }
        }

        [TestMethod]
        public void GetAlphaListMgrTest()
        {
            String alpha = "B";
            ItemMgr myItemMgr = new ItemMgr();
            List<Item> myItemList = myItemMgr.GetAlphaList(alpha);
            Assert.AreNotEqual(0, myItemList.Count<Item>());
            foreach (Item itemListMember in myItemList) // Loop through List with foreach
            {
                Console.WriteLine(itemListMember.itemName);
            }
        }

        [TestMethod]
        public void GetItemByKeyWithMgrTest()
        {
            ItemMgr myItemMgr = new ItemMgr();
            ItemDescriptionMgr myItemDescMgr = new ItemDescriptionMgr();

            String searchName = "itemName";

            // this is the key value used on insert and again on select
            Random randomNumber = new Random();
            int thingNumber = randomNumber.Next(1, 1000);
            String searchValue = "mgr test Lisa Simpson " + Convert.ToString(thingNumber);

            // first add an item I want to be able to get
            Item myItem = new Item();

            myItem.itemName = searchValue;
            myItem.itemType = "person";
            myItem.firstMentionBook = 0;
            myItem.firstMentionChapter = 3;

            myItemMgr.Insert(myItem);

            ItemDescription myDesc = new ItemDescription();
            myDesc.bookNumber = 0;
            myDesc.description = "mgr test Lisa Simpson " + Convert.ToString(thingNumber);
            myDesc.itemID = myItem.itemID;

            myItemDescMgr.Insert(myDesc);

            // use the same key to search
            Item resultItem = myItemMgr.GetItem(searchName, searchValue);

            //// result will be not null if I found a record with the given search value
            //Assert.IsNotNull(resultItem);

            // result's itemName should match the searchValue
            Assert.AreEqual(searchValue, resultItem.itemName, true);
        }

        [TestMethod]
        public void AuthenticateFalseMgrTest()
        {
            // Steps:
            // Create a UserMgr
            // Create a User
            // Populate the User
            // Use the UserMgr to authenticate the User

            UserMgr myUserMgr = new UserMgr();
            User myUser = new User();
            myUser.userName = "pworthin";
            myUser.userPass = "abcdefgh";
            myUser.userType = "0";

            Boolean isValid = true;
            isValid = myUserMgr.authenticate(myUser);
            Assert.IsFalse(isValid);
        }

        [TestMethod]
        public void AuthenticateTrueMgrTest()
        {
            // Steps:
            // Create a UserMgr
            // Create a User
            // Populate the User
            // Use the UserMgr to authenticate the User

            UserMgr myUserMgr = new UserMgr();
            User myUser = new User();
            myUser.userName = "hsimpson";
            myUser.userPass = "12345678";
            myUser.userType = "0";

            Boolean isValid = false;
            isValid = myUserMgr.authenticate(myUser);
            Assert.IsTrue(isValid);
        }
    }
}
