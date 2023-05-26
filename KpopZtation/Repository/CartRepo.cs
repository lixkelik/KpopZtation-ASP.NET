using KpopZtation.Factory;
using KpopZtation.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Repository
{
    public class CartRepo
    {
        DatabaseEntities db = Database.getDb();
        public int AddAlbumToCart(int albumId, int qty, int customerId)
        {
            Cart cart = FindCustomerSameProductCart(albumId, customerId);
            if(cart == null)
            {
                cart = CartFactory.createCart(albumId, qty, customerId);
                db.Carts.Add(cart);
            }
            else
            {
                //Validation if the total added > stock avail, 
                //then it will make the quantity to same as stock avail
                int stockAvail = cart.Album.AlbumStock;

                cart.Qty += qty;

                if (cart.Qty > stockAvail) cart.Qty = stockAvail;

            }
            
            return db.SaveChanges();
        }

        public Cart FindCustomerSameProductCart(int albumId, int customerId)
        {
            Cart cart = (from c in db.Carts where c.AlbumID.Equals(albumId) && c.CustomerID.Equals(customerId) select c).ToList().FirstOrDefault();
            if(cart == null)
            {
                return null;
            }
            return cart;
        }

        public List<Cart> GetCustomerCart(int customerId)
        {
            return (from c in db.Carts where c.CustomerID.Equals(customerId) select c).ToList();
        }

        public Cart GetCustomerAlbumItemCart(int albumId)
        {
            return (from c in db.Carts where c.AlbumID.Equals(albumId) select c).ToList().FirstOrDefault();
        }

        public int DeleteCartItem(int id)
        {
            Cart cart = GetCustomerAlbumItemCart(id);
            db.Carts.Remove(cart);
            return db.SaveChanges();
        }

        public int RemoveAllCartItem(List<Cart> cartList)
        {
            db.Carts.RemoveRange(cartList);
            return db.SaveChanges();
        }
    }
}