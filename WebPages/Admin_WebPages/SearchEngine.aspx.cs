using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Configuration;

public partial class WebPages_Admin_WebPages_SearchEngine : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            setAcademicYear();
            setTermYearDD();
            ddYear.DataBind();
            ddAcademicYear.DataBind();
        }
    }

    protected void btnManageEvents_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageEvents.aspx", false);
    }

    protected void btnCategory_Click(object sender, EventArgs e)
        {
            lblSelectedCategory.Visible = false;
            ddSelectedCategory.Visible = false;
            btnSelectedCategory.Visible = false;

            // String Variables to hold values for Dynamic Labels
            string member = "Member Type: ";
            string selectItem = "Select Item: ";

            // Arrays to Hold Static Search Criteria

            // 1: holds the different member types to manipulate in the database
            string[] memberType = {"Select Type","Student","Staff","Cipher"};
            // 2: holds different academy items to manipulate 
            string[] academyItems = { "Select Area", "Courses", "Subjects", "Teachers", "Locations" };
            // 3. holds different event items 
            string[] eventItems = { "Select Item", "Edit Events", "View Attendance" };
            // 4. holds different workshop items
            string[] workshopItems = { "Select Item", "Edit Existing", "Add Workshop", "View Attendance", "Student Workshop" };
            // 5. holds different skill items to manipulate
            string[] skillItems = { "Select Item",  "Add Skill", "Edit Skill", "Student Skill" };
            //5. BuckStore items to manipulate
            string[] buckstoreItems = { "Select Item", "Add Items", "Edit Items", "Transactions", "Edit Inventory" };

            // If checking which selection was made a =nd displaying proper list 
            if (ddCategory.SelectedIndex == 0)
            {
                lblCategoryErr.Visible = true;
            }
            // Member
            else if (ddCategory.SelectedIndex == 1)
            {
                lblCategoryErr.Visible = false;
                ddSelectedCategory.DataSource = memberType;
                ddSelectedCategory.DataBind();
                lblSelectedCategory.Text = member;
                lblSelectedCategory.Visible = true;
                ddSelectedCategory.Visible = true;
                btnSelectedCategory.Visible = true;
            }
            // Academy
            else if (ddCategory.SelectedIndex == 2)
            {
                lblCategoryErr.Visible = false;
                ddSelectedCategory.DataSource = academyItems;
                ddSelectedCategory.DataBind();
                lblSelectedCategory.Text = selectItem;
                lblSelectedCategory.Visible = true;
                ddSelectedCategory.Visible = true;
                btnSelectedCategory.Visible = true;
            }
            // Events
            else if (ddCategory.SelectedIndex == 3)
            {
                lblCategoryErr.Visible = false;
                ddSelectedCategory.DataSource = eventItems;
                ddSelectedCategory.DataBind();
                lblSelectedCategory.Text = selectItem;
                lblSelectedCategory.Visible = true;
                ddSelectedCategory.Visible = true;
                btnSelectedCategory.Visible = true;
            }
            // Workshops
            else if (ddCategory.SelectedIndex == 4)
            {
                lblCategoryErr.Visible = false;
                ddSelectedCategory.DataSource = workshopItems;
                ddSelectedCategory.DataBind();
                lblSelectedCategory.Text = selectItem;
                lblSelectedCategory.Visible = true;
                ddSelectedCategory.Visible = true;
                btnSelectedCategory.Visible = true;
            }
            // Skills
            else if (ddCategory.SelectedIndex == 5)
            {
                lblCategoryErr.Visible = false;
                ddSelectedCategory.DataSource = skillItems;
                ddSelectedCategory.DataBind();
                lblSelectedCategory.Text = selectItem;
                lblSelectedCategory.Visible = true;
                ddSelectedCategory.Visible = true;
                btnSelectedCategory.Visible = true;
            }
            else //Buck Store
            {
                lblCategoryErr.Visible = false;
                ddSelectedCategory.DataSource = buckstoreItems;
                ddSelectedCategory.DataBind();
                lblSelectedCategory.Text = selectItem;
                lblSelectedCategory.Visible = true;
                ddSelectedCategory.Visible = true;
                btnSelectedCategory.Visible = true;
            }
        }

        // After selecting the Item within Categories to Search, btnSelectedCategory Clicked
        protected void btnSelectedCategory_Click(object sender, EventArgs e)
        {
            // Strings for label (member)
            string manageMember;

            // Creating all items for individual categories in Member
            string[] studentItems = { "Student Items", "Information","Schedule", "Grades", "Diet Restriction", "Bucks Account"};
            string[] staffItems = { "Staff Items","Edit Staff Info", "Classes" };
            string[] cipherItems = { "Cipher Items", "Donations", "Board Members" };

            // String for Label (academy)
            string manageAcademy;

            // Creating all items for individual categories in Academy
            string[] courseItems = { "Course Items","Add Course", "Edit Course" };
            string[] subjectItems = { "Subject Items", "Add Subject", "Edit Subject" };
            string[] teacherAcademyItems = { "Teacher Items", "Course Plan", "Scores" };
            string[] locationItems = { "Location Items", "Add Location", "Edit Location" };

            // String for Label (events)
            string manageEvents;

            // Creating all items for individual categories in events
            
            // If we are in MEMBER
            if (ddCategory.SelectedIndex == 1)
            {
                if (ddSelectedCategory.SelectedIndex == 0)
                {
                    // null selection
                    lblSelectedCategoryErr.Visible = true;
                }
                else if (ddSelectedCategory.SelectedIndex == 1)
                {
                    // Student
                    manageMember = "Manage Student: ";
                    lblSelectedCategoryErr.Visible = false;
                    ddCategoryItems.DataSource = studentItems;
                    ddCategoryItems.DataBind();
                    lblCategoryItems.Text = manageMember;
                    lblCategoryItems.Visible = true;
                    ddCategoryItems.Visible = true;
                    btnCategoryItem.Visible = true;
                }
                else if (ddSelectedCategory.SelectedIndex == 2)
                {
                    //Teacher
                    manageMember = "Manage Teacher: ";
                    lblSelectedCategoryErr.Visible = false;
                    ddCategoryItems.DataSource = staffItems;
                    ddCategoryItems.DataBind();
                    lblCategoryItems.Text = manageMember;
                    lblCategoryItems.Visible = true;
                    ddCategoryItems.Visible = true;
                    btnCategoryItem.Visible = true;
                }
                else
                {
                    // Cipher
                    manageMember = "Manage Cipher: ";
                    lblSelectedCategoryErr.Visible = false;
                    ddCategoryItems.DataSource = cipherItems;
                    ddCategoryItems.DataBind();
                    lblCategoryItems.Text = manageMember;
                    lblCategoryItems.Visible = true;
                    ddCategoryItems.Visible = true;
                    btnCategoryItem.Visible = true;
                }
            }
            // if we are in ACADEMY
            else if (ddCategory.SelectedIndex == 2)
            {
                if (ddSelectedCategory.SelectedIndex == 0)
                {
                    lblSelectedCategoryErr.Visible = true;
                }
                else if (ddSelectedCategory.SelectedIndex == 1)
                {
                    // Course
                    lblSelectedCategoryErr.Visible = false;
                    manageAcademy = "Manage Courses: ";
                    ddCategoryItems.DataSource = courseItems;
                    ddCategoryItems.DataBind();
                    lblCategoryItems.Text = manageAcademy;
                    lblCategoryItems.Visible = true;
                    ddCategoryItems.Visible = true;
                    btnCategoryItem.Visible = true;
                }
                else if (ddSelectedCategory.SelectedIndex == 2)
                {
                    // Subject
                    lblSelectedCategoryErr.Visible = false;
                    lblSelectedCategoryErr.Visible = false;
                    manageAcademy = "Manage Subjects: ";
                    ddCategoryItems.DataSource = subjectItems;
                    ddCategoryItems.DataBind();
                    lblCategoryItems.Text = manageAcademy;
                    lblCategoryItems.Visible = true;
                    ddCategoryItems.Visible = true;
                    btnCategoryItem.Visible = true;
                }
                else if (ddSelectedCategory.SelectedIndex == 3)
                {
                    // Teachers
                    lblSelectedCategoryErr.Visible = false;
                    lblSelectedCategoryErr.Visible = false;
                    manageAcademy = "Manage Teachers: ";
                    ddCategoryItems.DataSource = teacherAcademyItems;
                    ddCategoryItems.DataBind();
                    lblCategoryItems.Text = manageAcademy;
                    lblCategoryItems.Visible = true;
                    ddCategoryItems.Visible = true;
                    btnCategoryItem.Visible = true;
                }
                else if (ddSelectedCategory.SelectedIndex == 4)
                {
                    // Locations
                    lblSelectedCategoryErr.Visible = false;
                    lblSelectedCategoryErr.Visible = false;
                    manageAcademy = "Manage Locations: ";
                    ddCategoryItems.DataSource = locationItems;
                    ddCategoryItems.DataBind();
                    lblCategoryItems.Text = manageAcademy;
                    lblCategoryItems.Visible = true;
                    ddCategoryItems.Visible = true;
                    btnCategoryItem.Visible = true;
                }
            }
            // in Events
            else if (ddCategory.SelectedIndex == 3)
            {
                lblSelectedCategoryErr.Visible = false;
                lblSearchArea.Visible = false;
                txtSearchArea.Visible = false;
                btnSearchArea.Visible = false;
                btnViewAllEvents.Visible = false;

                // null
                if (ddSelectedCategory.SelectedIndex == 0) 
                {
                    lblSelectedCategoryErr.Visible = true;
                }
                // Edit Events
                else if (ddSelectedCategory.SelectedIndex == 1)
                {
                    lblSelectedCategoryErr.Visible = false;
                    lblSearchArea.Text = "Enter Event Name: ";
                    btnSearchArea.Text = "Find Events";
                    lblSearchArea.Visible = true;
                    txtSearchArea.Visible = true;
                    btnSearchArea.Visible = true;
                    btnViewAllEvents.Visible = true;
                }
                // View Event Attendance
                else
                {
                    // View Event Attendance
                    lblSelectedCategoryErr.Visible = false;
                    lblSearchArea.Text = "View By: ";
                    btnSearchArea.Text = "Next";
                    lblSearchArea.Visible = true;
                    ddAttendanceType.Visible = true;
                    btnSearchArea.Visible = true;
                }
                
            }
        }

        // Inside The category Items (some do not need to go inside b/s they are handled before this button)
    protected void btnCategoryItem_Click(object sender, EventArgs e)
    {
        dropClassOption();
        // In Member
        if (ddCategory.SelectedIndex == 1)
        {
            // If we are in Student
            if (ddSelectedCategory.SelectedIndex == 1)
            {
                // Null option selcted
                if (ddCategoryItems.SelectedIndex == 0)
                {
                    lblCategoryItemErr.Visible = true;
                }
                // Student Information
                else if (ddCategoryItems.SelectedIndex == 1)
                {
                    lblCategoryItemErr.Visible = false;
                    studentSearchArea();
                }
                // Student Schedule
                else if (ddCategoryItems.SelectedIndex == 2)
                {
                    lblCategoryItemErr.Visible = false;
                    studentSearchArea();
                }
                // Student Grades
                else if (ddCategoryItems.SelectedIndex == 3)
                {
                    lblCategoryItemErr.Visible = false;
                    studentSearchArea();
                }
                // Student Diet Restrictions
                else if (ddCategoryItems.SelectedIndex == 4)
                {
                    lblCategoryItemErr.Visible = false;
                    studentSearchArea();
                }
                // Student Bucks Account
                else
                {
                    lblCategoryItemErr.Visible = false;
                    studentSearchArea();
                }
            }
            // In the staff area
            else if (ddSelectedCategory.SelectedIndex == 2)
            {
                if (ddCategoryItems.SelectedIndex == 0)
                {
                    lblCategoryItemErr.Visible = true;
                }
                else if (ddCategoryItems.SelectedIndex == 2)
                {
                    string[] teacherClassOptons = { "Drop a Class", "Add to Class" };
                    btnCategoryOptionSelect.Text = "Edit";
                    ddCategoryOptions.DataSource = teacherClassOptons;
                    ddCategoryOptions.DataBind();
                    lblCategoryItemErr.Visible = false;
                    addCategoryOptions();
                }
                else
                {
                    btnSearchArea.Text = "View";
                    lblSearchArea.Text = "Enter Staff Email: ";
                    txtSearchArea.Visible = true;
                    lblSearchArea.Visible = true;
                    btnSearchArea.Visible = true;
                }
            }
        }
        // In Academy have to do a null
        else if (ddCategory.SelectedIndex == 2)
        {
            // Courses
            if (ddSelectedCategory.SelectedIndex == 1)
            {
                ddCategoryOptions.DataSource = sqlSubject;
                btnCategoryOptionSelect.Text = "Next";
                ddCategoryOptions.DataTextField = "SubjectName";
                ddCategoryOptions.DataValueField = "SubjectName";
                ddCategoryOptions.DataBind();
                addCategoryOptions();

            }
            // Subjects
            else if (ddSelectedCategory.SelectedIndex == 2)
            {
                // No Selection
                if (ddCategoryItems.SelectedIndex == 0)
                {
                    lblCategoryItemErr.Visible = true;
                }
                // Add Subject
                else if (ddCategoryItems.SelectedIndex == 1)
                {
                    addSubjectArea();
                }
                // Edit/Delete Subject
                else
                {
                    ddCategoryOptions.DataSource = sqlSubject;
                    ddCategoryOptions.DataTextField = "SubjectName";
                    ddCategoryOptions.DataValueField = "SubjectName";
                    ddCategoryOptions.DataBind();
                    btnCategoryOptionSelect.Text = "Edit/Delete";
                    addCategoryOptions();
                }
                }
                // Teachers
                else if (ddSelectedCategory.SelectedIndex == 3)
                {

                }

            }
        // Events
        else if (ddCategory.SelectedIndex == 3)
        {

        }
    }
        protected void ddCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            dropAllMessages();
            dropCategoryOptions();
            dropSelectedCategory();
            dropSearchArea();
            ddCategoryItems.Visible = false;
            lblCategoryItems.Visible = false;
            ddAttendanceType.Visible = false;
            lnkSelectAccountView.Visible = false;
            ddBuckAccount.Visible = false;
            btnSelectStudent.Visible = false;
            btnViewAllEvents.Visible = false;
            btnSearchArea.Visible = false;
            lstStudentSearch.Visible = false;
            ddYear.Visible = false;
            chkTerm.Visible = false;
            btnSelectSemester.Visible = false;
            dropAllViews();
            lblSemester.Visible = false;
            dropAddEditCourse();
            // Setting Teacher add class area invisible
            dropTeacherToClassArea();


    }
        protected void ddSelectedCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            dropAllMessages();
            ddAttendanceType.Visible = false;
            txtSearchArea.Visible = false;
            txtSearchArea2.Visible = false;
            lnkSelectAccountView.Visible = false;
            ddBuckAccount.Visible = false;
            lblSearchArea.Visible = false;
            lblSearchArea.Visible = false;
            lblCategoryItems.Visible = false;
            lblStudentSearch.Visible = false;
            ddCategoryItems.Visible = false;
            btnCategoryItem.Visible = false;
            btnSearchArea.Visible = false;
            btnViewAllEvents.Visible = false;
            lstStudentSearch.Visible = false;
            lblSelectSemesterYear.Visible = false;
            ddYear.Visible = false;
            btnSelectStudent.Visible = false;
            chkTerm.Visible = false;
            btnSelectSemester.Visible = false;
            lblSemester.Visible = false;
            dropAllViews();
            dropAddEditCourse();
            // Setting Teacher add class area invisible
            dropTeacherToClassArea();


    }
        protected void ddCategoryItems_SelectedIndexChanged(object sender, EventArgs e)
        {
            // If we are updating staff infomration we're gonna drop Search Area
            if (ddCategory.SelectedIndex == 1 && ddSelectedCategory.SelectedIndex == 2)
            {
                dropSearchArea();
            }

            dropAllMessages();
            ddAttendanceType.Visible = false;
            lnkSelectAccountView.Visible = false;
            ddBuckAccount.Visible = false;
            dvEvents.Visible = false;
            lblStudentSearch.Visible = false;
            lblSemester.Visible = false;
            btnViewAllEvents.Visible = false;
            lstStudentSearch.Visible = false;
            btnSelectStudent.Visible = false;
            ddYear.Visible = false;
            lblSelectSemesterYear.Visible = false;
            chkTerm.Visible = false;
            btnSelectSemester.Visible = false;
            dropAllViews();
            dropAddEditCourse();
            // Setting Teacher add class area invisible
            dropTeacherToClassArea();

    }
        protected void ddCategoryOptions_SelectedIndexChanged(object sender, EventArgs e)
        {
     
            dropAllMessages();
            dropAllViews();
            dropTeacherToClassArea();
        }
        
        // Go to Reports Page
        protected void btnReports_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReportPage.aspx", false);
        }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        dropAllViews();
        dropAllMessages();
        lnkSelectAccountView.Visible = false;
        ddBuckAccount.Visible = false;
        // In Member
        if (ddCategory.SelectedIndex == 1)
        {
            // In Student
            if (ddSelectedCategory.SelectedIndex == 1)
            {
                lstStudentSearch.DataSourceID = "sqlSearchStudent";
                // In Information
                if (ddCategoryItems.SelectedIndex == 1)
                {

                    lblStudentSearch.Visible = true;
                    lstStudentSearch.Visible = true;
                    btnSelectStudent.Visible = true;
                }
                // In Student Schedule
                else if (ddCategoryItems.SelectedIndex == 2)
                {
                    lblStudentSearch.Visible = true;
                    lstStudentSearch.Visible = true;
                    btnSelectStudent.Visible = true;
                }
                // In Student Grades
                else if (ddCategoryItems.SelectedIndex == 3)
                {
                    btnSelectStudent.Visible = true;
                    lblStudentSearch.Visible = true;
                    lstStudentSearch.Visible = true;
                }
                // Student Diet Restrictions
                else if (ddCategoryItems.SelectedIndex == 4)
                {
                    btnSelectStudent.Visible = true;
                    lblStudentSearch.Visible = true;
                    lstStudentSearch.Visible = true;
                }
                else
                {
                    btnSelectStudent.Visible = true;
                    lblStudentSearch.Visible = true;
                    lstStudentSearch.Visible = true;
                }
            }
            // Staff
            else if (ddSelectedCategory.SelectedIndex == 2)
            {
                string email = txtSearchArea.Text;
                if (IsEmailValid(email) == true)
                {
                    // Null Selection
                    if (ddCategoryItems.SelectedIndex == 0)
                    {
                        lblCategoryItemErr.Visible = true;
                    }
                    // Edit Info for Teacher
                    else if (ddCategoryItems.SelectedIndex == 1)
                    {
                        gvTeacherSchedule.Visible = false;
                        lblCategoryOptionErr.Visible = false;
                        dvTeacherInfo.Visible = true;
                    }
                    // Remove from Scheduled Class
                    else if (ddCategoryItems.SelectedIndex == 2)
                    {
                        lstStudentSearch.DataSourceID = "sqlListTeacherSchedule";
                        lstStudentSearch.DataBind();
                        lstStudentSearch.Visible = true;
                        btnSelectStudent.Visible = true;
                    }
                }
                // Email Address Invalid
                else
                {
                    lblCategoryOption.Visible = false;
                    btnCategoryOptionSelect.Visible = false;
                    dvTeacherInfo.Visible = false;
                    lblSearchAreaErr.Text = "Please Enter a Valid Staff Email Address.";
                    lblSearchAreaErr.Visible = true;
                }

            }
        }
        // Academy
        else if (ddCategory.SelectedIndex == 2)
        {
            // Courses 
            if (ddSelectedCategory.SelectedIndex == 1) 
            {
                // Only reason for this button click in Courses is to ADD COURSE
                    string d = checkDifficulty();
                    string subject = ddCategoryOptions.SelectedValue.ToString();
                    try
                    {
                        if (txtSearchArea.Text != null && d != "false")
                        {
                            int id = Int32.Parse(getIdForTable("SubjectID", "Subject", "SubjectName", ddCategoryOptions.SelectedValue.ToString()));
                            string query = "insert into Course (SubjectID,CourseName,Difficulty) VALUES (@SubjectID,@CourseName,@Difficulty)";
                            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCSS"].ToString());
                            con.Open();
                            SqlCommand com = new SqlCommand(query, con);
                            com.Parameters.AddWithValue("@SubjectID", id);
                            com.Parameters.AddWithValue("@CourseName", txtSearchArea.Text);
                            com.Parameters.AddWithValue("@Difficulty", d);
                            com.ExecuteNonQuery();
                            con.Close();
                            lblSearchAreaErr.Text = "Record entered successfully";
                            lblSearchAreaErr.Visible = true;
                        }

                    }
                    catch (SqlException ex)
                    {
                        throw ex;
                    }
            }
            // Subjects
            else if (ddSelectedCategory.SelectedIndex == 2)
            {
                // Add Subject
                if (ddCategoryItems.SelectedIndex == 1)
                {
                    if (txtSearchArea.Text != null)
                    {
                        string sqlQuery = "insert into subject values(@SubjectName)";
                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCSS"].ToString());
                        SqlCommand com = new SqlCommand(sqlQuery, con);
                        con.Open();
                        com.Parameters.AddWithValue("@SubjectName", txtSearchArea.Text);
                        com.ExecuteNonQuery();
                        lblSearchAreaErr.Text = "Record created sucessfully!";
                        lblSearchAreaErr.Visible = true;
                    }
                    else
                    {
                        lblSearchAreaErr.Text = "Subject Name is required.";
                        lblSearchAreaErr.Visible = true;
                    }
                }
            }
            // Teachers
            else if (ddSelectedCategory.SelectedIndex == 3)
            {

            }
            // Locations
            else
            {

            }
            
        }
        // Events
        else if (ddCategory.SelectedIndex == 3)
        {
            // Null Event Selection
            if (ddSelectedCategory.SelectedIndex == 1)
                // Editing Events
                gvAllEvents.Visible = false;
                dvEvents.DataBind();
                dvEvents.Visible = true;
        }
        


    }
        // After the student has been searched for and selected from list 
        protected void btnSelectStudent_Click(object sender, EventArgs e)
        {
        // Member
            if (ddCategory.SelectedIndex == 1)
        {
            //Student
            if (ddSelectedCategory.SelectedIndex == 1)
            {
                if (ddCategoryItems.SelectedIndex == 1)
                {
                    setStudentInfoDV();
                }
                // In Class Schedule
                else if (ddCategoryItems.SelectedIndex == 2)
                {
                    addSemesterSelection();
                }
                // In Grades
                else if (ddCategoryItems.SelectedIndex == 3)
                {
                    addSemesterSelection();
                }
                // In Student Diet Restriction
                else if (ddCategoryItems.SelectedIndex == 4)
                {
                    // Not going to be a grid view, maybe give them a list to add/edit/delete
                    gvDietRestriction.Visible = true;
                }
                // In Student Buck Account
                else
                {
                    ddBuckAccount.DataBind();
                    ddBuckAccount.Visible = true;
                    lnkSelectAccountView.Visible = true;
                }

                
                gvStudentAccount.Visible = false;
                gvStudentPurchases.Visible = false;
            }
            // In Staff
            else if (ddSelectedCategory.SelectedIndex == 2)
            {
                // Edit Teacher Class
                if (ddCategoryItems.SelectedIndex == 2)
                {
                    if (ddCategoryOptions.SelectedIndex == 0)
                    {
                        int classScheduleID = Int32.Parse(lstStudentSearch.SelectedValue.Substring(0, lstStudentSearch.SelectedValue.IndexOf(":")));
                        string sql = "update ClassSchedule set TeacherID = null where " +
                                     "ClassScheduleID = @ClassScheduleID";
                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCSS"].ToString());
                        SqlCommand com = new SqlCommand(sql, con);
                        com.Parameters.AddWithValue("@ClassScheduleID", classScheduleID);
                        try
                        {
                            con.Open();
                            com.ExecuteNonQuery();
                            lblSearchAreaErr.Text = "Removed from course Successfully";
                            lblSearchAreaErr.Visible = true;
                        }
                        catch (SqlException ex)
                        {
                            throw ex;
                        }
                        finally
                        {
                            con.Close();
                        }
                    }

                }
            }
        }
            
                
            
       }   
        protected void lstStudentSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvStudentAccount.Visible = false;
            gvStudentPurchases.Visible = false;
        }
        protected void btnEvents_Click(object sender, EventArgs e)
        {
            dvEvents.Visible = false;
            gvAllEvents.DataBind();
            gvAllEvents.Visible = true;
        }
        public bool IsEmailValid(string emailaddress)
        {
            // Check the format of an Email
            bool valid = false;
            try
            {
                MailAddress m = new MailAddress(emailaddress);
                valid = true;
            }
            catch (FormatException)
            {
                valid = false;
            }

            // Check the email accross the databse to make sure it matches a teachers email (data integrity)
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCSS"].ToString());
            SqlCommand com = new SqlCommand("select Email from Member where MemberType = 'Teacher'", con);
            con.Open();
            SqlDataReader reader = com.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    string dbEmail = reader.GetString(0);
                    if (emailaddress == dbEmail)
                    {
                        valid = true;
                        break;
                    }
                    else
                    {
                        valid = false;
                    }
                }
            }
            con.Close();
            return valid;
        }
    protected int getSelectedSectionID()
    {
        int id;
        string selection = rdoSelectSection.SelectedItem.Text;
        String holdID = selection.Substring(0, selection.IndexOf(':'));
        id = Int32.Parse(holdID);
        return id;
    }
        protected int getSelectedListboxID()
        {
            int id;
            string selection = lstStudentSearch.SelectedItem.Text;
            String holdID = selection.Substring(0, selection.IndexOf(':'));
            id = Int32.Parse(holdID);
            return id;
        }
        protected void setStudentInfoDV()
        {
            int studentID = getSelectedListboxID();
            Session["MemberID"] = studentID;
            dvSelectStudent.Visible = true;
        }
        protected void setStudentScheduleGV()
        {
            int studentID = getSelectedListboxID();
            Session["MemberID"] = studentID;
            gvStudentSchedule.Visible = true;
        }
        protected void setStudentDietGV()
        {
            int studentID = getSelectedListboxID();
            Session["MemberID"] = studentID;
            gvDietRestriction.Visible = true;
        }
        protected void studentSearchArea()
        {
            lblSearchArea.Text = "Enter Students First and Last Name: ";
            btnSearchArea.Text = "Search";
            lblSearchArea.Visible = true;
            txtSearchArea.Visible = true;
            txtSearchArea2.Visible = true;
            btnSearchArea.Visible = true;
        }
        protected void setTermYearDD()
        {
            int currentYear = DateTime.Now.Year;
            int previous5Years = currentYear - 5;
            for (int i = previous5Years; i <= currentYear; i++)
            {
                ddYear.Items.Add(i.ToString());
            }
        }
        protected void setAcademicYear()
        {
            int currentYear = DateTime.Now.Year;
            int future2Years = currentYear + 2;
            for (int i = future2Years; i >= currentYear; i--)
            {
                ddAcademicYear.Items.Add(i.ToString());
            }
        }

    // Clicking to view student grades and schedule in a specific term
    protected void btnSelectSemester_Click(object sender, EventArgs e)
    {
        // Finding if both winter and spring were selected
        bool spring = chkTermSpring();
        bool winter = chkTermWinter();

        // Setting Variables needed to perform Search
        int studentID = getSelectedListboxID();
        string year = ddYear.SelectedItem.Value;
        Session["MemberID"] = studentID;

        // Schedule
        if (ddCategoryItems.SelectedIndex == 2)
        {
            
            //Specific Year and Semester
            if (chkTerm.SelectedItem != null && ddYear.SelectedItem != null)
            {
                string semester = chkTerm.SelectedItem.Value;
                Session["Semester"] = semester;
                gvStudentSchedule.Visible = true;
            }
            // If we are checking for the Whole Year
            else if (chkTerm.SelectedItem == null)
            {
                gvStudentYearlySchedule.Visible = true;
            }
            else if (spring == true && winter == true)
            {
                gvStudentYearlySchedule.Visible = true;
            }
            // We got a problem
            else
            {
                lblSelectSemesterYear.Visible = true;
            }
        }
        // Grades
        else
        {
            //Specific Year and Semester
            if (chkTerm.SelectedItem != null && ddYear.SelectedItem != null)
            {
                string semester = chkTerm.SelectedItem.Value;
                Session["Semester"] = semester;
                gvStudentGrades.Visible = true;
            }
            // If we are checking for the Whole Year
            else if (chkTerm.SelectedItem == null)
            {
                gvYearlyGrades.Visible = true;
            }
            // We got a problem
            else
            {
                lblSelectSemesterYear.Visible = true;
            }
        }
    }
    // GridView Selection in Edit Courses 
    protected void gvCoursesInSubject_SelectedIndexChanged(object sender, EventArgs e)
    {
        dropAllViews();
        // Get the currently selected row using the SelectedRow property.
        GridViewRow row = gvCoursesInSubject.SelectedRow;

        string courseID = row.Cells[1].Text;
        Session["CourseID"] = courseID;
        dvEditCourses.DataBind();
        dvEditCourses.Visible = true;
    }

    // 
    protected void btnStudentCourseGrade_Click(object sender, EventArgs e)
    {

    }

    /* A drop down list will show when selecting student then buck account with:
        - Buck Account
        - Student Transaction 
       Sets the proper gridviews true
    */
    protected void lnkSelectAccountView_Click(object sender, EventArgs e)
    {
        Session["StudentID"] = getSelectedListboxID();
        if (ddBuckAccount.SelectedIndex == 0)
        {
            gvStudentPurchases.Visible = false;
            gvStudentAccount.DataBind();
            gvStudentAccount.Visible = true;
        }
        else if (ddBuckAccount.SelectedIndex == 1)
        {
            gvStudentPurchases.DataBind();
            gvStudentAccount.Visible = false;
            gvStudentPurchases.Visible = true;
        }
    }
    // Button to select what to do under Teachers and then under Courses
    protected void btnCategoryOptionSelect_Click(object sender, EventArgs e)
    {
        // Member
        if (ddCategory.SelectedIndex == 1)
        {
            // Staff
            if (ddSelectedCategory.SelectedIndex == 2)
            {
                // We are in Teacher and Then Class, Now we want to find out what is to be done
                btnSearchArea.Text = "View";
                lblSearchArea.Text = "Enter Staff Email: ";
                addPartialSearchArea();

                // Add a class
                if (ddCategoryOptions.SelectedIndex == 1)
                {
                    lblCategoryOptionErr.Visible = false;
                    addTeacherToClassArea();

                }
            }
        }
        // Academy
        else if (ddCategory.SelectedIndex == 2)
        {
            // Course
            if (ddSelectedCategory.SelectedIndex == 1)
            {
                // Add Course
                if (ddCategoryItems.SelectedIndex == 1)
                {
                    lblSearchArea.Text = "Enter a Course Name: ";
                    btnSearchArea.Text = "Add Course";
                    addNewClassArea();
                }
                // Edit Course
                else if (ddCategoryItems.SelectedIndex == 2)
                {
                    Session["CourseID"] = getIdForTable("CourseID", "Course", "CourseName", ddCategoryOptions.SelectedItem.Value); 
                    gvCoursesInSubject.DataBind();
                    gvCoursesInSubject.Visible = true;
                }
            }
            // Subject
            else if (ddCategoryItems.SelectedIndex == 2)
            {
                // Add Course
                if (ddCategoryItems.SelectedIndex == 1)
                {
                    lblSearchArea.Text = "Enter a Course Name: ";
                    btnSearchArea.Text = "Add Course";
                    addNewClassArea();
                }
                // Edit Course
                else if (ddCategoryItems.SelectedIndex == 2)
                {
                    Session["SubjectName"] = ddCategoryOptions.SelectedValue;
                    Response.Redirect("EditItems.aspx", false);
                }
            }

        }    
    }

    // Making Sure a button from rdo Group Difficulty is selected
    private string checkDifficulty()
    {
        string check = "false";
        foreach (Control c in frmSearchEngine.Controls)
        {
            if (c is RadioButton)
            {
                RadioButton rb = (RadioButton)c;
                if (rb.GroupName == "Difficulty" && rb.Checked == true)
                {
                    check = rb.Text;
                    break;
                }
            }
        }
        return check;
    }

    // Button that submits the new teacher and the respective course to the database
    protected void btnUpdateTeacherSchedule_Click(object sender, EventArgs e)
    {
        if (IsEmailValid(txtSearchArea.Text) == true)
        { 
            // Connection Variables 
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCSS"].ToString());
            string email = txtSearchArea.Text;
            string courseName = ddCourses.SelectedItem.Text;
            string section = rdoSelectSection.SelectedItem.Text;
            string location = ddLocations.SelectedItem.Text;
            string semester = rdoSemester.SelectedItem.Text;
            string year = ddAcademicYear.SelectedItem.Text;
            int teacherID = Int32.Parse(getIdForTable("MemberID", "Member", "Email", email));
            int courseID = Int32.Parse(getIdForTable("CourseID", "Course", "CourseName", courseName));
            int locationID = Int32.Parse(getIdForTable("LocationID", "AcademyLocation", "LocationName", location));
            int sectionID = getSelectedSectionID();

            con.Open();
            string insertString = "INSERT INTO ClassSchedule(CourseID, SectionID, TeacherID, LocationID, Semester, Year) "
                + "VALUES(@CourseID, @SectionID, @TeacherID, @LocationID, @Semester, @Year)";
            SqlCommand insert = new SqlCommand(insertString, con);
            insert.Parameters.AddWithValue("@CourseID", courseID);
            insert.Parameters.AddWithValue("@SectionID", sectionID);
            insert.Parameters.AddWithValue("@TeacherID", teacherID);
            insert.Parameters.AddWithValue("@LocationID", locationID);
            insert.Parameters.AddWithValue("@Semester", semester);
            insert.Parameters.AddWithValue("@Year", Int32.Parse(year));
            insert.ExecuteNonQuery();
            con.Close();
            dropAllMessages();
            dropTeacherToClassArea();
            lblSearchAreaErr.Text = "Successfully added Teacher to Class.";
            lblSearchAreaErr.Visible = true;
        }
        else
        {
            lblTeacherNotFound.Visible = true;
        }
    }

    // This method will get the ID from a table -> the Parameter must be unique to that table
    private string getIdForTable(string idColumn, string tableName, string parameterName, string parameterValue)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBXY"].ToString());
        con.Open();
        string sql = "Select " + idColumn + " from " + tableName + " where " + parameterName + "= @" + parameterName;
        SqlCommand select = new SqlCommand(sql, con);
        string email = parameterValue;
        select.Parameters.AddWithValue("@"+parameterName,parameterValue);
        SqlDataReader reader = select.ExecuteReader();

        string uniqueRow = "";

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                lblTeacherNotFound.Text = "Teacher Not Found.";
                uniqueRow = reader[0].ToString();
            }
        }
        con.Close();
        return uniqueRow;

    }
    // Find if Spring has Been Selected
    private bool chkTermSpring()
    {
        bool spring = false;
        foreach (ListItem item in chkTerm.Items)
        {
            if (item.Value == "Spring")
            {
                spring = true;
            }
            else
            {
                spring = false;
            }
        }
        return spring;
    }
    // Find if Winter has Been Selected
    private bool chkTermWinter()
    {
        bool winter = false;
        foreach (ListItem item in chkTerm.Items)
        {
            if (item.Value == "Winter")
            {
                winter = true;
            }
            else
            {
                winter = false;
            }
        }
        return winter;
    }
    // Drop search area boxes 1 and 2 along with their dynamic label
    private void dropSearchArea()
    {
        txtSearchArea.Text = null;
        txtSearchArea2.Text = null;
        lblSearchArea.Visible = false;
        txtSearchArea.Visible = false;
        txtSearchArea2.Visible = false;
        btnSearchArea.Visible = false;
        
    }
    private void addFullSearchArea()
    {
        lblSearchArea.Visible = true;
        txtSearchArea.Visible = true;
        txtSearchArea2.Visible = false;
        btnSearchArea.Visible = true;
    }
    private void addPartialSearchArea()
    {
        lblSearchArea.Visible = true;
        txtSearchArea.Visible = true;
        btnSearchArea.Visible = true;
    }
    private void addCategoryOptions()
    {
        lblCategoryOption.Visible = true;
        btnCategoryOptionSelect.Visible = true;
        ddCategoryOptions.Visible = true;
    }
    // Drop the semester selection area for student schedule and grades
    private void dropSemesterSelection()
    {
        lblSemester.Visible = false;
        chkTerm.Visible = false;
        ddYear.Visible = false;
        btnSelectSemester.Visible = false;
    }
    // Add the student semester search area for sched and grades
    private void addSemesterSelection()
    {
        chkTerm.Visible = true;
        ddYear.Visible = true;
        btnSelectSemester.Visible = true;
    }
    private void dropClassOption()
    {
        dropSearchArea();
        lblCategoryOption.Visible = false;
        btnCategoryOptionSelect.Visible = false;
        ddCategoryOptions.Visible = false;
    }
    // Drop all Messages and Error messages
    private void dropAllMessages()
    {
        lblCategoryErr.Visible = false;
        lblCategoryItemErr.Visible = false;
        lblCategoryOptionErr.Visible = false;
        lblSearchAreaErr.Visible = false;
        lblSelectedCategoryErr.Visible = false;
        lblTeacherNotFound.Visible = false;
    }
    private void dropAllViews()
    {
        gvAllEvents.Visible = false;
        gvCoursesInSubject.Visible = false;
        dvEditCourses.Visible = false;
        gvDietRestriction.Visible = false;
        gvStudentAccount.Visible = false;
        gvStudentGrades.Visible = false;
        gvStudentPurchases.Visible = false;
        gvStudentSchedule.Visible = false;
        gvStudentYearlySchedule.Visible = false;
        gvTeacherSchedule.Visible = false;
        gvYearlyGrades.Visible = false;
        dvEvents.Visible = false;
        dvSelectStudent.Visible = false;
        dvTeacherInfo.Visible = false;
        dvEditCourses.Visible = false;
    }
    // Drop the radio buttons for difficulty level
    private void dropNewClassArea()
    {
        rdoAdvanced.Visible = false;
        rdoBeginner.Visible = false;
        rdoIntermediate.Visible = false;
        lblDifficultyLevel.Visible = false;
    }
    // Add radio buttons for difficulty level
    private void addNewClassArea()
    {
        addPartialSearchArea();
        rdoAdvanced.Visible = true;
        rdoBeginner.Visible = true;
        rdoIntermediate.Visible = true;
        lblDifficultyLevel.Visible = true;
    }
    // Will drop and add the area containing all elements for adding a teacher to a course
    private void addTeacherToClassArea()
    {
        lblAcademicYear.Visible = true;
        lblLocations.Visible = true;
        lblSelectSection.Visible = true;
        lblCourses.Visible = true;
        ddAcademicYear.Visible = true;
        ddCourses.Visible = true;
        ddLocations.Visible = true;
        rdoSelectSection.Visible = true;
        rdoSemester.Visible = true;
        btnUpdateTeacherSchedule.Visible = true;
    }
    private void dropTeacherToClassArea()
    {
        lblAcademicYear.Visible = false;
        lblLocations.Visible = false;
        lblSelectSection.Visible = false;
        lblCourses.Visible = false;
        ddAcademicYear.Visible = false;
        ddCourses.Visible = false;
        ddLocations.Visible = false;
        rdoSelectSection.Visible = false;
        rdoSemester.Visible = false;
        btnUpdateTeacherSchedule.Visible = false;
    }
    protected void addSubjectArea()
    {
        lblSearchArea.Text = "Enter the Title of the Subject: ";
        btnSearchArea.Text = "Add Subject";
        txtSearchArea.Visible = true;
        btnSearchArea.Visible = true;
        lblSearchArea.Visible = true;
    }
    protected void dropSubjectArea()
    {
        lblSearchArea.Text = null;
        btnSearchArea.Text = null;
        txtSearchArea.Visible = false;
        btnSearchArea.Visible = false;
        lblSearchArea.Visible = false;
    }
    private void dropAddEditCourse()
    {
        lblDifficultyLevel.Visible = false;
        rdoAdvanced.Visible = false;
        rdoBeginner.Visible = false;
        rdoIntermediate.Visible = false;
    }
    protected void dropCategory()
    {
        lblCategory.Visible = false;
        ddCategory.Visible = false;
        btnCategory.Visible = false;
        lblCategoryErr.Visible = false;
    }
    protected void dropSelectedCategory()
    {
        lblSelectedCategory.Visible = false;
        btnSelectedCategory.Visible = false;
        ddSelectedCategory.Visible = false;
        lblSelectedCategoryErr.Visible = false;
    }
    protected void dropCategoryItems()
    {
        lblCategoryItems.Visible = false;
        btnCategoryItem.Visible = false;
        ddCategoryItems.Visible = false;
        lblCategoryItemErr.Visible = false;
    }
    protected void dropCategoryOptions()
    {
        lblCategoryOption.Visible = false;
        ddCategoryOptions.Visible = false;
        btnCategoryOptionSelect.Visible = false;
        lblCategoryOptionErr.Visible = false;
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
       server control at run time. */
    }
    }