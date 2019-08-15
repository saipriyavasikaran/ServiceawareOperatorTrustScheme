using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;

namespace ServiceOperator
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dataconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Session["username"] = txtLoginUserName.Text;
            if (ddlcloudservice.SelectedItem.Text == "Cloud Provider")
            {
                SqlCommand cmd = new SqlCommand("select UserName,Password,CloudService from Tbl_registration where UserName=@username and Password=@password and CloudService=@cloud", conn);
                cmd.Parameters.AddWithValue("@username", txtLoginUserName.Text);
                cmd.Parameters.AddWithValue("@password", txtLoginPassword.Text);
                cmd.Parameters.AddWithValue("@cloud", ddlcloudservice.SelectedItem.Text);
                conn.Open();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                int count = Convert.ToInt32(dt.Rows.Count);               
                if (count > 0)
                {                    
                   Response.Redirect("providerhome.aspx");                    
                }
                else
                {
                    string display = "invalid details";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
                }
            }
            else if (ddlcloudservice.SelectedItem.Text == "User")
            {
                SqlCommand cmd = new SqlCommand("select UserName,Password,CloudService from Tbl_registration where UserName=@username and Password=@password and CloudService=@cloud", conn);
                cmd.Parameters.AddWithValue("@username", txtLoginUserName.Text);
                cmd.Parameters.AddWithValue("@password", txtLoginPassword.Text);
                cmd.Parameters.AddWithValue("@cloud", ddlcloudservice.SelectedItem.Text);
                conn.Open();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                int count = Convert.ToInt32(dt.Rows.Count);
                if (count > 0)
                {
                    Response.Redirect("userhome.aspx");
                }
                else
                {
                    string display = "invalid details";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
                }
            }
            else
            {
                string display = "invalid details";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
            }



        }

        protected void lnkforgetUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPassword.aspx");
        }
    }
}