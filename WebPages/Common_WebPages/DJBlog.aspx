<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DJBlog.aspx.cs" Inherits="DJBlog" validateRequest ="false"%>

<!DOCTYPE html>
<style type="text/css">
    html {background-color: black}
        #form1 {
          
           background-color: #000;
           font-family: Courier;
	       color: white;
	       font-size:20px;
            
        }
        .auto-style1 {
            background-color: #000;
        }

        .auto-style2 {
            width: 200px;
        }         </style>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  
    <title>DJBlog</title>
</head>
      
<body>
    <a href="Topics.aspx">Back To Topics</a>
    <form id="form1" runat="server">
    <div>
        <h2>
   DJ Blogs - DJing is a Culture!</h2>
        
<br />
         <div style="margin-left: 601px">
        <asp:Repeater ID="rptPages" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>
        <%# Container.ItemIndex + 1 %>
        <asp:HyperLink ID="HyperLink" NavigateUrl='<%# string.Format("~/blog/{0}/{1}.aspx", Eval("PostID"), Eval("Subject")) %>'
            Text='<%# Eval("Subject") %>' runat="server" validateRequest ="false" />
    </ItemTemplate>
    <SeparatorTemplate>
        <br />
    </SeparatorTemplate>
</asp:Repeater>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WBLConnectionString %>" SelectCommand="SELECT [PostID], [BlogPostDate], [Subject], [PostContent] FROM [BlogPost] WHERE ([DisciplineType] = @DisciplineType2)">
                 <SelectParameters>
                     <asp:SessionParameter Name="DisciplineType2" SessionField="DisciplineType" Type="String" />
                 </SelectParameters>
             </asp:SqlDataSource>
    </div>
      
    
    </div>
        <p>
            &nbsp;</p>
             Rules:<p>
        <p>
            MC topics only
             </p>
        
        <p>
    
        <asp:Button ID="AddPost" runat="server" Text="Add Post" OnClick="AddPost_Click" style="margin-left: 601px" />
    
        </p>
        <div style="margin-left: 1000px" ><script src="https://www.reddit.com/r/hiphop/hot/.embed?limit=10&t=week" type="text/javascript"></script></div>
    </form>
   
    
</body>
</html>
