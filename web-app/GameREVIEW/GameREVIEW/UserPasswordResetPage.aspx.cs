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
    public partial class UserPasswordResetPage : System.Web.UI.Page
    {
        static string savePW;
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Reset Password btn clicked
        protected void ResetPWBtn_Click(object sender, EventArgs e)
        {
            if (UNameTextBox.Text.Trim() == "" || PwTextBox.Text.Trim() == "" || ConfirmBox.Text.Trim() == "")
            {
                Response.Write("<script>alert('Please Fill All Boxes.')</script>");
                Label1.Attributes.Add("style", "color:Salmon");
                Label2.Attributes.Add("style", "color:Salmon");
            }
            else {                
                if (isPwMatch())
                {
                    if (isUserNameExist())
                    {
                        resetPW();
                    }
                    else {
                        Response.Write("<script>alert('User Name Is Not Existed.')</script>");
                        UNameTextBox.Focus();
                    }
                }
                else {
                    Response.Write("<script>alert('Confirm Password Not Matched.')</script>");
                    ConfirmBox.Focus();
                }
                
            }
        }
        //

        //Reset password func
        void resetPW() {
            try
            {
                //Get encrypted password
                string PWencrypted = Hash_Password.GetHashPassword(ConfirmBox.Text.Trim());
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE [user_tbl] SET [passWord]='" + PWencrypted + "' WHERE [userName] = '" + UNameTextBox.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert", "alert('Password Changed Successfully.');window.location ='UserLogin.aspx';", true);

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //Check username existed func
        bool isUserNameExist() {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM [user_tbl] WHERE [userName] = '" + UNameTextBox.Text.Trim() + "'", con);
                SqlDataAdapter d_adap = new SqlDataAdapter(cmd);
                DataTable d_tbl = new DataTable();
                d_adap.Fill(d_tbl);
                if (d_tbl.Rows.Count > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        //Check Pw box with confirm box is match
        bool isPwMatch() {
            try {
                savePW = PwTextBox.Text.Trim();
                if (savePW == ConfirmBox.Text.Trim())
                {
                    return true;
                }
                else {
                    return false;
                }
            }
            catch (Exception ex) {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        //
    }
}