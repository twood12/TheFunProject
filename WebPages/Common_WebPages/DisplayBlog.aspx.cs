using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class DisplayBlog : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.PopulateBlog();
           
        }
    }

    private void PopulateBlog()
    {
        try
        {
            string PostID = this.Page.RouteData.Values["PostID"].ToString();
            string query = "SELECT [Subject], [PostContent] FROM [BlogPost] WHERE [PostID] = @PostID";
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
        
            catch(Exception)
            {
            }
    
    }
    protected void AddComment_Click(object sender, EventArgs e)
    {

        
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            sc.ConnectionString = @"Server=Localhost;Database=WBL;Trusted_Connection=Yes;";
            sc.Open();

            System.Data.SqlClient.SqlCommand reader = new System.Data.SqlClient.SqlCommand();
            reader.Connection = sc;
            reader.CommandText = "Insert into BlogPostComment(PostComment) values (@PostComment)";
            reader.Parameters.AddWithValue("@PostComment", txtBody.Text);
            reader.ExecuteNonQuery();
            bridge();
            Response.Redirect("Topics.aspx");
       
    }
    
        
      

    
    private void bridge()
    {
        string PostID = this.Page.RouteData.Values["PostID"].ToString();
        int max = findMax();
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        sc.ConnectionString = @"Server=Localhost;Database=WBL;Trusted_Connection=Yes;";
        sc.Open();

        System.Data.SqlClient.SqlCommand reader = new System.Data.SqlClient.SqlCommand();
        reader.Connection = sc;
        reader.CommandText = "Insert into FullPost(CommentID, PostID) values (@maxID, @PostID)";
        reader.Parameters.AddWithValue("@maxID", max);
        reader.Parameters.AddWithValue("@PostID", PostID);
        reader.ExecuteNonQuery();


    }
    public int findMax()
    {
        int max = 0;
        String id = "";

        try
        {

            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            sc.ConnectionString = @"Server=LOCALHOST;Database=WBL;Trusted_Connection=Yes;";

            sc.Open();
            System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
            insert.Connection = sc;
            insert.CommandText = "select Max(CommentID) as Max from BlogPostComment";
            System.Data.SqlClient.SqlDataReader reader = insert.ExecuteReader();
            while (reader.Read())
            {
                id = reader["Max"].ToString();
            }
            max = Convert.ToInt32(id);
            sc.Close();


        }
        catch (Exception)
        {
        }

        return max;
    }
   
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Return_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/WebPages/Common_WebPages/CommunityBlogHomePage.aspx");
    }
}
