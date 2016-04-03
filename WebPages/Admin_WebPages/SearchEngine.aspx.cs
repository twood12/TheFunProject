using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Admin_WebPages_SearchEngine : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
            string[] memberType = {"Select Type","Student","Teacher","Admin","Cipher","Intern","Personal Info"};
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
            string[] teacherItems = { "Teacher Items","Edit Info", "Classes" };
            string[] adminItems = { "Admin Items", "Admin Info", "Positions" };
            string[] cipherItems = { "Cipher Items", "Donations", "Board Members" };
            string[] internItems = { "Intern Items", "Intern Info", "Change Status" };

            // String for Label (academy)
            string manageAcademy;

            // Creating all items for individual categories in Academy
            string[] courseItems = { "Course Items","Add Course", "Edit Course", "Course Enrollment" };
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
                    ddCategoryItems.DataSource = teacherItems;
                    ddCategoryItems.DataBind();
                    lblCategoryItems.Text = manageMember;
                    lblCategoryItems.Visible = true;
                    ddCategoryItems.Visible = true;
                    btnCategoryItem.Visible = true;
                }
                else if (ddSelectedCategory.SelectedIndex == 3)
                {
                    // Admin
                    manageMember = "Manage Admin: ";
                    lblSelectedCategoryErr.Visible = false;
                    ddCategoryItems.DataSource = adminItems;
                    ddCategoryItems.DataBind();
                    lblCategoryItems.Text = manageMember;
                    lblCategoryItems.Visible = true;
                    ddCategoryItems.Visible = true;
                    btnCategoryItem.Visible = true;
                }
                else if (ddSelectedCategory.SelectedIndex == 4)
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
                else if (ddSelectedCategory.SelectedIndex == 6)
                {
                    // General Member Information
                }
                else
                {
                    // Intern
                    manageMember = "Manage Intern: ";
                    lblSelectedCategoryErr.Visible = false;
                    ddCategoryItems.DataSource = internItems;
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
        }
        

        protected void ddCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddAttendanceType.Visible = false;
            gvAllEvents.Visible = false;
            dvEvents.Visible = false;
            txtSearchArea.Visible = false;
            txtSearchArea2.Visible = false;
            lblSearchArea.Visible = false;
            lblSelectedCategory.Visible = false;
            lblCategoryItems.Visible = false;
            lblSelectedCategory.Visible = false;
            lblStudentSearch.Visible = false;
            ddCategoryItems.Visible = false;
            ddSelectedCategory.Visible = false;
            btnSelectedCategory.Visible = false;
            btnCategoryItem.Visible = false;
            btnViewAllEvents.Visible = false;
            btnSearchArea.Visible = false;
            lstStudentSearch.Visible = false;
            dvSelectStudent.Visible = false;
            gvStudentSchedule.Visible = false;
            gvDietRestriction.Visible = false;
            ddYear.Visible = false;
            chkTerm.Visible = false;
            btnSelectSemester.Visible = false;
        }
        protected void ddSelectedCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddAttendanceType.Visible = false;
            dvEvents.Visible = false;
            txtSearchArea.Visible = false;
            txtSearchArea2.Visible = false;
            lblSearchArea.Visible = false;
            lblSearchArea.Visible = false;
            lblCategoryItems.Visible = false;
            lblStudentSearch.Visible = false;
            gvAllEvents.Visible = false;
            gvDietRestriction.Visible = false;
            ddCategoryItems.Visible = false;
            btnCategoryItem.Visible = false;
            btnSearchArea.Visible = false;
            btnViewAllEvents.Visible = false;
            lstStudentSearch.Visible = false;
            dvSelectStudent.Visible = false;
            gvStudentSchedule.Visible = false;
            ddYear.Visible = false;
            chkTerm.Visible = false;
            btnSelectSemester.Visible = false;
        }
        protected void ddCategoryItems_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddAttendanceType.Visible = false;
            dvEvents.Visible = false;
            txtSearchArea.Visible = false;
            txtSearchArea2.Visible = false;
            lblSearchArea.Visible = false;
            lblSearchArea.Visible = false;
            lblStudentSearch.Visible = false;
            gvAllEvents.Visible = false;
            gvDietRestriction.Visible = false;
            btnSearchArea.Visible = false;
            btnViewAllEvents.Visible = false;
            lstStudentSearch.Visible = false;
            dvSelectStudent.Visible = false;
            gvStudentSchedule.Visible = false;
            ddYear.Visible = false;
            chkTerm.Visible = false;
            btnSelectSemester.Visible = false;
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // In Member
            gvStudentSchedule.Visible = false;
            dvSelectStudent.Visible = false;
            gvDietRestriction.Visible = false;

            if (ddCategory.SelectedIndex == 1)
            {
                // In Student
                if (ddSelectedCategory.SelectedIndex == 1)
                {
                    // In Information
                    if (ddCategoryItems.SelectedIndex == 1)
                    {
                        lblStudentSearch.Visible = true;
                        lstStudentSearch.Visible = true;
                    }
                    // In Student Schedule
                    else if (ddCategoryItems.SelectedIndex == 2)
                    {
                        lblStudentSearch.Visible = true;
                        lstStudentSearch.Visible = true;
                    }
                    // In Student Grades
                    else if (ddCategoryItems.SelectedIndex == 3)
                    {
                        lblStudentSearch.Visible = true;
                        lstStudentSearch.Visible = true;
                        setTermYearDD();
                    }
                    // In Student Diet Restrictions
                    else if (ddCategoryItems.SelectedIndex == 4)
                    {
                        lblStudentSearch.Visible = true;
                        lstStudentSearch.Visible = true;
                    }
                }

            }
            /*
            else if (ddSelectedCategory.SelectedIndex == 2)
            {

            }
            else if (ddCategory.SelectedIndex == 3)
            {
                if (ddSelectedCategory.SelectedIndex == 1)
                {
                    gvAllEvents.Visible = false;
                    dvEvents.Visible = true;
                }
                else
                {
                    ddAttendanceType.Visible = true;
                }
            }*/
            
            
        }
        protected void lstStudentSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddCategoryItems.SelectedIndex == 1)
            {

                setStudentInfoDV();
            }
            // In Class Schedule
            else if (ddCategoryItems.SelectedIndex == 2)
            {
                setStudentScheduleGV();
            }
            // In Grades
            else if (ddCategoryItems.SelectedIndex == 3)
            {
                ddYear.Visible = true;
                chkTerm.Visible = true;
                btnSelectSemester.Visible = true;
            }
            // In Student Diet Restriction
            else if (ddCategoryItems.SelectedIndex == 4)
            {
                // Not going to be a grid view, maybe give them a list to add/edit/delete
                gvDietRestriction.Visible = true;
            }
        }
        protected void btnEvents_Click(object sender, EventArgs e)
        {
            dvEvents.Visible = false;
            gvAllEvents.Visible = true;
        }
        protected int getSelectedListboxID()
        {
            int id;
            string selection = lstStudentSearch.SelectedItem.Text;
            String holdID = selection.Substring(0, selection.IndexOf(' '));
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

        protected void btnSelectSemester_Click(object sender, EventArgs e)
        {
            // Selecting the Students classes Based on the Semester Choice, SetStudentGradeGV
            // How do we pull grades? Course Evals?
        }
    }