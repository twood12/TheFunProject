using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class WebPages_Teacher_WebPages_WBLTeacherAttendanceReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.GetData();
            defaultCourseID();
            defaultStudentID();
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
        //this.GetData();
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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {

            if (((CheckBox)row.FindControl("chkSelect")).Checked)
            {
                //string studentID = Session variable here
                string courseID = row.Cells[1].Text;
                string studentID = row.Cells[3].Text;

                GetTotalClasses(courseID, studentID);
                GetClassesAttended(courseID, studentID);
                Percentage();
            }
        }

            if (ddCourse.SelectedValue != "0" && ddStudent.SelectedValue != "0")
             {
            string courseSelected = ddCourse.SelectedValue;
            int idPositioncourse = ddCourse.SelectedValue.IndexOf('-');
            string course = ddCourse.SelectedValue.Substring(0, idPositioncourse);

            string studentcourseSelected = ddStudent.SelectedValue;
            int studentidPositioncourse = ddStudent.SelectedValue.IndexOf('-');
            string student = ddStudent.SelectedValue.Substring(0, studentidPositioncourse);

                DataTable table = new DataTable();
                // get the connection 
                using (SqlConnection conn = new SqlConnection("Server = LOCALHOST; Database = WBL; Trusted_Connection = Yes;"))
                {
                    // write the sql statement to execute 
                    string sql = "select c.CourseID, c.CourseName, m.MemberID, m.FirstName,m.LastName, se.SectionID, se.MeetingDays,se.MeetingTime,se.RoomNumber FROM ClassSchedule cs JOIN member m on m.memberID = cs.StudentID JOIN Course c on c.CourseID = cs.CourseID JOIN section se on se.SectionID = cs.SectionID where c.CourseID = " + course + " and m.MemberID = " + student + "";
                    //  Response.Write(sql);
                    //  Response.Write(sql);
                    // instantiate the command object to fire 
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        // get the adapter object and attach the command object to it 
                        using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                        {
                            // fire Fill method to fetch the data and fill into DataTable 
                            try
                            {
                                ad.Fill(table);
                            }
                            catch (Exception t)
                            {

                            }
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
            GetTotalClasses(course, student);
            GetClassesAttended(course, student);
            Percentage();
        }
           
            defaultCourseID();
            defaultStudentID();

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
            insert.CommandText = "select distinct convert(varchar(10), c.courseID) + ' - ' + CourseName as CourseName from course c JOIN ClassAttendance ca on c.courseID = ca.CourseID";
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
    public void defaultStudentID()
    {


        ddStudent.Items.Clear();
        ddStudent.Items.Insert(0, new ListItem("Select a student", "0"));

        try
        {
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            sc.ConnectionString = @"Server=LOCALHOST;Database=WBL;Trusted_Connection=Yes;";

            sc.Open();
            System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
            insert.Connection = sc;
            insert.CommandText = "select distinct convert(varchar(10), m.MemberID) + ' - ' + m.FirstName + ' ' + m.LastName as Student from Member m JOIN Student s ON m.MemberID = S.StudentID JOIN ClassAttendance ca on s.StudentID = ca.StudentID";
            System.Data.SqlClient.SqlDataReader reader = insert.ExecuteReader();

            while (reader.Read())
            {
                ddStudent.Items.Add(new ListItem(reader["Student"].ToString()));
            }
            
        }
        catch (Exception x)
        {

        }
    }
    public void GetTotalClasses(string course, string student)
    {

        DataTable table = new DataTable();
        // get the connection 
        using (SqlConnection conn = new SqlConnection("Server = LOCALHOST; Database = WBL; Trusted_Connection = Yes;"))
        {
            // write the sql statement to execute 
            string sql = "select count(ClassAttendanceID) as TotalClasses from classattendance where studentid = " + student + " and courseid = " + course;
           // Response.Write(sql);
            // instantiate the command object to fire 
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                // get the adapter object and attach the command object to it 
                using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                {
                    // fire Fill method to fetch the data and fill into DataTable 

                    try
                    {
                        ad.Fill(table);
                    }
                    catch(Exception x)
                    {

                    }
                }
            }
        }
        try
        {
            GridView2.DataSource = table;
            GridView2.DataBind();
        }
        catch (Exception v)
        {

        }
    }
    
    public void GetClassesAttended(string course, string student)
    {
        DataTable table = new DataTable();
        // get the connection 
        using (SqlConnection conn = new SqlConnection("Server = LOCALHOST; Database = WBL; Trusted_Connection = Yes;"))
        {
            // write the sql statement to execute 
            string sql = "select count(ClassAttendanceID) as ClassesAttended from classattendance where studentid = " + student + "and CourseID = " + course + " and Attended = 1";
            //  Response.Write(sql);
            // instantiate the command object to fire 
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                // get the adapter object and attach the command object to it 
                using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                {
                    // fire Fill method to fetch the data and fill into DataTable 
                    try { ad.Fill(table); }
                    catch(Exception p) {}
                }
            }
        }
        try
        {
            GridView3.DataSource = table;
            GridView3.DataBind();
        }
        catch (Exception v)
        {

        }

    }
    protected void Percentage()
    {

        decimal TotalClasses = 0;
        decimal ClassesAttended = 0;

        Label1.Visible = true;

        foreach (GridViewRow row in GridView2.Rows)
        {
            string strTotalClasses = row.Cells[0].Text;
            TotalClasses = Convert.ToInt32(strTotalClasses);
            
        }
        foreach (GridViewRow row in GridView3.Rows)
        {
            string strClassesAttended = row.Cells[0].Text;
            ClassesAttended = Convert.ToInt32(strClassesAttended);
        }
        if (TotalClasses == 0)
        {
            Response.Write("Student is not in the course you selected");
        }
        else
        {
            decimal percent = ClassesAttended / TotalClasses;
            lblPercentage.Text = percent.ToString("0.00") + "%";
        }
        

    }


    protected void btnReset_Click(object sender, EventArgs e)
    {
        GetData();
        GridView2.Visible = false;
        GridView3.Visible = false;
        Label1.Visible = false;
        lblPercentage.Visible = false;
    }





    protected void ddStudent_Change(object sender, EventArgs e)
    {
        string selectedValue = ddStudent.SelectedValue;
        int idPosition = ddStudent.SelectedValue.IndexOf('-');
        string student = ddStudent.SelectedValue.Substring(0, idPosition);

        DataTable table = new DataTable();
        // get the connection 
        using (SqlConnection conn = new SqlConnection("Server = LOCALHOST; Database = WBL; Trusted_Connection = Yes;"))
        {
            // write the sql statement to execute 
            string sql = "select c.CourseID, c.CourseName, m.MemberID, m.FirstName,m.LastName, se.SectionID, se.MeetingDays,se.MeetingTime,se.RoomNumber FROM ClassSchedule cs JOIN member m on m.memberID = cs.StudentID JOIN Course c on c.CourseID = cs.CourseID JOIN section se on se.SectionID = cs.SectionID where m.MemberID = " + student + "";
            //  Response.Write(sql);
            //  Response.Write(sql);
            // instantiate the command object to fire 
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                // get the adapter object and attach the command object to it 
                using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                {
                    // fire Fill method to fetch the data and fill into DataTable 
                    try
                    {
                        ad.Fill(table);
                    }
                    catch (Exception t)
                    {

                    }
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
}