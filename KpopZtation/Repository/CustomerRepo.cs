using KpopZtation.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Repository
{
    public class CustomerRepo
    {
        DatabaseEntities db = Database.getDb();
        public Customer getCustomerLogin(string email, string password)
        {
            Customer customer = (from c in db.Customers 
                                 where c.CustomerEmail == email && c.CustomerPassword == password 
                                 select c).ToList().LastOrDefault();

            return customer;
        }

    }
}