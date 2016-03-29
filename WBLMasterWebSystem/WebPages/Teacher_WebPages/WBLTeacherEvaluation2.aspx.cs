using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Teacher_WebPages_WBLTeacherEvaluation2 : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write(Session["StudentEvaluationStuID"].ToString());
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        String sqlQuery = "";

        String studentStrength = txtStrengths.Text;
        String studentImprovement = txtImprovements.Text;
        String studentGradeComment = txtComments.Text;

        int studentRecognition = Convert.ToInt32(ddRecognitionScore.SelectedValue);
        int studentTechnology = Convert.ToInt32(ddTechScore.SelectedValue);
        int studentMixing = Convert.ToInt32(ddMixingScore.SelectedValue);
        int studentScratching = Convert.ToInt32(ddScratchingScore.SelectedValue);
        int studentProfessionalism = Convert.ToInt32(ddProfessionalScore.SelectedValue);
        int studentPresentation = Convert.ToInt32(ddPresentationScore.SelectedValue);

        
        
        try
        {
            sqlQuery += "EXEC [dbo].[InsertStudentEvaluation] "
                        +"'S', " + Session["EvaluationCourseID"] + ", " + 4 + "," + Session["StudentEvaluationStuID"] + ", " + Session["StudentAttendance"] + ", " + Session["StudentTimeliness"] + ", " + Session["StudentEnvironment"] + ", " + Session["StudentCriticism"]
                        + ", " + Session["StudentAttitude"] + ", " + Session["StudentMotivation"] + ", " + Session["StudentProject"] + ", " + Session["StudentEngagement"] + ",'" + studentStrength + "', '" + studentImprovement + "', '" + studentGradeComment + "', "
                        + studentRecognition + ", " + studentTechnology + ", " + studentMixing + ", " + studentScratching + ", " + studentProfessionalism + ", " + studentPresentation;

            sendDBCommand(sqlQuery);
        }
        catch (Exception ex)
        {
            Console.Write(ex);
        }

        Response.Redirect("~/WebPages/Teacher_WebPages/WBLTeacherEvaluationConfirmation.aspx");




    }
    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/WebPages/Teacher_WebPages/WBLTeacherIndividualEvaluation1.aspx");
    }


    public static void sendDBCommand(String cmdLine)
    {
        try
        {
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            sc.ConnectionString = @"Server =user-PC;Database=WBL;Trusted_Connection=Yes;";

            sc.Open();
            System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
            insert.Connection = sc;
            insert.CommandText = cmdLine;
            insert.ExecuteNonQuery();

            sc.Close();


        }

        catch (Exception ex)
        {
            Console.Write(ex);
        }
    }
}