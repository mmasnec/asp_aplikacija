using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Seminarski_zadatak
{
    public partial class Login : System.Web.UI.Page
    {
        private string strcon = WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private bool UserLogin(string un, string pw)
        {
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select Count(*) from Users where Username=@un and Password=@pw", con);
            cmd.Parameters.AddWithValue("@un", un);
            cmd.Parameters.AddWithValue("@pw", pw);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            cmd.ExecuteNonQuery();
            if (dt.Rows[0][0].ToString() == "1")
            {
                //Response.Write("<script>alert('successful login!')</script>");
                con.Close();
                return true;
            }
            else
            {
                //Response.Write("<script>alert('error!')</script>");
                con.Close();
                return false;
            }
            //string result = Convert.ToString(cmd.ExecuteScalarAsync());
            //if (string.IsNullOrEmpty(result)) return false; return true;

        }
        protected void LoginUser_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string un = LoginUser.UserName;
            string pw = FormsAuthentication.HashPasswordForStoringInConfigFile(LoginUser.Password, "MD5");
            bool result = UserLogin(un, pw);
            if (result)
            {
                //Response.Write("<script>alert('successful login!')</script>");
                FormsAuthentication.RedirectFromLoginPage(un, false);
                Session["username"] = un;
            }
            else Response.Write("<script>alert('error!')</script>");

        }
    }
}