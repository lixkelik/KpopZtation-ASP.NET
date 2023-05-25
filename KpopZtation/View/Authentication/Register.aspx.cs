using KpopZtation.Controller;
using KpopZtation.Model;
using KpopZtation.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KpopZtation.View.Authentication
{
    public partial class Register : System.Web.UI.Page
    {
        AuthController authController = new AuthController();

        protected void Page_PreInit(object sender, EventArgs e)
        {
            CustomerRepo custRepo = new CustomerRepo();

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
                    cust = custRepo.GetCustomerById(id);
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

        protected void registerBtn_Click(object sender, EventArgs e)
        {
            String name = nameTbx.Text.Trim();
            String email = emailTbx.Text.Trim();
            String gender = genderList.SelectedValue;
            String address = addresTbx.Text.Trim();
            String password = passTbx.Text;

            
            String responseText = authController.CheckRegister(name, email, gender, address, password);
            if (responseText == "Registered")
            {
                errorLbl.Text = "You succesfully registered! Proceed to login";
                
                Thread.Sleep(2000);
                Response.Redirect("Login.aspx");
            }
            else errorLbl.Text = responseText;

            
        }
    }
}