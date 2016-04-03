using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class WebPages_Student_WebPages_WBLAvailableCourses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.GetData();
            defaultCourseID();
            defaultTeacherID();
            defaultDifficultyID();
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
            string sql = "select c.CourseID, c.CourseName, c.Difficulty, m.MemberID, m.FirstName,m.LastName,se.SectionID, se.MeetingDays,se.MeetingTime,se.RoomNumber, cp.StartDate, cp.EndDate, al.LocationID, al.LocationName, al.Street, al.City, al.State FROM ClassSchedule cs JOIN member m on m.memberID = cs.TeacherID JOIN Course c on c.CourseID = cs.ClassSchduleID JOIN section se on se.SectionID = cs.SectionID JOIN AcademyLocation al on al.LocationID = cs.locationID JOIN CoursePlan cp on cp.CourseID = c.courseID";
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
                string sectionID = row.Cells[7].Text;
                string teacherID = row.Cells[4].Text;
                string locationID = row.Cells[13].Text;
                string mySQL = "";
                mySQL += "Exec EnrollClass " + courseID + ", " + sectionID + ", " + teacherID + ", " + Session["MemberID"] + ", " + locationID;

                    sendDBCommand(mySQL);
                    //Response.Write(mySQL);
                    Response.Write("<h3>Success</h3> <p>You are enrolled in the classes listed below. If you wish to change your classes please contanct a staff member</p>");
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
        string teacher = ddTeacher.Text;
        string difficulty = ddDifficultyLevel.Text;

     if(course == "0" && teacher == "0" && difficulty == "0")
        {
            GetData();
        }    
        if(course != "0")
        {
            DataTable table = new DataTable();
            // get the connection 
            using (SqlConnection conn = new SqlConnection("Server = LOCALHOST; Database = WBL; Trusted_Connection = Yes;"))
            {
                // write the sql statement to execute 
                string sql = "select c.CourseID, c.CourseName, c.Difficulty, m.MemberID, m.FirstName,m.LastName,se.SectionID, se.MeetingDays,se.MeetingTime,se.RoomNumber, cp.StartDate, cp.EndDate, al.LocationID, al.LocationName, al.Street, al.City, al.State FROM ClassSchedule cs JOIN member m on m.memberID = cs.TeacherID JOIN Course c on c.CourseID = cs.ClassSchduleID JOIN section se on se.SectionID = cs.SectionID JOIN AcademyLocation al on al.LocationID = cs.locationID JOIN CoursePlan cp on cp.CourseID = c.courseID where c.CourseName = '" + course + "'";
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
        if (teacher != "0")
        {
            DataTable table = new DataTable();
            // get the connection 
            using (SqlConnection conn = new SqlConnection("Server = LOCALHOST; Database = WBL; Trusted_Connection = Yes;"))
            {
                // write the sql statement to execute 
                string sql = "select c.CourseID, c.CourseName, c.Difficulty, m.MemberID, m.FirstName,m.LastName,se.SectionID, se.MeetingDays,se.MeetingTime,se.RoomNumber, cp.StartDate, cp.EndDate, al.LocationID, al.LocationName, al.Street, al.City, al.State FROM ClassSchedule cs JOIN member m on m.memberID = cs.TeacherID JOIN Course c on c.CourseID = cs.ClassSchduleID JOIN section se on se.SectionID = cs.SectionID JOIN AcademyLocation al on al.LocationID = cs.locationID JOIN CoursePlan cp on cp.CourseID = c.courseID where m.LastName = '" + teacher + "'";
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
            defaultTeacherID();
        }
        if (difficulty != "0")
        {
            DataTable table = new DataTable();
            // get the connection 
            using (SqlConnection conn = new SqlConnection("Server = LOCALHOST; Database = WBL; Trusted_Connection = Yes;"))
            {
                // write the sql statement to execute 
                string sql = "select c.CourseID, c.CourseName, c.Difficulty, m.MemberID, m.FirstName,m.LastName,se.SectionID, se.MeetingDays,se.MeetingTime,se.RoomNumber, cp.StartDate, cp.EndDate, al.LocationID, al.LocationName, al.Street, al.City, al.State FROM ClassSchedule cs JOIN member m on m.memberID = cs.TeacherID JOIN Course c on c.CourseID = cs.ClassSchduleID JOIN section se on se.SectionID = cs.SectionID JOIN AcademyLocation al on al.LocationID = cs.locationID JOIN CoursePlan cp on cp.CourseID = c.courseID where c.Difficulty = '" + difficulty + "'";
               // Response.Write(sql);
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
            defaultDifficultyID();
        }
        if (course != "0" && teacher != "0")
        {
            DataTable table = new DataTable();
            // get the connection 
            using (SqlConnection conn = new SqlConnection("Server = LOCALHOST; Database = WBL; Trusted_Connection = Yes;"))
            {
                // write the sql statement to execute 
                string sql = "select c.CourseID, c.CourseName, c.Difficulty, m.MemberID, m.FirstName,m.LastName,se.SectionID, se.MeetingDays,se.MeetingTime,se.RoomNumber, cp.StartDate, cp.EndDate, al.LocationID, al.LocationName, al.Street, al.City, al.State FROM ClassSchedule cs JOIN member m on m.memberID = cs.TeacherID JOIN Course c on c.CourseID = cs.ClassSchduleID JOIN section se on se.SectionID = cs.SectionID JOIN AcademyLocation al on al.LocationID = cs.locationID JOIN CoursePlan cp on cp.CourseID = c.courseID where c.CourseName = '" + course + "' and m.LastName = '" + teacher + "'";
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
            defaultTeacherID();
        }
        if (course != "0" && difficulty != "0")
        {
                DataTable table = new DataTable();
                // get the connection 
                using (SqlConnection conn = new SqlConnection("Server = LOCALHOST; Database = WBL; Trusted_Connection = Yes;"))
                {
                    // write the sql statement to execute 
                    string sql = "select c.CourseID, c.CourseName, c.Difficulty, m.MemberID, m.FirstName,m.LastName,se.SectionID, se.MeetingDays,se.MeetingTime,se.RoomNumber, cp.StartDate, cp.EndDate, al.LocationID, al.LocationName, al.Street, al.City, al.State FROM ClassSchedule cs JOIN member m on m.memberID = cs.TeacherID JOIN Course c on c.CourseID = cs.ClassSchduleID JOIN section se on se.SectionID = cs.SectionID JOIN AcademyLocation al on al.LocationID = cs.locationID JOIN CoursePlan cp on cp.CourseID = c.courseID where c.CourseName = '" + course + "' and c.Difficulty = '" + difficulty + "'";
                   // Response.Write(sql);
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
            defaultDifficultyID();
            }
        if (teacher != "0" && difficulty != "0")
        {
            DataTable table = new DataTable();
            // get the connection 
            using (SqlConnection conn = new SqlConnection("Server = LOCALHOST; Database = WBL; Trusted_Connection = Yes;"))
            {
                // write the sql statement to execute 
                string sql = "select c.CourseID, c.CourseName, c.Difficulty, m.MemberID, m.FirstName,m.LastName,se.SectionID, se.MeetingDays,se.MeetingTime,se.RoomNumber, cp.StartDate, cp.EndDate, al.LocationID, al.LocationName, al.Street, al.City, al.State FROM ClassSchedule cs JOIN member m on m.memberID = cs.TeacherID JOIN Course c on c.CourseID = cs.ClassSchduleID JOIN section se on se.SectionID = cs.SectionID JOIN AcademyLocation al on al.LocationID = cs.locationID JOIN CoursePlan cp on cp.CourseID = c.courseID where m.LastName = '" + teacher + "' and c.Difficulty = '" + difficulty + "'";
             //   Response.Write(sql);
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
        defaultTeacherID();
        defaultDifficultyID();
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
    public void defaultTeacherID()
    {
        

        ddTeacher.Items.Clear();
        ddTeacher.Items.Insert(0, new ListItem("Select a teacher", "0"));

        try
        {
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            sc.ConnectionString = @"Server=LOCALHOST;Database=WBL;Trusted_Connection=Yes;";

            sc.Open();
            System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
            insert.Connection = sc;
            insert.CommandText = "select distinct LastName as Teacher from member where membertype = 'Teacher'";
            System.Data.SqlClient.SqlDataReader reader = insert.ExecuteReader();

            while (reader.Read())
            {
                ddTeacher.Items.Add(new ListItem(reader["Teacher"].ToString()));
            }
        }
        catch (Exception x)
        {

        }
    }
    public void defaultDifficultyID()
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
    }

    protected void Reset_Click(object sender, EventArgs e)
    {
        GetData();
    }
}