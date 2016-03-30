<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DisplayBlog.aspx.cs" Inherits="DisplayBlog" ValidateRequest = "false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    
    <form id="form1" runat="server">
    <div>
    <h2>
    <asp:Label ID="lblTitle" runat="server" /></h2>
<hr />
<asp:Label ID="lblBody" runat="server" />
    </div>

        Comments
        <asp:Label ID="lblComments" runat="server" /> 
         
        
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=WBL;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="select b.PostComment from BlogPost c join FullPost d on d.PostID = c.PostID Join BlogPostComment b on b.CommentID = d.CommentID  where c.PostID = @PostID; ">
            <SelectParameters>
                <asp:RouteParameter Name="PostID" RouteKey="PostID" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
            <ItemTemplate>
                PostComment:
                <asp:Label ID="PostCommentLabel" runat="server" Text='<%# Eval("PostComment") %>' />
                <br />
<br />
            </ItemTemplate>
        </asp:DataList>
        
        <tr>
        <td>
            <asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine" />
        </td>
    </tr>
        <script type="text/javascript" src="//tinymce.cachefly.net/4.0/tinymce.min.js"></script>
<script type="text/javascript">
    tinymce.init({ selector: 'textarea' });
</script>


        <asp:Button ID="AddComment" runat="server" Text="AddComment" OnClick="AddComment_Click" />
        <p>
            <asp:Button ID="Return" runat="server" Text="Return" OnClick="Return_Click" />
        </p>
    </form>
</body>
</html>
