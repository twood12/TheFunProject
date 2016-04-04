<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchEngine.aspx.cs" Inherits="WebPages_Admin_WebPages_SearchEngine" MasterPageFile="~/NestedMasterPages/WBLAdminMasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<head>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 30px;
        }
        .auto-style2 {
            height: 29px;
        }
        .auto-style3 {
            height: 34px;
            width: 404px;
        }
        .auto-style4 {
            width: 404px;
        }
    </style>
</head>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<body>
    <form id="frmSearchEngine" runat="server">
        <table>
            <tr>
                <td>
                    <asp:Label 
                        ID="lblTitle" 
                        runat="server" 
                        Text="WBL Search Engine">
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <hr />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label 
                        ID="lblCategory" 
                        runat="server" 
                        Text="Select Category: ">
                    </asp:Label>
                </td>
                <td>
                    <asp:DropDownList 
                        ID="ddCategory" 
                        runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddCategory_SelectedIndexChanged">
                        <asp:ListItem Selected="True">Select Category</asp:ListItem>
                        <asp:ListItem>Members</asp:ListItem>
                        <asp:ListItem>Academy</asp:ListItem>
                        <asp:ListItem>Events</asp:ListItem>
                        <asp:ListItem>Workshops</asp:ListItem>
                        <asp:ListItem>Skills</asp:ListItem>
                        <asp:ListItem>Buck Store</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="btnCategory" runat="server" Text=" GO " OnClick="btnCategory_Click" />
                </td>
                <td>
                    <strong>
                        <asp:Label 
                        ID="lblCategoryErr" 
                        runat="server" 
                        Text="Please select a Category." 
                        Visible="false"
                        Color="red">
                    </asp:Label>
                    </strong>
                </td>
                <td>
                    <asp:Button 
                        ID="btnReports" 
                        runat="server" 
                        Text="Go to Reports" OnClick="btnReports_Click" />
                </td>
            </tr>
           <tr>
              <td>
                  <asp:Label ID="lblSelectedCategory" runat="server" visbile="false"></asp:Label>
              </td>
               <td>
                   <asp:DropDownList ID="ddSelectedCategory" runat="server" Visible="false" AutoPostBack="True" OnSelectedIndexChanged="ddSelectedCategory_SelectedIndexChanged"></asp:DropDownList>
               </td>
               <td>
                  <asp:Button 
                       ID="btnSelectedCategory" 
                       runat="server" Text="Next" Visible="false" OnClick="btnSelectedCategory_Click"/>
               </td>
               <td>
                   <strong>
                       <asp:Label 
                           ID="lblSelectedCategoryErr" 
                           runat="server" 
                           Text="Please Select an Item."
                           visible="false">
                       </asp:Label>
                   </strong>
               </td>
           </tr>
           <tr>
               <td>
                   <asp:Label 
                       ID="lblCategoryItems" 
                       runat="server" 
                       Visible="false"></asp:Label>
               </td>
               <td>
                   <asp:DropDownList 
                       ID="ddCategoryItems" 
                       runat="server" 
                       Visible="false" 
                       AutoPostBack="True" 
                       OnSelectedIndexChanged="ddCategoryItems_SelectedIndexChanged">
                   </asp:DropDownList>
               </td>
               <td>
                   <asp:Button 
                       ID="btnCategoryItem" 
                       runat="server" 
                       Text="Next"
                        Visible="false" 
                       OnClick="btnCategoryItem_Click" />
               </td>
               <td>
                   <strong>
                       <asp:Label 
                           ID="lblCategoryItemErr" 
                           runat="server" 
                           Text="Please Select a Search Area." 
                           Visible="false">
                       </asp:Label>
                   </strong>
               </td>
           </tr>
            <tr>
                <td>
                    <asp:Label 
                        ID="lblCategoryOption" 
                        runat="server" 
                        Text="Select an Option: " 
                        Visible="false">
                    </asp:Label>
                </td>
                <td>
                    <asp:DropDownList 
                        ID="ddCategoryOptions" 
                        runat="server"
                        visible="false" 
                        OnSelectedIndexChanged="ddCategoryOptions_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button 
                        ID="btnCategoryOptionSelect" 
                        runat="server" 
                        Visible="false" 
                        OnClick="btnCategoryOptionSelect_Click" Width="80px"/>
                </td>
                <td>
                   <strong><asp:Label 
                       ID="lblCategoryOptionErr" 
                       runat="server" 
                       Text="Please select an option." 
                       Visible="false">
                    </asp:Label></strong>
                </td>
            </tr>
            </table>
            <table>
            <tr>
                <td>
                    <asp:Label ID="lblSearchArea" runat="server" Visible="false"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtSearchArea" runat="server" Visible="false"></asp:TextBox>
                    <asp:TextBox ID="txtSearchArea2" runat="server" Visible="false"></asp:TextBox>
                    <asp:DropDownList ID="ddAttendanceType" runat="server" Visible="false">
                        <asp:ListItem>Attendance By:</asp:ListItem>
                        <asp:ListItem>Student</asp:ListItem>
                        <asp:ListItem>Event</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button 
                        ID="btnSearchArea" 
                        runat="server" 
                        Visible="false" 
                        OnClick="btnSearch_Click" 
                        style="height: 26px" /> 
                </td>
                <td>
                    <asp:Label 
                        ID="lblSearchAreaErr" 
                        runat="server" 
                        Visible="false">
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label 
                        ID="lblDifficultyLevel" 
                        runat="server" 
                        Text="Select course difficulty Level: "
                        Visible="false" >
                    </asp:Label>
                </td>
                <td>
                    <asp:RadioButton 
                        ID="rdoBeginner" 
                        runat="server" 
                        Text ="Beginner"
                        GroupName="Difficulty"
                        Visible="false" />
                    <asp:RadioButton 
                        ID="rdoIntermediate" 
                        runat="server" 
                        Text="Intermed" 
                        GroupName="Difficulty"
                        Visible="false" />
                    <asp:RadioButton 
                        ID="rdoAdvanced" 
                        GroupName="Difficulty"
                        runat="server" 
                        Text="Advanced" 
                        Visible="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label 
                        ID="lblCourses" 
                        runat="server" 
                        Text="Select Course to Add: "
                        Visible="false">
                    </asp:Label>
                </td>
                <td>

                    <asp:DropDownList 
                        ID="ddCourses" 
                        runat="server" 
                        Visible="False" DataSourceID="sqlClasses" DataTextField="CourseName" DataValueField="CourseName">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sqlClasses" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DBXY %>" 
                        SelectCommand="SELECT DISTINCT [CourseName] FROM [Course]">
                    </asp:SqlDataSource>
                </td>
            </tr>
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblLocations" 
                            runat="server" 
                            Text="Select the Class Location: " 
                            Visible="false">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList 
                            ID="ddLocations" 
                            runat="server" 
                            Visible="False" 
                            DataSourceID="sqlLocations" 
                            DataTextField="LocationName" 
                            DataValueField="LocationName" >
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="sqlLocations" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" SelectCommand="SELECT [LocationName], [LocationID] FROM [AcademyLocation]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblSelectSection" 
                            runat="server" 
                            Text="Select the Section and Semester: "
                            Visible="false" >
                        </asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rdoSelectSection" runat="server" 
                            DataSourceID="sqlSectionSelect" 
                            DataTextField="Sections" 
                            DataValueField="Sections"
                            visible="false" >
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        <asp:Label 
                            ID="lblSemester"
                            runat="server" 
                            Text="and Semester: " 
                            Visible="false" >
                        </asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList 
                            ID="rdoSemester" 
                            runat="server"
                            Visible="false" >
                            <asp:ListItem>Winter</asp:ListItem>
                            <asp:ListItem>Spring</asp:ListItem>
                            <asp:ListItem>Summer</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblAcademicYear" 
                            runat="server" 
                            Text="Select the Academic Year: "
                            Visible="false" >
                        </asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList 
                            ID="ddAcademicYear" 
                            runat="server"
                            Visible="false">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button 
                            ID="btnUpdateTeacherSchedule" 
                            runat="server" 
                            Text="Update Schedule" 
                            Visible="false" OnClick="btnUpdateTeacherSchedule_Click" />
                    </td>
                    <td>
                        <asp:Label 
                            ID="lblTeacherNotFound" 
                            runat="server" 
                            Text="No teacher with that email address found." 
                            Visible="false">
                        </asp:Label>
                    </td>
                </tr>
            <tr>
            <td>
                <asp:Button ID="btnViewAllEvents" runat="server" Text="All Events" visible="false" OnClick="btnEvents_Click"/>
            </td>
            </tr>
            </table>
            <table>
            <tr>
              <td>
                    <asp:Label ID="lblStudentSearch" runat="server" Text="Choose Student: " Visible="false"></asp:Label>
              </td>
             <td>
                    
                    <asp:ListBox 
                        ID="lstStudentSearch" 
                        runat="server"
                        DataTextField="MemberID" 
                        DataValueField="MemberID"
                        Visible="false" Width="338px" 
                        OnSelectedIndexChanged="lstStudentSearch_SelectedIndexChanged">
                    </asp:ListBox>
                 
                    <asp:SqlDataSource ID="sqlSearchStudent" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DBXY %>" 
                        SelectCommand="SELECT CONVERT(varchar(25),[MemberID]) +': '+[FirstName]+' '+[LastName]+' - '+[Email]+' - '+[CellNo]+' - '+ [MemberType] as 'MemberID' FROM [Member] WHERE (([FirstName] = @FirstName) AND ([LastName] = @LastName) AND ([MemberType] = @MemberType))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtSearchArea" Name="FirstName" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtSearchArea2" Name="LastName" PropertyName="Text" Type="String" />
                            <asp:Parameter DefaultValue="Student" Name="MemberType" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                 <asp:SqlDataSource 
                     ID="sqlSectionSelect" 
                     runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" SelectCommand="SELECT convert(varchar(25), [SectionID]) + ':  ' +  [MeetingDays]  + '    ' + substring(convert(varchar(25), [MeetingTime]), 0,6) AS Sections FROM [Section]" >
                 </asp:SqlDataSource>
                 </td>
                <td>
                    <asp:Button 
                        ID="btnSelectStudent" 
                        runat="server" 
                        Text="View" 
                        Visible="false" OnClick="btnSelectStudent_Click" />
                </td>
                 </tr>
                 <tr>
                     <td></td>
                    <td>
                        <asp:DropDownList 
                            ID="ddBuckAccount" 
                            runat="server"
                            visible="false">
                            <asp:ListItem>Buck Account</asp:ListItem>
                            <asp:ListItem>Student Transactions</asp:ListItem>
                        </asp:DropDownList>
                        <asp:LinkButton 
                             ID="lnkSelectAccountView" 
                             runat="server" 
                             OnClick="lnkSelectAccountView_Click"
                             visible ="false">View History</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                <td style="vertical-align:top;">
                    <asp:Label 
                        ID="lblYearSemester"
                        runat="server" 
                        Text="Please Select the Semester and Year: "
                        Visible="false">
                    </asp:Label>
                </td>
                 <td>       
                    <asp:DropDownList 
                        ID="ddYear" 
                        runat="server"
                        visible="false">
                    </asp:DropDownList>
                    <asp:CheckBoxList 
                        ID="chkTerm" 
                        runat="server" 
                        Visible="false" AutoPostBack="True" Width="74px" >
                        <asp:ListItem>Winter</asp:ListItem>
                        <asp:ListItem>Spring</asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:Button
                        ID="btnSelectSemester" 
                        runat="server" 
                        Text="Select" 
                        Visible="false" OnClick="btnSelectSemester_Click" Height="26px" />
                        <asp:Label 
                            ID="lblSelectSemesterYear" 
                            runat="server" 
                            Text="Please Select a Semester, Year, or Both" 
                            Visible="false">
                        </asp:Label>
                </td>
                </tr>
               
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:SqlDataSource 
                                ID="sqlSubject" 
                                runat="server" 
                                ConnectionString="<%$ ConnectionStrings:DBXY %>" 
                                SelectCommand="SELECT DISTINCT [SubjectName] FROM [Subject]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                <td>
                <asp:DetailsView 
                    ID="dvTeacherInfo" 
                    runat="server" 
                    Height="50px" 
                    Width="208px" 
                    Visible="False" 
                    DataSourceID="sqlTeacherInfo" 
                    AutoGenerateRows="False" 
                    DataKeyNames="MemberID">
                    <Fields>
                        <asp:BoundField DataField="MemberID" HeaderText="MemberID" InsertVisible="False" ReadOnly="True" SortExpression="MemberID" />
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="CellNo" HeaderText="CellNo" SortExpression="CellNo" />
                        <asp:BoundField DataField="HomePhoneNo" HeaderText="HomePhoneNo" SortExpression="HomePhoneNo" />
                        <asp:BoundField DataField="MemberType" HeaderText="MemberType" SortExpression="MemberType" />
                        <asp:BoundField DataField="AddressLine1" HeaderText="AddressLine1" SortExpression="AddressLine1" />
                        <asp:BoundField DataField="AddressLine2" HeaderText="AddressLine2" SortExpression="AddressLine2" />
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                        <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                                &nbsp;<asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Delete" 
                                    Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this user?');"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
                        <asp:GridView 
                            ID="gvTeacherSchedule" 
                            runat="server" AutoGenerateColumns="False" DataSourceID="sqlTeacherSchedule">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                                <asp:BoundField DataField="Difficulty" HeaderText="Difficulty" SortExpression="Difficulty" />
                                <asp:BoundField DataField="MeetingDays" HeaderText="MeetingDays" SortExpression="MeetingDays" />
                                <asp:BoundField DataField="MeetingTime" HeaderText="MeetingTime" SortExpression="MeetingTime" />
                                <asp:BoundField DataField="RoomNumber" HeaderText="RoomNumber" SortExpression="RoomNumber" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="sqlTeacherSchedule" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" SelectCommand="SELECT        Course.CourseName, Course.Difficulty, Section.MeetingDays, Section.MeetingTime, Section.RoomNumber
