using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Teacher_WebPages_WBLTeacherEvaluationConfirmation : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblConfirmation.Text = "Evaluation completed for " + Session["StudentEvaluationName"];

    }

    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/WebPages/Teacher_WebPages/WBLTeacherEvaluations.aspx");
    }
}