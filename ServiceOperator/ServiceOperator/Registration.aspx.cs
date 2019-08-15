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
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dataconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
                SqlCommand cmd = new SqlCommand("insert into Tbl_registration values(@UserName,@Password,@Re_Password,@EmailId,@CloudService,@Mobile)", conn);
                cmd.Parameters.AddWithValue("@UserName", txtusername.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@Re_Password", txtrepass.Text);
                cmd.Parameters.AddWithValue("@EmailId", txtemailid.Text);
                cmd.Parameters.AddWithValue("@CloudService", ddlcloudservice.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Mobile", tbmobile.Text);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                string display = "Registered Successfully";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
            
        }
    }
}