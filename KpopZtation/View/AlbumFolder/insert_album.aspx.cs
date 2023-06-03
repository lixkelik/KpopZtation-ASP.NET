using KpopZtation.Controller;
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
    public partial class insert_album : System.Web.UI.Page
    {
        AlbumController albumController = new AlbumController();
        FileUploadController fileController = new FileUploadController();

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
            
        }

        protected void insertBtn_Click(object sender, EventArgs e)
        {
            errorLbl.Visible = true;
            if (string.IsNullOrEmpty(priceTbx.Text) || string.IsNullOrEmpty(stockTbx.Text))
            {
                errorLbl.Text = "Please enter a value";
            }
            string name = nameTbx.Text.Trim();
            string desc = descTbx.Text.Trim();
            string price = priceTbx.Text;
            string stock = stockTbx.Text;
            string imageUrl;

            string response = "";

            if (imgUpload.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(imgUpload.FileName);
                int fileSize = imgUpload.PostedFile.ContentLength;

                response = fileController.IsFileValid(fileExtension, fileSize);
            }

            if (response == "")
            {
                if(Request["ID"] == null)
                {
                    Response.Redirect("~/View/home.aspx");
                }

                int artistId = int.Parse(Request["ID"]);
                
                if (imgUpload.HasFile)
                {
                    imgUpload.SaveAs(Server.MapPath("~/Assets/Albums/" + imgUpload.FileName));
                    imageUrl = "~/Assets/Albums/" + imgUpload.FileName;
                    response = albumController.CheckInsertAlbum(artistId, name, desc, price, stock, imageUrl);

                    if (response == "success") Response.Redirect("~/View/ArtistFolder/detail_artist.aspx?ID=" +artistId);
                    else errorLbl.Text = response;
                }
                else
                {
                    errorLbl.Text = "Please upload your file first!";
                }
            }
            else
            {
                errorLbl.Text = response;
            }
        }
    }
}