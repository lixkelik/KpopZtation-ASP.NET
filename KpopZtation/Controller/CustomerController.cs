using KpopZtation.Handler;
using KpopZtation.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Controller
{
    public class CustomerController
    {
        CustomerHandler custHandler = new CustomerHandler();
        public Customer GetCustomerById(int id)
        {
            return custHandler.GetCustomerById(id);
        }
    }
}