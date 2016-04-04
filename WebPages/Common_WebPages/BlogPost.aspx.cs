using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BlogPost : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

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

        else if ((string)Session["MemberType"] == "Admin")
        {
            this.MasterPageFile = "~/NestedMasterPages/WBLAdminMasterPage.master";
        }


    }
}