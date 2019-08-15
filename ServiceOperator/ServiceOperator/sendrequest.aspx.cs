using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net;
using System.Net.Mail;

namespace ServiceOperator
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dataconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter("select EmailId from Tbl_registration where UserName='"+Session["username"].ToString()+"'",conn );
            da.Fill(dt);
            Session["email"] = dt.Rows[0][0].ToString();
            conn.Close();
        }
        protected void btnsend_Click(object sender, EventArgs e)
        { 
            string reply="";
            SqlCommand cmd = new SqlCommand("insert into Tbl_message values(@username,@subject,@message,@email,@replymessage)", conn);
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());
            cmd.Parameters.AddWithValue("@subject", txtsubject.Text);
            cmd.Parameters.AddWithValue("@message", txtmessage.Text);
            cmd.Parameters.AddWithValue("@email", Session["email"].ToString());
            cmd.Parameters.AddWithValue("@replymessage", reply);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            string display = "Request Sent Successfully";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
         }
    }
}