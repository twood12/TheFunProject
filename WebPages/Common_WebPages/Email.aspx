<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPages/WBLCommonMasterPage.master" AutoEventWireup="true" CodeFile="Email.aspx.cs" Inherits="WebPages_Common_WebPages_Email" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <head id="Head1">
    <title></title>
    
</head>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="Panel1" runat="server" Height="626px">
            To:<asp:TextBox ID="TextBox1" runat="server" style="margin-left: 49px"></asp:TextBox>
            <br />
            <br />
            From:<asp:TextBox ID="TextBox2" runat="server" style="margin-left: 32px" Width="119px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Password<asp:TextBox ID="TextBox4" TextMode="Password" runat="server" style="margin-left: 19px"></asp:TextBox>
            <br />
            <br />
            <br />
            Subject:&nbsp;
            <asp:TextBox ID="TextBox3" runat="server" style="margin-left: 11px"></asp:TextBox>
            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Message:<br />&nbsp;&nbsp;&nbsp;<textarea id="TextArea1" name="S1" runat="server"></textarea>
            <br />
            <br />
            <br />
            <asp:Button ID="Send" runat="server" style="margin-left: 312px" Text="Send" OnClick="Send_Click" />
        </asp:Panel>
              
    
        </div>
    <p>
        &nbsp;</p>
              
    
    </form>
</body>
</asp:Content>

