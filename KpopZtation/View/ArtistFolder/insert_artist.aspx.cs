﻿using KpopZtation.Controller;
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
    public partial class insert_artist : System.Web.UI.Page
    {

        ArtistController artistController = new ArtistController();
        FileUploadController fileController = new FileUploadController();

        protected void Page_PreInit(object sender, EventArgs e)
        {
            CustomerController custController = new CustomerController();

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
                    cust = custController.GetCustomerById(id);
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
            string name = nameTbx.Text.Trim();
            string image = "";

            string response = "";
            errorLbl.Visible = true;
            if (imageUpload.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(imageUpload.FileName);
                int fileSize = imageUpload.PostedFile.ContentLength;

                response = fileController.IsFileValid(fileExtension, fileSize);
            }

            if (response == "")
            {
                if (imageUpload.HasFile)
                {
                    imageUpload.SaveAs(Server.MapPath("~/Assets/Artists/" + imageUpload.FileName));
                    image = "~/Assets/Artists/" + imageUpload.FileName;
                    response = artistController.CheckInsertArtist(name, image);

                    if (response == "success") Response.Redirect("~/View/home.aspx");
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