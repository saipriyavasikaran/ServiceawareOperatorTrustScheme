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
    public partial class WebForm5 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dataconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEmail_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds = new DataSet();
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT UserId,UserName,Password FROM Tbl_registration Where EmailId= '" + txtEmailId.Text.Trim() + "'", conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    conn.Close();
                }
                if (ds.Tables[0].Rows.Count > 0)
                {
                    //conn.Open();
                    //MailMessage Msg = new MailMessage();
                    //// Sender e-mail address.
                    //Msg.From = new MailAddress("rachel.infoziant@gmail.com"); ;
                    //// Recipient e-mail address.
                    //Msg.To.Add(txtEmailId.Text);
                    //Msg.Subject = "Your Password Details";
                    //Msg.Body = "Hi, <br/>Please check your Login Detailss<br/><br/>Your User Id: " + ds.Tables[0].Rows[0]["UserId"] + "<br/><br/>Your UserName: " + ds.Tables[0].Rows[0]["UserName"] + "<br/><br/>Your Password: " + ds.Tables[0].Rows[0]["Password"] + "<br/><br/>";
                    //Msg.IsBodyHtml = true;
                    //// your remote SMTP server IP.
                    //SmtpClient smtp = new SmtpClient();
                    //smtp.Host = "smtp.gmail.com";
                    //smtp.Port = 587;
                    //smtp.Credentials = new System.Net.NetworkCredential("rachel.infoziant@gmail.com", "rachelinfoziant25");
                    //smtp.EnableSsl = true;
                    //smtp.Send(Msg);
                    ////Msg = null;
                    //lbl1Result.Text = "Your Password Details Sent to your mail";
                    //// Clear the textbox valuess
                    //txtEmailId.Text = "";
                    //conn.Close();
                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                    mail.From = new MailAddress("rachel.infoziant@gmail.com");
                    mail.To.Add(txtEmailId.Text);
                    mail.Subject = "Forgot Password";
                    mail.Body = "Hi, Your User Id: " + ds.Tables[0].Rows[0]["UserId"] + "  \n\t Your UserName: " + ds.Tables[0].Rows[0]["UserName"] + " \n\t Your Password: " + ds.Tables[0].Rows[0]["Password"] + "  \n\t ";

                    SmtpServer.Port = 587;
                    SmtpServer.Credentials = new System.Net.NetworkCredential("rachel.infoziant@gmail.com", "rachelinfoziant25");
                    SmtpServer.EnableSsl = true;

                    SmtpServer.Send(mail);
                    string script = @"<script language=""javascript""> alert('Your Password has been send successfully to Your Email '); </script>;";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "myJScript1", script);
                }
                else
                {
                    lbl1Result.Text = "The Email you entered not exists.";
                }
            }


            catch (Exception ex)
            {
                string display = "check your internet connection";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
                lbl1Result.Text = ex.Message;
            }


        }
    }
}