<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPages/WBLAdminMasterPage.master" AutoEventWireup="true" CodeFile="ManageCommunity.aspx.cs" Inherits="WebPages_Admin_WebPages_ManageCommunity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <body>
    <form id="frmCommunityEngine" runat="server">
        
        <div style="float: left;">
        <asp:Label runat="server" Text="Choose a post to delete:" ></asp:Label>
        <asp:DropDownList ID="ddPostList" runat="server" DataTextField="CommentID" DataSourceID="sqlGetCommunityItems" AutoPostBack="true" Visible="true">
        </asp:DropDownList>
       
            <asp:SqlDataSource ID="sqlGetCommunityItems" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" OldValuesParameterFormatString="original_{0}"
                SelectCommand="Select CommentID From FullPost">
                
            </asp:SqlDataSource>
            
            
            <asp:Button ID="btnDeletePost" runat="server" Text="Delete Post" OnClick="btnDeletePost_Click" />

            </div>


    </form>
    </body>
</asp:Content>

