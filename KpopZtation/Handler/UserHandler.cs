using KpopZtation.Model;
using KpopZtation.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Handler
{
    public class UserHandler
    {
        CustomerRepo csRepo = new CustomerRepo();
        public dynamic DoLogin(String email, String password)
        {
            Customer cust = csRepo.GetCustomerLogin(email, password);
            if(cust != null) return cust;

            return "No credential found for that user!";
        }

        public String DoRegister(String name, String email, String gender, String address, String password)
        {
            bool isEmailDuplicate = csRepo.isDuplicateUser(email);
            if (isEmailDuplicate) return "Email already registered!";

            csRepo.RegisterUser(name, email, gender, address, password);
            return "Registered";
        }

        public String DoUpdate(int custId, String name, String email, String gender, String address, String password)
        {
            Customer cust = csRepo.GetCustomerById(custId);
            if(email == cust.CustomerEmail)
            {
                csRepo.UpdateUser(custId, name, email, gender, address, password);
            }
            else
            {
                bool isEmailDuplicate = csRepo.isDuplicateUser(email);

                if (isEmailDuplicate) return "Email duplicated!";
                int response = csRepo.UpdateUser(custId, name, email, gender, address, password);
                if (response > 0) return "Update Success!";
            }
            return "Failed to update!";
        }
    }
}