using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Student_WebPages_WBLStudent2TeacherEvaluation4 : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/WebPages/Student_WebPages/WBLStudent2TeacherEvaluation3.aspx");
    }

    protected void Next_Click(object sender, EventArgs e)
    {
        //Session["stuTeacherName"] = txtTeacher.Text; //This may need to be pulled from the drop down list which is on the base evaluation page where you select who to evaluate
        Session["stuTeacherAttendance"] = rdoTeacherAttendance.SelectedValue;
        Session["stuTeacherConsistent"] = rdoTeacherConsistently.SelectedValue;
        Session["stuTeacherManage"] = rdoTeacherManaged.SelectedValue;
        Session["stuTeacherOrganized"] = rdoTeacherOrganized.SelectedValue;
        Session["stuTeacherFeedback"] = rdoTeacherFeedback.SelectedValue;
        Session["stuTeacherFostered"] = rdoTeacherFostered.SelectedValue;
        Session["stuTeacherChallenge"] = rdoTeacherChallenged.SelectedValue;
        Session["stuTeacherActivities"] = rdoActivities.SelectedValue;
        Session["stuTeacherJob"] = rdoTeacherJob.SelectedValue;
        Session["stuTeacherSupport"] = rdoTeacherSupport.SelectedValue;



        Response.Redirect("~/WebPages/Student_WebPages/WBLStudent2TeacherEvaluation5.aspx");
    }
}