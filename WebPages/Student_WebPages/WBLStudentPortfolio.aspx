<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPages/WBLStudentMasterPage.master" AutoEventWireup="true" CodeFile="WBLStudentPortfolio.aspx.cs" Inherits="WebPages_Student_WebPages_WBLStudentPortfolio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

        <title>Portfolio</title>
    <style type="text/css">
        #player {
            height: 295px;
            width: 815px;
        }
        #player2 {
            height: 271px;
            width: 811px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>This is the student portfolio page.</p>
    <asp:HyperLink ID="lnkPortfolioSearch" runat="server" 
             NavigateUrl="~/WebPages/Common_WebPages/WBLPortfolioSearch.aspx" 
             Text="Portfolio Search" />
    <asp:HyperLink ID="lnkViewPortfolio" runat="server" 
             NavigateUrl="~/WebPages/Common_WebPages/WBLViewPortfolio.aspx" 
             Text="View Portfolios" />





    <body style="height: 568px">
    <form id="form1" runat="server">
       
    <div>
        <asp:Panel ID="Panel1" runat="server" Height="1048px">
            <div style="margin-left: 434px">
            <asp:FormView ID="FormView1" runat="server" Height="29px" style="margin-left: 267px" Width="288px" DataSourceID="SqlDataSource2">
                <EditItemTemplate>
                    FirstName:
                    <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                    <br />
                    LastName:
                    <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    FirstName:
                    <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                    <br />
                    LastName:
                    <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    FirstName:
                    <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Bind("FirstName") %>' />
                    <br />
                    LastName:
                    <asp:Label ID="LastNameLabel" runat="server" Text='<%# Bind("LastName") %>' />
                    <br />
                </ItemTemplate>
            </asp:FormView>
               
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" SelectCommand="SELECT [FirstName], [LastName] FROM [Member] WHERE ([MemberID] = @MemberID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="MemberID" SessionField="StudentID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
               
                </div>
             <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Student Dropdown List<br />
             <asp:DropDownList ID="DropDownList1" runat="server" style="margin-left: 434px" DataSourceID="SqlDataSource1" DataTextField="FirstName" DataValueField="FirstName">
                </asp:DropDownList>
            <asp:Button ID="ViewPortfolios" runat="server" OnClick="ViewPortfolios_Click" style="margin-left: 418px" Text="View Portfolios" Width="131px" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" SelectCommand="SELECT [FirstName], [LastName] FROM [Member] Join Student on ([MemberID] = StudentID)">
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
            <br />
            <div id="player"></div>


           
            <br />
          
           <img alt="loading..." id="saving-indicator" src="https://pathbrite-content.s3.amazonaws.com/PpXH/P/P2DBM/snapshots-2/PpXHUPOP2DBM.original.jpg?1457184863"/>
            <iframe src="https://www.youtube.com/embed/FeZptv96QUU" width="560" height="315"></iframe>
            <iframe height="281" src="https://player.vimeo.com/video/124625318" style="margin-top: 0px" width="500"></iframe>
            &nbsp;<iframe width="560" height="315" src="https://www.youtube.com/embed/Nz72BV1LdGg"></iframe>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="MessageUser" runat="server" Height="100px" OnClick="MessageUser_Click" style="margin-left: 54px; margin-top: 1px;" Text="Message User" Width="120px" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <script>



        // 2. This code loads the IFrame Player API code asynchronously.
        var tag = document.createElement('script');

        tag.src = "https://www.youtube.com/iframe_api";
        var firstScriptTag = document.getElementsByTagName('script')[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

        // 3. This function creates an <iframe> (and YouTube player)
        //    after the API code downloads.
        var player;
        function onYouTubeIframeAPIReady() {
            player = new YT.Player('player', {
                height: '390',
                width: '640',
                videoId: '03sA4VNBDjg',
                events: {
                    'onReady': onPlayerReady,
                    'onStateChange': onPlayerStateChange
                }
            });
        }

        // 4. The API will call this function when the video player is ready.
        function onPlayerReady(event) {
            event.target.playVideo();
        }

        // 5. The API calls this function when the player's state changes.
        //    The function indicates that when playing a video (state=1),
        //    the player should play for six seconds and then stop.
        var done = false;
        function onPlayerStateChange(event) {
            if (event.data == YT.PlayerState.PLAYING && !done) {
                setTimeout(stopVideo, 6000);
                done = true;
            }
        }
        function stopVideo() {
            player.stopVideo();
        }
    </script>
            <p>
                <a href="https://vimeo.com/124625318">Lexi: It can wait</a> from <a href="https://vimeo.com/wordsbeatslife">Words Beats &amp; Life</a> on <a href="https://vimeo.com">Vimeo</a>.</p>
            <div>
            </div>
        </asp:Panel>
    </div>
    </form>
     </body>
</asp:Content>

