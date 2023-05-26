using KpopZtation.Controller;
using KpopZtation.Model;
using KpopZtation.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KpopZtation.View
{
    public partial class Login : System.Web.UI.Page
    {
        AuthController authController = new AuthController();

        protected void Page_PreInit(object sender, EventArgs e)
        {
            CustomerController custController = new CustomerController();

            if (Session["user"] == null && Request.Cookies["user_cookie"] == null)
            {
                MasterPageFile = "~/View/Master/Guest.Master"; ;
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
                else MasterPageFile = "~/View/Master/Customer.Master";

                Response.Redirect("~/View/home.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            //To check what is the data type returned by the auth controller as it is dynamic.
            dynamic customer = authController.CheckLogin(emailTbx.Text, passTbx.Text);

            if(customer is Customer)
            {
                if (customer != null)
                {
                    Session["user"] = customer;
                    if (rememberMeCbx.Checked)
                    {
                        HttpCookie cookie = new HttpCookie("user_cookie");
                        cookie.Value = customer.CustomerID.ToString();
                        cookie.Expires = DateTime.Now.AddDays(3);
                        Response.Cookies.Add(cookie);
                    }

                    if (Application["user_count"] == null)
                    {
                        Application["user_count"] = 1;
                    }
                    else
                    {
                        Application["user_count"] = (int)Application["user_count"] + 1;
                    }

                    Response.Redirect("~/View/home.aspx");
                }
            }
            else
            {
                errorLbl.Text = customer;
            }
        }
    }
}