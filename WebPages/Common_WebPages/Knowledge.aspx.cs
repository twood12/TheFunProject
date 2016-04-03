using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Knowledge : BasePage
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
        Session["DisciplineType"] = "Knowledge"; 
    }
    protected void AddPost_Click(object sender, EventArgs e)
    {
        Response.Redirect("blog.aspx");
    }
}