using KpopZtation.Handler;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Controller
{
    public class AlbumController
    {
        AlbumHandler albumHandler = new AlbumHandler();
        private String CheckName(string name)
        {
            if(name == null || name == "") return "Album name must be filled!";
            if (name.Length > 50) return "Album name must be < 50 character";
            return "";
        }

        private String CheckDesc(string desc)
        {
            if (desc == null || desc == "") return "Description must be filled!";
            if (desc.Length > 255) return "Description must be < 255 character";
            return "";
        }

        private String CheckPrice(int price)
        {
            if (price == 0) return "Price must be filled!";
            if (price < 100000 || price > 1000000) return "Price must be > 100000 and < 1000000";
            return "";
        }

        private String CheckStock(int stock)
        {
            if (stock == 0) return "Stock must be filled!";
            if (stock < 0) return "Stock must > 0";
            return "";
        }

        public String CheckPriceAndStock(string price, string stock)
        {
            if (price == null || price == "") return "Price must be filled!";
            if (stock == null || stock == "") return "Stock must be filled!";
            return "";
        }

        public String CheckInsertAlbum(int artistId, string name, string desc, string price, string stock, string imageUrl)
        {
            int cPrice = 0, cStock = 0;
            string response = CheckName(name);
            if (response == "") response = CheckDesc(desc);
            if(response == "")
            {
                response = CheckPriceAndStock(price, stock);
                if(response == "")
                {
                    cPrice = int.Parse(price);
                    cStock = int.Parse(stock);
                }
                else
                {
                    return response;
                }
            }
            if (response == "") response = CheckPrice(cPrice);
            if (response == "") response = CheckStock(cStock);
            if (response == "")
            {
                response = albumHandler.InsertAlbum(artistId, name, desc, cPrice, cStock, imageUrl);
                if (response == "success") return "success";
                else if (response == "artist not found") return "Artist not found!";
                else return "Failed, please try again later!";
            }
            return response;
        }

        public String CheckUpdateAlbum(int albumId, string name, string desc, string price, string stock, string imageUrl)
        {
            int cPrice = 0, cStock = 0;
            string response = CheckName(name);
            if (response == "") response = CheckDesc(desc);
            if (response == "")
            {
                response = CheckPriceAndStock(price, stock);
                if (response == "")
                {
                    cPrice = int.Parse(price);
                    cStock = int.Parse(stock);
                }
                else
                {
                    return response;
                }
            }
            if (response == "") response = CheckPrice(cPrice);
            if (response == "") response = CheckStock(cStock);
            if (response == "")
            {
                response = albumHandler.UpdateAlbum(albumId, name, desc, cPrice, cStock, imageUrl);
                if (response == "success") return "success";
                else if (response == "album not found") return "Album not found!";
                else return "Failed, please try again later!";
            }
            return response;
        }

        public String DeleteAlbum(int id)
        {
            string response = albumHandler.DeleteAlbum(id);

            if (response == "not found") return "No Artist found!";
            if (response == "failed") return "Failed to delete! Please try again";
            return "Artist Deleted!";

        }
    }
}