using KpopZtation.Model;
using KpopZtation.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Handler
{
    public class CustomerHandler
    {
        CustomerRepo custRepo = new CustomerRepo();
        public Customer GetCustomerById(int id)
        {
            return custRepo.GetCustomerById(id);
        }
    }
}