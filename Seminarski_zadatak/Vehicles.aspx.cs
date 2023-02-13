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
    public partial class Vehicles : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                username.Text += (string)Session["username"];

            }

        }
        protected void ClearData()
        {
            TextBoxManufacturer.Text = "";
            TextBoxModel.Text = "";
            TxtReg.Text = "";
            TxtExpDate.Text = "";


        }

        protected void DataLoad()
        {
            if (Page.IsPostBack)
            {
                GridView1.DataBind();
            }
        }

        private bool RegistrationExists(string registration)
        {
            using (con = new SqlConnection(cs))
            {
               
                con.Open();
                cmd = new SqlCommand("SELECT COUNT(*) FROM Vehicles WHERE Registration=@reg", con);
                cmd.Parameters.AddWithValue("@reg", registration);
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TxtVehicleMan.Text = GridView1.SelectedRow.Cells[1].Text +" "+GridView1.SelectedRow.Cells[4].Text;
        }

        protected void BtnReg_Click(object sender, EventArgs e)
        {
            this.MultiView1.ActiveViewIndex = 0;

        }

        protected void BtnExp_Click(object sender, EventArgs e)
        {
            this.MultiView1.ActiveViewIndex = 1;

        }

        protected void BtnAva_Click(object sender, EventArgs e)
        {
            this.MultiView1.ActiveViewIndex = 2;

        }
        protected void BtnNew_Click(object sender, EventArgs e)
        {
            this.MultiView1.ActiveViewIndex = 3;

        }

        protected void BtnChReg_Click(object sender, EventArgs e)
        {
            if (TxtNewReg.Text != "" && !RegistrationExists(TxtNewReg.Text))
            {
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("UPDATE Vehicles SET Registration = @Data WHERE Registration = @reg", con);
                    cmd.Parameters.AddWithValue("@Data", TxtNewReg.Text);
                    cmd.Parameters.AddWithValue("@reg", this.GridView1.SelectedRow.Cells[4].Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                DataLoad();
                LblFill.Text = String.Format("Vehicle successfully updated!");
            }
            else
            {
                LblFill.Text = "Error occured!";
            }

            

        }

        protected void BtnToggleAv_Click(object sender, EventArgs e)
        {
            if (DDList.SelectedValue == "False")
            {
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("UPDATE Vehicles SET Available = @Data WHERE Registration = @reg", con);
                    cmd.Parameters.AddWithValue("@Data", "False");
                    cmd.Parameters.AddWithValue("@reg", this.GridView1.SelectedRow.Cells[4].Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                DataLoad();
            }
            else if(DDList.SelectedValue == "True")
            {
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("UPDATE Vehicles SET Available = @Data WHERE Registration = @reg", con);
                    cmd.Parameters.AddWithValue("@Data", "True");
                    cmd.Parameters.AddWithValue("@reg", this.GridView1.SelectedRow.Cells[4].Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                DataLoad();
            }
            else
            {
                LblAvailable.Text = "Error!";
            }
        }

        protected void BtnNewExp_Click(object sender, EventArgs e)
        {
            using (con = new SqlConnection(cs))
            {
                con.Open();
                cmd = new SqlCommand("UPDATE Vehicles SET Registration_Expire = @Data WHERE Registration = @reg", con);
                cmd.Parameters.AddWithValue("@Data", TxtExpChange.Text);
                cmd.Parameters.AddWithValue("@reg", this.GridView1.SelectedRow.Cells[4].Text);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            DataLoad();

        }


        protected void BtnAddNewVehicle_Click(object sender, EventArgs e)
        {
            if(TextBoxManufacturer.Text!=""&&TextBoxModel.Text!=""&&TxtReg.Text!=""&& TxtExpDate.Text != "" && CheckBox.Checked)
            {
                if (!RegistrationExists(TxtReg.Text))
                {
                    using (con = new SqlConnection(cs))
                    {
                        con.Open();
                        cmd = new SqlCommand("INSERT INTO Vehicles (Manufacturer, Model, Engine, Registration, Registration_Expire, " +
                            "Available, Added_By) VALUES (@manufacturer, @model, @engine, @registration, @registration_expire, @available, @added_by)", con);
                        cmd.Parameters.AddWithValue("@manufacturer", TextBoxManufacturer.Text);
                        cmd.Parameters.AddWithValue("@model", TextBoxModel.Text);
                        cmd.Parameters.AddWithValue("@engine", DropDownList2.SelectedValue);
                        cmd.Parameters.AddWithValue("@registration", TxtReg.Text);
                        cmd.Parameters.AddWithValue("@registration_expire", TxtExpDate.Text);
                        cmd.Parameters.AddWithValue("@available", DropDownList1.SelectedValue);
                        cmd.Parameters.AddWithValue("@added_by", (string)Session["username"]);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        DataLoad();
                        ClearData();
                    }
                }
                else
                {
                    LblFill.Text = "Registration already exists!";
                }
                
            }
            else
            {
                LblFill.Text = "Please fill all fields!";
            }
        }

        protected void BtnWrite_off_Click(object sender, EventArgs e)
        {
            using (con = new SqlConnection(cs))
            {
                con.Open();
                cmd = new SqlCommand("DELETE FROM Vehicles WHERE Registration = @reg", con);
                cmd.Parameters.AddWithValue("@reg", this.GridView1.SelectedRow.Cells[4].Text);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            DataLoad();
        }
    }
}