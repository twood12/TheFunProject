<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPages/WBLCommonMasterPage.master" AutoEventWireup="true" CodeFile="Inbox.aspx.cs" Inherits="WebPages_Common_WebPages_Inbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <head>
    <title></title>
    <style type="text/css">
        #TextArea1 {
            height: 343px;
            width: 681px;
            margin-left: 403px;
        }
    </style>
</head>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <body>
    <form id="form1" runat="server">
    <div>
    
        UserName:<asp:TextBox ID="TextBox2" TextMode="Email" runat="server" style="margin-left: 18px"></asp:TextBox>
    
    </div>
        <p>
            Password:<asp:TextBox ID="TextBox1" TextMode="Password" runat="server" style="margin-left: 18px" Width="138px"></asp:TextBox>
            <asp:Button ID="GotoInbox" runat="server" style="margin-left: 492px" Text="Go to Inbox" Width="98px" OnClick="GotoInbox_Click" />
        </p>
        <p>
    
        <asp:Button ID="NewMessage" runat="server" Text="New Message" style="margin-left: 315px" Width="135px" OnClick="NewMessage_Click" />
    
            <asp:Button ID="Notfication" runat="server" style="margin-left: 596px" Text="Notfication" Width="102px" OnClick="Notfication_Click" />
        </p>
        <p style="margin-left: 400px">
            &nbsp;Inbox:</p>
        <div style="margin-left: 403px">
          
            <asp:TextBox ID="TextBox3" TextMode="MultiLine" runat="server" Height="243px" Width="485px"></asp:TextBox>
        </div>
        
        
    </form>
    

        
</body>
</asp:Content>

