using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

namespace FYPSite
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            string sqlcmd = "Select * From [Account] Where username='" + txt_user.Text + "' And password='" + txt_pass.Text + "'";

            SqlDataSource sds = new SqlDataSource(ConfigurationManager.ConnectionStrings["cs"].ConnectionString, sqlcmd);

            DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);


            //If no records match query
            if (dv.Count == 0)
            {
                this.Label1.Visible = true;
                return;
            }

            //Create session variables
            this.Session["userID"] = dv[0].Row[0].ToString();
            this.Session["username"] = dv[0].Row[1].ToString();
            Response.Redirect("RecentNews.aspx");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}