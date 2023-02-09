using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Seminarski_zadatak
{
    public partial class ChangeUsername : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = (string)Session["username"];
        }

        protected void BtnChange_Click(object sender, EventArgs e)
        {
            using (con = new SqlConnection(cs))
            {
                string hash = FormsAuthentication.HashPasswordForStoringInConfigFile(TxtConfirmPass.Text, "MD5");
                con.Open();
                cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Username=@username AND Password=@Pass", con);
                cmd.Parameters.AddWithValue("@username", Label1.Text);
                cmd.Parameters.AddWithValue("@Pass", hash);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                cmd.ExecuteNonQuery();
                if (dt.Rows[0][0].ToString() == "1")
                {
                    con.Close();

                    using (con = new SqlConnection(cs))
                    {
                        con.Open();
                        cmd = new SqlCommand("UPDATE Users SET Username=@Name WHERE Username=@username", con);
                        cmd.Parameters.AddWithValue("@Name", TxtNewUsername.Text);
                        cmd.Parameters.AddWithValue("@username", Label1.Text);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        LblMsg.Text = "Username successfully updated!";
                    }

                }
                else
                {
                    con.Close();
                    LblMsg.Text = "Error with updating username!";
                    
                }
            }
        }
    }
}