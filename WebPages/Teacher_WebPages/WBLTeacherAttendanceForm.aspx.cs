using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class WebPages_Teacher_WebPages_WBLTeacherAttendanceForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.GetData();
            defaultCourseID();
            defaultSectionID();
            //defaultDifficultyID();
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
            string sql = "select c.CourseID, c.CourseName, m.MemberID, m.FirstName,m.LastName, se.SectionID, se.MeetingDays,se.MeetingTime,se.RoomNumber FROM ClassSchedule cs JOIN member m on m.memberID = cs.StudentID JOIN Course c on c.CourseID = cs.CourseID JOIN section se on se.SectionID = cs.SectionID";
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
    /// Gets the selected records. 
    /// </summary> 
    /// <param name="sender">The sender.</param> 
    /// <param name="e">The <see cref="System.EventArgs"/>
    ///    instance containing the event data.</param> 
    protected void Enroll_Click(object sender, EventArgs e)
    {

        foreach (GridViewRow row in GridView1.Rows)
        {

            if (((CheckBox)row.FindControl("chkSelect")).Checked)
            {
                //string studentID = Session variable here
                string courseID = row.Cells[1].Text;
                string sectionID = row.Cells[6].Text;
                string teacherID = row.Cells[4].Text;
                string studentID = row.Cells[3].Text;
                string date = txtDate.Text;
                string mySQL = "";
                mySQL += "Exec UpdateAttendance " + courseID + ", " + sectionID + ", " + 4 + ", " + studentID + ", " + 1 + ", '" + date + "'";

                sendDBCommand(mySQL);
                Response.Write(mySQL);
                Response.Write("<h3>Success</h3> <p>Attedance form successfully submitted for " + date + "</p>");
            }
            else
            {
                string courseID = row.Cells[1].Text;
                string sectionID = row.Cells[6].Text;
                string teacherID = row.Cells[4].Text;
                string studentID = row.Cells[3].Text;
                string date = txtDate.Text;
                string mySQL = "";
                mySQL += "Exec UpdateAttendance " + courseID + ", " + sectionID + ", " + 4 + ", " + studentID + ", " + 0 + ", '" + date + "'";

                sendDBCommand(mySQL);
                Response.Write(mySQL);
            }

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

    protected void btnEnter_Click(object sender, EventArgs e)
    {
        string course = ddCourse.Text;
        string section = ddSection.Text;
        //string difficulty = ddDifficultyLevel.Text;


        if (course != "0")
        {
            DataTable table = new DataTable();
            // get the connection 
            using (SqlConnection conn = new SqlConnection("Server = LOCALHOST; Database = WBL; Trusted_Connection = Yes;"))
            {
                // write the sql statement to execute 
                string sql = "select c.CourseID, c.CourseName, m.MemberID, m.FirstName,m.LastName, se.SectionID, se.MeetingDays,se.MeetingTime,se.RoomNumber FROM ClassSchedule cs JOIN member m on m.memberID = cs.StudentID JOIN Course c on c.CourseID = cs.CourseID JOIN section se on se.SectionID = cs.SectionID where c.CourseName = '" + course + "'";
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
                GridView1.DataSource = table;
                GridView1.DataBind();
            }
            catch (Exception v)
            {

            }
            defaultCourseID();
        }
        if (section != "0")
        {
            DataTable table = new DataTable();
            // get the connection 
            using (SqlConnection conn = new SqlConnection("Server = LOCALHOST; Database = WBL; Trusted_Connection = Yes;"))
            {
                // write the sql statement to execute 
                string sql = "select c.CourseID, c.CourseName, m.MemberID, m.FirstName,m.LastName, se.SectionID, se.MeetingDays,se.MeetingTime,se.RoomNumber FROM ClassSchedule cs JOIN member m on m.memberID = cs.StudentID JOIN Course c on c.CourseID = cs.CourseID JOIN section se on se.SectionID = cs.SectionID where cs.SectionID = '" + section + "'";
                //  Response.Write(sql);
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
            defaultSectionID();
        }

        if (course != "0" && section != "0")
            {
                DataTable table = new DataTable();
                // get the connection 
                using (SqlConnection conn = new SqlConnection("Server = LOCALHOST; Database = WBL; Trusted_Connection = Yes;"))
                {
                    // write the sql statement to execute 
                    string sql = "select c.CourseID, c.CourseName, m.MemberID, m.FirstName,m.LastName, se.SectionID, se.MeetingDays,se.MeetingTime,se.RoomNumber FROM ClassSchedule cs JOIN member m on m.memberID = cs.StudentID JOIN Course c on c.CourseID = cs.CourseID JOIN section se on se.SectionID = cs.SectionID where c.CourseName = '" + course + "' and cs.SectionID = '" + section + "'";
                    //  Response.Write(sql);
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
                defaultCourseID();
                defaultSectionID();

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
            insert.CommandText = "select distinct coursename from course";
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
    public void defaultSectionID()
    {


        ddSection.Items.Clear();
        ddSection.Items.Insert(0, new ListItem("Select a section", "0"));

        try
        {
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            sc.ConnectionString = @"Server=LOCALHOST;Database=WBL;Trusted_Connection=Yes;";

            sc.Open();
            System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
            insert.Connection = sc;
            insert.CommandText = "select distinct sectionid from classschedule";
            System.Data.SqlClient.SqlDataReader reader = insert.ExecuteReader();

            while (reader.Read())
            {
                ddSection.Items.Add(new ListItem(reader["SectionID"].ToString()));
            }
        }
        catch (Exception x)
        {

        }
    }
    /*public void defaultDifficultyID()
    {


        ddDifficultyLevel.Items.Clear();
        ddDifficultyLevel.Items.Insert(0, new ListItem("Select a difficulty", "0"));

        try
        {
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            sc.ConnectionString = @"Server=LOCALHOST;Database=WBL;Trusted_Connection=Yes;";

            sc.Open();
            System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
            insert.Connection = sc;
            insert.CommandText = "select distinct difficulty from course";
            System.Data.SqlClient.SqlDataReader reader = insert.ExecuteReader();

            while (reader.Read())
            {
                ddDifficultyLevel.Items.Add(new ListItem(reader["Difficulty"].ToString()));
            }
        }
        catch (Exception x)
        {

        }
    }*/

    protected void btnReset_Click(object sender, EventArgs e)
    {
        GetData();
    }
}