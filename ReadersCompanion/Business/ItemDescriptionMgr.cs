using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DAL;
using Service;

namespace Business
{
    public class ItemDescriptionMgr : Manager
    {

        public void Insert(ItemDescription itemDesc)
        {
            IItemDescriptionSvc itemDescService = (IItemDescriptionSvc)getService("ItemDescription");
            itemDescService.addItemDescription(itemDesc);
        }

        //public void Delete(ItemDescription itemDesc)
        //{
        //    IItemDescriptionSvc itemDescService = (IItemDescriptionSvc)getService("ItemDescription");
        //    itemDescService.deleteItemDescription(itemDesc);
        //}

        public void Update(ItemDescription itemDesc)
        {
            IItemDescriptionSvc itemDescService = (IItemDescriptionSvc)getService("ItemDescription");
            itemDescService.updateItemDescription(itemDesc);
        }

        public IQueryable<ItemDescription> GetAll()
        {
            IItemDescriptionSvc itemDescService = (IItemDescriptionSvc)getService("ItemDescription");
            return (IQueryable<ItemDescription>)itemDescService.getAllItemDescriptions();
        }

        public IQueryable<ItemDescription> GetItemDesc(String keyName, String keyValue)
        {
            IItemDescriptionSvc itemDescService = (IItemDescriptionSvc)getService("ItemDescription");
            return (IQueryable<ItemDescription>)itemDescService.getItemDescription(keyName, keyValue);
        }
    }
}
