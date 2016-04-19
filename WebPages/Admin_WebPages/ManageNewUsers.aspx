<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPages/WBLAdminMasterPage.master" AutoEventWireup="true" CodeFile="ManageNewUsers.aspx.cs" Inherits="WebPages_Admin_WebPages_ManageNewUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <body>
        <form id="manageUsers" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" 
  AllowPaging="true" DataKeyNames="MemberID" OnPageIndexChanging="PaginateTheData" 
  PageSize="5" PagerSettings-Mode="Numeric" 
  OnRowDataBound="ReSelectSelectedRecords" EmptyDataText="No Students Available">
    <Columns> 
                <asp:TemplateField HeaderText="Select"> 
                    <ItemTemplate> 
                        <asp:CheckBox ID="chkSelect" runat="server" /> 
                    </ItemTemplate> 
                </asp:TemplateField> 
                <asp:BoundField DataField="MemberID" HeaderText="Member ID" ReadOnly="True" SortExpression="MemberID" /> 
                <asp:BoundField DataField="FirstName" HeaderText="First Name" ReadOnly="True" SortExpression="FirstName" />
                  <asp:BoundField DataField="LastName" HeaderText="Last Name" ReadOnly="True" SortExpression="LastName" />
                  
            </Columns>  
        </asp:GridView> 

            <asp:Button ID="btnAccept" runat="server" Text="Accept users" OnClick="btnAccept_Click" />
            <asp:Button ID="btnReject" runat="server" Text="Deny users" OnClick="btnReject_Click" />

            </form>
    </body>
</asp:Content>

