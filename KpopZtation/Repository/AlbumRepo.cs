using KpopZtation.Factory;
using KpopZtation.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Repository
{
    public class AlbumRepo
    {
        DatabaseEntities db = Database.getDb();

        public int AlbumCountByArtist(int artistId)
        {
            int totalAlbum = (from albm in db.Albums where albm.ArtistID == artistId select albm).ToList().Count();
            return totalAlbum;
        }

        public List<Album> GetAlbumByArtistId(int artistId)
        {
            return (from albm in db.Albums where albm.ArtistID == artistId select albm).ToList();
        }

        public Album GetAlbumById(int albumId)
        {
            return (from albm in db.Albums where albm.AlbumID == albumId select albm).ToList().LastOrDefault();
        }

        public int InsertAlbum(int artistId, string name, string desc, int price, int stock, string imageUrl)
        {
            Album album = AlbumFactory.createAlbum(artistId, name, imageUrl, price, stock, desc);

            db.Albums.Add(album);
            return db.SaveChanges();
        }

        public int UpdateAlbum(int albumId, string name, string desc, int price, int stock, string imageUrl)
        {
            Album album = GetAlbumById(albumId);

            album.AlbumName = name;
            album.AlbumDescription = desc;
            album.AlbumPrice = price;
            album.AlbumStock = stock;
            album.AlbumImage = imageUrl;

            return db.SaveChanges();
        }
        public void RemoveAlbumList(List<Album> albmList)
        {
            db.Albums.RemoveRange(albmList);
            db.SaveChanges();
        }

        public int DeleteAlbum(int albumId)
        {
            Album album = GetAlbumById(albumId);

            db.Albums.Remove(album);
            return db.SaveChanges();
        }
    }
}