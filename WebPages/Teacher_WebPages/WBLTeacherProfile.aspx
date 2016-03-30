<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPages/WBLTeacherMasterPage.master" AutoEventWireup="true" CodeFile="WBLTeacherProfile.aspx.cs" Inherits="NestedMasterPages_WBLTeacherProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <body>
        <form runat="server" method="post" id="form1">

        <table>
            <tr>
                <td><h3>Teacher Profile</h3></td>
            </tr>
            <tr>
                <td>First Name: </td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Last Name: </td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnAttendanceForm" runat="server" Text="Attendance Form" OnClick="btnAttendanceForm_Click" />

                </td>
            </tr>
        </table>
        <hr />
        <div>

             <asp:GridView ID="gvTeacherInfo" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="MemberID" DataSourceID="sqlTeacherInfo" ForeColor="Black">
              <Columns>
                  <asp:BoundField DataField="MemberID" HeaderText="TeacherID" ReadOnly="True" SortExpression="TeacherID" />
                  <asp:BoundField DataField="FirstName" HeaderText="First Name" ReadOnly="True" SortExpression="FirstName" />
                  <asp:BoundField DataField="LastName" HeaderText="Last Name" ReadOnly="True" SortExpression="LastName" />
                  <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
                  <asp:BoundField DataField="MemberType" HeaderText="Member Type" ReadOnly="True" SortExpression="Member Type" />
              </Columns>
              <FooterStyle BackColor="#CCCCCC" />
              <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
              <RowStyle BackColor="White" />
              <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#808080" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#383838" />
          </asp:GridView>
          <asp:SqlDataSource ID="sqlTeacherInfo" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" OldValuesParameterFormatString="original_{0}" 
              SelectCommand="SELECT 
                            m.MemberID,
                            m.FirstName,
                            m.LastName,
                            m.Email,
                            m.MemberType
                            FROM member m
                            JOIN Staff s
                            ON m.memberID = s.staffID">
          </asp:SqlDataSource>

             <asp:GridView ID="gvClassSchedule" runat="server" EmptyDataText="No Rows Available" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="TeacherID" ForeColor="Black">
              <Columns>
                  <asp:TemplateField HeaderText="Select"> 
                    <ItemTemplate> 
                        <asp:CheckBox ID="chkSelect" runat="server" /> 
                    </ItemTemplate> 
                  </asp:TemplateField> 
                  <asp:BoundField DataField="TeacherID" HeaderText="TeacherID" ReadOnly="True" SortExpression="TeacherID" />
                  <asp:BoundField DataField="FirstName" HeaderText="Teacher" ReadOnly="True" SortExpression="FirstName" />
                  <asp:BoundField DataField="LastName" HeaderText="Name" ReadOnly="True" SortExpression="LastName" />
                  <asp:BoundField DataField="CourseID" HeaderText="CourseID" ReadOnly="True" SortExpression="CourseID" />
                  <asp:BoundField DataField="CourseName" HeaderText="CourseName" ReadOnly="True" SortExpression="CourseName" />
                  <asp:BoundField DataField="SectionID" HeaderText="SectionID" ReadOnly="True" SortExpression="SectionID" />
                  <asp:BoundField DataField="MeetingDays" HeaderText="Meeting Days" ReadOnly="True" SortExpression="MeetingDays" />
                  <asp:BoundField DataField="MeetingTime" HeaderText="MeetingTime" ReadOnly="True" SortExpression="MeetingTime" />
                  <asp:BoundField DataField="RoomNumber" HeaderText="Room No." ReadOnly="True" SortExpression="RoomNumber" />
                  
              </Columns>
              <FooterStyle BackColor="#CCCCCC" />
              <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
              <RowStyle BackColor="White" />
              <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#808080" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#383838" />
          </asp:GridView>
        

        </div>
      </form>
        
    </body>
    <asp:HyperLink ID="lnkTeacherManageCourses" runat="server" 
                 NavigateUrl="~/WebPages/Teacher_WebPages/WBLTeacherManageCourse.aspx" 
                 Text="Manage My Courses" />
</asp:Content>

