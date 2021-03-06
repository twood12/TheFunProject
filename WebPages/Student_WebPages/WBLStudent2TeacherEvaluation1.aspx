﻿<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPages/WBLStudentMasterPage.master" AutoEventWireup="true" CodeFile="WBLStudent2TeacherEvaluation1.aspx.cs" Inherits="WebPages_Student_WebPages_WBLStudent2TeacherEvaluation1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <body>
    <form id="frmTeacherEvaluation1" runat="server">
    <div>
    <table>
        <tr>
         <th>WBL DJ Class Evaluation</th>
        </tr>
        <tr><td>What is your name?</td></tr>
        <tr><td>Your answers are confidential</td></tr>
        <tr><td><asp:TextBox ID="txtStudentName" runat="server" name="txtStudentName"></asp:TextBox></td></tr>
        <tr><td>How did you hear about this class?</td></tr>
        <asp:RadioButtonList ID="rdoHearAboutClass" runat="server" name="rdoHearAboutClass">
            <asp:ListItem>Facebook</asp:ListItem>
            <asp:ListItem>Twitter</asp:ListItem>
            <asp:ListItem>Friend</asp:ListItem>
            <asp:ListItem>Parent/Guardian</asp:ListItem>
            <asp:ListItem>Teacher/Counselor</asp:ListItem>
            <asp:ListItem>Not Sure</asp:ListItem>
        </asp:RadioButtonList>
        <tr><td>Your Experience in Class</td></tr>
        <tr><td>Do you feel safe/comfortable in class?</td></tr>
        <asp:RadioButtonList ID="rdoSafety" runat="server" name="rdoSafety">
            <asp:ListItem>Always</asp:ListItem>
            <asp:ListItem>Most of the Time</asp:ListItem>
            <asp:ListItem>Sometimes</asp:ListItem>
            <asp:ListItem>Never</asp:ListItem>
        </asp:RadioButtonList>
        <tr><td>If you answered sometime or never - what needs to change to make you feel safe/comfortable always or most of the time?</td></tr>
        <tr><td><asp:TextBox ID="txtSafetyAnswers" runat="server" name="txtSafetyAnswers"></asp:TextBox></td></tr>
        <tr><td>What skills have you developed since attending?</td></tr>
        <tr><td><asp:TextBox ID="txtSkills" runat="server" name="txtSkills"></asp:TextBox></td></tr>
     </table>
     
        <asp:Button ID="btnNextPage1" runat="server" Text="Next" OnClick="Next_Click" />
    </div>
    </form>
</body>
</asp:Content>

