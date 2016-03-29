using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Teacher_WebPages_WBLTeacherEvaluations : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            ddStudentEvaluations.DataBind();
    }

    protected void btnEvaluateStudent_Click(object sender, EventArgs e)
    {
        
        String selectedValue = ddStudentEvaluations.SelectedValue;
        
        int commaPosition = ddStudentEvaluations.SelectedValue.IndexOf(',');
        int idPosition = ddStudentEvaluations.SelectedValue.IndexOf('-');

        String studentName = ddStudentEvaluations.SelectedValue.Substring((idPosition + 1), (commaPosition -3));
        String studentIDString = ddStudentEvaluations.SelectedValue.Substring(0, idPosition);

        int studentID = Convert.ToInt32(studentIDString);
        Response.Write(studentName);
        //Response.Write(studentName);

        Session["StudentEvaluationName"] = studentName;
        Session["StudentEvaluationStuID"] = studentID;

        Response.Redirect("~/WebPages/Teacher_WebPages/WBLTeacherIndividualEvaluation1.aspx");

    }

    protected void ddCourseList_SelectedIndexChanged(object sender, EventArgs e)
    {
        String selectedValue = ddCourseList.SelectedValue;
        int idPosition = ddCourseList.SelectedValue.IndexOf('-');
        String courseIDString = ddCourseList.SelectedValue.Substring(0, idPosition);

        int courseID = Convert.ToInt32(courseIDString);

        Session["EvaluationCourseID"] = courseID;
    }
}