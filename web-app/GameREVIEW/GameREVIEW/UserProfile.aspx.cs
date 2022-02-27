using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameREVIEW
{
    public partial class UserProfile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Load data in fields 
            if (Session["username"] == null || Session["username"].ToString() == "")
            {
                Response.Redirect("UserLogin.aspx");
            }
            else {
                
                if (!Page.IsPostBack) {
                    accStatusUpdate();
                    getUserData();
                }
            }

        }

        protected void GoButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserReviewManagement.aspx");
        }

        //Fix btn clicked
        protected void ChangeBtn_Click(object sender, EventArgs e)
        {
            FNTextBox.ReadOnly = false;
            DoBTextBox.ReadOnly = false;
            SexDropDownList.Enabled = true;
            CityTextBox.ReadOnly = false;
            CountryTextBox.ReadOnly = false;
            EmailTextBox.ReadOnly = false;
            PhoneTextBox.ReadOnly = false;

            ChangeBtn.Visible = false;
            SaveBtn.Visible = true;

        }
        //save btn clicked
        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            if (FNTextBox.Text.Trim() == "")
            {
                Response.Write("<script>alert('Please Fill All Boxes Have*.')</script>");
            }
            else {
                userUpdate();
                FNTextBox.ReadOnly = true;
                DoBTextBox.ReadOnly = true;
                SexDropDownList.Enabled = false;
                CityTextBox.ReadOnly = true;
                CountryTextBox.ReadOnly = true;
                EmailTextBox.ReadOnly = true;
                PhoneTextBox.ReadOnly = true;

                ChangeBtn.Visible = true;
                SaveBtn.Visible = false;
            }
        }

        //
        //update user details func
        void userUpdate() {
            try {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE [user_tbl] SET [full_name] = @full_name, [DOB]=@DOB, [gender]=@gender, [city]=@city, [country]=@country, [email]=@email, [contact_no]=@contact_no WHERE [userName] ='" + Session["username"] + "'", con);
                cmd.Parameters.AddWithValue("@full_name", FNTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@DOB",DoBTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@gender",SexDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city",CityTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@country",CountryTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@email",EmailTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", PhoneTextBox.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Details Have Updated Successfully.')</script>");

            }
            catch (Exception ex) {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        //get user data func
        void getUserData() {
            try {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed) {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM [user_tbl] WHERE [userName] ='"+Session["username"]+"'", con);
                SqlDataAdapter d_adap = new SqlDataAdapter(cmd);
                DataTable d_tbl = new DataTable();
                d_adap.Fill(d_tbl);
                FNTextBox.Text = d_tbl.Rows[0]["full_name"].ToString();
                DoBTextBox.Text = d_tbl.Rows[0]["DOB"].ToString();
                SexDropDownList.SelectedValue = d_tbl.Rows[0]["gender"].ToString().Trim();
                CityTextBox.Text = d_tbl.Rows[0]["city"].ToString();
                CountryTextBox.Text = d_tbl.Rows[0]["country"].ToString();
                EmailTextBox.Text = d_tbl.Rows[0]["email"].ToString();
                PhoneTextBox.Text = d_tbl.Rows[0]["contact_no"].ToString();
            }
            catch (Exception ex) {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }

        }

        //account status func based on no of posts
        void accStatusUpdate()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM [contents_tbl] WHERE [userName] ='" + Session["username"] + "'", con);
                SqlDataAdapter d_adap = new SqlDataAdapter(cmd);
                DataTable d_tbl = new DataTable();
                d_adap.Fill(d_tbl);
                if (d_tbl.Rows.Count <= 2)
                {
                    Label1.Attributes.Add("class", "badge rounded-pill bg-info");
                    Label1.Text = "FRESH";
                }
                else if (d_tbl.Rows.Count > 2 && d_tbl.Rows.Count <= 5)
                {
                    Label1.Attributes.Add("class", "badge rounded-pill bg-success");
                    Label1.Text = "SWEET";
                }
                else if (d_tbl.Rows.Count > 5 && d_tbl.Rows.Count <= 15)
                {
                    Label1.Attributes.Add("class", "badge rounded-pill bg-primary");
                    Label1.Text = "COOL";
                }
                else if (d_tbl.Rows.Count > 15 && d_tbl.Rows.Count <= 25)
                {
                    Label1.Attributes.Add("class", "badge rounded-pill bg-warning");
                    Label1.Text = "PRO";
                }
                else {
                    Label1.Attributes.Add("class", "badge rounded-pill bg-dark");
                    Label1.Text = "MASTER";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
    }
}