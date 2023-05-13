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

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                MasterPageFile = "~/View/Master/Guest.Master";
            }
            else
            {
                Customer cust = (Customer)Session["user"];
                if (cust.CustomerRole == "Cust") MasterPageFile = "~/View/Master/Customer.Master";
                else MasterPageFile = "~/View/Master/Admin.Master";
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
            List<Artist> artist = artistHandler.GetAllArtist();
            artistGridView.DataSource = artist;
            artistGridView.DataBind();
        }

        protected void artistGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = artistGridView.Rows[e.RowIndex];
            int id = int.Parse(row.Cells[0].Text);
            artistHandler.DeleteArtist(id);

            DataRebinding();
        }

        protected void artistGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRow row = artistGridView.Rows[e.NewEditIndex];

            int id = int.Parse(row.Cells[0].Text);
            Response.Redirect("~/View/edit_artist.aspx?ID=" + id);
        }

        protected void artistGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = artistGridView.SelectedRow;

            int id = int.Parse(row.Cells[0].Text);
            Response.Redirect("~/View/view_artist.aspx?ID=" + id);
        }

        protected void artistGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Customer cust = (Customer)Session["user"];
            if(cust == null || cust.CustomerRole == "Cust")
            {
                e.Row.Cells[4].Visible = false;
            }
            else if(cust.CustomerRole == "admin")
            {
                e.Row.Cells[4].Visible = true;
            }
            
        }
    }
}