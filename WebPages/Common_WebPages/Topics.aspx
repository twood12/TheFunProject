<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/NestedMasterPages/WBLCommonMasterPage.master" CodeFile="Topics.aspx.cs" Inherits="Topics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
    html {background-color: black}
        #form1 {
          
           background-color: #000;
           font-family: Courier;
	       color: white;
	       font-size:20px;
            
        }
         </style>


<head>
   
    <title>Topics</title>

</head>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<body>
     <a href="CommunityBlogHomePage.aspx">Back To Community</a>
    <form id="form1" runat="server">
    <div>
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TOPICS
    
    </div>
        <asp:Button ID="DJ" runat="server" Text="DJ" OnClick="DJ_Click" style="margin-left: 100px" Width="120px" Height="82px" BackColor="DarkRed" />
        <asp:Button ID="MC" runat="server" OnClick="MC_Click" style="margin-left: 466px" Text="MC" Width="120px" Height="82px" BackColor="Crimson" />
        <p>
            <asp:Button ID="Breaking" runat="server" OnClick="Breaking_Click" style="margin-left: 100px" Text="Breaking" Width="120px" Height="82px" BackColor="FireBrick"  />
            <asp:Button ID="Graffti" runat="server" OnClick="Graffti_Click" style="margin-left: 466px" Text="Graffti" Width="120px" Height="82px" BackColor="IndianRed"/>
        </p>
        <asp:Button ID="Knowledge" runat="server" OnClick="Knowledge_Onclick" style="margin-left: 354px" Text="Knowledge/Misc" Width="254px" Height="74px" BackColor="LightSalmon" />
        
    </form>


    <iframe width="560" height="315" src="https://www.youtube.com/embed/DQ7szXlJoe0" onloadstart="True" ></iframe>
</body>
</asp:Content>

    