FROM            ClassSchedule INNER JOIN
                         Course ON ClassSchedule.CourseID = Course.CourseID INNER JOIN
                         Staff ON ClassSchedule.TeacherID = Staff.StaffID INNER JOIN
                         Member ON Staff.StaffID = Member.MemberID INNER JOIN
                         Section ON ClassSchedule.SectionID = Section.SectionID
WHERE Member.Email = @Email">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtSearchArea" Name="Email" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="sqlTeacherInfo" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" DeleteCommand="DELETE FROM [Member] WHERE [MemberID] = @MemberID" InsertCommand="INSERT INTO [Member] ([FirstName], [LastName], [Email], [CellNo], [HomePhoneNo], [MemberType], [AddressLine1], [AddressLine2], [City], [State], [Zip]) VALUES (@FirstName, @LastName, @Email, @CellNo, @HomePhoneNo, @MemberType, @AddressLine1, @AddressLine2, @City, @State, @Zip)" SelectCommand="SELECT [MemberID], [FirstName], [LastName], [Email], [CellNo], [HomePhoneNo], [MemberType], [AddressLine1], [AddressLine2], [City], [State], [Zip] FROM [Member] WHERE (([Email] = @Email) AND ([MemberType] NOT LIKE '%' + @MemberType + '%'))" UpdateCommand="UPDATE [Member] SET [FirstName] = @FirstName, [LastName] = @LastName, [Email] = @Email, [CellNo] = @CellNo, [HomePhoneNo] = @HomePhoneNo, [MemberType] = @MemberType, [AddressLine1] = @AddressLine1, [AddressLine2] = @AddressLine2, [City] = @City, [State] = @State, [Zip] = @Zip WHERE [MemberID] = @MemberID">
                            <DeleteParameters>
                                <asp:Parameter Name="MemberID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="FirstName" Type="String" />
                                <asp:Parameter Name="LastName" Type="String" />
                                <asp:Parameter Name="Email" Type="String" />
                                <asp:Parameter Name="CellNo" Type="String" />
                                <asp:Parameter Name="HomePhoneNo" Type="String" />
                                <asp:Parameter Name="MemberType" Type="String" />
                                <asp:Parameter Name="AddressLine1" Type="String" />
                                <asp:Parameter Name="AddressLine2" Type="String" />
                                <asp:Parameter Name="City" Type="String" />
                                <asp:Parameter Name="State" Type="String" />
                                <asp:Parameter Name="Zip" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtSearchArea" Name="Email" PropertyName="Text" Type="String" />
                                <asp:Parameter DefaultValue="Student" Name="MemberType" Type="String" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="FirstName" Type="String" />
                                <asp:Parameter Name="LastName" Type="String" />
                                <asp:Parameter Name="Email" Type="String" />
                                <asp:Parameter Name="CellNo" Type="String" />
                                <asp:Parameter Name="HomePhoneNo" Type="String" />
                                <asp:Parameter Name="MemberType" Type="String" />
                                <asp:Parameter Name="AddressLine1" Type="String" />
                                <asp:Parameter Name="AddressLine2" Type="String" />
                                <asp:Parameter Name="City" Type="String" />
                                <asp:Parameter Name="State" Type="String" />
                                <asp:Parameter Name="Zip" Type="String" />
                                <asp:Parameter Name="MemberID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                <asp:DetailsView 
                    ID="dvEvents" 
                    runat="server" 
                    Height="50px" Width="125px" 
                    AutoGenerateRows="False" 
                    CellPadding="4" 
                    DataKeyNames="EventID" 
                    DataSourceID="sqlSearchEvent" 
                    ForeColor="#333333" 
                    GridLines="None" 
                    Visible="False">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="EventID" HeaderText="EventID" InsertVisible="False" ReadOnly="True" SortExpression="EventID" />
                    <asp:BoundField DataField="EventName" HeaderText="EventName" SortExpression="EventName" />
                    <asp:BoundField DataField="EventDate" HeaderText="EventDate" SortExpression="EventDate" />
                    <asp:BoundField DataField="EventTopic" HeaderText="EventTopic" SortExpression="EventTopic" />
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="lnkUpdateEvent" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lnkCancelUpdate" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:LinkButton ID="lnkInsertEvent" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lnkCancelInsert" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEditEvent" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            <asp:LinkButton ID="lnkNewEvent" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                            <asp:LinkButton ID="lnkDeleteEvent" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this user?');" > </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:DetailsView>
                    </td>
                  </tr>
                <tr>
             <td class="auto-style4">
                    <asp:DetailsView 
                        ID="dvSelectStudent" 
                        runat="server" 
                        Height="50px" 
                        Width="222px"
                        visible="False" DataSourceID="sqlStudentDetails1" AutoGenerateRows="False" CellPadding="4" DataKeyNames="StudentID" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                        <EditRowStyle BackColor="#999999" />
                        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                        <Fields>
                            <asp:BoundField DataField="StudentID" HeaderText="StudentID" ReadOnly="True" SortExpression="StudentID" />
                            <asp:BoundField DataField="GradeLevel" HeaderText="GradeLevel" SortExpression="GradeLevel" />
                            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                            <asp:BoundField DataField="Ethnicity" HeaderText="Ethnicity" SortExpression="Ethnicity" />
                            <asp:BoundField DataField="Apprentice" HeaderText="Apprentice" SortExpression="Apprentice" />
                            <asp:BoundField DataField="SchoolName" HeaderText="SchoolName" SortExpression="SchoolName" />
                            <asp:BoundField DataField="StudentStatus" HeaderText="StudentStatus" SortExpression="StudentStatus" />
                            <asp:BoundField DataField="ExpectedGradYr" HeaderText="ExpectedGradYr" SortExpression="ExpectedGradYr" />
                            <asp:BoundField DataField="Resume" HeaderText="Resume" SortExpression="Resume" />
                            <asp:BoundField DataField="ArtisticResume" HeaderText="ArtisticResume" SortExpression="ArtisticResume" />
                            <asp:CommandField ShowEditButton="True" ShowInsertButton="True" ShowDeleteButton="True"/>
                        </Fields>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    </asp:DetailsView>
                    <asp:SqlDataSource 
                        ID="sqlStudentDetails1" 
                        runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DBXY %>" 
                        DeleteCommand="DELETE FROM [Student] WHERE [StudentID] = @StudentID" 
                        InsertCommand="INSERT INTO [Student] ([StudentID], [GradeLevel], [Gender], [Ethnicity], [Apprentice], [SchoolName], [StudentStatus], [ExpectedGradYr], [Resume], [ArtisticResume]) VALUES (@StudentID, @GradeLevel, @Gender, @Ethnicity, @Apprentice, @SchoolName, @StudentStatus, @ExpectedGradYr, @Resume, @ArtisticResume)" 
                        SelectCommand="SELECT [StudentID], [GradeLevel], [Gender], [Ethnicity], [Apprentice], [SchoolName], [StudentStatus], [ExpectedGradYr], [Resume], [ArtisticResume] FROM [Student] WHERE ([StudentID] = @StudentID2)" UpdateCommand="UPDATE [Student] SET [GradeLevel] = @GradeLevel, [Gender] = @Gender, [Ethnicity] = @Ethnicity, [Apprentice] = @Apprentice, [SchoolName] = @SchoolName, [StudentStatus] = @StudentStatus, [ExpectedGradYr] = @ExpectedGradYr, [Resume] = @Resume, [ArtisticResume] = @ArtisticResume WHERE [StudentID] = @StudentID">
                        <DeleteParameters>
                            <asp:Parameter Name="StudentID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="StudentID" Type="Int32" />
                            <asp:Parameter Name="GradeLevel" Type="String" />
                            <asp:Parameter Name="Gender" Type="String" />
                            <asp:Parameter Name="Ethnicity" Type="String" />
                            <asp:Parameter Name="Apprentice" Type="String" />
                            <asp:Parameter Name="SchoolName" Type="String" />
                            <asp:Parameter Name="StudentStatus" Type="String" />
                            <asp:Parameter Name="ExpectedGradYr" Type="Int32" />
                            <asp:Parameter Name="Resume" Type="String" />
                            <asp:Parameter Name="ArtisticResume" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="StudentID2" SessionField="MemberID" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="GradeLevel" Type="String" />
                            <asp:Parameter Name="Gender" Type="String" />
                            <asp:Parameter Name="Ethnicity" Type="String" />
                            <asp:Parameter Name="Apprentice" Type="String" />
                            <asp:Parameter Name="SchoolName" Type="String" />
                            <asp:Parameter Name="StudentStatus" Type="String" />
                            <asp:Parameter Name="ExpectedGradYr" Type="Int32" />
                            <asp:Parameter Name="Resume" Type="String" />
                            <asp:Parameter Name="ArtisticResume" Type="String" />
                            <asp:Parameter Name="StudentID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
            </td>
            </tr>
            <tr>
                <td class="auto-style4">
                <asp:GridView ID="gvAllEvents" runat="server" 
                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="EventID" 
                    DataSourceID="sqlAllEvents" ForeColor="#333333" GridLines="None" Visible="False" AllowSorting="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="EventID" HeaderText="EventID" InsertVisible="False" ReadOnly="True" SortExpression="EventID" />
                        <asp:BoundField DataField="EventName" HeaderText="EventName" SortExpression="EventName" />
                        <asp:BoundField DataField="EventDate" HeaderText="EventDate" SortExpression="EventDate" />
                        <asp:BoundField DataField="EventTopic" HeaderText="EventTopic" SortExpression="EventTopic" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="sqlAllEvents" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" DeleteCommand="DELETE FROM [Event] WHERE [EventID] = @EventID" InsertCommand="INSERT INTO [Event] ([EventName], [EventDate], [EventTopic]) VALUES (@EventName, @EventDate, @EventTopic)" SelectCommand="SELECT * FROM [Event]" UpdateCommand="UPDATE [Event] SET [EventName] = @EventName, [EventDate] = @EventDate, [EventTopic] = @EventTopic WHERE [EventID] = @EventID">
                    <DeleteParameters>
                        <asp:Parameter Name="EventID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="EventName" Type="String" />
                        <asp:Parameter Name="EventDate" Type="DateTime" />
                        <asp:Parameter Name="EventTopic" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="EventName" Type="String" />
                        <asp:Parameter Name="EventDate" Type="DateTime" />
                        <asp:Parameter Name="EventTopic" Type="String" />
                        <asp:Parameter Name="EventID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
              </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView 
                        ID="gvStudentYearlySchedule" 
                        runat="server" AutoGenerateColumns="False" DataSourceID="sqlYearlySchedule">
                        <Columns>
                            <asp:BoundField DataField="Student First Name" HeaderText="Student First Name" SortExpression="Student First Name" />
                            <asp:BoundField DataField="Student Last Name" HeaderText="Student Last Name" SortExpression="Student Last Name" />
                            <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                            <asp:BoundField DataField="Teacher First Name" HeaderText="Teacher First Name" SortExpression="Teacher First Name" />
                            <asp:BoundField DataField="Teacher Last Name" HeaderText="Teacher Last Name" SortExpression="Teacher Last Name" />
                            <asp:BoundField DataField="MeetingDays" HeaderText="MeetingDays" SortExpression="MeetingDays" />
                            <asp:BoundField DataField="MeetingTime" HeaderText="MeetingTime" SortExpression="MeetingTime" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sqlYearlySchedule" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" SelectCommand="SELECT Member_1.FirstName AS [Student First Name], Member_1.LastName AS [Student Last Name], Course.CourseName, Member.FirstName AS [Teacher First Name], Member.LastName AS [Teacher Last Name], Section.MeetingDays, Section.MeetingTime FROM ClassSchedule INNER JOIN Student ON ClassSchedule.StudentID = Student.StudentID INNER JOIN Staff ON ClassSchedule.TeacherID = Staff.StaffID INNER JOIN Course ON ClassSchedule.CourseID = Course.CourseID INNER JOIN Section ON ClassSchedule.SectionID = Section.SectionID INNER JOIN Member ON Staff.StaffID = Member.MemberID INNER JOIN Member AS Member_1 ON Student.StudentID = Member_1.MemberID WHERE (ClassSchedule.StudentID = @StudentID) AND (ClassSchedule.Year = @SemesterYear)">
                        <SelectParameters>
                            <asp:SessionParameter Name="StudentID" SessionField="MemberID" />
                            <asp:ControlParameter ControlID="ddYear" Name="SemesterYear" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:GridView 
                        ID="gvStudentSchedule" 
                        runat="server" 
                        AutoGenerateColumns="False" 
                        DataSourceID="sqlStudentSchedule"
                        visible="False">
                        <Columns>
                            <asp:BoundField DataField="Student First Name" HeaderText="Student First Name" SortExpression="Student First Name" />
                            <asp:BoundField DataField="Student Last Name" HeaderText="Student Last Name" SortExpression="Student Last Name" />
                            <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                            <asp:BoundField DataField="Teacher First Name" HeaderText="Teacher First Name" SortExpression="Teacher First Name" />
                            <asp:BoundField DataField="Teacher Last Name" HeaderText="Teacher Last Name" SortExpression="Teacher Last Name" />
                            <asp:BoundField DataField="MeetingDays" HeaderText="MeetingDays" SortExpression="MeetingDays" />
                            <asp:BoundField DataField="MeetingTime" HeaderText="MeetingTime" SortExpression="MeetingTime" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sqlStudentSchedule" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=WBL;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT Member_1.FirstName AS [Student First Name], Member_1.LastName AS [Student Last Name], Course.CourseName, Member.FirstName AS [Teacher First Name], Member.LastName AS [Teacher Last Name], Section.MeetingDays, Section.MeetingTime FROM ClassSchedule INNER JOIN Student ON ClassSchedule.StudentID = Student.StudentID INNER JOIN Staff ON ClassSchedule.TeacherID = Staff.StaffID INNER JOIN Course ON ClassSchedule.CourseID = Course.CourseID INNER JOIN Section ON ClassSchedule.SectionID = Section.SectionID INNER JOIN Member ON Staff.StaffID = Member.MemberID INNER JOIN Member AS Member_1 ON Student.StudentID = Member_1.MemberID WHERE (ClassSchedule.StudentID = @StudentID) AND (ClassSchedule.Semester = @Semester) AND (ClassSchedule.Year = @Year)">
                        <SelectParameters>
                            <asp:SessionParameter Name="StudentID" SessionField="MemberID" />
                            <asp:ControlParameter ControlID="chkTerm" Name="Semester" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ddYear" Name="Year" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
            <td class="auto-style4">
            <asp:SqlDataSource ID="sqlSearchEvent" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DBXY %>" 
                SelectCommand="SELECT * FROM [Event] WHERE ([EventName] LIKE '%' + @EventName + '%')" 
                DeleteCommand="DELETE FROM [Event] WHERE [EventID] = @EventID" 
                InsertCommand="INSERT INTO [Event] ([EventName], [EventDate], [EventTopic]) VALUES (@EventName, @EventDate, @EventTopic)" 
                UpdateCommand="UPDATE [Event] SET [EventName] = @EventName, [EventDate] = @EventDate, [EventTopic] = @EventTopic WHERE [EventID] = @EventID">
                <DeleteParameters>
                    <asp:Parameter Name="EventID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="EventName" Type="String" />
                    <asp:Parameter Name="EventDate" Type="DateTime" />
                    <asp:Parameter Name="EventTopic" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearchArea" Name="EventName" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="EventName" Type="String" />
                    <asp:Parameter Name="EventDate" Type="DateTime" />
                    <asp:Parameter Name="EventTopic" Type="String" />
                    <asp:Parameter Name="EventID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
                </td>
                </tr>
            <tr>
                <td>
                    <asp:GridView 
                        ID="gvDietRestriction" 
                        runat="server" 
                        AutoGenerateColumns="False" 
                        DataSourceID="sqlDietRestriction">
                    </asp:GridView>
                    <asp:SqlDataSource ID="sqlDietRestriction" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DBXY %>" 
                        SelectCommand="SELECT        Member.FirstName, Member.LastName, DietRestriction.RestrictionName
