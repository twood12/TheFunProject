<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CommunityBlogHomePage.aspx.cs" MasterPageFile="~/NestedMasterPages/WBLCommonMasterPage.master" Inherits="CommunityBlogHomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<head>
    <title>CommunityBlogHome</title>
</head>

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
        }
         </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   
<body>
     <header> <img src="http://thyblackman.com/wp-content/uploads/2015/08/hiphop-2015.jpg" alt="Words Beats & Life Inc. | Teaching Convening Presenting Hip-Hop Since 2002" />
            </header>
    <form id="form1" runat="server">
    <div>
        <h2>Community Blog - WE ARE HIP HOP!!</h2>
    
        <br />
        <br />
&nbsp;&nbsp;
        <asp:Button ID="Topic" runat="server" OnClick="Topic_Click" style="margin-left: 222px" Text="Topic" Width="199px" />
        <asp:Button ID="Notification" runat="server" OnClick="Notification_Click" style="margin-left: 563px" Text="Notification" Width="183px" />
    
    </div>
        <div style="margin-left: 600px">
                                                       <h2>Featured Student</h2>
            </div>
        <p>
            &nbsp;</p>
        <p>
            Community
            Rules:</p>
        <p>
            Respect yourself and your peers</p>
        <p>
            Blog<span style="color: white; font-family: Verdana, Arial; font-size: 13.4px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.1429px; orphans: auto; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: black;"> up if you forever a fan of Hip Hop</span><br style="box-sizing: border-box; color: rgb(0, 0, 0); font-family: Verdana, Arial; font-size: 13.4px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.1429px; orphans: auto; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(204, 204, 221);" />
            We<span style="color: white; font-family: Verdana, Arial; font-size: 13.4px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.1429px; orphans: auto; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: black;"> wake up Hip Hop</span><br style="box-sizing: border-box; color: rgb(0, 0, 0); font-family: Verdana, Arial; font-size: 13.4px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.1429px; orphans: auto; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(204, 204, 221);" />
            <span style="color: white; font-family: Verdana, Arial; font-size: 13.4px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.1429px; orphans: auto; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: black;">Go to sleep Hip Hop</span><br style="box-sizing: border-box; color: rgb(0, 0, 0); font-family: Verdana, Arial; font-size: 13.4px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.1429px; orphans: auto; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(204, 204, 221);" />
            <span style="color: white; font-family: Verdana, Arial; font-size: 13.4px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.1429px; orphans: auto; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: black;">Dream bout Hip Hop</span><br style="box-sizing: border-box; color: rgb(0, 0, 0); font-family: Verdana, Arial; font-size: 13.4px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.1429px; orphans: auto; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(204, 204, 221);" />
            <span style="color: white; font-family: Verdana, Arial; font-size: 13.4px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.1429px; orphans: auto; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: black;">Cause we are Hip Hop</span></p>
        <p>
            No Censorship*</p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>

        <div style="margin-left: 600px">
                                                       <h2>What's HOT on the BLOCK! </h2>
            </div>
<br />
        <div style="margin-left: 600px">
        <asp:Repeater ID="rptPages" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>
        <%# Container.ItemIndex + 1 %>
        <asp:HyperLink ID="HyperLink" NavigateUrl='<%# string.Format("~/blog/{0}/{1}.aspx", Eval("PostID"), Eval("Subject")) %>'
            Text='<%# Eval("Subject") %>'  runat="server" validateRequest ="false" />
    </ItemTemplate>
    <SeparatorTemplate>
        <br />
    </SeparatorTemplate>
</asp:Repeater>
            </div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=WBL;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [PostID], [BlogPostDate], [PostContent], [Subject] FROM [BlogPost]"></asp:SqlDataSource>
    
   
        <p>
            &nbsp;</p>
        <p>
    </form>
</body>

</asp:Content>