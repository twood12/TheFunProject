using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Teacher_WebPages_WBLTeacherIndividualEvaluation1 : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtStudentName.Text = (String)Session["StudentEvaluationName"];
    }

    protected void Next_Click(object sender, EventArgs e)
    {
        //create variables for data collection. Collect values from all radio buttons
        Session["StudentAttendance"] = rdoStudentAttendance.SelectedValue;
        Session["StudentTimeliness"] = rdoStudentTime.SelectedValue;
        Session["StudentEnvironment"] = rdoStudentEnvironment.SelectedValue;
        Session["StudentCriticism"] = rdoStudentCriticism.SelectedValue;
        Session["StudentAttitude"] = rdoStudentAttitude.SelectedValue;
        Session["StudentMotivation"] = rdoStudentMotivation.SelectedValue;
        Session["StudentProject"] = rdoStudentProject.SelectedValue;
        Session["StudentEngagement"] = rdoStudentEngagement.SelectedValue;


        Response.Redirect("~/WebPages/Teacher_WebPages/WBLTeacherEvaluation2.aspx");
    }

}