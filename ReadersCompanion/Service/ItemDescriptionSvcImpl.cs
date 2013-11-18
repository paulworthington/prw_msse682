using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace Service
{
    public class ItemDescriptionSvcImpl : IItemDescriptionSvc
    {
        // class data members
        public GenericRepository<ItemDescription> itemDescriptionRepository;

        // constructor
        public ItemDescriptionSvcImpl()
        {
            itemDescriptionRepository = new GenericRepository<ItemDescription>();
        }

        // methods
        public void addItemDescription(ItemDescription myItemDesc)
        {
            itemDescriptionRepository.Insert(myItemDesc);
        }

        public void deleteItemDescription(ItemDescription myItemDesc)
        {
            itemDescriptionRepository.Delete(myItemDesc);
        }

        public List<ItemDescription> getAllItemDescriptions()
        {
            return itemDescriptionRepository.GetAll().ToList<ItemDescription>();
        }

        public void updateItemDescription(ItemDescription myItemDesc)
        {
            itemDescriptionRepository.Update(myItemDesc);
        }

        public ItemDescription getItemDescription(String keyName, String keyValue)
        {
            return itemDescriptionRepository.GetByKey(keyName, keyValue).FirstOrDefault<ItemDescription>();
        }

        public ItemDescription getItemDescription(String keyName, int keyValue)
        {
            return itemDescriptionRepository.GetByKey(keyName, keyValue).FirstOrDefault<ItemDescription>();
        }

    }
}

