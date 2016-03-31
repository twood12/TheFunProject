<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPages/WBLStudentMasterPage.master" AutoEventWireup="true" CodeFile="WBLStudentEvaluations.aspx.cs" Inherits="WebPages_Student_WebPages_WBLStudentEvaluations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>This is the student evaluations page.</p>
    <asp:HyperLink ID="lnkEvaluationsToDo" runat="server" 
             NavigateUrl="~/WebPages/Common_WebPages/WBLToDoEvaluations.aspx" 
             Text="Evaluations To-Do" />


    <form id="frmStudentEvaluations" runat ="server" method="post">
        <asp:Label ID="lblStudentCourseList" runat="server" Text="Choose a course:" ></asp:Label>
        <asp:DropDownList ID="ddStudentCourseList" runat="server" DataTextField="Name" DataSourceID="courseListCommand" AutoPostBack="true" Visible="true" OnSelectedIndexChanged="ddCourseList_SelectedIndexChanged">
            <asp:ListItem Value="" Text="" runat="server"></asp:ListItem>
        </asp:DropDownList>

        <br />
        <asp:Label runat="server" Text="Choose a Teacher:" ></asp:Label>
        <asp:DropDownList ID="ddTeacherEvaluations" runat="server" DataTextField="Name" DataSourceID="teacherEvalCommand" AutoPostBack="true" Visible="true" OnSelectedIndexChanged="ddTeacherEvaluations_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <asp:Button runat="server" Text="Evaluate Teacher" ID="btnEvaluateTeacher" Visible="true" OnClick="btnEvaluateTeacher_Click" />

        


    </form>
    <asp:SqlDataSource id="courseListCommand" ConnectionString="<%$ ConnectionStrings:DBXY %>" SelectCommand="Select CONVERT(varchar(10),C.CourseID)+ '-' + C.CourseName as Name From Course C JOIN ClassSchedule CS on C.CourseID = CS.CourseID AND Cs.StudentID = @StudentID" runat="server" >
        <SelectParameters>
            <asp:SessionParameter  Name="StudentID" SessionField="MemberID" Type="Int32" />
        </SelectParameters>

    </asp:SqlDataSource>

        <asp:SqlDataSource id="teacherEvalCommand" ConnectionString="<%$ ConnectionStrings:DBXY %>" SelectCommand="Select distinct CONVERT(varchar(10),M.MemberID) + '-' + M.FirstName + ' ' + M.LastName as Name From Member M JOIN ClassSchedule CS on CS.TeacherID = M.MemberID AND CS.CourseID = @CourseID" runat="server" >
        <SelectParameters>
            <asp:SessionParameter Name="CourseID" SessionField="stuEvaluationCourseID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>




</asp:Content>

