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

        public void RemoveAlbumList(List<Album> albmList)
        {
            db.Albums.RemoveRange(albmList);
            db.SaveChanges();
        }
    }
}