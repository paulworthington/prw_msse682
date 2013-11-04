using System;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Data;
using System.Linq;
using DAL;

namespace DALUnitTest
{
    [TestClass]
    public class UnitTest1
    {

        [TestMethod]
        public void AddItemTest()
        {
            readerDB01Entities dbCntxt = new readerDB01Entities();

            Item myItem = new Item();

            myItem.itemName = "half-coin";
            myItem.itemType = "thing";
            myItem.firstMentionBook = 0;
            myItem.firstMentionChapter = 3;

            dbCntxt.Items.Add(myItem);
            dbCntxt.SaveChanges();

            ItemDescription myDesc = new ItemDescription();
            myDesc.bookNumber = 0;
            myDesc.description = "The half-coin given to Grace Beckett by Brother Cy enables her to understand languages other than English.";
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
            myItem.itemName = "Colfax Avenue";
            myItem.itemType = "place";
            myItem.firstMentionBook = 1;
            myItem.firstMentionChapter = 18;

            dbCntxt.Items.Add(myItem);
            dbCntxt.SaveChanges();

            // now find the matching item and delete it
            Item deleteItem = (from rcrd in dbCntxt.Items where rcrd.itemName == "Colfax Avenue" select rcrd).Single();
            if (deleteItem.itemName == "Colfax Avenue")
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


    }
}
