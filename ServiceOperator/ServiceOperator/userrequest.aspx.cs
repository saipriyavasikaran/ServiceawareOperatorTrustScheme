using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net.Mail;

namespace ServiceOperator
{
    public partial class WebForm15 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dataconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter("select id,username,subject,message,email from Tbl_message", conn);
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            conn.Close();
        }
        protected void lnk_replyclick(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            int id = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value.ToString());
            Session["id"] = id.ToString();
        }

        protected void btnsend_Click(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedItem.Text == "Message")
            {
                SqlCommand cmd = new SqlCommand("update Tbl_message set replymessage=@reply where id=@id", conn);
                cmd.Parameters.AddWithValue("@reply", txtmessage.Text);
                cmd.Parameters.AddWithValue("@id", Session["id"].ToString());
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                string display = "Message Send Successfully";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
            }
            else if (RadioButtonList1.SelectedItem.Text == "Email")
            {
                conn.Open();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter("select username,email from Tbl_message where id='" + Session["id"].ToString() + "'", conn);
                da.Fill(dt);
                string name = dt.Rows[0][0].ToString();
                string email = dt.Rows[0][1].ToString();
                try
                {
                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                    mail.From = new MailAddress("dotnetproject15@gmail.com");
                    mail.To.Add(email);
                    mail.Subject = "Request Reply";
                    mail.Body = "\t\tHai " + name + "\n\t\t '" + txtmessage.Text + "'";

                    SmtpServer.Port = 587;
                    SmtpServer.Credentials = new System.Net.NetworkCredential("dotnetproject15@gmail.com", ".net2015");
                    SmtpServer.EnableSsl = true;

                    SmtpServer.Send(mail);
                    string display = "Mail Sended Successfully";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
                }
                catch
                {
                    string display = "Check Your internet connection";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
                }
            }
            else
            {
                string display = "Please Select Mode Of Message";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
            }
        }
        
    }
}