using KpopZtation.Model;
using KpopZtation.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Handler
{
    public class ArtistHandler
    {
        ArtistRepo artRepo = new ArtistRepo();
        AlbumRepo albmRepo = new AlbumRepo();

        public void DeleteArtist(int id)
        {
            Artist artist = artRepo.FindArtistById(id);

            if (artist == null) return;

            int totalAlbum = albmRepo.AlbumCountByArtist(id);

            if(totalAlbum > 0)
            {
                List<Album> albmList = albmRepo.GetAlbumByArtistId(id);
                albmRepo.RemoveAlbumList(albmList);
            }

            artRepo.DeleteArtist(id);
        }

        public String UpdateArtist(int artistId, String artistName, String imageUrl )
        {
            Artist artist = artRepo.FindArtistByName(artistName);

            if (artist != null) return "duplicate";

            // status > 0 == success, status == 0 failed
            int status = artRepo.UpdateArtist(artistId, artistName, imageUrl);
            if (status > 0) return "success";
            else return "failed";
        }

        public String InsertArtist(string artistName, string imageUrl)
        {
            Artist artist = artRepo.FindArtistByName(artistName);

            if (artist != null) return "duplicate";

            // status > 0 == success, status == 0 failed
            int status = artRepo.InsertArtist(artistName, imageUrl);
            if (status > 0) return "success";
            else return "failed";
        }

        public Artist GetArtistById(int id)
        {
            return artRepo.FindArtistById(id);

        }

        public List<Artist> GetAllArtist()
        {
            return artRepo.GetAllArtist();
        }
    }
}