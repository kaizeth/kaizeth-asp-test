using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYPSite
{
    public partial class ProfileView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["id"] != null)
            {
                lbl_id.Text = Request.QueryString["id"];
            }
            else
            {
                if (Session["userID"] != null)
                lbl_id.Text = Session["userID"].ToString();
            }
                
        }
    }
}