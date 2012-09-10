using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYPSite
{
    public partial class ProfileSite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Return to login if session variable does not exist
            if (Session["userID"] == null)
                Response.Redirect("Login.aspx");

            Label1.Text = "Logged in as " + Session["username"].ToString() + ".  ";
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login.aspx");
        }
    }
}