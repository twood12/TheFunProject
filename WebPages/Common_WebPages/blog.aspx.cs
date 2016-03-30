using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class blog : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Submit(object sender, EventArgs e)
    {
        try
        {
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            sc.ConnectionString = @"Server=Localhost;Database=WBL;Trusted_Connection=Yes;";
            sc.Open();

            System.Data.SqlClient.SqlCommand reader = new System.Data.SqlClient.SqlCommand();
            reader.Connection = sc;
            reader.CommandText = "Insert into BlogPost(Subject, PostContent, DisciplineType) values (@Subject, @PostContent, @DisciplineType)";
            reader.Parameters.AddWithValue("@Subject", txtTitle.Text);
            reader.Parameters.AddWithValue("@PostContent", txtBody.Text);
            reader.Parameters.AddWithValue("@DisciplineType", Session["DisciplineType"]);
            reader.ExecuteNonQuery();
         

            Response.Redirect("CommunityBlogHomePage.aspx");
        }
        catch (Exception)
        {


        }
      
        
    }
   
}