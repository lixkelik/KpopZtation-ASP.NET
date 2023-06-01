using KpopZtation.Factory;
using KpopZtation.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Repository
{
    public class TransactionRepo
    {
        DatabaseEntities db = Database.getDb();

        public int AddTransaction(int customerId, List<Cart> cartList)
        {
            AddToTransactionHeader(customerId, cartList);
            return db.SaveChanges();
        }

        public void AddToTransactionHeader(int customerId, List<Cart> cartList)
        {
            TransactionHeader trsHeader = TransactionHeaderFactory.CreateTrsHeader(DateTime.Now, customerId);
            db.TransactionHeaders.Add(trsHeader);

            AddToTransactionDetail(trsHeader.TransactionID, cartList);
        }

        public void AddToTransactionDetail(int trsId, List<Cart> cartList)
        {
            List<TransactionDetail> trsDetailList = new List<TransactionDetail>();
            for(int i = 0; i < cartList.Count; i++)
            {
                TransactionDetail trsDetail = TransactionDetailFactory.CreateTrsDetail(trsId, cartList[i].AlbumID, cartList[i].Qty);
                trsDetailList.Add(trsDetail);
            }
            
            db.TransactionDetails.AddRange(trsDetailList);
        }

        public List<TransactionHeader> GetCustomerTransaction(int custId)
        {
            return (from trs in db.TransactionHeaders 
                    where trs.CustomerID.Equals(custId) 
                    orderby trs.TransactionDate descending 
                    select trs).ToList();
        }

        public List<TransactionHeader> GetAllTransaction()
        {
            return db.TransactionHeaders.ToList();
        }
    }
}