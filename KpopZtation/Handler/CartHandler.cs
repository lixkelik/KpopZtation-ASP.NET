using KpopZtation.Controller;
using KpopZtation.Model;
using KpopZtation.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Handler
{
    public class CartHandler
    {
        AlbumController albumController = new AlbumController();
        CustomerController custController = new CustomerController();
        TransactionHandler trsHandler = new TransactionHandler();

        CartRepo cartRepo = new CartRepo();
        public string AddAlbumToCart(int albumId, int qty, int customerId)
        {
            Customer cust = custController.GetCustomerById(customerId);
            Album album = albumController.GetAlbumById(albumId);

            if(cust != null && album != null)
            {
                int stockLeft = album.AlbumStock;

                if(qty > stockLeft)
                {
                    return "not enough";
                }

                int response = cartRepo.AddAlbumToCart(albumId, qty, customerId);
                if (response > 0) return "success";
                else return "failed";
            }
            else
            {
                return "not found";
            }
        }

        public List<Cart> GetCustomerCart(int customerId)
        {
            return cartRepo.GetCustomerCart(customerId);
        }

        public string DeleteCartItem(int id)
        {
            int response = cartRepo.DeleteCartItem(id);

            if(response > 0)
            {
                return "success";
            }

            return "failed";
        }

        public string Checkout(int customerId)
        {
            List<Cart> cartList = cartRepo.GetCustomerCart(customerId);
            int responseTrs = trsHandler.AddToTransaction(customerId, cartList);
            if(responseTrs > 0)
            {
                int responseCart = cartRepo.RemoveAllCartItem(cartList);
                if(responseCart > 0)
                {
                    return "success";
                }

            }
            return "failed";

        }
    }
}