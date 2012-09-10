using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace FYPSite
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Insert();
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            this.Session["userID"] = dv[0].Row[0].ToString();
            this.Session["username"] = dv[0].Row[1].ToString();
            Response.Redirect("RecentNews.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}