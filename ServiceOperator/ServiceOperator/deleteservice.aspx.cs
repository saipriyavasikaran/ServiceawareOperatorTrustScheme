using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace ServiceOperator
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dataconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter("select id,username,servicename,policy,aboutus from Tbl_service where username='" + Session["username"].ToString() + "'", conn);
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            conn.Close();

        }
        protected void lnk_deleteclick(object sender, EventArgs e)
        {
            conn.Open();
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            int id = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value.ToString());
            SqlCommand cmd = new SqlCommand("delete from Tbl_service where id=@id", conn);
            cmd.Parameters.AddWithValue("@id", id);
          
            cmd.ExecuteNonQuery();
            conn.Close();
            string display = "Deleted sucessfully";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
        }
    }
}