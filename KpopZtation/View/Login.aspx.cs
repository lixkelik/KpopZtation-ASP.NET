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
        CustomerRepo csRepo = new CustomerRepo();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            Customer customer = csRepo.getCustomerLogin(emailTbx.Text, passTbx.Text);
        }
    }
}