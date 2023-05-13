using KpopZtation.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Repository
{
    public class ArtistRepo
    {
        DatabaseEntities db = Database.getDb();

        public Artist FindArtistById(int id)
        {
            return (from a in db.Artists where a.ArtistID == id select a).ToList().FirstOrDefault();
        }

        public Artist FindArtistByName(String name)
        {
            return (from a in db.Artists where a.ArtistName == name select a).ToList().FirstOrDefault();
        }


        public List<Artist> GetAllArtist()
        {
            return (from a in db.Artists select a).ToList();
        }

        public int UpdateArtist(int id, String name, String image)
        {
            Artist artist = FindArtistById(id);

            artist.ArtistName = name;
            artist.ArtistImage = image;
            return db.SaveChanges();
        }

        public void DeleteArtist(int id)
        {
            Artist artist = FindArtistById(id);
            db.Artists.Remove(artist);
            db.SaveChanges();
        }

    }
}