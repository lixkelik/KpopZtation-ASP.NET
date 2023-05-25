using KpopZtation.Controller;
using KpopZtation.Handler;
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
    public partial class home : System.Web.UI.Page
    {
        ArtistHandler artistHandler = new ArtistHandler();
        CustomerRepo custRepo = new CustomerRepo();
        Customer cust;
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["user"] == null && Request.Cookies["user_cookie"] == null)
            {
                MasterPageFile = "~/View/Master/Guest.Master"; ;
            }
            else
            {
                
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

                if (cust.CustomerRole == "admin")
                {
                    MasterPageFile = "~/View/Master/Admin.Master";
                }
                else MasterPageFile = "~/View/Master/Customer.Master";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (cust != null )
                {
                    welcomeLbl.Text = $"Hello, {cust.CustomerName}! Welcome to KpopZtation";
                    if(cust.CustomerRole == "admin")
                    {
                        insertBtn.Visible = true;
                        insertLbl.Visible = true;
                    }
                }else
                {
                    welcomeLbl.Text = "Welcome to KpopZtation";
                }
                DataRebinding();
            }
            
        }

        protected void DataRebinding()
        {
            List<Artist> artist = artistHandler.GetAllArtist();
            artistGridView.DataSource = artist;
            artistGridView.DataBind();
        }

        protected void artistGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = artistGridView.Rows[e.RowIndex];
            int id = int.Parse(row.Cells[1].Text);
            artistHandler.DeleteArtist(id);

            DataRebinding();
        }

        protected void artistGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRow row = artistGridView.Rows[e.NewEditIndex];

            int id = int.Parse(row.Cells[1].Text);
            Response.Redirect("~/View/ArtistFolder/edit_artist.aspx?ID=" + id);
        }

        protected void artistGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = artistGridView.SelectedRow;

            int id = int.Parse(row.Cells[1].Text);
            Response.Redirect("~/View/ArtistFolder/detail_artist.aspx?ID=" + id);
        }

        protected void artistGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(cust == null || cust.CustomerRole == "Cust")
            {
                e.Row.Cells[4].Visible = false;
            }
            else if(cust.CustomerRole == "admin")
            {
                e.Row.Cells[4].Visible = true;
            }
            
        }

        protected void insertBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/View/ArtistFolder/insert_artist.aspx");
        }
    }
}