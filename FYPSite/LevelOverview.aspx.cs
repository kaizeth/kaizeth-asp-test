using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYPSite
{
    public partial class LevelOverview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label9.Text = Request.QueryString["id"];
        }
    }
}