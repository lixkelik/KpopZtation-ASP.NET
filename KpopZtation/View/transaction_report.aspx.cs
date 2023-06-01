using KpopZtation.Controller;
using KpopZtation.Dataset;
using KpopZtation.Model;
using KpopZtation.Report;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataSet = KpopZtation.Dataset.DataSet;

namespace KpopZtation.View
{
    public partial class transaction_report : System.Web.UI.Page
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
                    MasterPageFile = "~/View/Master/Admin.Master";
                }
                else Response.Redirect("~/View/home.aspx"); ;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            CrystalReport report = new CrystalReport();
            DataSet data = GetData(trsController.GetAllTransaction());
            CrystalReportViewer1.ReportSource = report;
            report.SetDataSource(data);
        }

        private DataSet GetData(List<TransactionHeader> trsHeader)
        {
            DataSet data = new DataSet();

            var headerTable = data.TransactionHeaders;
            var detailTable = data.TransactionDetails;
            var albumTable = data.Albums;

            foreach (TransactionHeader t in trsHeader)
            {
                var hRow = headerTable.NewRow();
                hRow["TransactionID"] = t.TransactionID;
                hRow["CustomerID"] = t.CustomerID;
                hRow["TransactionDate"] = t.TransactionDate;
                headerTable.Rows.Add(hRow);

                foreach (TransactionDetail td in t.TransactionDetails)
                {
                    var dRow = detailTable.NewRow();
                    var aRow = albumTable.NewRow();
                    dRow["TransactionID"] = td.TransactionID;
                    dRow["AlbumID"] = td.Album.AlbumID; // Ensure AlbumID is assigned
                    dRow["Qty"] = td.Qty;
                    detailTable.Rows.Add(dRow);

                    aRow["AlbumID"] = td.Album.AlbumID;
                    aRow["AlbumName"] = td.Album.AlbumName;
                    aRow["AlbumPrice"] = td.Album.AlbumPrice;
                    albumTable.Rows.Add(aRow);
                    
                }
            }

            return data;
        }

    }
}