using KpopZtation.Controller;
using KpopZtation.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KpopZtation.View.AlbumFolder
{
    public partial class detail_album : System.Web.UI.Page
    {
        AlbumController albumController = new AlbumController();
        CartController cartController = new CartController();

        Customer cust;
        Album album;
        int albumId;

        protected void Page_PreInit(object sender, EventArgs e)
        {
            CustomerController custController = new CustomerController();

            if (Session["user"] == null && Request.Cookies["user_cookie"] == null)
            {
                MasterPageFile = "~/View/Master/Guest.Master";
            }
            else
            {

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
                else MasterPageFile = "~/View/Master/Customer.Master"; ;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["ID"] == null)
            {
                Response.Redirect("~/View/home.aspx");
            }
            albumId = int.Parse(Request["ID"]);

            if (!IsPostBack)
            {
                if (cust != null)
                {
                    if (cust.CustomerRole == "Cust")
                    {
                        addToStockBtn.Visible = true;
                        stockTbx.Visible = true;
                    }
                }

                album = albumController.GetAlbumById(albumId);

                albumNameLbl.Text = $"Album name: {album.AlbumName}";
                albumImg.ImageUrl = album.AlbumImage;
                descLbl.Text = $"Description:\n{album.AlbumDescription}";
                priceLbl.Text = $"Price: {album.AlbumPrice}";
                stockLbl.Text = $"Stock: {album.AlbumStock}";
                
            }
        }

        protected void addToStockBtn_Click(object sender, EventArgs e)
        {
            string qty = stockTbx.Text;

            string response = cartController.AddAlbumToCart(albumId, qty, cust.CustomerID);
            errorLbl.Text = response;
        }
    }
}