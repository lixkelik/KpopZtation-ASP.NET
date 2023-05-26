using KpopZtation.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Factory
{
    public class CartFactory
    {
        public static Cart createCart(int albumId, int qty, int customerId)
        {
            Cart cart = new Cart();
            cart.AlbumID = albumId;
            cart.CustomerID = customerId;
            cart.Qty = qty;

            return cart;
        }
    }
}