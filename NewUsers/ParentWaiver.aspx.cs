using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class NewUsers_ParentWaiver : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnApplySignature_Click(object sender, EventArgs e)
    {

        Session["MemberID2"] = "";
        

        string cs = ConfigurationManager.ConnectionStrings["DBXY"].ConnectionString;
        SqlConnection sc = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = sc;
        cmd.CommandText = "Select * from Member where Email = @Email";
        cmd.Parameters.AddWithValue("@Email", Session["emailAddress1"]);
        sc.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            Session["MemberID2"] = reader["MemberID"].ToString();

        }







        string parentSignature = txtParentSignature.Text;
        string signatureDate = txtSignatureDate.Text;


        string mySQL = "";
        mySQL += "update Member set ParentSignature = '" + parentSignature + "', SignatureDate = '" + signatureDate + "' where memberID = " + Session["MemberID2"];



        sendDBCommand(mySQL);

        Response.Write(mySQL);
        //Response.Write("<h3>Success</h3> <p>" + firstName + " " + lastName + " is now a student in WBL!</p>");
        Response.Redirect("accountConfirmation.aspx");
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
}