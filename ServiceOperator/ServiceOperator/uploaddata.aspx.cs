using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Security.Cryptography;
using System.Diagnostics;
using System.Threading;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Dropbox.Api;
using OAuthProtocol;



namespace ServiceOperator
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        private const string ConsumerKey = "0ok4tuzwctdgh9z";
        private const string ConsumerSecret = "o1crce68zjt8qtq";
        private const string ConsumerKey1 = "v8qasmx37mfl90s";
        private const string ConsumerSecret1 = "6riwgo8ew5rs3zd";
        private const string ConsumerKey2 = "a23dy2f1p8pz3md";
        private const string ConsumerSecret2 = "ol13wfz6tl0qnhj";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dataconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Visible = false;
        }
        private static OAuthToken GetAccessToken()
        {
            var oauth = new OAuth();

            var requestToken = oauth.GetRequestToken(new Uri(DropboxRestApi.BaseUri), ConsumerKey, ConsumerSecret);

            var authorizeUri = oauth.GetAuthorizeUri(new Uri(DropboxRestApi.AuthorizeBaseUri), requestToken);
            Process.Start(authorizeUri.AbsoluteUri);
            Thread.Sleep(20000); // Leave some time for the authorization step to complete

            return oauth.GetAccessToken(new Uri(DropboxRestApi.BaseUri), ConsumerKey, ConsumerSecret, requestToken);
        }
        private static OAuthToken GetAccessToken1()
        {
            var oauth = new OAuth();

            var requestToken1 = oauth.GetRequestToken(new Uri(DropboxRestApi.BaseUri), ConsumerKey1, ConsumerSecret1);

            var authorizeUri1 = oauth.GetAuthorizeUri(new Uri(DropboxRestApi.AuthorizeBaseUri), requestToken1);
            Process.Start(authorizeUri1.AbsoluteUri);
            Thread.Sleep(20000); // Leave some time for the authorization step to complete

            return oauth.GetAccessToken(new Uri(DropboxRestApi.BaseUri), ConsumerKey1, ConsumerSecret1, requestToken1);
        }
        private static OAuthToken GetAccessToken2()
        {
            var oauth = new OAuth();

            var requestToken2 = oauth.GetRequestToken(new Uri(DropboxRestApi.BaseUri), ConsumerKey2, ConsumerSecret2);

            var authorizeUri2 = oauth.GetAuthorizeUri(new Uri(DropboxRestApi.AuthorizeBaseUri), requestToken2);
            Process.Start(authorizeUri2.AbsoluteUri);
            Thread.Sleep(20000); // Leave some time for the authorization step to complete

            return oauth.GetAccessToken(new Uri(DropboxRestApi.BaseUri), ConsumerKey2, ConsumerSecret2, requestToken2);
        }

        protected void btn_upload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile == true)
            {
                Panel1.Visible = true;
                txtkey.ReadOnly = true;
                string filename = Path.GetFileNameWithoutExtension(FileUpload1.PostedFile.FileName);
                Session["filename"] = filename;
                string fileextension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                string input = Server.MapPath("~//files//") + filename + fileextension;
                string output = Server.MapPath("~//files//") + filename + "_enc" + fileextension;
                string part1 = Server.MapPath("~//part1//") + filename + "1.txt";
                string part2 = Server.MapPath("~//part2//") + filename + "2.txt";
                string part3 = Server.MapPath("~//part3//") + filename + "3.txt";
                FileUpload1.SaveAs(input);
                StreamReader fileI = new StreamReader(input);
                StreamWriter fileA = new StreamWriter(part1);
                StreamWriter fileB = new StreamWriter(part2);
                StreamWriter fileC = new StreamWriter(part3);
                // int linenum1;
                string line;
                int counter = System.IO.File.ReadAllLines(input).Length;
                int counter1 = counter / 3;
                int counter2 = counter1 + counter1;
                int counter3 = counter2 + counter1;
                for (int linenum = 1; linenum <= counter1; linenum++)
                {
                    if ((line = fileI.ReadLine()) != null)
                    {
                        fileA.WriteLine(line);
                    }
                }
                for (int linenum = counter1 + 1; linenum <= counter2; linenum++)
                {
                    if ((line = fileI.ReadLine()) != null)
                    {
                        fileB.WriteLine(line);
                    }
                }
                for (int linenum = counter2 + 1; linenum <= counter3; linenum++)
                {
                    if ((line = fileI.ReadLine()) != null)
                    {
                        fileC.WriteLine(line);
                    }
                }
                fileI.Close();
                fileA.Close();
                fileB.Close();
                fileC.Close();
                StreamReader reader1 = new StreamReader(part1);
                txtpart1.Text = reader1.ReadToEnd();
                StreamReader reader2 = new StreamReader(part2);
                txtpart2.Text = reader2.ReadToEnd();
                StreamReader reader3 = new StreamReader(part3);
                txtpart3.Text = reader3.ReadToEnd();
                SqlCommand cmd = new SqlCommand("insert into Tbl_upload values(@username,@filename,@filepath,@fileextension,@secretkey,@filepath1,@filepath2,@filepath3)", conn);
                cmd.Parameters.AddWithValue("@username", Session["username"].ToString());
                cmd.Parameters.AddWithValue("@filename",filename);
                cmd.Parameters.AddWithValue("@filepath",input);
                cmd.Parameters.AddWithValue("@fileextension",fileextension);
                cmd.Parameters.AddWithValue("@secretkey",txtkey.Text);
                cmd.Parameters.AddWithValue("@filepath1","");
                cmd.Parameters.AddWithValue("@filepath2", "");
                cmd.Parameters.AddWithValue("@filepath3", "");
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            else
            {
                string display = "Please select a file to upload";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
            }            
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            txtkey.ReadOnly = true;
            txtpart1.Text = Encrypt(txtpart1.Text);
            string filename = Session["filename"].ToString();
            string FileName = filename + "1_enc.txt";
            string enc_part1=Server.MapPath("~//part1//") + filename + "1_enc.txt";
            System.IO.File.WriteAllText(enc_part1, txtpart1.Text);
            SqlCommand cmd = new SqlCommand("update Tbl_upload set filepath1='" + enc_part1 + "' where filename='" + filename + "'", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            {
               var accessToken = GetAccessToken();              
               var api = new DropboxApi(ConsumerKey, ConsumerSecret, accessToken);
               var file = api.UploadFile("dropbox", FileName, enc_part1);
               Console.WriteLine(string.Format("{0} uploaded.", file.Path));
               Console.WriteLine();
               Console.WriteLine("Done. Press any key to continue...");
               ClientScript.RegisterStartupScript(Page.GetType(), "Error Message ", "<script language='javascript'>alert(' Upload Successfully')</script>");
            }
        }    

        protected void Button2_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            txtkey.ReadOnly = true;
            txtpart2.Text = Encrypt(txtpart2.Text);
            string filename = Session["filename"].ToString();
            string FileName = filename + "2_enc.txt";
            string enc_part2 = Server.MapPath("~//part2//") + filename + "2_enc.txt";
            System.IO.File.WriteAllText(enc_part2, txtpart2.Text);
            SqlCommand cmd = new SqlCommand("update Tbl_upload set filepath2='" + enc_part2 + "' where filename='" + filename + "'", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            {
                var accessToken = GetAccessToken1();
                var api = new DropboxApi(ConsumerKey1, ConsumerSecret1, accessToken);
                var file = api.UploadFile("dropbox", FileName, enc_part2);
                Console.WriteLine(string.Format("{0} uploaded.", file.Path));
                Console.WriteLine();
                Console.WriteLine("Done. Press any key to continue...");
                ClientScript.RegisterStartupScript(Page.GetType(), "Error Message ", "<script language='javascript'>alert(' Upload Successfully')</script>");
            }
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            txtkey.ReadOnly = true;
            txtpart3.Text = Encrypt(txtpart3.Text);
            string filename = Session["filename"].ToString();
            string FileName = filename + "3_enc.txt";
            string enc_part3=Server.MapPath("~//part3//") + filename + "3_enc.txt";
            System.IO.File.WriteAllText(enc_part3, txtpart3.Text);
            SqlCommand cmd = new SqlCommand("update Tbl_upload set filepath3='" + enc_part3 + "' where filename='" + filename + "'", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            {
                var accessToken = GetAccessToken2();
                var api = new DropboxApi(ConsumerKey2, ConsumerSecret2, accessToken);
                var file = api.UploadFile("dropbox", FileName, enc_part3);
                Console.WriteLine(string.Format("{0} uploaded.", file.Path));
                Console.WriteLine();
                Console.WriteLine("Done. Press any key to continue...");
                ClientScript.RegisterStartupScript(Page.GetType(), "Error Message ", "<script language='javascript'>alert(' Upload Successfully')</script>");
            }
        }
        private string Encrypt(string clearText)
        {
            string EncryptionKey = txtkey.Text;
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }
    }
}