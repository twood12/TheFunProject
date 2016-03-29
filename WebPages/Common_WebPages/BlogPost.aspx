<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BlogPost.aspx.cs" Inherits="BlogPost" ValidateRequest = "false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h2>
    Blogs</h2>
<br />
<asp:HyperLink ID="HyperLink1" NavigateUrl="~/AddBlog.aspx" Text="Add Blog" runat="server" />
<hr />
<asp:Repeater ID="rptPages" runat="server">
    <ItemTemplate>
        <%# Container.ItemIndex + 1 %>
        <asp:HyperLink ID="HyperLink2" NavigateUrl='<%# string.Format("~/Blogs/{0}/{1}.aspx", Eval("BlogId"), Eval("Slug")) %>'
            Text='<%# Eval("Title") %>' runat="server" />
    </ItemTemplate>
    <SeparatorTemplate>
        <br />
    </SeparatorTemplate>
</asp:Repeater>
    </div>
    </form>
    
</body>
</html>