FROM            Student INNER JOIN
                         Member ON Student.StudentID = Member.MemberID INNER JOIN
                         StuDietRestriction ON Student.StudentID = StuDietRestriction.StudentID INNER JOIN
                         DietRestriction ON StuDietRestriction.RestrictionID = DietRestriction.RestrictionID
WHERE        (Member.MemberID = @MemberID)" ProviderName="System.Data.SqlClient">
                        <SelectParameters>
                            <asp:SessionParameter Name="MemberID" SessionField="@MemberID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                <asp:Label 
                    ID="lblNullData" 
                    runat="server" 
                    Text="There were no records matching your search."
                    visible ="false">
                </asp:Label>
                </td> 
           </tr>
           <tr>
               <td>
                   
            <asp:GridView 
                ID="gvCoursesInSubject" 
                runat="server" 
                AllowPaging="True" 
                AutoGenerateColumns="False" 
                DataKeyNames="CourseID" 
                DataSourceID="sqlCoursesInSubject"
                Visible="False" OnSelectedIndexChanged="gvCoursesInSubject_SelectedIndexChanged" >
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="CourseID" HeaderText="CourseID" InsertVisible="False" ReadOnly="True" SortExpression="CourseID" />
                    <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                    <asp:BoundField DataField="Difficulty" HeaderText="Difficulty" SortExpression="Difficulty" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sqlCoursesInSubject" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:DBXY %>" 
                DeleteCommand="DELETE FROM [Course] WHERE [CourseID] = @CourseID" 
                InsertCommand="INSERT INTO [Course] ([CourseName], [Difficulty]) VALUES (@CourseName, @Difficulty)" 
                SelectCommand="SELECT [CourseID], [CourseName], [Difficulty] FROM [Course] WHERE ([SubjectID] = @SubjectID) ORDER BY [CourseName]" UpdateCommand="UPDATE [Course] SET [CourseName] = @CourseName, [Difficulty] = @Difficulty WHERE [CourseID] = @CourseID">
                <DeleteParameters>
                    <asp:Parameter Name="CourseID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CourseName" Type="String" />
                    <asp:Parameter Name="Difficulty" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="SubjectID" SessionField="SubjectID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CourseName" Type="String" />
                    <asp:Parameter Name="Difficulty" Type="String" />
                    <asp:Parameter Name="CourseID" Type="Int32" />
                </UpdateParameters>
                </asp:SqlDataSource>
               </td>
           </tr>
            <tr>
                <td>
                    <asp:DetailsView 
                ID="dvEditCourses" 
                runat="server" 
                Height="50px" 
                Width="181px"
                visible="False" 
                AutoGenerateRows="False" 
                DataKeyNames="CourseID" 
                DataSourceID="sqlClassesInSubject" 
                AllowPaging="True" >
                <Fields>
                    <asp:BoundField DataField="CourseID" HeaderText="CourseID" InsertVisible="False" ReadOnly="True" SortExpression="CourseID" />
                    <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                    <asp:BoundField DataField="Difficulty" HeaderText="Difficulty" SortExpression="Difficulty" />
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" OnClientClick=""></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource 
                ID="sqlClassesInSubject" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:DBXY %>" 
                DeleteCommand="DELETE FROM [Course] WHERE [CourseID] = @CourseID" 
                InsertCommand="INSERT INTO [Course] ([CourseName], [Difficulty]) VALUES (@CourseName, @Difficulty)" 
                SelectCommand="SELECT [CourseID], [CourseName], [Difficulty] FROM [Course] WHERE ([CourseID] = @CourseID) ORDER BY [CourseName]" 
                UpdateCommand="UPDATE [Course] SET [CourseName] = @CourseName, [Difficulty] = @Difficulty WHERE [CourseID] = @CourseID">
                <DeleteParameters>
                    <asp:Parameter Name="CourseID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CourseName" Type="String" />
                    <asp:Parameter Name="Difficulty" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="CourseID" SessionField="CourseID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CourseName" Type="String" />
                    <asp:Parameter Name="Difficulty" Type="String" />
                    <asp:Parameter Name="CourseID" Type="Int32" />
                </UpdateParameters>
                </asp:SqlDataSource>
                </td>
           </tr>
        </table>
        <div>
            
            <asp:GridView 
                ID="gvStudentGrades" 
                runat="server" 
                AutoGenerateColumns="False" 
                DataSourceID="sqlStudentGrades" 
                Visible="False" 
                DataKeyNames="StudentID">
                <Columns>
                    <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" ReadOnly="True" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="SubjectName" HeaderText="SubjectName" SortExpression="SubjectName" />
                    <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                    <asp:BoundField DataField="Difficulty" HeaderText="Difficulty" SortExpression="Difficulty" />
                    <asp:BoundField DataField="LetterGrade" HeaderText="LetterGrade" SortExpression="LetterGrade" />
                    <asp:BoundField DataField="Points" HeaderText="Points" SortExpression="Points" />
                    <asp:BoundField DataField="Semester" HeaderText="Semester" SortExpression="Semester" />
                    <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                </Columns>
            </asp:GridView>
            <asp:GridView 
                ID="gvYearlyGrades"
                runat="server" 
                AutoGenerateColumns="False" 
                SqlDataSouceID="sqlYearlyGrades"
                DataKeyNames="StudentID"
                visible="False" DataSourceID="sqlStudentYearGrades">
                <Columns>
                    <asp:BoundField DataField="StudentID" HeaderText="StudentID" ReadOnly="True" SortExpression="StudentID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="SubjectName" HeaderText="SubjectName" SortExpression="SubjectName" />
                    <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                    <asp:BoundField DataField="Difficulty" HeaderText="Difficulty" SortExpression="Difficulty" />
                    <asp:BoundField DataField="LetterGrade" HeaderText="LetterGrade" SortExpression="LetterGrade" />
                    <asp:BoundField DataField="Points" HeaderText="Points" SortExpression="Points" />
                    <asp:BoundField DataField="Semester" HeaderText="Semester" SortExpression="Semester" />
                    <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                </Columns>
            </asp:GridView>
            <asp:GridView 
                ID="gvStudentAccount" 
                runat="server" 
                AutoGenerateColumns="False" 
                DataKeyNames="AccountNumber" 
                DataSourceID="sqlBuckAccount"
                visible="false">
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="AccountNumber" HeaderText="AccountNumber" InsertVisible="False" ReadOnly="True" SortExpression="AccountNumber" />
                    <asp:BoundField DataField="AccountBalance" HeaderText="AccountBalance" SortExpression="AccountBalance" />
                </Columns>
            </asp:GridView>
            <asp:GridView 
                ID="gvStudentPurchases" 
                runat="server"
                visible="False" 
                AutoGenerateColumns="False" 
                DataSourceID="sqlStudentTransaction">
                <Columns>
                    <asp:BoundField DataField="PurchaseDate" HeaderText="PurchaseDate" SortExpression="PurchaseDate" />
                    <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                    <asp:BoundField DataField="ItemPrice" HeaderText="ItemPrice" SortExpression="ItemPrice" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="PurchaseQty" HeaderText="PurchaseQty" SortExpression="PurchaseQty" />
                    <asp:BoundField DataField="TransactionAmt" HeaderText="TransactionAmt" SortExpression="TransactionAmt" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sqlStudentTransaction" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" SelectCommand="SELECT        BuckTansaction.PurchaseDate, BuckStore.ItemName, BuckStore.ItemPrice, BuckStore.Description, BuckTansaction.PurchaseQty, BuckTansaction.TransactionAmt
