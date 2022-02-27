using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameREVIEW
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try {
                if (Session["role"] == null) {
                    LoginButton.Visible = true;
                    SignUpLinkButton.Visible = true;
                    SignOutLinkButton.Visible = false;
                    UserProfileLinkButton.Visible = false;

                    AdminLoginBtn.Visible = true;
                    MemberManageBtn.Visible = false;
                }
                else if (Session["role"].Equals("user")) {
                    LoginButton.Visible = false;
                    SignUpLinkButton.Visible = false;
                    SignOutLinkButton.Visible = true;
                    UserProfileLinkButton.Visible = true;
                    UserProfileLinkButton.Text = "Hello " + Session["username"].ToString()+"!";

                    AdminLoginBtn.Visible = true;
                    MemberManageBtn.Visible = false;
                }
                else if (Session["role"].Equals("admin"))
                {
                    LoginButton.Visible = true;
                    SignUpLinkButton.Visible = false;
                    SignOutLinkButton.Visible = true;
                    UserProfileLinkButton.Visible = true;
                    UserProfileLinkButton.Text = "Hello " + Session["username"].ToString()+"!";

                    AdminLoginBtn.Visible = false;
                    MemberManageBtn.Visible = true;
                }
            }
            catch (Exception ex) {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //Login btn clicked
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }
        //SignUp btn clicked
        protected void SignUpLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserSignUpPage.aspx");
        }
        //SignOut btn clicked
        protected void SignOutLinkButton_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";

            LoginButton.Visible = true;
            SignUpLinkButton.Visible = true;
            SignOutLinkButton.Visible = false;
            UserProfileLinkButton.Visible = false;

            AdminLoginBtn.Visible = true;
            MemberManageBtn.Visible = false;

            Response.Redirect("Index.aspx");
        }
        //UserProfile btn clicked
        protected void UserProfileLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }

        protected void AdminLoginBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }
        //forum btn clicked
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForumPage.aspx");
        }

        protected void MemberManageBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminManagementpage.aspx");
        }
    }
}