<%@ Page Language="C#" AutoEventWireup="true" CodeFile="blog.aspx.cs" MasterPageFile="~/NestedMasterPages/WBLCommonMasterPage.master" Inherits="blog" ValidateRequest = "false" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<head>
    <title>Post a Blog</title>
</head>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<body>
    
    <form id="form1" runat="server">
    <div>
          <table border="0" >
    <tr>
        <td>
            Title:
        </td>
    </tr>
    <tr>
        <td>
            <asp:TextBox ID="txtTitle" runat="server" Width = "550" />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            Body:
        </td>
    </tr>
    <tr>
        <td>
            <asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine" />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="Submit" />
        </td>
    </tr>
</table>
<script type="text/javascript" src="//tinymce.cachefly.net/4.0/tinymce.min.js"></script>
<script type="text/javascript">
    tinymce.init({ selector: 'textarea' });
</script>
         
 
        
           
    </div>
    </form>
    
</body>
</asp:Content>    

