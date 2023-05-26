using KpopZtation.Controller;
using KpopZtation.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KpopZtation.View
{
    public partial class cart : System.Web.UI.Page
    {
        CustomerController custController = new CustomerController();
        CartController cartController = new CartController();
        Customer cust;
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["user"] == null && Request.Cookies["user_cookie"] == null)
            {
                Response.Redirect("~/View/ArtistFolder/home.aspx");
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

                if (cust.CustomerRole == "admin")
                {
                    Response.Redirect("~/View/ArtistFolder/home.aspx");
                }
                else MasterPageFile = "~/View/Master/Customer.Master";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataRebinding();
            }
        }

        protected void DataRebinding()
        {
            List<Cart> cart = cartController.GetCustomerCart(cust.CustomerID);
            cartGrid.DataSource = cart;
            cartGrid.DataBind();
            if(cartGrid.Rows.Count == 0)
            {
                isEmptyLbl.Text = "Your cart is empty. Add an album first!";
            }
        }

        protected void cartGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = cartGrid.Rows[e.RowIndex];
            int id = int.Parse(row.Cells[1].Text);
            errorLbl.Text = cartController.DeleteCartItem(id);

            DataRebinding();
        }

        protected void checkoutBtn_Click(object sender, EventArgs e)
        {
            errorLbl.Text = cartController.Checkout(cust.CustomerID);
            DataRebinding();
        }
    }
}