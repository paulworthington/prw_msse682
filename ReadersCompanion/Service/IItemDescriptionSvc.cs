using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace Service
{
    public interface IItemDescriptionSvc : IService
    {
        void addItemDescription(ItemDescription myItemDescription);
        void deleteItemDescription(ItemDescription myItemDescription);
        List<ItemDescription> getAllItemDescriptions();
        void updateItemDescription(ItemDescription myItemDescription);
        ItemDescription getItemDescription(String keyName, String keyValue);
        ItemDescription getItemDescription(String keyName, int keyValue);
    }
}
