using KpopZtation.Model;
using KpopZtation.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Handler
{
    public class AlbumHandler
    {
        AlbumRepo albumRepo = new AlbumRepo();
        ArtistRepo artistRepo = new ArtistRepo();

        public Album GetAlbumById(int id)
        {
            Album albm = albumRepo.GetAlbumById(id);
            return albm;
        }

        public List<Album> GetAllArtistAlbum(int artistId)
        {
            return albumRepo.GetAlbumByArtistId(artistId);
        }

        public String InsertAlbum(int artistId, string name, string desc, int price, int stock, string imageUrl)
        {
            Artist artist = artistRepo.FindArtistById(artistId);

            if (artist == null) return "artist not found";

            int response = albumRepo.InsertAlbum(artistId, name, desc, price, stock, imageUrl);
            if (response > 0) return "success";
            else return "failed";
        }

        public String UpdateAlbum(int albumId, string name, string desc, int price, int stock, string imageUrl)
        {
            Album album = albumRepo.GetAlbumById(albumId);

            if (album == null) return "album not found";

            int response = albumRepo.UpdateAlbum(albumId, name, desc, price, stock, imageUrl);

            if (response > 0) return "success";
            return "failed";
        }

        public String DeleteAlbum(int albumId)
        {
            Album album = albumRepo.GetAlbumById(albumId);

            if (album == null) return "not found";
            else
            {
                int response = albumRepo.DeleteAlbum(albumId);
                if (response > 0) return "success";
                return "failed";
            }
        }

    }
}