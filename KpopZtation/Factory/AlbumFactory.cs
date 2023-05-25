using KpopZtation.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Factory
{
    public class AlbumFactory
    {
        public static Album createAlbum(int artistID, string albumName, string albumImage, int albumPrice, int albumStock, string albumDescription)
        {
            Album albm = new Album();
            albm.ArtistID = artistID;
            albm.AlbumName = albumName;
            albm.AlbumImage = albumImage;
            albm.AlbumPrice = albumPrice;
            albm.AlbumStock = albumStock;
            albm.AlbumDescription = albumDescription;

            return albm;
        }
    }
}