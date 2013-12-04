using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Net;
using System.Net.Sockets;
using AuthenticationServer;
using DAL;
using Service;

namespace ServiceUnitTest
{
    [TestClass]
    public class ServiceUnitTest
    {

        [TestMethod]
        public void AddItemUsingServiceTest()
        {
            // Note: No Service Factory in this test

            // Steps:
            // instantiate an ItemSvc
            // instantiate an ItemDescriptionSvc
            // instantiate an Item
            // populate Item
            // use ItemSvc to add Item
            // instantiate an ItemDescription
            // populate ItemDescription
            // use ItemDescriptionSvc to add ItemDescription

            IItemSvc myItemService = new ItemSvcImpl();
            IItemDescriptionSvc myItemDescriptionService = new ItemDescriptionSvcImpl();

            Item myItem = new Item();
            Random randomNumber = new Random();
            int thingNumber = randomNumber.Next(1, 1000);
            myItem.itemName = "service test half-coin " + Convert.ToString(thingNumber);
            myItem.itemType = "thing";
            myItem.firstMentionBook = 0;
            myItem.firstMentionChapter = 3;

            myItemService.addItem(myItem);

            ItemDescription myDesc = new ItemDescription();
            myDesc.bookNumber = 0;
            myDesc.description = "service test The half-coin given to Grace Beckett by Brother Cy " + Convert.ToString(thingNumber);
            myDesc.itemID = myItem.itemID;

            myItemDescriptionService.addItemDescription(myDesc);

        }

        [TestMethod]
        public void DeleteItemUsingServiceTest()
        {
            // Note: No Service Factory in this test

            IItemSvc myItemService = new ItemSvcImpl();
            String searchName = "itemName";  // the column name I'm searching by

            // add a unique item that I want to delete
            // this will be the target item
            Random randomNumber = new Random();
            int thingNumber = randomNumber.Next(1, 1000);
            String searchValue = "svc del test Castle City " + Convert.ToString(thingNumber);

            Item myItem = new Item();

            myItem.itemName = searchValue;
            myItem.itemType = "place";
            myItem.firstMentionBook = 0;
            myItem.firstMentionChapter = 3;

            myItemService.addItem(myItem);

            // Note: at this time, do not add an item description
            // will make this test easier

            // search for the item to be deleted
            Item targetItem = myItemService.getItem(searchName, searchValue);

            // delete that item
            myItemService.deleteItem(targetItem);
        }

