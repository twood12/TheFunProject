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

    <asp:SqlDataSource id="studentEvalCommand" ConnectionString="<%$ ConnectionStrings:DBXY %>" SelectCommand="Select distinct CONVERT(varchar(10),M.MemberID) + '-' + M.FirstName + ' ' + M.LastName + ',' + M.Email as [Name] From Member M JOIN Student S on M.MemberID = S.StudentID JOIN ClassSchedule CS ON CS.StudentID = S.StudentID JOIN Course C on C.CourseID = CS.CourseID WHERE cs.TeacherID = @MemberID AND C.CourseID = @CourseID" runat="server" >
        <SelectParameters>
            <asp:SessionParameter Name="CourseID" SessionField="EvaluationCourseID" Type="Int32" />
            <asp:SessionParameter Name="MemberID" SessionField="MemberID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource id="courseListCommand" ConnectionString="<%$ ConnectionStrings:DBXY %>" SelectCommand="SELECT distinct CONVERT(varchar(10),C.CourseID) + '-' + C.CourseName as CourseTitle FROM Course C JOIN ClassSchedule CS on C.CourseID = Cs.CourseID WHERE (CS.TeacherID = @TeacherID)" runat="server">
        <SelectParameters>
            <asp:SessionParameter Name="TeacherID" SessionField="MemberID" Type="Int32" />
        </SelectParameters>
        
    </asp:SqlDataSource>
</asp:Content>

