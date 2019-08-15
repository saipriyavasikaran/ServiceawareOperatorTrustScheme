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
    public partial class WebForm12 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dataconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter("select EmailId from Tbl_registration where UserName='" + Session["username"].ToString() + "'", conn);
            da.Fill(dt);
            Session["email"] = dt.Rows[0][0].ToString();
            conn.Close();

        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("insert into Tbl_service values(@username,@servicename,@policy,@aboutus,@email)", conn);
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());
            cmd.Parameters.AddWithValue("@servicename", txtservice.Text);
            cmd.Parameters.AddWithValue("@policy", txtpolicy.Text);
            cmd.Parameters.AddWithValue("@aboutus", txtmessage.Text);
            cmd.Parameters.AddWithValue("@email", Session["email"].ToString());            
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            string display = "Service Added Successfully";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);

        }
    }
}