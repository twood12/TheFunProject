using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class NestedMasterPages_WBLTeacherProfile : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        this.GetData();
        //defaultDifficultyID();
    }
    private void GetData()
    {
        DataTable table = new DataTable();
        // get the connection 
        using (SqlConnection conn = new SqlConnection("Server = LOCALHOST; Database = WBL; Trusted_Connection = Yes;"))
        {
            // write the sql statement to execute 
            string sql = "select cs.TeacherID, m.FirstName, m.LastName, c.CourseID, c.CourseName, sec.SectionID, sec.MeetingDays, sec.MeetingTime,sec.RoomNumber from ClassSchedule cs JOIN Course c on c.courseID = cs.CourseID JOIN Section sec on sec.SectionID = cs.SectionID JOIN staff st on st.StaffID = cs.TeacherID JOIN member m on m.memberID = cs.TeacherID";
            //Response.Write(sql);
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
            gvClassSchedule.DataSource = table;
            gvClassSchedule.DataBind();
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

    protected void ReSelectSelectedRecords(object sender, GridViewRowEventArgs e)
    {
        List<int> list = ViewState["SelectedRecords"] as List<int>;
        if (e.Row.RowType == DataControlRowType.DataRow && list != null)
        {
            var autoId = int.Parse(gvClassSchedule.DataKeys[e.Row.RowIndex].Value.ToString());
            if (list.Contains(autoId))
            {
                CheckBox chk = (CheckBox)e.Row.FindControl("chkSelect");
                chk.Checked = true;
            }
        }
    }

    protected void btnAttendanceForm_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/WebPages/Teacher_WebPages/WBLTeacherAttendanceForm.aspx");
    }
}