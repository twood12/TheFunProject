<%@ Page Language="C#" AutoEventWireup="true" CodeFile="blog.aspx.cs" Inherits="blog" ValidateRequest = "false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Post a Blog</title>
</head>
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
    
</html>
