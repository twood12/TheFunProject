using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Student_WebPages_WBLStudentEvaluations : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //ddTeacherEvaluations.DataBind();
            ddStudentCourseList.DataBind();
            ddStudentCourseList.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            ddStudentCourseList.SelectedIndex = 0;
        }
            
    }

    protected void ddCourseList_SelectedIndexChanged(object sender, EventArgs e)
    {
      
        try
        {
            String selectedValue = ddStudentCourseList.SelectedValue;
            int idPosition = ddStudentCourseList.SelectedValue.IndexOf('-');
            String courseIDString = ddStudentCourseList.SelectedValue.Substring(0, idPosition);
            int courseID = Convert.ToInt32(courseIDString);

            Session["stuEvaluationCourseID"] = courseID;

            
        }
        catch(Exception ex)
        {

        }
        

        
    }

    protected void btnEvaluateTeacher_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/WebPages/Student_WebPages/WBLStudent2TeacherEvaluation1.aspx");
    }

    protected void ddTeacherEvaluations_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            String selectedValueTeacher = ddTeacherEvaluations.SelectedValue;
            int idPositionTeacher = ddTeacherEvaluations.SelectedValue.IndexOf('-');
            String teacherIDString = ddTeacherEvaluations.SelectedValue.Substring(0, idPositionTeacher);
            int teacherID = Convert.ToInt32(teacherIDString);

            Session["stuEvaluationTeacherID"] = teacherID;
        }
        catch(Exception ex)
        {

        }
    }
}