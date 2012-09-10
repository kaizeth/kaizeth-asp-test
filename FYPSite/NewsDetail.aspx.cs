using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace FYPSite
{
    public partial class NewsDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label5.Text = Request.QueryString["id"];
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            int num = int.Parse(dv[0].Row[2].ToString());
            num++;
            Label6.Text = num.ToString();
            SqlDataSource1.Update();


        }
    }
}