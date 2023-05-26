using KpopZtation.Handler;
using KpopZtation.Model;
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

        public String CheckUpdateArtist(int id, string name, string imageUrl)
        {
            if(name == null || name == "")
            {
                return "Artist name must be filled!";
            }

            string response = artistHandler.UpdateArtist(id, name, imageUrl);

            return CheckReturnString(response);

        }

        public String CheckInsertArtist(string name, string imageUrl)
        {
            if (name == null || name == "") return "Artist name must be filled!";

            string response = artistHandler.InsertArtist(name, imageUrl);

            return CheckReturnString(response);
        }

        public String CheckReturnString(string response)
        {
            if (response == "success") return "success";
            else if (response == "duplicate") return "Artist name duplicated! Input unique name!";
            else return "Failed, please try again!";
        }
        public Artist GetArtistById(int id)
        {
            return artistHandler.GetArtistById(id);
        }

        public List<Artist> GetAllArtist()
        {
            return artistHandler.GetAllArtist();
        }

        public void DeleteArtist(int id)
        {
            artistHandler.DeleteArtist(id);
        }

    }
}