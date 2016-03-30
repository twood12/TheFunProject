<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchEngine.aspx.cs" Inherits="WebPages_Admin_WebPages_SearchEngine" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
                <td class="auto-style1">
                    <asp:Label 
                        ID="lblCategory" 
                        runat="server" 
                        Text="Select Category: ">
                    </asp:Label>
                </td>
                <td class="auto-style1">
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
                <td class="auto-style1">
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
            </tr>
           <tr>
              <td class="auto-style1">
                  <asp:Label ID="lblSelectedCategory" runat="server" visbile="false"></asp:Label>
              </td>
               <td class="auto-style1">
                   <asp:DropDownList ID="ddSelectedCategory" runat="server" Visible="false" AutoPostBack="True" OnSelectedIndexChanged="ddSelectedCategory_SelectedIndexChanged"></asp:DropDownList>
               </td>
               <td class="auto-style1">
                   <asp:Button 
                       ID="btnSelectedCategory" 
                       runat="server" Text="Next" Visible="false" OnClick="btnSelectedCategory_Click"/>
               </td>
               <td class="auto-style1">
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
               <td class="auto-style2">
                   <asp:Label ID="lblCategoryItems" runat="server" Visible="false"></asp:Label>
               </td>
               <td class="auto-style2">
                   <asp:DropDownList ID="ddCategoryItems" runat="server" Visible="false" AutoPostBack="True" OnSelectedIndexChanged="ddCategoryItems_SelectedIndexChanged"></asp:DropDownList>
               </td>
               <td class="auto-style2">
                   <asp:Button ID="btnCategoryItem" runat="server" Text="Next" Visible="false" OnClick="btnCategoryItem_Click" />
               </td>
               <td class="auto-style2">
                   <strong>
                       <asp:Label ID="lblCategoryItemErr" runat="server" Text="Please Select a Search Area." Visible="false"></asp:Label>
                   </strong>
               </td>
           </tr>
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
                    <asp:Button ID="btnSearchArea" runat="server" Visible="false" OnClick="btnSearch_Click" style="height: 26px" /> 
                </td>
            </tr>
            <tr>
            <td class="auto-style3">
                <asp:Button ID="btnViewAllEvents" runat="server" Text="All Events" visible="false" OnClick="btnEvents_Click"/>
            </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lblStudentSearch" runat="server" Text="Choose Student: " Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
             <td class="auto-style4">
                    <asp:ListBox 
                        ID="lstStudentSearch" 
                        runat="server" 
                        DataSourceID="sqlSearchStudent" 
                        DataTextField="MemberID" 
                        DataValueField="MemberID"
                        Visible="false" Width="338px" AutoPostBack="True" OnSelectedIndexChanged="lstStudentSearch_SelectedIndexChanged"></asp:ListBox>
                    <asp:SqlDataSource ID="sqlSearchStudent" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DBXYS %>" 
                        SelectCommand="SELECT CONVERT(varchar(25),[MemberID]) +' '+[FirstName]+' '+[LastName]+' '+[Email]+' '+[CellNo]+' '+ [MemberType] as 'MemberID' FROM [Member] WHERE (([FirstName] = @FirstName) AND ([LastName] = @LastName) AND ([MemberType] = @MemberType))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtSearchArea" Name="FirstName" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtSearchArea2" Name="LastName" PropertyName="Text" Type="String" />
                            <asp:Parameter DefaultValue="Student" Name="MemberType" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                 </td>
                 </tr>
            <tr>
                <td class="auto-style4">
                    <asp:DropDownList 
                        ID="ddYear" 
                        runat="server"
                        visible="false">
                    </asp:DropDownList>
                    <asp:CheckBoxList 
                        ID="chkTerm" 
                        runat="server" 
                        Visible="false" AutoPostBack="True" Width="74px">
                        <asp:ListItem>Winter</asp:ListItem>
                        <asp:ListItem>Spring</asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:Button 
                        ID="btnSelectSemester" 
                        runat="server" 
                        Text="Select" 
                        Visible="false" OnClick="btnSelectSemester_Click" />
                </td>
            </tr>
                <tr>
                    <td class="auto-style4">
                <asp:DetailsView ID="dvEvents" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" CellPadding="4" DataKeyNames="EventID" DataSourceID="sqlSearchEvent" ForeColor="#333333" GridLines="None" Visible="False">
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
                            &nbsp;<asp:LinkButton ID="lnkNewEvent" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lnkDeleteEvent" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this event?');"></asp:LinkButton>
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
                            <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
                        </Fields>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="sqlStudentDetails1" runat="server" ConnectionString="<%$ ConnectionStrings:DBXYS %>" DeleteCommand="DELETE FROM [Student] WHERE [StudentID] = @StudentID" InsertCommand="INSERT INTO [Student] ([StudentID], [GradeLevel], [Gender], [Ethnicity], [Apprentice], [SchoolName], [StudentStatus], [ExpectedGradYr], [Resume], [ArtisticResume]) VALUES (@StudentID, @GradeLevel, @Gender, @Ethnicity, @Apprentice, @SchoolName, @StudentStatus, @ExpectedGradYr, @Resume, @ArtisticResume)" SelectCommand="SELECT [StudentID], [GradeLevel], [Gender], [Ethnicity], [Apprentice], [SchoolName], [StudentStatus], [ExpectedGradYr], [Resume], [ArtisticResume] FROM [Student] WHERE ([StudentID] = @StudentID2)" UpdateCommand="UPDATE [Student] SET [GradeLevel] = @GradeLevel, [Gender] = @Gender, [Ethnicity] = @Ethnicity, [Apprentice] = @Apprentice, [SchoolName] = @SchoolName, [StudentStatus] = @StudentStatus, [ExpectedGradYr] = @ExpectedGradYr, [Resume] = @Resume, [ArtisticResume] = @ArtisticResume WHERE [StudentID] = @StudentID">
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
                <asp:GridView ID="gvAllEvents" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="EventID" DataSourceID="sqlAllEvents" ForeColor="#333333" GridLines="None" Visible="False" AllowSorting="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="lnkUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="lnkCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this event?');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
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
                <asp:SqlDataSource ID="sqlAllEvents" runat="server" ConnectionString="<%$ ConnectionStrings:DBXYS %>" DeleteCommand="DELETE FROM [Event] WHERE [EventID] = @EventID" InsertCommand="INSERT INTO [Event] ([EventName], [EventDate], [EventTopic]) VALUES (@EventName, @EventDate, @EventTopic)" SelectCommand="SELECT * FROM [Event]" UpdateCommand="UPDATE [Event] SET [EventName] = @EventName, [EventDate] = @EventDate, [EventTopic] = @EventTopic WHERE [EventID] = @EventID">
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
                <td class="auto-style4">
                    <asp:GridView 
                        ID="gvStudentSchedule" 
                        runat="server" 
                        AllowSorting="True" 
                        AutoGenerateColumns="False" 
                        CellPadding="4" 
                        DataKeyNames="StudentID,CourseID" 
                        DataSourceID="sqlStudentClassSchedul" 
                        ForeColor="#333333" 
                        GridLines="None" >
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this event?');"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="StudentID" HeaderText="StudentID" ReadOnly="True" SortExpression="StudentID" />
                            <asp:BoundField DataField="CourseID" HeaderText="CourseID" ReadOnly="True" SortExpression="CourseID" />
                            <asp:BoundField DataField="MeetingDays" HeaderText="MeetingDays" SortExpression="MeetingDays" />
                            <asp:BoundField DataField="MeetingTime" HeaderText="MeetingTime" SortExpression="MeetingTime" />
                            <asp:BoundField DataField="RoomNumber" HeaderText="RoomNumber" SortExpression="RoomNumber" />
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
                    <asp:SqlDataSource ID="sqlStudentClassSchedul" runat="server" ConnectionString="<%$ ConnectionStrings:DBXYS %>" DeleteCommand="DELETE FROM [ClassSchedule] WHERE [StudentID] = @StudentID AND [CourseID] = @CourseID" InsertCommand="INSERT INTO [ClassSchedule] ([StudentID], [CourseID], [MeetingDays], [MeetingTime], [RoomNumber]) VALUES (@StudentID, @CourseID, @MeetingDays, @MeetingTime, @RoomNumber)" SelectCommand="SELECT * FROM [ClassSchedule] WHERE ([StudentID] = @StudentID)" UpdateCommand="UPDATE [ClassSchedule] SET [MeetingDays] = @MeetingDays, [MeetingTime] = @MeetingTime, [RoomNumber] = @RoomNumber WHERE [StudentID] = @StudentID AND [CourseID] = @CourseID">
                        <DeleteParameters>
                            <asp:Parameter Name="StudentID" Type="Int32" />
                            <asp:Parameter Name="CourseID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="StudentID" Type="Int32" />
                            <asp:Parameter Name="CourseID" Type="Int32" />
                            <asp:Parameter Name="MeetingDays" Type="String" />
                            <asp:Parameter Name="MeetingTime" Type="String" />
                            <asp:Parameter Name="RoomNumber" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="StudentID" SessionField="MemberID" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="MeetingDays" Type="String" />
                            <asp:Parameter Name="MeetingTime" Type="String" />
                            <asp:Parameter Name="RoomNumber" Type="String" />
                            <asp:Parameter Name="StudentID" Type="Int32" />
                            <asp:Parameter Name="CourseID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
            <td class="auto-style4">
            <asp:SqlDataSource ID="sqlSearchEvent" runat="server" ConnectionString="<%$ ConnectionStrings:DBXYS %>" SelectCommand="SELECT * FROM [Event] WHERE ([EventName] LIKE '%' + @EventName + '%')" DeleteCommand="DELETE FROM [Event] WHERE [EventID] = @EventID" InsertCommand="INSERT INTO [Event] ([EventName], [EventDate], [EventTopic]) VALUES (@EventName, @EventDate, @EventTopic)" UpdateCommand="UPDATE [Event] SET [EventName] = @EventName, [EventDate] = @EventDate, [EventTopic] = @EventTopic WHERE [EventID] = @EventID">
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
                    <asp:GridView ID="gvDietRestriction" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID,RestrictionID" DataSourceID="sqlDietRestriction">
                        <Columns>
                            <asp:BoundField DataField="StudentID" HeaderText="Student ID#" ReadOnly="True" SortExpression="StudentID" />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" ReadOnly="True" SortExpression="RestrictionID" />
                            <asp:BoundField DataField="LastName" HeaderText="" ReadOnly="True" SortExpression="RestrictionID" />
                            <asp:BoundField DataField="RestrictionID" HeaderText="Restriction Number" ReadOnly="True" SortExpression="RestrictionID" />
                            <asp:BoundField DataField="RestrictionName" HeaderText="Restriction Name" ReadOnly="True" SortExpression="RestrictionID" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sqlDietRestriction" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DBXYS %>" 
                        DeleteCommand="DELETE FROM [StuDietRestriction] WHERE [StudentID] = @StudentID AND [RestrictionID] = @RestrictionID" 
                        InsertCommand="INSERT INTO [StuDietRestriction] ([StudentID], [RestrictionID]) VALUES (@StudentID, @RestrictionID)" 
                        SelectCommand="SELECT Student.StudentID, Member.FirstName, Member.LastName, DietRestriction.RestrictionID, DietRestriction.RestrictionName DietRestriction INNER JOIN StuDietRestriction ON DietRestriction.RestrictionID = StuDietRestriction.RestrictionID INNER JOIN Student ON StuDietRestriction.StudentID = Student.StudentID INNER JOIN Member ON Student.StudentID = Member.MemberID WHERE ([StudentID] = @StudentID)">
                        <DeleteParameters>
                            <asp:Parameter Name="StudentID" Type="Int32" />
                            <asp:Parameter Name="RestrictionID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="StudentID" Type="Int32" />
                            <asp:Parameter Name="RestrictionID" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="StudentID" SessionField="MemberID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
