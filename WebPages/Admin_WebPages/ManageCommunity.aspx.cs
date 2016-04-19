using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Admin_WebPages_ManageCommunity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddPostList.DataBind();
            ddPostList.Items.Insert(0, "Select a postID");
            ddPostList.SelectedIndex = 0;
            
        }
    }

    public void sendDBCommand(String sqlQuery)
    {
        try
        {
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            sc.ConnectionString = @"Server=LocalHost;Database=WBL;Trusted_Connection=Yes;";

            sc.Open();
            System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
            insert.Connection = sc;
            insert.CommandText = sqlQuery;
            insert.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
        }

    }



    protected void btnDeletePost_Click(object sender, EventArgs e)
    {
        string commentID = ddPostList.SelectedValue;

        Response.Write(commentID);

        string mySQL = "";
        mySQL += "Exec deleteBlogPost " + commentID;

        sendDBCommand(mySQL);
        Response.Write(mySQL);
        Response.Write("<h3>Success</h3> <p>You have deleted a blog post.</p>");

        ddPostList.DataBind();


    }
}