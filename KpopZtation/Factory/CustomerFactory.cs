using KpopZtation.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Factory
{
    public class CustomerFactory
    {
        public static Customer createCustomer(string customerName, string customerEmail, string customerGender, string customerAddress, string customerPassword, string customerRole)
        {
            Customer cust = new Customer();
            cust.CustomerName = customerName;
            cust.CustomerEmail = customerEmail;
            cust.CustomerPassword = customerPassword;
            cust.CustomerGender = customerGender;
            cust.CustomerAddress = customerAddress;
            cust.CustomerRole = customerRole;

            return cust;
        }
    }
}