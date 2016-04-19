using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class WebPages_Admin_WebPages_ManageNewUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.GetData();
            
        }
    }

    /// <summary> 
    /// Paginates the data. 
    /// </summary> 
    /// <param name="sender">The sender.</param> 
    /// <param name="e">The <seecref="System.Web.UI.WebControls.GridViewPageEventArgs"/>
    ///       instance containing the event data.</param> 

    protected void PaginateTheData(object sender, GridViewPageEventArgs e)
    {
        List<int> list = new List<int>();
        if (ViewState["SelectedRecords"] != null)
        {
            list = (List<int>)ViewState["SelectedRecords"];
        }
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chkSelect");
            var selectedKey =
            int.Parse(GridView1.DataKeys[row.RowIndex].Value.ToString());
            if (chk.Checked)
            {
                if (!list.Contains(selectedKey))
                {
                    list.Add(selectedKey);
                }
            }
            else
            {
                if (list.Contains(selectedKey))
                {
                    list.Remove(selectedKey);
                }
            }
        }
        ViewState["SelectedRecords"] = list;
        GridView1.PageIndex = e.NewPageIndex;
        this.GetData();
    }

    /// <summary> 
    /// Gets the data. 
    /// </summary> 
    private void GetData()
    {
        DataTable table = new DataTable();
        // get the connection 
        using (SqlConnection conn = new SqlConnection("Server = LOCALHOST; Database = WBL; Trusted_Connection = Yes;"))
        {
            // write the sql statement to execute 
            string sql = "select MemberID, FirstName, LastName from Member where MemberType = 'Applicant'";
            // instantiate the command object to fire 
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                // get the adapter object and attach the command object to it 
                using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                {
                    // fire Fill method to fetch the data and fill into DataTable 
                    ad.Fill(table);
                }
            }
        }
        try
        {
            GridView1.DataSource = table;
            GridView1.DataBind();
        }
        catch (Exception v)
        {

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

    /// <summary> 
    /// Looks for selection. 
    /// </summary> 
    /// <param name="sender">The sender.</param> 
    /// <param name="e">The <seecref="System.Web.UI.WebControls.GridViewRowEventArgs"/>
    ///     instance containing the event data.</param> 
    protected void ReSelectSelectedRecords(object sender, GridViewRowEventArgs e)
    {
        List<int> list = ViewState["SelectedRecords"] as List<int>;
        if (e.Row.RowType == DataControlRowType.DataRow && list != null)
        {
            var autoId = int.Parse(GridView1.DataKeys[e.Row.RowIndex].Value.ToString());
            if (list.Contains(autoId))
            {
                CheckBox chk = (CheckBox)e.Row.FindControl("chkSelect");
                chk.Checked = true;
            }
        }
    }




    protected void btnAccept_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {

            if (((CheckBox)row.FindControl("chkSelect")).Checked)
            {
                //string studentID = Session variable here
                string memberID = row.Cells[1].Text;
                string firstName = row.Cells[2].Text;
                string lastName = row.Cells[3].Text;
                

                string mySQL = "";
                mySQL += "update Member set MemberType = 'Student', WaiverForm = 'Yes' where memberID = " + memberID;

                string mySql2 = "";
                mySql2 = "INSERT INTO STUDENT (STUDENTID) VALUES (" + memberID + ")";


                sendDBCommand(mySQL);

                sendDBCommand(mySql2);
                Response.Write(mySQL);
                Response.Write(mySql2);
                Response.Write("<h3>Success</h3> <p>" + firstName + " " + lastName + " is now a student in WBL!</p>");
            }

        }
    }

    protected void btnReject_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {

            if (((CheckBox)row.FindControl("chkSelect")).Checked)
            {
                //string studentID = Session variable here
                string memberID = row.Cells[1].Text;
                string firstName = row.Cells[2].Text;
                string lastName = row.Cells[3].Text;


                string mySQL = "";
                mySQL += "DELETE FROM Student Where StudentID = " + memberID;

                string mySql3 = "";
                mySql3 = "DELETE FROM MEMBER where MemberID = " + memberID;

                sendDBCommand(mySQL);

                sendDBCommand(mySql3);
                Response.Write(mySQL);
                Response.Write(mySql3);
                Response.Write("<h3>Success</h3> <p>" + firstName + " " + lastName + " has been deleted from WBL!</p>");
            }

        }
    }
}