        // use service to get all items from the database
        [TestMethod]
        public void GetAllItemsWithServiceTest()
        {
            IItemSvc myItemService = new ItemSvcImpl();

            List<Item> myItemList = myItemService.getAllItems();
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
        public void GetAllItemsQueryableServiceTest()
        {
            IItemSvc myItemService = new ItemSvcImpl();

            IQueryable<Item> myItemList = myItemService.getAllItemsQueryable();

            //foreach (Item itemListMember in myItemList) // Loop through List with foreach
            //{
            //    Console.WriteLine(itemListMember.itemName);
            //}

            // query for a filtered list of items
            // select all rows from myItemList where the itemName starts with T and order the results by itemName
            List<Item> anotherItemList = (from rcrd in myItemList where rcrd.itemName.StartsWith("T") orderby rcrd.itemName select rcrd).ToList<Item>();

            foreach (Item itemListMember in anotherItemList) // Loop through List with foreach
            {
                Console.WriteLine(itemListMember.itemName);
            }
        }

        [TestMethod]
        public void GetAlphaListServiceTest()
        {
            String alpha = "T";
            IItemSvc myItemService = new ItemSvcImpl();
            List<Item> myItemList = myItemService.getAlphaList(alpha);
            Assert.AreNotEqual(0, myItemList.Count<Item>());
            foreach (Item itemListMember in myItemList) // Loop through List with foreach
            {
                Console.WriteLine(itemListMember.itemName);
            }
        }


        // get item by key from Item Service, using string name and string value
        [TestMethod]
        public void GetItemByKeyWithItemService()
        {
            IItemSvc myItemService = new ItemSvcImpl();
            IItemDescriptionSvc myItemDescriptionService = new ItemDescriptionSvcImpl();

            String searchName = "itemName";

            // this is the key value used on insert and again on select
            Random randomNumber = new Random();
            int thingNumber = randomNumber.Next(1, 1000);
            String searchValue = "service test Bart Simpson " + Convert.ToString(thingNumber);

            // first add an item I want to be able to get
            Item myItem = new Item();

            myItem.itemName = searchValue;
            myItem.itemType = "person";
            myItem.firstMentionBook = 0;
            myItem.firstMentionChapter = 3;

            myItemService.addItem(myItem);

            ItemDescription myDesc = new ItemDescription();
            myDesc.bookNumber = 0;
            myDesc.description = "service test Bart Simpson " + Convert.ToString(thingNumber);
            myDesc.itemID = myItem.itemID;

            myItemDescriptionService.addItemDescription(myDesc);

            // use the same key to search
            Item resultItem = myItemService.getItem(searchName, searchValue);

            //// result will be not null if I found a record with the given search value
            //Assert.IsNotNull(resultItem);

            // result's itemName should match the searchValue
            Assert.AreEqual(searchValue, resultItem.itemName, true);
        }


        // add item using a factory to create services
        [TestMethod]
        public void AddItemUsingFactoryTest()
        {
            // Steps:
            // Create a Factory
            // Use the factory to create an Item Service and an Item Description Service
            // Create an Item
            // Add the Item
            // Create an Item Description
            // Add the Item Description

            Factory myFactory = new Factory();
            IItemSvc myItemService = (IItemSvc)myFactory.getService("Item");
            IItemDescriptionSvc myItemDescriptionService = (IItemDescriptionSvc)myFactory.getService("ItemDescription");

            Item myItem = new Item();
            Random randomNumber = new Random();
            int thingNumber = randomNumber.Next(1, 1000);
            myItem.itemName = "factory test Pearl River " + Convert.ToString(thingNumber);
            myItem.itemType = "thing";
            myItem.firstMentionBook = 0;
            myItem.firstMentionChapter = 3;

            myItemService.addItem(myItem);

            ItemDescription myDesc = new ItemDescription();
            myDesc.bookNumber = 0;
            myDesc.description = "factory test The Pearl River forms one of the boundaries between Louisiana and Mississippi " + Convert.ToString(thingNumber);
            myDesc.itemID = myItem.itemID;

            myItemDescriptionService.addItemDescription(myDesc);

        }

        // authenticate user using a factory to create service
        [TestMethod]
        public void AuthenticateFalseTest()
        {
            // Steps:
            // Create a Factory
            // Use the factory to create a User Service
            // Create an User
            // Use the Service to authenticate the User

            Factory myFactory = new Factory();
            IUserSvc myUserService = (IUserSvc)myFactory.getService("User");

            User myUser = new User();
            myUser.userName = "pworthin";
            myUser.userPass = "abcdefgh";
            myUser.userType = "0";

            Boolean isValid = true;
            isValid = myUserService.authenticateUser(myUser);

            Assert.IsFalse(isValid);
        }

        // authenticate user using a factory to create service
        [TestMethod]
        public void AuthenticateTrueTest()
        {
            // Steps:
            // Create a Factory
            // Use the factory to create a User Service
            // Create an User
            // Use the Service to authenticate the User

            Factory myFactory = new Factory();
            IUserSvc myUserService = (IUserSvc)myFactory.getService("User");

            User myUser = new User();
            myUser.userName = "hsimpson";
            myUser.userPass = "12345678";
            myUser.userType = "0";

            Boolean isValid = false;
            isValid = myUserService.authenticateUser(myUser);

            Assert.IsTrue(isValid);
        }

        // authenticate user using AuthenticationSvc
        [TestMethod]
        public void AuthenticateWithAuthSvcTest()
        {
            // NOTE: YOU MUST START THE AUTHENTICATION SERVER INDEPENDENTLY FIRST

            String USERNAME = "hsimpson";
            String PASSWORD = "12345678++";
            Boolean result = false;

            IAuthenticationSvc AuthSvc = new AuthenticationSvcSocketImpl();

            try
            {
                Console.WriteLine("Result before, should be false: " + result);
                result = AuthSvc.authenticateUser(USERNAME, PASSWORD);
                Console.WriteLine("Result after, should be true: " + result);
            }
            catch (Exception e)
            {
                Console.WriteLine("PRW: Socket Communication Exception from test. Message: " + e.Message);
            }

            Assert.IsTrue(result);
        }

    }
}
