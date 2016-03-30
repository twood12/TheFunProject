using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Student_WebPages_WBLStudent2TeacherEvaluation2 : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/WebPages/Student_WebPages/WBLStudent2TeacherEvaluation1.aspx");
    }

    protected void Next_Click(object sender, EventArgs e)
    {
        Session["stuNewThings"] = rdoNewThings.SelectedValue;
        Session["stuLearn"] = rdoLearn.SelectedValue;
        Session["stuMediums"] = rdoMediums.SelectedValue;
        Session["stuMakeFriends"] = rdoMakeFriends.SelectedValue;
        Session["stuMotivationNew"] = rdoMotivated.SelectedValue;
        Session["stuHappy"] = rdoHappy.SelectedValue;
        Session["stuFuture"] = rdoFuture.SelectedValue;
        Session["stuWorkArtists"] = rdoWorkWithArtists.SelectedValue;
        Session["stuStress"] = rdoStress.SelectedValue;
        Session["stuRespect"] = rdoRespect.SelectedValue;
        Session["stuNegativity"] = rdoNegativity.SelectedValue;
        Response.Redirect("~/WebPages/Student_WebPages/WBLStudent2TeacherEvaluation3.aspx");
    }
}