<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPages/WBLTeacherMasterPage.master" AutoEventWireup="true" CodeFile="WBLTeacherAttendanceForm.aspx.cs" Inherits="WebPages_Teacher_WebPages_WBLTeacherAttendanceForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <body>
    <form id="form1" runat="server">
    <div>

        <table>
       <tr><td><h3>Class Attendance</h3></td></tr>
       <tr><td>Date:</td><td><asp:TextBox ID="txtDate" runat="server"></asp:TextBox></td></tr>
       <tr><td>Course: </td><td><asp:DropDownList ID="ddCourse" runat="server" DataTextField="CourseName" ></asp:DropDownList></td></tr>
       <tr><td>Section: </td><td><asp:DropDownList ID="ddSection" runat="server" DataTextField="Section" ></asp:DropDownList></td></tr>
       <tr><td>
           <asp:Button ID="btnReset" runat="server"  Text="Reset" OnClick ="btnReset_Click"/>
           <asp:Button ID="btnEnter" runat="server" Text="Enter" OnClick ="btnEnter_Click"/></td></tr> 
       
     </table>
       
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" 
  AllowPaging="true" DataKeyNames="CourseID" OnPageIndexChanging="PaginateTheData" 
  PageSize="5" PagerSettings-Mode="Numeric" 
  OnRowDataBound="ReSelectSelectedRecords" EmptyDataText="No Courses Available">
    <Columns> 
                <asp:TemplateField HeaderText="Select"> 
                    <ItemTemplate> 
                        <asp:CheckBox ID="chkSelect" runat="server" /> 
                    </ItemTemplate> 
                </asp:TemplateField> 
                 <asp:BoundField DataField="CourseID" HeaderText="CourseID" ReadOnly="True" SortExpression="CourseID" />
                  <asp:BoundField DataField="CourseName" HeaderText="Course Name" ReadOnly="True" SortExpression="CourseName" />
                  <asp:BoundField DataField="MemberID" HeaderText="StudentID" ReadOnly="True" SortExpression="MemberID" />
                  <asp:BoundField DataField="FirstName" HeaderText="Student" ReadOnly="True" SortExpression="FirstName" />
                  <asp:BoundField DataField="LastName" HeaderText="Name" ReadOnly="True" SortExpression="LastName" />
                  <asp:BoundField DataField="SectionID" HeaderText="SectionID" ReadOnly="True" SortExpression="SectionID" />
                  <asp:BoundField DataField="MeetingDays" HeaderText="Meeting Days" ReadOnly="True" SortExpression="MeetingDays" />
                  <asp:BoundField DataField="MeetingTime" HeaderText="Meeting Time" ReadOnly="True" SortExpression="MeetingTime" />
                  <asp:BoundField DataField="RoomNumber" HeaderText="Room/Location" ReadOnly="True" SortExpression="RoomNumber" />
             
            </Columns>  
        </asp:GridView> 

    <asp:Button ID="btnGetSelected" runat="server" 
   Text="Submit" OnClick="Enroll_Click" />
  
      
    </div>
    </form>
  
</body>
</asp:Content>

