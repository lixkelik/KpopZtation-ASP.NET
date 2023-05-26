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
    public partial class update_profile : System.Web.UI.Page
    {
        CustomerController custController = new CustomerController();
        AuthController authController = new AuthController();
        Customer cust;
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["user"] == null && Request.Cookies["user_cookie"] == null)
            {
                Response.Redirect("~/View/home.aspx");
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
                    Response.Redirect("~/View/home.aspx");
                }
                else MasterPageFile = "~/View/Master/Customer.Master";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                nameTbx.Text = cust.CustomerName;
                emailTbx.Text = cust.CustomerEmail;
                genderList.SelectedValue = cust.CustomerGender;
                addressTbx.Text = cust.CustomerAddress;
            }
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            String name = nameTbx.Text.Trim();
            String email = emailTbx.Text.Trim();
            String gender = genderList.SelectedValue;
            String address = addressTbx.Text.Trim();
            String password = passTbx.Text;


            String responseText = authController.CheckUpdate(cust.CustomerID, name, email, gender, address, password);
            if (responseText == "Registered")
            {
                errorLbl.Text = "You succesfully registered! Proceed to login";

                Response.Redirect("Login.aspx");
            }
            else errorLbl.Text = responseText;
        }
    }
}