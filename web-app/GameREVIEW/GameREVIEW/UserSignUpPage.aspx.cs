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
    public partial class UserSignUpPage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //signup btn clicked
        protected void SignUpBtn_Click(object sender, EventArgs e)
        {
            if (FNTextBox.Text.Trim() == "" || UserNameTextBox.Text.Trim() == "" || PwTextBox.Text.Trim() == "")
            {
                Response.Write("<script>alert('Fill All Boxes Have *.')</script>");
            }
            else {
                if (isUserExist())
                {
                    Response.Write("<script>alert('User Name Already Existed.')<script>");
                }
                else {
                    signUpNewUser();
                    
                }
            }
        }
        // btn go to login if aldready have acc
        protected void goLoginbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Userlogin.aspx");
        }

        //
        //check user exist func
        bool isUserExist() {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed) {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM user_tbl WHERE userName = '"+UserNameTextBox.Text.Trim()+"' ", con);
                SqlDataAdapter d_adap = new SqlDataAdapter(cmd);
                DataTable d_tbl = new DataTable();
                d_adap.Fill(d_tbl);

                if (d_tbl.Rows.Count > 0) {
                    return true;
                }
                else {
                    return false;
                }
            }
            catch (Exception ex){
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        //sign up func
        void signUpNewUser() {
            try {

                //encrypt password
                string PWencrypted = Hash_Password.GetHashPassword(PwTextBox.Text.Trim());

                SqlConnection con = new SqlConnection(strcon);
                if (con.State==ConnectionState.Closed) {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO user_tbl ([full_name],[DOB],[gender],[city],[country],[email],[contact_no],[userName],[passWord]) VALUES (@full_name,@DOB,@gender,@city,@country,@email,@contact_no,@userName,@passWord)", con);

                cmd.Parameters.AddWithValue("@full_name",FNTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@DOB", DoBTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@gender",SexDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city",CityTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@country",CountryTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@email",EmailTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no",PhoneTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@userName",UserNameTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@passWord", PWencrypted);

                cmd.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert", "alert('User Sign Up Successfully.');window.location ='UserLogin.aspx';", true);
                
            }
            catch (Exception ex) {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        



        //
    }
}