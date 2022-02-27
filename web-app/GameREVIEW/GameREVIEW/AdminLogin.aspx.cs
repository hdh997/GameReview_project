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
    public partial class AdminLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //admin login btn click
        protected void LogInBtn_Click(object sender, EventArgs e)
        {
            if (UnameTextBox.Text.Trim() == "" || PwTextBox.Text.Trim() == "") {
                Response.Write("<script>alert('Please Enter Your User Name & Password.')</script>");
            }
            else {
                adminLogin();
            }
        }

        //
        //Log in func
        void adminLogin()
        {
            try
            {
                // get encrypted password
                string PWencrypted = Hash_Password.GetHashPassword(PwTextBox.Text.Trim());

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM [admin_tbl] WHERE [userName] = '" + UnameTextBox.Text.Trim() + "' AND [passWord]='" + PWencrypted + "'", con);
                SqlDataReader d_reader = cmd.ExecuteReader();
                if (d_reader.HasRows)
                {
                    while (d_reader.Read())
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert", "alert('Admin Login Successfully.');window.location ='Index.aspx';", true);
                        Session["username"] = d_reader.GetValue(1).ToString();
                        Session["adminID"] = d_reader.GetValue(0).ToString();
                        Session["role"] = "admin";
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