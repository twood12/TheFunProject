using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Topics : System.Web.UI.Page
{
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
        Response.Redirect("GrafftiBlog.aspx");
    }
    protected void Breaking_Click(object sender, EventArgs e)
    {
        Response.Redirect("BreakingBlog.aspx");
    }
}