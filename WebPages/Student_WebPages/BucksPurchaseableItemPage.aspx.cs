using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Data.SqlClient;

public partial class WebPages_Student_WebPages_BucksPurchaseableItemPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void PurchaseItem_Click(object sender, EventArgs e)
    {

        int balance = Convert.ToInt32(FormView5.SelectedValue);
        int price = Convert.ToInt32(FormView2.SelectedValue);

        if (price < balance)
        {

            string sql = "Exec UpdateBuckAccount " + FormView5.SelectedValue + ", " + FormView2.SelectedValue + ", " + FormView1.SelectedValue;
            sendDBCommand(sql);
            Response.Write("You're teacher has been notify about your purchase. Your bucks have been removed and you will recieve your item soon");
        }
        else
        {
            Response.Write("You don't have enough Bucks to purchase this");
        }



    }

    private void GetData()
    {

    }

    private decimal calcBalance(decimal ab, decimal ip)
    {
        ab -= ip;
        return ab;
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
        catch (Exception)
        {
        }

    }
}