FROM            Student INNER JOIN
                         Subject ON Student.SubjectID = Subject.SubjectID INNER JOIN
                         BuckAccount ON Student.StudentID = BuckAccount.StudentID INNER JOIN
                         BuckTansaction ON BuckAccount.AccountNumber = BuckTansaction.AccountNumber INNER JOIN
                         BuckStore ON BuckTansaction.ItemID = BuckStore.ItemID
WHERE BuckAccount.StudentID = @StudentID">
                <SelectParameters>
                    <asp:SessionParameter Name="StudentID" SessionField="StudentID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sqlBuckAccount" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT        Member.FirstName, Member.LastName, BuckAccount.AccountNumber, BuckAccount.AccountBalance
FROM            Student INNER JOIN
                         BuckAccount ON Student.StudentID = BuckAccount.StudentID INNER JOIN
                         Member ON Student.StudentID = Member.MemberID
WHERE        BuckAccount.StudentID = @StudentID">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="StudentID" SessionField="StudentID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sqlStudentGrades" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT        Student.StudentID, Member.FirstName, Member.LastName, Subject.SubjectName, Course.CourseName, Course.Difficulty, Grade.LetterGrade, Grade.Points, ClassSchedule.Semester, ClassSchedule.Year
FROM            ClassSchedule INNER JOIN
                         Course ON ClassSchedule.CourseID = Course.CourseID INNER JOIN
                         CourseGrade ON ClassSchedule.ClassScheduleID = CourseGrade.ClassScheduleID INNER JOIN
                         Student ON ClassSchedule.StudentID = Student.StudentID INNER JOIN
                         Member ON Student.StudentID = Member.MemberID INNER JOIN
                         Grade ON CourseGrade.GradeID = Grade.GradeID INNER JOIN
                         Subject ON Course.SubjectID = Subject.SubjectID
