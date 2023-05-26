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
    public partial class transaction : System.Web.UI.Page
    {
        CustomerController custController = new CustomerController();
        TransactionController trsController = new TransactionController();
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
                DataRebinding();
            }
        }
        protected void DataRebinding()
        {
            List<TransactionHeader> trs = trsController.GetCustomerTransaction(cust.CustomerID);
            transactionGrid.DataSource = trs;
            transactionGrid.DataBind();
            if (transactionGrid.Rows.Count == 0)
            {
                isEmptyLbl.Text = "Your dont have transaction. Checkout first!";
            }
            else
            {
                transactionGrid.RowDataBound += transactionGrid_RowDataBound;
            }
        }

        protected void transactionGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TransactionHeader transactionHeader = (TransactionHeader)e.Row.DataItem;

                List<TransactionDetail> transactionDetails = transactionHeader.TransactionDetails.ToList();

                GridView transactionDetailGrid = (GridView)e.Row.FindControl("transactionDetailGrid");

                transactionDetailGrid.DataSource = transactionDetails;
                transactionDetailGrid.DataBind();
            }
        }
    }
}