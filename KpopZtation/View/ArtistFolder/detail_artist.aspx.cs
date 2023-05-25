using KpopZtation.Controller;
using KpopZtation.Handler;
using KpopZtation.Model;
using KpopZtation.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KpopZtation.View.ArtistFolder
{
    public partial class detail_artist : System.Web.UI.Page
    {
        AlbumHandler albumHandler = new AlbumHandler();
        AlbumController albumController = new AlbumController();
        ArtistHandler artistHandler = new ArtistHandler();

        Customer cust;
        Artist artist;
        int artistId;

        protected void Page_PreInit(object sender, EventArgs e)
        {
            CustomerRepo custRepo = new CustomerRepo();

            if (Session["user"] == null && Request.Cookies["user_cookie"] == null)
            {
                MasterPageFile = "~/View/Master/Guest.Master";
            }
            else
            {
                
                if (Session["user"] == null)
                {
                    int id = int.Parse(Request.Cookies["user_cookie"].Value);
                    cust = custRepo.GetCustomerById(id);
                    Session["user"] = cust;
                }
                else
                {
                    cust = (Customer)Session["user"];
                }

                if (cust.CustomerRole == "admin") MasterPageFile = "~/View/Master/Admin.Master";
                else MasterPageFile = "~/View/Master/Customer.Master"; ;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["ID"] == null)
            {
                Response.Redirect("~/View/home.aspx");
            }
            artistId = int.Parse(Request["ID"]);
            if (!IsPostBack)
            {
                if (cust != null)
                {
                    if (cust.CustomerRole == "admin")
                    {
                        insertBtn.Visible = true;
                        insertLbl.Visible = true;
                    }
                }
                

                
                artist = artistHandler.GetArtistById(artistId);

                artistImg.ImageUrl = artist.ArtistImage;
                artistName.Text = $"Artist name: {artist.ArtistName}";

                DataRebinding();
            } 
        }


        void DataRebinding()
        {
            List<Album> artistAlbum = albumHandler.GetAllArtistAlbum(artistId);
            albumGrid.DataSource = artistAlbum;
            albumGrid.DataBind();
        }

        protected void albumGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (cust == null || cust.CustomerRole == "Cust")
            {
                e.Row.Cells[7].Visible = false;
            }
            else if (cust.CustomerRole == "admin")
            {
                e.Row.Cells[7].Visible = true;
            }
        }

        protected void insertBtn_Click(object sender, EventArgs e)
        {
            artistId = int.Parse(Request["ID"]);
            Response.Redirect("~/View/AlbumFolder/insert_album.aspx?ID=" + artistId);
        }

        protected void albumGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = albumGrid.Rows[e.RowIndex];
            int id = int.Parse(row.Cells[1].Text);
            string response = albumController.DeleteAlbum(id);

            errorLbl.Text = response;
            DataRebinding();
        }

        protected void albumGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRow row = albumGrid.Rows[e.NewEditIndex];

            int id = int.Parse(row.Cells[1].Text);
            artistId = int.Parse(Request["ID"]);
            Response.Redirect("~/View/AlbumFolder/edit_album.aspx?ID=" + id+"&artistID="+artistId);
        }
    }
}