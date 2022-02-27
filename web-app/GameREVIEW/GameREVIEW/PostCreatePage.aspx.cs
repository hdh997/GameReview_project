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
    public partial class PostCreatePage : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null || Session["username"].ToString() == "")
            {
                Response.Redirect("UserLogin.aspx");
            }
        }
        //Created btn clicked
        protected void CreateBtn_Click(object sender, EventArgs e)
        {
            if (TitleTextBox.Text.Trim() =="" || ContentTextBox.Text.Trim() =="") {
                Response.Write("<script>('Fill All Boxes Have *.')</script>");
            }
            else {
                if (isTitleExist())
                {
                    Response.Write("<script>('This Title Already Exist. Change Another Title.')</script>");
                }
                else {
                    createReview();
                    textClear();
                }
                
            }
        }
        //back to forum btn
        protected void BackButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForumPage.aspx");
        }

        //
        //Check title exist
        bool isTitleExist() {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed) {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM [contents_tbl] WHERE [content_title] = '"+TitleTextBox.Text.Trim()+"'", con);
                SqlDataAdapter d_adapter = new SqlDataAdapter(cmd);
                DataTable d_table = new DataTable();
                d_adapter.Fill(d_table);

                if (d_table.Rows.Count > 0) {
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

        //create content func
        void createReview() {
            try {
                //get username
                string current_user = Session["username"].ToString();

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO [contents_tbl] ([userName],[content_title],[content_main],[genre]) VALUES (@userName,@content_title,@content_main,@genre);", con);

                cmd.Parameters.AddWithValue("@userName", current_user);
                cmd.Parameters.AddWithValue("@content_title", TitleTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@content_main", ContentTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", GenreDropDownList.SelectedItem.Value);

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Nice.')</script>");
                
            }
            catch (Exception ex) {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //Clear text func
        void textClear() {
            TitleTextBox.Text = string.Empty;
            GenreDropDownList.SelectedIndex = 0;
            ContentTextBox.Text = string.Empty;
        }

        
        //
    }
}