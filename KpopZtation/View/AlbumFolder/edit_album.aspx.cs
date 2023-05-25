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

namespace KpopZtation.View.AlbumFolder
{
    public partial class edit_album : System.Web.UI.Page
    {
        AlbumHandler albumHandler = new AlbumHandler();
        FileUploadController fileController = new FileUploadController();
        AlbumController albumController = new AlbumController();

        protected void Page_PreInit(object sender, EventArgs e)
        {
            CustomerRepo custRepo = new CustomerRepo();

            if (Session["user"] == null && Request.Cookies["user_cookie"] == null)
            {
                Response.Redirect("~/View/home.aspx");
            }
            else
            {
                Customer cust;
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
                else Response.Redirect("~/View/home.aspx");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["ID"] == null)
            {
                Response.Redirect("~/View/home.aspx");
            }

            int id = int.Parse(Request["ID"]);
            
            if (!IsPostBack)
            {
                Album albm = albumHandler.GetAlbumById(id);
                nameTbx.Text = albm.AlbumName;
                descTbx.Text = albm.AlbumDescription;
                priceTbx.Text = albm.AlbumPrice.ToString();
                stockTbx.Text = albm.AlbumStock.ToString();
                albumImage.ImageUrl = albm.AlbumImage;
            }
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            string name = nameTbx.Text.Trim();
            string desc = descTbx.Text.Trim();
            string price = priceTbx.Text;
            string stock = stockTbx.Text;
            string imageUrl = albumImage.ImageUrl;

            string response = "";

            if (imgUpload.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(imgUpload.FileName);
                int fileSize = imgUpload.PostedFile.ContentLength;

                response = fileController.IsFileValid(fileExtension, fileSize);
            }

            if (response == "")
            {
                int albumId = int.Parse(Request["ID"]);
                int artistId = int.Parse(Request["artistID"]);
                
                if (imgUpload.HasFile)
                {
                    imgUpload.SaveAs(Server.MapPath("~/Assets/Albums/" + imgUpload.FileName));
                    imageUrl = "~/Assets/Albums/" + imgUpload.FileName;
                }
                response = albumController.CheckUpdateAlbum(albumId, name, desc, price, stock, imageUrl);

                if (response == "success") Response.Redirect("~/View/ArtistFolder/detail_artist.aspx?ID=" + artistId);
                else errorLbl.Text = response;
            }
            else
            {
                errorLbl.Text = response;
            }
        }
    }
}