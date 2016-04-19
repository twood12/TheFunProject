using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Student_WebPages_WBLStudentPortfolio : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void MessageUser_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/WebPages/Common_WebPages/Email.aspx");
    }
    protected void ViewPortfolios_Click(object sender, EventArgs e)
    {

    }
    /* private void PopulatePortfolio()
     {
         try
         {
             string query = "SELECT [audio], [video], image FROM [BlogPost] WHERE [PostID] = @PostID";
             System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
             sc.ConnectionString = @"Server=Localhost;Database=WBL;Trusted_Connection=Yes;";

             using (SqlConnection con = new SqlConnection(sc.ConnectionString))
             {
                 using (SqlCommand cmd = new SqlCommand(query))
                 {
                     using (SqlDataAdapter sda = new SqlDataAdapter())
                     {
                         cmd.Parameters.AddWithValue("@PostID", PostID);
                         cmd.Connection = con;
                         sda.SelectCommand = cmd;
                         using (DataTable dt = new DataTable())
                         {
                             sda.Fill(dt);
                             lblTitle.Text = dt.Rows[0]["Subject"].ToString();
                             lblBody.Text = dt.Rows[0]["PostContent"].ToString();
                         }
                     }
                 }
             }
         }

         catch (Exception)
         {
         }

     }*/
}