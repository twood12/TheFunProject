<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPages/WBLStudentMasterPage.master" AutoEventWireup="true" CodeFile="WBLStudentProfile.aspx.cs" Inherits="NestedMasterPages_WBLStudentProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%: System.Web.Optimization.Styles.Render("~/Content/css") %>
    <style>
        #map {
            height: 350px;
            width: 350px;
            -ms-align-content: center;
            -webkit-align-content: center;
            align-content: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
   <body>
    <form runat="server" method="post" id="frmStudentProfile">

        <table>
            <tr>
                <td>
                    <h3>Student Profile</h3>
                </td>
            </tr>
        </table>
        <hr />
        <div>

            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="MemberID" DataSourceID="SqlDataSource3" ForeColor="Black">
                <Columns>
                    <asp:BoundField DataField="MemberID" HeaderText="StudentID" ReadOnly="True" SortExpression="MemberID" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" ReadOnly="True" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" ReadOnly="True" SortExpression="LastName" />
                    <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
                    <asp:BoundField DataField="MemberType" HeaderText="Member Type" ReadOnly="True" SortExpression="Member Type" />
                    <asp:BoundField DataField="GradeLevel" HeaderText="Grade Level" ReadOnly="True" SortExpression="GradeLevel" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" ReadOnly="True" SortExpression="Gender" />
                    <asp:BoundField DataField="WardOfResidenceName" HeaderText="Ward Of Residence" ReadOnly="True" SortExpression="Ward Of Residence" />
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" OldValuesParameterFormatString="original_{0}"
                SelectCommand="select m.MemberID,
                        m.FirstName,
                        m.LastName,
                        m.Email,
                        m.membertype,
                        s.Gradelevel,
                        s.Gender,
                        s.WardOfResidenceName
                        from Member m
                        LEFT JOIN
                        Student s
                        ON m.MemberID = s.StudentID where m.MemberType = 'Student' AND m.MemberID = @MemberID">
                <SelectParameters>
                    <asp:SessionParameter Name="MemberID" SessionField="MemberID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" EmptyDataText="No Rows Available" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="CourseID" DataSourceID="SqlDataSource4" ForeColor="Black">
                <Columns>
                    <asp:TemplateField HeaderText="Select">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CourseID" HeaderText="CourseID" ReadOnly="True" SortExpression="CourseID" />
                    <asp:BoundField DataField="CourseName" HeaderText="CourseName" ReadOnly="True" SortExpression="CourseName" />
                    <asp:BoundField DataField="Difficulty" HeaderText="Difficulty" ReadOnly="True" SortExpression="Difficulty" />
                    <asp:BoundField DataField="MemberID" HeaderText="Teacher ID" ReadOnly="True" SortExpression="MemberID" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" ReadOnly="True" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" ReadOnly="True" SortExpression="LastName" />
                    <asp:BoundField DataField="SectionID" HeaderText="SectionID" ReadOnly="True" SortExpression="SectionID" />
                    <asp:BoundField DataField="MeetingDays" HeaderText="Meeting Days" ReadOnly="True" SortExpression="MeetingDays" />
                    <asp:BoundField DataField="MeetingTime" HeaderText="Meeting Time" ReadOnly="True" SortExpression="MeetingTime" />
                    <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" ReadOnly="True" SortExpression="RoomNumber" />
                    <asp:BoundField DataField="ClassStartDate" HeaderText="Start Date" ReadOnly="True" SortExpression="ClassStartDate" />
                    <asp:BoundField DataField="ClassEndDate" HeaderText="End Date" ReadOnly="True" SortExpression="ClassEndDate" />
                    <asp:BoundField DataField="LocationID" HeaderText="LocationID" ReadOnly="True" SortExpression="LocationID" />
                    <asp:BoundField DataField="LocationName" HeaderText="Location Name" ReadOnly="True" SortExpression="LocationName" />
                    <asp:BoundField DataField="Street" HeaderText="Street" ReadOnly="True" SortExpression="Street" />
                    <asp:BoundField DataField="City" HeaderText="City" ReadOnly="True" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" ReadOnly="True" SortExpression="State" />

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
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" OldValuesParameterFormatString="original_{0}"
                SelectCommand="select distinct c.CourseID, c.CourseName, c.Difficulty, m.MemberID, m.FirstName,m.LastName,se.SectionID, se.MeetingDays,se.MeetingTime,se.RoomNumber, cs.ClassStartDate, cs.ClassEndDate, al.LocationID, al.LocationName, al.Street, al.City, al.State FROM ClassSchedule cs JOIN member m on m.memberID = cs.TeacherID JOIN Course c on c.CourseID = cs.CourseID JOIN section se on se.SectionID = cs.SectionID JOIN AcademyLocation al on al.LocationID = cs.locationID WHERE Cs.StudentID = @MemberID">
                <SelectParameters>
                    <asp:SessionParameter Name="MemberID" SessionField="MemberID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="GridView2" runat="server" EmptyDataText="No Rows Available" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="E_ContactName" DataSourceID="SqlDataSource1" ForeColor="Black">
                <Columns>
                    <asp:BoundField DataField="E_ContactName" HeaderText="E_ContactName" ReadOnly="True" SortExpression="E_ContactName" />
                    <asp:BoundField DataField="E_ContactLName" HeaderText="E_ContactLName" ReadOnly="True" SortExpression="E_ContactLName" />
                    <asp:BoundField DataField="E_ContactEmail" HeaderText="E_ContactEmail" ReadOnly="True" SortExpression="E_ContactEmail" />
                    <asp:BoundField DataField="E_ContactRelationship" HeaderText="E_ContactRelationship" ReadOnly="True" SortExpression="E_ContactRelationship" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" OldValuesParameterFormatString="original_{0}"
                SelectCommand="SELECT [E_ContactName], [E_ContactLName], [E_ContactEmail], [E_ContactRelationship] FROM [Student] where StudentID = @MemberID">
                <SelectParameters>
                    <asp:SessionParameter Name="MemberID" SessionField="MemberID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="GridView3" runat="server" EmptyDataText="No Rows Available" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="AccountBalance" DataSourceID="SqlDataSource5" ForeColor="Black">
                <Columns>
                    <asp:BoundField DataField="AccountBalance" HeaderText="Bucks Balance" ReadOnly="True" SortExpression="AccountBalance" />
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
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" OldValuesParameterFormatString="original_{0}"
                SelectCommand="SELECT [AccountBalance] FROM [BuckAccount] Where StudentID = @MemberID">
                <SelectParameters>
                    <asp:SessionParameter Name="MemberID" SessionField="MemberID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <%: System.Web.Optimization.Scripts.Render("~/bundles/calendar") %>
        <asp:ScriptManager ID="scriptManager" runat="server">
            <Scripts>
                <asp:ScriptReference Path="https://maps.googleapis.com/maps/api/js?key=AIzaSyAK7q44pdNrG5IN3XFw9_rR-b8n_XTI4D4&libraries=places&v=3" />
            </Scripts>
        </asp:ScriptManager>
    </form>
    <div>
        <div id="wrap">
            <div id="external-events-wrapper">
                <div id="external-events">
                    <h3>Event Legend</h3>
                    <div id="MC" class="fc-event MC">MC</div>
                    <div id="B-Boy" class="fc-event B-Boy">B-Boy</div>
                    <div id="DJ" class="fc-event DJ">DJ</div>
                    <div id="Graffiti" class="fc-event Graffiti">Graffiti</div>
                    <div id="CommunityService" class="fc-event Community-Service">Community Service</div>
                    <div id="General" class="fc-event General">General</div>
                </div>
            </div>
            <div id="calendar"></div>
        </div>

        <div id="eventInfoDialog" title="Event Info" style="display: none">
            <div id="eventTitle"></div>
            <div id="eventTopic"></div>
            <div id="eventStartDate"></div>
            <div id="eventEndDate"></div>
            <div id="eventDescription"></div>
            <div id="map"></div>
        </div>
    </div>
       </body> 
</asp:Content>