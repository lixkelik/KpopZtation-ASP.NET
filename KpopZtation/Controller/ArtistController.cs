using KpopZtation.Handler;
using KpopZtation.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Controller
{
    public class ArtistController
    {
        ArtistHandler artistHandler = new ArtistHandler();
        public String IsFileValid(String ext, int fileSize)
        {
            if (ext != ".png" && ext != ".jpg" && ext != ".jpeg" && ext != ".jfif" ) return "Image extension is not correct!";
            if (fileSize > 2097152) return "Image must be < 2 MB";
            return "";
        }   

        public String CheckUpdateArtist(int id, String name, String imageUrl)
        {
            if(name == null || name == "")
            {
                return "Artist name must be filled!";
            }

            String response = artistHandler.UpdateArtist(id, name, imageUrl);

            if (response == "success") return "success";
            else return "Failed to update, please try again!";

        }
    }
}