<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPages/WBLTeacherMasterPage.master" AutoEventWireup="true" CodeFile="WBLTeacherReports.aspx.cs" Inherits="WebPages_Teacher_WebPages_WBLTeacherReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>This is the teacher reports page.</p>

    <form id="frmReports" runat="server">
        <asp:Button id="btnAttedanceReport" runat="server" Text="Attendance Report" OnClick="btnAttedanceReport_Click"/>
    </form>
</asp:Content>

