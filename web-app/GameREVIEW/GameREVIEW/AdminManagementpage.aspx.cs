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
    public partial class AdminManagementpage : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                getPostData();
            }
            
        }
        //search btn clicked
        protected void SearchLinkButton_Click(object sender, EventArgs e)
        {
            
            if (UserNametbox.Text.Trim() == "")
            {
                clearText();
                errorLabel.Attributes.Add("style", "color:Salmon;");
                errorLabel.Visible = true;
                errorLabel.Text = "*Enter User Name";
                
            }
            else {
                searchUser();
            }
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
        }

        //Delete user btn clicked
        protected void DeleteUserbtn_Click(object sender, EventArgs e)
        {
            if (UserNametbox.Text.Trim() == "")
            {
                clearText();
                errorLabel.Attributes.Add("style", "color:Salmon;");
                errorLabel.Visible = true;
                errorLabel.Text = "*Invalid User.";
            }
            else {
                if (isUserExist())
                {
                    deleteUser();
                    //delete user if user exist
                }
                else
                {
                    clearText();
                    errorLabel.Attributes.Add("style", "color:Salmon;");
                    errorLabel.Visible = true;
                    errorLabel.Text = "*User Not Found.";
                }
            }
            
        }

        //delete REVIEW btn clicked
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM [contents_tbl] WHERE [contentId] = @id", con);
                cmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString())); // find the value on gridview
                cmd.ExecuteNonQuery();
                con.Close();
                getPostData();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        //
        // get review funct
        void getPostData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM contents_tbl;", con);
                SqlDataAdapter d_adap = new SqlDataAdapter(cmd);
                DataTable d_tbl = new DataTable();
                d_adap.Fill(d_tbl);
                if (d_tbl.Rows.Count > 0)
                {
                    GridView1.DataSource = d_tbl;
                    GridView1.DataBind();
                }
                else
                {
                    //show no data on gridview
                    d_tbl.Rows.Add(d_tbl.NewRow());
                    GridView1.DataSource = d_tbl;
                    GridView1.DataBind();
                    GridView1.Rows[0].Cells.Clear();
                    GridView1.Rows[0].Cells.Add(new TableCell());
                    GridView1.Rows[0].Cells[0].ColumnSpan = d_tbl.Columns.Count;
                    GridView1.Rows[0].Cells[0].Text = "No REVIEW yet...";
                    GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        //inside modal funcs
        //search user func
        void searchUser() {
            try {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed) {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT [userID],[userName],[full_name],[contact_no],[email] FROM [user_tbl] WHERE [userName] LIKE '%" + UserNametbox.Text.Trim()+"%' ", con);
                SqlDataAdapter d_adap = new SqlDataAdapter(cmd);
                DataTable d_tbl = new DataTable();
                d_adap.Fill(d_tbl);
                if (d_tbl.Rows.Count > 0)
                {
                    UserNametbox.Text = d_tbl.Rows[0]["userName"].ToString();
                    IdTextBox.Text = d_tbl.Rows[0]["userID"].ToString();
                    FullNametbox.Text = d_tbl.Rows[0]["full_name"].ToString();
                    Contacttbox.Text = d_tbl.Rows[0]["contact_no"].ToString();
                    Emailtbox.Text = d_tbl.Rows[0]["email"].ToString();
                    errorLabel.Text = "";
                }
                else {
                    errorLabel.Attributes.Add("style", "color:Salmon;");
                    errorLabel.Visible = true;
                    errorLabel.Text = "*User Name Invalid";
                    clearText();
                }
            }
            catch (Exception ex) {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        //delete user func
        void deleteUser() {
            try {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM [user_tbl] WHERE[userName] = '" + UserNametbox.Text.Trim()+ "'", con);
                cmd.ExecuteNonQuery();

                //delete related posts
                 cmd = new SqlCommand("DELETE FROM [contents_tbl] WHERE[userName] = '" + UserNametbox.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert", "alert('User Deleted.');window.location ='AdminManagementpage.aspx';", true);
                
            }
            catch (Exception ex) {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
            

        }

        //check user exist func
        bool isUserExist() {
            try {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM [user_tbl] WHERE [userName] = '"+ UserNametbox.Text+ "' ", con);
                SqlDataAdapter d_adap = new SqlDataAdapter(cmd);
                DataTable d_tabl = new DataTable();
                d_adap.Fill(d_tabl);
                if (d_tabl.Rows.Count > 0) {
                    return true;
                }
                else {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return false;
            }
        }

        //clear text func
        void clearText() {
            
            IdTextBox.Text = "";
            UserNametbox.Text = "";
            FullNametbox.Text = "";
            Contacttbox.Text = "";
            Emailtbox.Text = "";
        }
        //
    }
}