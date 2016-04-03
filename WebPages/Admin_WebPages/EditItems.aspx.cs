using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Admin_WebPages_EditItems : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["SubjectName"] != null)
            {
                lblTitle.Text = "EDITING, DELETING SUBJECT:";
                lblTitle2.Text = Session["SubjectName"].ToString();
                dvEditSubject.DataBind();
                dvEditSubject.Visible = true;
            }
        }

    }
    protected void lnkBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("SearchEngine.aspx", false);
    }
}