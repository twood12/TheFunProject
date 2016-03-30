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
        String stuTeacherStrength = txtTeachersStrengths.Text;
        String stuTeacherImprovements = txtTeachersImprovements.Text;
        String studentGradeComment = txtComments.Text;
        String stuTeacherAdditional = rdoAdditionalTeacher.SelectedValue;

        int stuClassParticipation = Convert.ToInt32(rdoParticipationInClass.SelectedValue);
        int stuClassCity = Convert.ToInt32(rdoAllCity.SelectedValue);
        int stuClassRecognition = Convert.ToInt32(ddRecognitionScore.SelectedValue);
        int stuClassTech = Convert.ToInt32(ddTechScore.SelectedValue);
        int stuClassMixing = Convert.ToInt32(ddMixingScore.SelectedValue);
        int stuClassScratching = Convert.ToInt32(ddScratchingScore.SelectedValue);
        int stuClassProfessional = Convert.ToInt32(ddProfessionalScore.SelectedValue);
        int stuClassPresentation = Convert.ToInt32(ddPresentationScore.SelectedValue);
    }
}