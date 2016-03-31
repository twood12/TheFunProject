<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPages/WBLTeacherMasterPage.master" AutoEventWireup="true" CodeFile="WBLTeacherEvaluations.aspx.cs" Inherits="WebPages_Teacher_WebPages_WBLTeacherEvaluations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>Here the teacher can view all of their to-do evaluations</p>
    


    <form id="frmAvailableEvals" runat="server" method="post">

    <asp:Label runat="server" Text="Choose a course:" ></asp:Label>
    <asp:DropDownList ID="ddCourseList" runat="server" DataTextField="CourseTitle" DataSourceID="courseListCommand" AutoPostBack="true" Visible="true" OnSelectedIndexChanged="ddCourseList_SelectedIndexChanged">
    </asp:DropDownList>

    <br />
    <asp:Label runat="server" Text="Choose a student:" ></asp:Label>
    <asp:DropDownList ID="ddStudentEvaluations" runat="server" DataTextField="Name" DataSourceID="studentEvalCommand" AutoPostBack="true" Visible="true">
    </asp:DropDownList>
    <br />
    <asp:Button runat="server" Text="Evaluate Student" ID="btnEvaluateStudent" Visible="true" OnClick="btnEvaluateStudent_Click" />
    </form>

    <asp:HyperLink ID="lnkIndividualEvaluation2" runat="server" 
             NavigateUrl="~/WebPages/Teacher_WebPages/WBLTeacherIndividualEvaluation1.aspx" 
             Text="Individual Evaluation" />

    <asp:SqlDataSource id="studentEvalCommand" ConnectionString="<%$ ConnectionStrings:DBXY %>" SelectCommand="Select CONVERT(varchar(10),M.MemberID) + '-' + M.FirstName + ' ' + M.LastName + ',' + M.Email as [Name] From Member M JOIN Student S on M.MemberID = S.StudentID JOIN ClassSchedule CS ON CS.StudentID = S.StudentID JOIN Course C on C.CourseID = CS.CourseID JOIN Staff ST ON C.TeacherID = ST.StaffID Where ST.StaffID = 4 AND C.CourseID = @CourseID" runat="server" >
        <SelectParameters>
            <asp:SessionParameter Name="CourseID" SessionField="MemberID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource id="courseListCommand" ConnectionString="<%$ ConnectionStrings:DBXY %>" SelectCommand="SELECT CONVERT(varchar(10),[CourseID]) + '-' + [CourseName] as [CourseTitle] FROM [Course] WHERE ([TeacherID] = @TeacherID)" runat="server" DeleteCommand="DELETE FROM [Course] WHERE [CourseID] = @CourseID" InsertCommand="INSERT INTO [Course] ([CourseName]) VALUES (@CourseName)" UpdateCommand="UPDATE [Course] SET [CourseName] = @CourseName WHERE [CourseID] = @CourseID" >
        <DeleteParameters>
            <asp:Parameter Name="CourseID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CourseName" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="4" Name="TeacherID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CourseName" Type="String" />
            <asp:Parameter Name="CourseID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

