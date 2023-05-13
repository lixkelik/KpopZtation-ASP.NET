using KpopZtation.Controller;
using KpopZtation.Handler;
using KpopZtation.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KpopZtation.View.ArtistFolder
{
    public partial class edit_artist : System.Web.UI.Page
    {
        ArtistController artistController = new ArtistController();
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = int.Parse(Request["ID"]);
            ArtistHandler artistHandler = new ArtistHandler();
            if (!IsPostBack)
            {
                Artist artist = artistHandler.GetArtistById(id);

                artistNameLbl.Text = artist.ArtistName;
                artistImage.ImageUrl = artist.ArtistImage;
            }
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Request["ID"]);
            string name = artistNameLbl.Text.Trim();
            if (imageUpload.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(imageUpload.FileName);
                int fileSize = imageUpload.PostedFile.ContentLength;
                
                string response = artistController.IsFileValid(fileExtension, fileSize);
                if(response != "")
                {
                    imageErrorLbl.Text = response;
                }
                else
                {
                    imageUpload.SaveAs(Server.MapPath("~/Assets/Artists/" +imageUpload.FileName));
                    String imageUrl = "~/Assets/Artists/" + imageUpload.FileName;

                    artistImage.ImageUrl = imageUrl;

                    response = artistController.CheckUpdateArtist(id, name, imageUrl);

                    if (response == "success") Response.Redirect("~/View/home.aspx");
                    else errorLbl.Text = response;
                    
                }
            }
            
        }
    }
}