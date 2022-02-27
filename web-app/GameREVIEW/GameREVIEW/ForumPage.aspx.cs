using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameREVIEW
{
    public partial class ForumPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        // create btn clicked
        protected void GoCreateLinkButton_Click(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].ToString() == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert", "alert('Login With Your Account To Create.');window.location ='UserLogin.aspx';", true);
                
            }
            else {
                Response.Redirect("PostCreatePage.aspx");
            }
        }

    }
}