using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace Service
{
    public interface IItemSvc : IService
    {
        void addItem(Item myItem);
        void deleteItem(Item myItem);
        List<Item> getAllItems();
        void updateItem(Item myItem);
        Item getItem(String keyName, String keyValue);
        Item getItem(String keyName, int keyValue);
    }
}
