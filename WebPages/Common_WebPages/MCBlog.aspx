﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MCBlog.aspx.cs" MasterPageFile="~/NestedMasterPages/WBLCommonMasterPage.master" Inherits="MCBlog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
    html {background-color: black}
        #form1 {
          
           background-color: #000;
           font-family: Courier;
	       color: white;
	       font-size:20px;
            
        }


        .auto-style2 {
            width: 200px;
        }
         </style>


<head>
    <title>MCBlog</title>
</head>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<body>
     <a href="Topics.aspx">Back To Topics</a>
    <form id="form1" runat="server">
        <div>
    <h2>
   MC Blogs - An MC is Someone who Controls the Crowd </h2>
<br />
        <div style="margin-left: 601px">
        <asp:Repeater ID="rptPages" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>
        <%# Container.ItemIndex + 1 %>
        <asp:HyperLink ID="HyperLink" NavigateUrl='<%# string.Format("~/WebPages/Common_WebPages/{0}/{1}.aspx", Eval("PostID"), Eval("Subject")) %>'
            Text='<%# Eval("Subject") %>'  runat="server" validateRequest ="false" />
    </ItemTemplate>
    <SeparatorTemplate>
        <br />
    </SeparatorTemplate>
</asp:Repeater>
            </div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" SelectCommand="SELECT [PostID], [BlogPostDate], [PostContent], [Subject] FROM [BlogPost] WHERE ([DisciplineType] = @DisciplineType)">
            <SelectParameters>
                <asp:SessionParameter Name="DisciplineType" SessionField="DisciplineType" Type="String" />
            </SelectParameters>
            </asp:SqlDataSource>
    
    </div>
        <p>
            &nbsp;</p>
        <p>
               Rules:</p>
        <p>
            MC topics only
             </p>
    
        <asp:Button ID="AddPost" runat="server" Text="Add Post" OnClick="AddPost_Click" style="margin-left: 601px" />
    
        </p>
        <div style="margin-left: 1000px"><script src="https://www.reddit.com/r/rap/hot/.embed?limit=5&t=week" type="text/javascript"></script></div>
    </form>
   
</body>
</asp:Content>
