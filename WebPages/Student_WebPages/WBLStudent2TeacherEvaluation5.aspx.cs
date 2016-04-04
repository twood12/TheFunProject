using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Student_WebPages_WBLStudent2TeacherEvaluation5 : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Back_Click(object sender, EventArgs e)
    {

    }

    protected void Submit_Click(object sender, EventArgs e)
    {

        String sqlQuery = "";
        String sqlQuery1 = "";
        String sqlQuery2 = "";
        String sqlQuery3 = "";
        int maxEvaluationID = -1;

        String stuTeacherStrength = txtTeachersStrengths.Text;
        String stuTeacherImprovements = txtTeachersImprovements.Text;
        String studentGradeComment = txtComments.Text;
        String stuTeacherAdditional = rdoAdditionalTeacher.SelectedValue;

        String stuClassParticipation = rdoParticipationInClass.SelectedValue;
        String stuClassCity = rdoAllCity.SelectedValue;
        int stuClassRecognition = Convert.ToInt32(ddRecognitionScore.SelectedValue);
        int stuClassTech = Convert.ToInt32(ddTechScore.SelectedValue);
        int stuClassMixing = Convert.ToInt32(ddMixingScore.SelectedValue);
        int stuClassScratching = Convert.ToInt32(ddScratchingScore.SelectedValue);
        int stuClassProfessional = Convert.ToInt32(ddProfessionalScore.SelectedValue);
        int stuClassPresentation = Convert.ToInt32(ddPresentationScore.SelectedValue);



        try
        {
            sqlQuery += "EXEC [dbo].[InsertBaseEvaluation] " + Session["stuEvaluationTeacherID"] + ", " + Session["MemberID"] + ", " + Session["stuEvaluationCourseID"];

            sendDBCommand(sqlQuery);

            maxEvaluationID = getEvaluationIDValue();
            Response.Write(maxEvaluationID);


            sqlQuery1 = "EXEC [dbo].[InsertCourseEvaluation] " + maxEvaluationID + ", " + Session["stuEvaluationTeacherID"] + ", " + Session["MemberID"] + ", '" + Session["stuHearAboutClass"] + "', '" + Session["stuSafety"] + "', '" + Session["stuSafetyDesc"] + "', '" + Session["stuSkills"] + "', " + Session["stuNewThings"]
                + ", " + Session["stuLearn"] + ", " + Session["stuMediums"] + ", " + Session["stuMakeFriends"] + ", " + Session["stuMotivationNew"] + ", " + Session["stuHappy"] + ", " + Session["stuFuture"] + ", " + Session["stuWorkArtists"] + ", " + Session["stuStress"] + ", " + Session["stuRespect"]
                + ", " + Session["stuNegativity"] + ", " + Session["stuCreative"] + ", " + Session["stuCareers"] + ", " + Session["stuCareerGoals"] + ", " + Session["stuCommunity"] + ", " + Session["stuGrowth"] + ", " + Session["stuFinishSchool"] + ", " + Session["stuFindJob"];
            
            Response.Write(sqlQuery1);

            sendDBCommand(sqlQuery1);

            sqlQuery2 = "EXEC [dbo].[InsertTeacherEvaluation] " + maxEvaluationID + ", " + Session["stuEvaluationTeacherID"] + ", " + Session["MemberID"] + ", " + Session["stuTeacherAttendance"] + ", " + Session["stuTeacherConsistent"] + ", " + Session["stuTeacherManage"] + ", " + Session["stuTeacherOrganized"] + ", " + Session["stuTeacherFeedback"]
                + ", " + Session["stuTeacherFostered"] + ", " + Session["stuTeacherChallenge"] + ", " + Session["stuTeacherActivities"] + ", " + Session["stuTeacherJob"] + ", " + Session["stuTeacherSupport"] + ", '" + stuTeacherStrength + "', '" + stuTeacherImprovements + "', '" + studentGradeComment + "', '" + stuTeacherAdditional + "'";

            Response.Write(sqlQuery2);
            sendDBCommand(sqlQuery2);

            sqlQuery3 = "EXEC [dbo].[InsertStudentSelfEvaluation] " + maxEvaluationID + ", " + Session["stuEvaluationTeacherID"] + ", " + Session["MemberID"] + ", '" + stuClassParticipation + "', '" + stuClassCity + "', " + stuClassRecognition + ", " + stuClassTech + ", " + stuClassMixing + ", " + stuClassScratching + ", " + stuClassProfessional + ", " + stuClassPresentation;

            Response.Write(sqlQuery3);

            sendDBCommand(sqlQuery3);

        }
        catch (Exception ex)
        {
            Console.Write(ex);
        }



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


    protected int getEvaluationIDValue()
    {
        int evaluationID = 0;



        try
        {
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            sc.ConnectionString = @"Server =user-PC;Database=WBL;Trusted_Connection=Yes;";

            sc.Open();
            System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
            insert.Connection = sc;
            insert.CommandText = @"Select MAX(EvaluationID) as MAX_VALUE from Evaluation";
            System.Data.SqlClient.SqlDataReader reader = null;

            reader = insert.ExecuteReader();


            while (reader.Read())
            {
                evaluationID = Convert.ToInt32((reader["MAX_VALUE"].ToString()));
            }

            sc.Close();


        }
        catch (Exception ex)
        {
            Console.Write(ex);
        }

        Response.Write(evaluationID);
        return evaluationID;
    }
}