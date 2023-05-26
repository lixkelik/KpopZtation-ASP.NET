using KpopZtation.Handler;
using KpopZtation.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Controller
{
    public class CartController
    {
        CartHandler cartHandler = new CartHandler();
        public string AddAlbumToCart(int albumId, string qty, int customerId)
        {
            int qtyC;
            try
            {
                qtyC = int.Parse(qty);
            }
            catch
            {
                return "Input only number!";
            }

            if (qtyC <= 0)
            {
                return "Please input the quantity > 0!";
            }

            string response = cartHandler.AddAlbumToCart(albumId, qtyC, customerId);
            if(response == "success")
            {
                return "Added To Cart!";
            }
            else if(response == "not found")
            {
                return "Album not found!";
            }else if(response == "not enough")
            {
                return "Not enough stock!";
            }
            return "An error has occured! Please try again later";
        }

        public List<Cart> GetCustomerCart(int customerId)
        {
            return cartHandler.GetCustomerCart(customerId);
        }

        public string DeleteCartItem(int id)
        {
            string response = cartHandler.DeleteCartItem(id);
            if(response == "success")
            {
                return "";
            }
            return "Failed to delete album. Please try again later!";
        }

        public string Checkout(int customerId)
        {
            string response = cartHandler.Checkout(customerId);
            if(response == "success")
            {
                return "You have checkout succesfully!";
            }
            return "An error occured, please try again later!";
        }
    }
}