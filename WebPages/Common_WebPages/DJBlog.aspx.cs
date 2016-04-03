using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


public partial class DJBlog : BasePage
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
        Session["DisciplineType"] = "DJ"; 
    }
    protected void AddPost_Click(object sender, EventArgs e)
    {
        Response.Redirect("Blog.aspx");
    }
    public class RequiredTextBox : Control, INamingContainer
    {


    }
   
 }
    
