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
    public partial class LevelSubmit : System.Web.UI.Page
    {
        int[] achieved;

        protected void Page_Load(object sender, EventArgs e)
        {   //display play result
            Label12.Text = "Distance Travelled: " + Request.QueryString["d"];
            Label13.Text = "Total time: " + Request.QueryString["t"] + " seconds";
            //prepare variables for submission
            lbl_accID.Text = Session["userID"].ToString();
            lbl_levelID.Text = Request.QueryString["id"];
            lbl_time.Text = Request.QueryString["t"];
            lbl_distance.Text = Request.QueryString["d"];
            lbl_timeStamp.Text = DateTime.Now.ToString("M/d/yyyy");

            //Check for obained achievement
            int playTime = int.Parse(Request.QueryString["t"]);
            int playDist = int.Parse(Request.QueryString["d"]);
            int levelID = int.Parse(Request.QueryString["id"]);

            DataView dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);

            achieved = new int[dv.Count];

            for (int i = 0; i < achieved.Length; i++)
            {
                //SQL query included [goalID], [type], [amount], [condition], [filter], [title]
                int goalID = int.Parse(dv[i].Row["goalID"].ToString());
                int type = int.Parse(dv[i].Row["type"].ToString());
                int amount = int.Parse(dv[i].Row["amount"].ToString());
                int condition = int.Parse(dv[i].Row["condition"].ToString());
                int filter = int.Parse(dv[i].Row["filter"].ToString());
                string title = dv[i].Row["title"].ToString();

                if (type == 0) // Check duration
                {
                    if (CheckCondition(playDist, amount, condition, filter, type))
                    {
                        achieved[i] = goalID;
                        Label16.Text += title + "<br />";
                    }
                    else
                    {
                        achieved[i] = 0;
                    }
                }
                else if (type == 1) // Check distance
                {
                    if (CheckCondition(playTime, amount, condition, filter, type))
                    {
                        achieved[i] = goalID;
                        Label16.Text += title + "<br />";
                    }
                    else
                    {
                        achieved[i] = 0;
                    }
                }
                else if (type == 2) // Check play count
                {
                    if (CheckPlay(amount, filter))
                    {
                        achieved[i] = goalID;
                        Label16.Text += title + "<br />";
                    }
                    else
                    {
                        achieved[i] = 0;
                    }
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Insert();

            DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            int num = int.Parse(dv[0].Row[0].ToString());
            num++;
            lbl_playcount.Text = num.ToString();
            SqlDataSource2.Update();

            //Prepare to update achievement system
            SqlDataSource sds = new SqlDataSource(ConfigurationManager.ConnectionStrings["cs"].ConnectionString, "SELECT goalID FROM [Achievement] WHERE accountID='" + lbl_accID.Text + "'");
            DataView dv2 = (DataView)sds.Select(DataSourceSelectArguments.Empty);
            int pass = 0;
            for (int i = 0; i < achieved.Length; i++) 
            {
                if (achieved[i] != 0)//getting all achieved goals
                {
                    for (int j = 0; j < dv2.Count; j++)
                    {
                        if (achieved[i] == int.Parse(dv2[j].Row["goalID"].ToString())) //check for existing records
                        {
                            pass = 1;
                            break;
                        }
                        pass = 0;
                    }
                    if (pass == 0)
                    {
                        sds.InsertCommand = "INSERT INTO [Achievement] VALUES (" + lbl_accID.Text + ", " + achieved[i] + ", '" + DateTime.Now.ToString("M/d/yyyy") + "')";
                        sds.Insert();
                    }
                }
            }
            Response.Redirect("LevelOverview.aspx?id=" + Request.QueryString["id"]);
        }
        public bool CheckCondition(int result, int amount, int condition, int filter, int type)
        {
            if (filter == int.Parse(Request.QueryString["id"].ToString())) //if filter equals to maze id
            {
                if (condition == 1)
                {
                    if (result > amount)
                        return true;
                }
                else if (condition == 2)
                {
                    if (result < amount)
                        return true;
                }
            }
            else if (filter == 0)//if filter covers all plays
            {
                DataView dv = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);

                int totalTime = int.Parse(dv[0].Row["totalTime"].ToString());
                int totalDist = int.Parse(dv[0].Row["totalDist"].ToString());

                if (type == 0) //Time
                {
                    if (condition == 1)
                    {
                        if (totalTime+result > amount)
                            return true;
                    }
                    else if (condition == 2)
                    {
                        if (totalTime+result < amount)
                            return true;
                    }
                }
                else if (type == 1) //Distance
                {
                    if (condition == 1)
                    {
                        if (totalDist + result > amount)
                            return true;
                    }
                    else if (condition == 2)
                    {
                        if (totalDist + result < amount)
                            return true;
                    }
                }
            }
            return false;
        }

        public bool CheckPlay(int amount, int filter)
        {
            //If filter != 0 then COUNT all records from playlog where mazeID = levelID and accountID match

            if (filter == int.Parse(Request.QueryString["id"].ToString())) //if filter equals to maze id
            {
                DataView dv = (DataView)SqlDataSource6.Select(DataSourceSelectArguments.Empty);
                int totalPlays = int.Parse(dv[0].Row["totalPlays"].ToString());

                if (totalPlays + 1 > amount)
                {
                    return true;
                }

            }
            else if (filter == 0)//if filter covers all plays
            {
                DataView dv = (DataView)SqlDataSource5.Select(DataSourceSelectArguments.Empty);
                int totalPlays = int.Parse(dv[0].Row["totalPlays"].ToString());

                if (totalPlays + 1 > amount)
                {
                    return true;
                }
            }
            return false;
        }
    }
}