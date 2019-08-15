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
    public partial class WebForm10 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dataconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            conn.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter("select id,username,filename,fileextension from Tbl_upload", conn);
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            conn.Close();
            conn.Open();
            SqlCommand cmd = new SqlCommand("select EmailId from Tbl_registration where UserName='" + Session["username"].ToString()+ "'", conn);
            DataTable dt1 = new DataTable();
            SqlDataAdapter da1 = new SqlDataAdapter(cmd);
            da1.Fill(dt1);
            Session["email"] = dt1.Rows[0][0].ToString();
            conn.Close();
        }
        protected void lnk_downloadclick(object sender, EventArgs e)
        {
            Panel1.Visible = true;            
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            int id = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value.ToString());
            Session["id"] = id;
            SqlCommand cmd = new SqlCommand("select id,filename,filepath,fileextension,secretkey from Tbl_upload where id=@id", conn);
            cmd.Parameters.AddWithValue("@id", id);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string filepath = dr["filepath"].ToString();
                Session["filepath"] = filepath;
                Session["extension"] = dr["fileextension"].ToString();
                Session["filename"] = dr["filename"].ToString();
                Session["secretkey"] = dr["secretkey"].ToString();
                conn.Close();
            }
            try
            {
                conn.Open();
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                mail.From = new MailAddress("rachel.infoziant@gmail.com");
                mail.To.Add(Session["email"].ToString());
                mail.Subject = "Decrypt key";
                mail.Body = " \n\t your decrypt key is '" + Session["secretkey"].ToString() + "'  for the file '" + Session["filename"].ToString()+ "'";
                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential("rachel.infoziant@gmail.com", "rachelinfoziant25");
                SmtpServer.EnableSsl = true;
                SmtpServer.Send(mail);
                conn.Close();                
                string display = " key send successfully";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);

            }
            catch
            {
                string display = " Check your internet connection";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
            }
               

        }

        protected void btnverify_Click(object sender, EventArgs e)
        {
            if (Session["secretkey"].ToString() == txtverify.Text)
            {
                Response.ContentType = Session["extension"].ToString();
                Response.AddHeader("Content-Disposition", "attachment;filename=\"" + Session["filename"].ToString() + "\"");
                Response.TransmitFile(Session["filepath"].ToString());
                Response.End();
            }
            else
            {
                string display = " Wrong Key";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
            }
        }
    }
}