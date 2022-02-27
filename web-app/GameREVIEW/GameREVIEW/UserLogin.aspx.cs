using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameREVIEW
{
    public partial class UserLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Forgetbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserPasswordResetPage.aspx");
        }
        //login btn clicked
        protected void LogInBtn_Click(object sender, EventArgs e)
        {
            if (UNameTextBox.Text.Trim() == "" || PwTextBox.Text.Trim() == "")
            {
                Response.Write("<script>alert('Please Enter Your User Name & Password.');</script>");
            }
            else
            {
                userLogin();

            }
        }
        //Sign up btn clicked
        protected void SignUpBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserSignUpPage.aspx");
        }

        //
        //Log in func
        void userLogin()
        {
            try
            {
                //Get encrypted password
                string PWencrypted = Hash_Password.GetHashPassword(PwTextBox.Text.Trim());
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM [user_tbl] WHERE [userName] = '" + UNameTextBox.Text.Trim() + "' AND [passWord]='" + PWencrypted + "'", con);
                SqlDataReader d_reader = cmd.ExecuteReader();
                if (d_reader.HasRows)
                {
                    while (d_reader.Read())
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert", "alert('User Login Successfully.');window.location ='Index.aspx';", true);
                        
                        Session["username"] = d_reader.GetValue(8).ToString();
                        Session["userID"] = d_reader.GetValue(0).ToString();
                        Session["fullname"] = d_reader.GetValue(1).ToString();
                        Session["role"] = "user";
                    }

                    
                }
                else
                {
                    Response.Write("<script>alert('Invalid User Name or Password.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        
        //
    }
}