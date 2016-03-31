using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class WebPages_Student_WebPages_WBLIndividualCourse : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GetData();
    }
    private void GetData()
    {
        DataTable table = new DataTable();
        // get the connection 
        using (SqlConnection conn = new SqlConnection("Server = LOCALHOST; Database = WBL; Trusted_Connection = Yes;"))
        {
            // write the sql statement to execute 
            string sql = "select c.CourseID, c.CourseName, c.Difficulty, m.MemberID, m.FirstName,m.LastName,se.SectionID, se.MeetingDays,se.MeetingTime,se.RoomNumber, cp.StartDate, cp.EndDate, al.LocationID, al.LocationName, al.Street, al.City, al.State FROM ClassSchedule cs JOIN member m on m.memberID = cs.TeacherID JOIN Course c on c.CourseID = cs.ClassSchduleID JOIN section se on se.SectionID = cs.SectionID JOIN AcademyLocation al on al.LocationID = cs.locationID JOIN CoursePlan cp on cp.CourseID = c.courseID where StudentID = @MemberID";
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
    public void defaultCourseID()
    {


        ddCourse.Items.Clear();
        ddCourse.Items.Insert(0, new ListItem("Select a course", "0"));

        try
        {
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            sc.ConnectionString = @"Server=LOCALHOST;Database=WBL;Trusted_Connection=Yes;";

            sc.Open();
            System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
            insert.Connection = sc;
            insert.CommandText = "select distinct coursename from course where StudentID = @MemberID";
            System.Data.SqlClient.SqlDataReader reader = insert.ExecuteReader();

            while (reader.Read())
            {
                ddCourse.Items.Add(new ListItem(reader["CourseName"].ToString()));
            }
        }
        catch (Exception x)
        {

        }
    }

}