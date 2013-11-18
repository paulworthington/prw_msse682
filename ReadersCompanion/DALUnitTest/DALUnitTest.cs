using System;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Data;
using System.Linq;
using DAL;

namespace DALUnitTest
{
    [TestClass]
    public class DALUnitTest
    {

        [TestMethod]
        public void AddItemAndDescTest()
        {
            readerDB01Entities dbCntxt = new readerDB01Entities();

            Item myItem = new Item();

            Random randomNumber = new Random();
            int thingNumber = randomNumber.Next(1, 1000);
            myItem.itemName = "half-coin " + Convert.ToString(thingNumber);
            myItem.itemType = "thing";
            myItem.firstMentionBook = 0;
            myItem.firstMentionChapter = 3;

            dbCntxt.Items.Add(myItem);
            dbCntxt.SaveChanges();

            ItemDescription myDesc = new ItemDescription();
            myDesc.bookNumber = 0;
            myDesc.description = "The half-coin given to Grace Beckett by Brother Cy " + Convert.ToString(thingNumber);
            myDesc.itemID = myItem.itemID;

            dbCntxt.ItemDescriptions.Add(myDesc);
            dbCntxt.SaveChanges();
        }

        [TestMethod]
        public void DeleteItemTest()
        {
            readerDB01Entities dbCntxt = new readerDB01Entities();

            Item myItem = new Item();

            // first add an item I want to delete
            Random randomNumber = new Random();
            int thingNumber = randomNumber.Next(1, 1000);
            myItem.itemName = "Delete Me " + Convert.ToString(thingNumber);
            myItem.itemType = "event";
            myItem.firstMentionBook = 1;
            myItem.firstMentionChapter = 18;

            dbCntxt.Items.Add(myItem);
            dbCntxt.SaveChanges();

            // now find the matching item and delete it
            Item deleteItem = (from rcrd in dbCntxt.Items where rcrd.itemName == myItem.itemName select rcrd).Single();
            if (deleteItem.itemName == myItem.itemName)
            {
                dbCntxt.Items.Remove(deleteItem);
                dbCntxt.SaveChanges();
            }
        }

        /*
        [TestMethod]
        public void simpleRetrieveTest()
        {
            // database context
            readerDB01Entities dbCntxt = new readerDB01Entities();

            // act -- go get the first record
            Item savedItem = (from rcrd in dbCntxt.Items where rcrd.itemID == 1 select rcrd).Single();

            // assert
            Assert.AreEqual(savedItem.itemID, 1);
        }
         */

        [TestMethod]
        public void RepoAddItemAndDescTest()
        {
            Item myItem = new Item();
            Random randomNumber = new Random();
            int thingNumber = randomNumber.Next(1, 1000);
            myItem.itemName = "repo test item " + Convert.ToString(thingNumber);
            myItem.itemType = "thing";
            myItem.firstMentionBook = 0;
            myItem.firstMentionChapter = 3;

            var itemRepository = new GenericRepository<Item>();
            itemRepository.Insert(myItem);

            ItemDescription myDesc = new ItemDescription();
            myDesc.bookNumber = 0;
            myDesc.description = "This is repo test item number " + Convert.ToString(thingNumber);
            myDesc.itemID = myItem.itemID;

            var itemDescriptionRepository = new GenericRepository<ItemDescription>();
            itemDescriptionRepository.Insert(myDesc);
        }

        // use repository to get all items from the database
        [TestMethod]
        public void RepoGetAllItemsTest()
        {
            GenericRepository<Item> itemRepository = new GenericRepository<Item>();

            List<Item> myItemList = itemRepository.GetAll().ToList<Item>();
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
        public void RepoDeleteItemTest()
        {
            // first add an item I want to delete
            Item myItem = new Item();
            Random randomNumber = new Random();
            int thingNumber = randomNumber.Next(1, 1000);
            myItem.itemName = "repo Delete Me " + Convert.ToString(thingNumber);
            myItem.itemType = "event";
            myItem.firstMentionBook = 1;
            myItem.firstMentionChapter = 18;

            var itemRepository = new GenericRepository<Item>();
            itemRepository.Insert(myItem);

            // NOPE
            //Item deleteItem = (from rcrd in dbCntxt.Items where rcrd.itemName == myItem.itemName select rcrd).Single();
            //if (deleteItem.itemName == myItem.itemName)
            //{
            //    dbCntxt.Items.Remove(deleteItem);
            //    dbCntxt.SaveChanges();
            //}
     
            // NOPE -- works in Unit Tests but not the GridView?
            // "conflicts with restraint"? does that mean I have to delete all the related
            // itemDescriptions and THEN delete the item?
           itemRepository.Delete(myItem);
        }

    }
}
