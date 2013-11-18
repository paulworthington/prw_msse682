using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace Service
{
    public class ItemSvcImpl : IItemSvc
    {
        // class data members
        public GenericRepository<Item> itemRepository;

        // constructor
        public ItemSvcImpl()
        {
            itemRepository = new GenericRepository<Item>();
        }

        // methods
        public void addItem(Item myItem)
        {
            itemRepository.Insert(myItem);
        }

        public void deleteItem(Item myItem)
        {
            itemRepository.Delete(myItem);
        }

        public List<Item> getAllItems()
        {
            return itemRepository.GetAll().ToList<Item>();
        }

        public void updateItem(Item myItem)
        {
            itemRepository.Update(myItem);
        }

        public Item getItem(String keyName, String keyValue)
        {
            return itemRepository.GetByKey(keyName, keyValue).FirstOrDefault<Item>();
        }

        public Item getItem(String keyName, int keyValue)
        {
            return itemRepository.GetByKey(keyName, keyValue).FirstOrDefault<Item>();
        }
    }
}

