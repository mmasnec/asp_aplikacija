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
    public partial class Users : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt;

        protected void DataLoad()
        {
            if (Page.IsPostBack)
            {
                GridView1.DataBind();
            }
        }

        protected void ClearAllData()
        {
            TxtNewUser.Text = "";
            TxtNewPass.Text = "";
            ChkNewUsr.Checked = false;
        }

        private bool UserExists(string username)
        {
            using (con = new SqlConnection(cs))
            {
                string hash = FormsAuthentication.HashPasswordForStoringInConfigFile(TxtNewPass.Text, "MD5");
                con.Open();
                cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Username=@username", con);
                cmd.Parameters.AddWithValue("@username", username);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                cmd.ExecuteNonQuery();
                if (dt.Rows[0][0].ToString() == "1")
                {
                    con.Close();
                    return true;
                }
                else
                {
                    con.Close();
                    return false;
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                username.Text += (string)Session["username"];

            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TxtUser.Text = GridView1.SelectedRow.Cells[1].Text;
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            this.MultiView1.ActiveViewIndex = 0;
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            this.MultiView1.ActiveViewIndex = 1;

        }

        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            if(TxtNewUser.Text!="" && TxtNewPass.Text!="" && ChkNewUsr.Checked)
            {
                if (UserExists(TxtNewUser.Text))
                {
                    LblFill.Text = "Username already exist! Try again!";
                    ClearAllData();
                }
                else
                {
                    using (con = new SqlConnection(cs))
                    {
                        string hash = FormsAuthentication.HashPasswordForStoringInConfigFile(TxtNewPass.Text, "MD5");
                        con.Open();
                        cmd = new SqlCommand("INSERT INTO Users(Username, Password) VALUES(@username, @pass)", con);
                        cmd.Parameters.AddWithValue("@username", TxtNewUser.Text);
                        cmd.Parameters.AddWithValue("@pass", hash);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        DataLoad();
                        LblFill.Text = String.Format("User {0} successfully created!", TxtNewUser.Text);
                        ClearAllData();

                    }
                }
                
                    
                    
                
            }
            else
            {
                LblFill.Text = "Fill all fields and say You understand, then try again!";
            }
        }

        protected void BtnUser_Click(object sender, EventArgs e)
        {
            this.MWUpdate.ActiveViewIndex = 0;
            LblUser.Text = "Update user: " + Session["username"];

        }

        protected void BtnAdmin_Click(object sender, EventArgs e)
        {
            this.MWUpdate.ActiveViewIndex = 1;

        }
    }
}