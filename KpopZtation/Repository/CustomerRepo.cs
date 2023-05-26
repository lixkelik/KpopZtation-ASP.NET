﻿using KpopZtation.Factory;
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
        public Customer GetCustomerLogin(string email, string password)
        {
            Customer cust = (from c in db.Customers
                                 where c.CustomerEmail == email && c.CustomerPassword == password
                                 select c).ToList().LastOrDefault();

            return cust;
        }

        public bool isDuplicateUser(String email)
        {
            Customer cust = (from c in db.Customers where c.CustomerEmail == email select c).ToList().FirstOrDefault();
            if(cust == null)return false;
            return true;
        }

        public Customer GetCustomerById(int id)
        {
            Customer cust = (from c in db.Customers where c.CustomerID == id select c).ToList().FirstOrDefault();
            return cust;
        }

        public void RegisterUser(String name, String email, String gender, String address, String password)
        {
            string role = "Cust";
            Customer cust = CustomerFactory.createCustomer(name, email, gender, address, password, role);

            db.Customers.Add(cust);
            db.SaveChanges();
            
        }

        public int UpdateUser(int custId, String name, String email, String gender, String address, String password)
        {
            Customer cust = GetCustomerById(custId);

            cust.CustomerName = name;
            cust.CustomerEmail = email;
            cust.CustomerGender = gender;
            cust.CustomerAddress = address;
            cust.CustomerPassword = password;

            return db.SaveChanges();
        }


    }
}