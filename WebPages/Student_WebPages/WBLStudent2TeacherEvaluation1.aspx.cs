using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Student_WebPages_WBLStudent2TeacherEvaluation1 : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Next_Click(object sender, EventArgs e)
    {

        Session["stuHearAboutClass"] = rdoHearAboutClass.SelectedValue;
        Session["stuSafety"] = rdoSafety.SelectedValue;
        Session["stuSafetyDesc"] = txtSafetyAnswers.Text;
        Session["stuSkills"] = txtSkills.Text;
        Response.Redirect("~/WebPages/Student_WebPages/WBLStudent2TeacherEvaluation2.aspx");
    }
}