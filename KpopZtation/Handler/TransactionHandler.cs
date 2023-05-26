using KpopZtation.Model;
using KpopZtation.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Handler
{
    public class TransactionHandler
    {
        TransactionRepo trsRepo = new TransactionRepo();
        public int AddToTransaction(int customerId, List<Cart> cartList)
        {
            return trsRepo.AddTransaction(customerId, cartList);
        }

        public List<TransactionHeader> GetCustomerTransaction(int custId)
        {
            return trsRepo.GetCustomerTransaction(custId);
        }

    }
}