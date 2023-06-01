using KpopZtation.Handler;
using KpopZtation.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Controller
{
    public class TransactionController
    {
        TransactionHandler trsHandler = new TransactionHandler();

        public List<TransactionHeader> GetCustomerTransaction(int custId)
        {
            return trsHandler.GetCustomerTransaction(custId);
        }

        public List<TransactionHeader> GetAllTransaction()
        {
            return trsHandler.GetAllTransaction();
        }
    }
}