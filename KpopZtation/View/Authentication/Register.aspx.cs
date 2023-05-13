using KpopZtation.Controller;
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