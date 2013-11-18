using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DAL;
using Service;

namespace Business
{
    public class ItemMgr : Manager
    {

        public void Insert(Item item)
        {
            IItemSvc itemService = (IItemSvc)getService("Item");
            itemService.addItem(item);
        }

        public void Delete(Item item)
        {
            IItemSvc itemService = (IItemSvc)getService("Item");
            itemService.deleteItem(item);
        }

        public void Update(Item item)
        {
            IItemSvc itemService = (IItemSvc)getService("Item");
            itemService.updateItem(item);
        }

        public List<Item> GetAll()
        {
            IItemSvc itemService = (IItemSvc)getService("Item");
            return (List<Item>)itemService.getAllItems();
        }

        public Item GetItem(String keyName, String keyValue)
        {
            IItemSvc itemService = (IItemSvc)getService("Item");
            return itemService.getItem(keyName, keyValue);
        }

    }
}