using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameREVIEW
{
    public partial class UserReviewManagement : System.Web.UI.Page
    {
        //static List<string> ori_title = new List<string>(); // save original tittle for update post

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null || Session["username"].ToString() == "")
            {
                Response.Redirect("UserLogin.aspx");
            }
            else
            {

                if (!IsPostBack)
                {
                    getPostData();
                }
            }
        }

        protected void BackButton1_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("UserProfile.aspx");
            
        }

        //new review btn clicked in modal
        protected void CreateReviewbtn_Click(object sender, EventArgs e)
        {
            string new_title = TitleTextBox.Text.Trim();
            if (TitleTextBox.Text.Trim() == "" || ContentTextBox.Text.Trim() == "")
            {
                errorLabel.Text = "";
                errorLabel.Attributes.Add("style", "color:Salmon;");
                errorLabel.Visible = true;
                errorLabel.Text = "Fill All Boxes Have*.";

            }
            else {
                if (isTitleExist(new_title))
                {
                    errorLabel.Text = "";
                    errorLabel.Attributes.Add("style", "color:Salmon;");
                    errorLabel.Visible = true;
                    errorLabel.Text = "*Try Another Title.";
                }
                else {
                    createReview();
                }
                
            }
        }

        //command on gridview
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Save btn clicked
            //Check if title exsited
            string get_Title = (GridView1.Rows[e.RowIndex].FindControl("CTTExtBox") as TextBox).Text.Trim();
            
            
            if (get_Title == "") {
                Response.Write("<script>alert('Invalid Title.')</script>");
                GridView1.EditIndex = -1;
                getPostData();
            }
            else
            {
                try
                {
                    //execute update
                    DropDownList droplist = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("GenreDropDownListEdit");
                    string dropValue = droplist.SelectedItem.Value;
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE [contents_tbl] SET [content_title] =  @content_title, [content_main] = @content_main, [genre] = @genre WHERE [contentID] = @id", con);
                    cmd.Parameters.AddWithValue("@content_title", (GridView1.Rows[e.RowIndex].FindControl("CTTExtBox") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@genre", dropValue);
                    cmd.Parameters.AddWithValue("@content_main", (GridView1.Rows[e.RowIndex].FindControl("DTextBox") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));

                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.EditIndex = -1;
                    getPostData();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "')</script>");
                }
            }
        }

        //edit btn clicked
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex; //on the edit mode
            //foreach(var i in ori_title)
            //{
            //    Response.Write("<script>alert('"+i+"')</script>");
            //}

            getPostData();
        }
        //Cancel btn clicked
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1; //back to normal stage
            getPostData();
        }
        //Delete btn clicked
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM [contents_tbl] WHERE [content_title] = @content_title", con);
                cmd.Parameters.AddWithValue("@content_title", (GridView1.Rows[e.RowIndex].FindControl("CTLabel") as Label).Text.Trim());
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
        //get user posts data
        void getPostData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM [contents_tbl] WHERE [userName] ='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter d_adap = new SqlDataAdapter(cmd);
                DataTable d_tbl = new DataTable();
                d_adap.Fill(d_tbl);
                if (d_tbl.Rows.Count > 0)
                {
                    GridView1.DataSource = d_tbl;
                    GridView1.DataBind();

                    //Debug.WriteLine(d_tbl.Rows[0]["content_title"].ToString());
                    //ori_title.Add(d_tbl.Rows[0]["content_title"].ToString());

                   
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
                    GridView1.Rows[0].Cells[0].Text = "You Have No REVIEW yet...";
                    GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        //Check title exist
        bool isTitleExist(string title)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM [contents_tbl] WHERE [content_title] = '" + title + "'", con);
                SqlDataAdapter d_adapter = new SqlDataAdapter(cmd);
                DataTable d_table = new DataTable();
                d_adapter.Fill(d_table);

                if (d_table.Rows.Count > 0)
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

        //Create Review func in modal
        void createReview() {
            try {
                string current_user = Session["username"].ToString(); // get current username

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed) {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO [contents_tbl] ([userName],[content_title],[content_main],[genre]) VALUES (@userName,@content_title,@content_main,@genre);", con);
                cmd.Parameters.AddWithValue("@userName", current_user);
                cmd.Parameters.AddWithValue("@content_title", TitleTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@content_main", ContentTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", GenreDropDownList.SelectedItem.Value);
                cmd.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert", "alert('NICE.');window.location = 'UserReviewManagement.aspx';", true);
            }
            catch (Exception ex) {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        //
    }
}