WHERE (ClassSchedule.StudentID = @StudentID) and ((ClassSchedule.Semester = @Semester) or                (ClassSchedule.Year = @Year))">
                <SelectParameters>
                    <asp:SessionParameter Name="StudentID" SessionField="StudentID" />
                    <asp:SessionParameter Name="Semester" SessionField="Semester" />
                    <asp:SessionParameter Name="Year" SessionField="SemesterYear" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource 
                ID="sqlStudentYearGrades" 
                runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT        Student.StudentID, Member.FirstName, Member.LastName, Subject.SubjectName, Course.CourseName, Course.Difficulty, Grade.LetterGrade, Grade.Points, ClassSchedule.Semester, ClassSchedule.Year
FROM            ClassSchedule INNER JOIN
                         Course ON ClassSchedule.CourseID = Course.CourseID INNER JOIN
                         CourseGrade ON ClassSchedule.ClassScheduleID = CourseGrade.ClassScheduleID INNER JOIN
                         Student ON ClassSchedule.StudentID = Student.StudentID INNER JOIN
                         Member ON Student.StudentID = Member.MemberID INNER JOIN
                         Grade ON CourseGrade.GradeID = Grade.GradeID INNER JOIN
                         Subject ON Course.SubjectID = Subject.SubjectID
						 Where ClassSchedule.StudentID = @StudentID and ClassSchedule.Year = @SemesterYear">
                <SelectParameters>
                    <asp:SessionParameter Name="StudentID" SessionField="StudentID" />
                    <asp:SessionParameter DefaultValue="" Name="SemesterYear" SessionField="Year" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sqlCourses" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT        Course.CourseName, Course.TeacherID, Member.FirstName AS [Teacher F Name], Member.LastName AS [Teacher L Name], Subject.SubjectName AS Subject, AcademyLocation.LocationName, 
                         Course.Difficulty
