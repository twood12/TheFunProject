using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Topics : BasePage
{

    protected void Page_PreInit(Object sender, EventArgs e)
    {
        if ((string)Session["MemberType"] == "Student")
        {
            this.MasterPageFile = "~/NestedMasterPages/WBLStudentMasterPage.master";
        }

        else if ((string)Session["MemberType"] == "Teacher")
        {
            this.MasterPageFile = "~/NestedMasterPages/WBLTeacherMasterPage.master";
        }

    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DJ_Click(object sender, EventArgs e)
    {
        Response.Redirect("DJBlog.aspx");
    
    }
    protected void MC_Click(object sender, EventArgs e)
    {
        Response.Redirect("MCBlog.aspx");
    
    }
    protected void Knowledge_Onclick(object sender, EventArgs e)
    {
        Response.Redirect("Knowledge.aspx");
    }
    protected void Graffti_Click(object sender, EventArgs e)
    {
        Response.Redirect("graffitiBlog.aspx");
    }
    protected void Breaking_Click(object sender, EventArgs e)
    {
        Response.Redirect("BreakingBlog.aspx");
    }
}