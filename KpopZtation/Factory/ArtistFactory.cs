using KpopZtation.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Factory
{
    public class ArtistFactory
    {
        public static Artist createArtist(int artistID, string artistName, string artistImage)
        {
            Artist artist = new Artist();
            artist.ArtistID = artistID;
            artist.ArtistName = artistName;
            artist.ArtistImage = artistImage;

            return artist;
        }
    }
}