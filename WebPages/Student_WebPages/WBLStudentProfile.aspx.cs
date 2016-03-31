using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class NestedMasterPages_WBLStudentProfile : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


        }
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        this.MasterPageFile = "~/NestedMasterPages/WBLStudentMasterPage.master";
    }
}