using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace Seminarski_zadatak
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnNewPass_Click(object sender, EventArgs e)
        {
            using (con = new SqlConnection(cs))
            {
                string hash = FormsAuthentication.HashPasswordForStoringInConfigFile(TxtPassword.Text, "MD5");
                con.Open();
                cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Username=@username AND Password=@Pass", con);
                cmd.Parameters.AddWithValue("@username", (string)Session["username"]);
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
                        cmd = new SqlCommand("UPDATE Users SET Password=@Pass WHERE Username=@username", con);
                        cmd.Parameters.AddWithValue("@Pass", FormsAuthentication.HashPasswordForStoringInConfigFile(TxtNewPass.Text, "MD5"));
                        cmd.Parameters.AddWithValue("@username", (string)Session["username"]);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        LblMsg.Text = "Password successfully updated!";
                    }

                }
                else
                {
                    con.Close();
                    LblMsg.Text = "Error with updating password!";

                }
            }

        }
    }
}