using KpopZtation.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Factory
{
    public class TransactionHeaderFactory
    {
        public static TransactionHeader CreateTrsHeader(DateTime trsDate, int customerId)
        {
            TransactionHeader trsHeader = new TransactionHeader();

            trsHeader.CustomerID = customerId;
            trsHeader.TransactionDate = trsDate;

            return trsHeader;
        }
    }
}