FROM            Course INNER JOIN
                         Staff ON Course.TeacherID = Staff.StaffID INNER JOIN
                         Member ON Staff.StaffID = Member.MemberID INNER JOIN
                         AcademyLocation ON Course.LocationID = AcademyLocation.LocationID INNER JOIN
                         Subject ON Course.SubjectID = Subject.SubjectID
WHERE			(Course.SubjectID = @SubjectID);">
                <SelectParameters>
                    <asp:SessionParameter Name="SubjectID" SessionField="SubjectID" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div>
            <asp:SqlDataSource ID="sqlListTeacherSchedule" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" 
                SelectCommand="SELECT        CONVERT(varchar(20), ClassSchedule.ClassScheduleID) + ': ' + Member.LastName + ', ' + 
                Member.FirstName + ' Course - ' + Course.CourseName + ': ' +
                SUBSTRING(CONVERT(varchar(10), Section.MeetingTime), 0,6) + ' '+ Section.MeetingDays AS MemberID
                FROM            Course INNER JOIN
                         ClassSchedule ON Course.CourseID = ClassSchedule.CourseID INNER JOIN
                         Staff ON ClassSchedule.TeacherID = Staff.StaffID INNER JOIN
                         Member ON Staff.StaffID = Member.MemberID INNER JOIN
                         Section ON ClassSchedule.SectionID = Section.SectionID WHERE Email = @Email">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearchArea" Name="Email" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</asp:Content>
