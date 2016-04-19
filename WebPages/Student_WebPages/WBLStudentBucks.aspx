<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPages/WBLStudentMasterPage.master" AutoEventWireup="true" CodeFile="WBLStudentBucks.aspx.cs" Inherits="WebPages_Student_WebPages_WBLStudentBucks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
html {background-color: black}
        #form1 {
                     
           font-family: Courier;
	       font-size:20px;
            
        }


        .auto-style2 {
            width: 200px;
        }
         </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>This is the student bucks page.</p>
    <asp:HyperLink ID="lnkBucksIndividual" runat="server" 
             NavigateUrl="~/WebPages/Student_WebPages/WBLBucksIndividualItem.aspx" 
             Text="Individual Bucks Item" />


    <body>
    <header><asp:Image ID="Image1" runat="server" /></header>

    
    <form id="form1" runat="server">
    <div>
    <h2>Bucks Home Page</h2>
    </div>
        <div style="margin-left: 601px">
            <asp:GridView ID="GridView1" runat="server" Visible="False" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="ItemID" DataSourceID="SqlDataSource1" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                <Columns>
                    <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                    <asp:BoundField DataField="ItemPrice" HeaderText="ItemPrice" SortExpression="ItemPrice" />
                    <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" ReadOnly="True" SortExpression="ItemID" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="ItemID" DataSourceID="SqlDataSource1" ForeColor="Black" OnRowCommand="GridView2_RowCommand" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" AllowSorting="True">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                    <asp:BoundField DataField="ItemPrice" HeaderText="ItemPrice" SortExpression="ItemPrice" />
                    <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" ReadOnly="True" SortExpression="ItemID" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            </div>
        
        Total Bucks Amount<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" SelectCommand="SELECT [ItemName], [ItemPrice], [ItemID] FROM [BuckStore]" DeleteCommand="DELETE FROM [BuckStore] WHERE [ItemID] = @ItemID" InsertCommand="INSERT INTO [BuckStore] ([ItemName], [ItemPrice]) VALUES (@ItemName, @ItemPrice)" UpdateCommand="UPDATE [BuckStore] SET [ItemName] = @ItemName, [ItemPrice] = @ItemPrice WHERE [ItemID] = @ItemID">
            <DeleteParameters>
                <asp:Parameter Name="ItemID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="ItemPrice" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="ItemPrice" Type="Decimal" />
                <asp:Parameter Name="ItemID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" SelectCommand="SELECT [AccountNumber], [AccountBalance] FROM [BuckAccount] WHERE ([StudentID] = @StudentID)">
            <SelectParameters>
                <asp:SessionParameter Name="StudentID" SessionField="MemberID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" SelectCommand="SELECT [AccountNumber], [PurchaseDate], [PurchaseQty], [TransactionAmt] FROM [BuckTansaction] WHERE ([AccountNumber] = @AccountNumber)">
            <SelectParameters>
                <asp:SessionParameter Name="AccountNumber" SessionField="MemberID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
&nbsp;<asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="AccountNumber" DataSourceID="SqlDataSource2">
            <EditItemTemplate>
                AccountNumber:
                <asp:Label ID="AccountNumberLabel1" runat="server" Text='<%# Eval("AccountNumber") %>' />
                <br />
                AccountBalance:
                <asp:TextBox ID="AccountBalanceTextBox" runat="server" Text='<%# Bind("AccountBalance") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <InsertItemTemplate>
                AccountBalance:
                <asp:TextBox ID="AccountBalanceTextBox" runat="server" Text='<%# Bind("AccountBalance") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                AccountNumber:
                <asp:Label ID="AccountNumberLabel" runat="server" Text='<%# Eval("AccountNumber") %>' />
                <br />
                AccountBalance:
                <asp:Label ID="AccountBalanceLabel" runat="server" Text='<%# Bind("AccountBalance") %>' />
                <br />

            </ItemTemplate>
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        </asp:FormView>
        <div>
            <p>
            &nbsp;</p>
        <p>
            <p>
            &nbsp;</p>
        <p>
            <p>
                Recent Transactions</p>
        <p>
        <asp:FormView ID="FormView2" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSource3">
            <EditItemTemplate>
                AccountNumber:
                <asp:TextBox ID="AccountNumberTextBox" runat="server" Text='<%# Bind("AccountNumber") %>' />
                <br />
                PurchaseDate:
                <asp:TextBox ID="PurchaseDateTextBox" runat="server" Text='<%# Bind("PurchaseDate") %>' />
                <br />
                PurchaseQty:
                <asp:TextBox ID="PurchaseQtyTextBox" runat="server" Text='<%# Bind("PurchaseQty") %>' />
                <br />
                TransactionAmt:
                <asp:TextBox ID="TransactionAmtTextBox" runat="server" Text='<%# Bind("TransactionAmt") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <InsertItemTemplate>
                AccountNumber:
                <asp:TextBox ID="AccountNumberTextBox" runat="server" Text='<%# Bind("AccountNumber") %>' />
                <br />
                PurchaseDate:
                <asp:TextBox ID="PurchaseDateTextBox" runat="server" Text='<%# Bind("PurchaseDate") %>' />
                <br />
                PurchaseQty:
                <asp:TextBox ID="PurchaseQtyTextBox" runat="server" Text='<%# Bind("PurchaseQty") %>' />
                <br />
                TransactionAmt:
                <asp:TextBox ID="TransactionAmtTextBox" runat="server" Text='<%# Bind("TransactionAmt") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                AccountNumber:
                <asp:Label ID="AccountNumberLabel" runat="server" Text='<%# Bind("AccountNumber") %>' />
                <br />
                PurchaseDate:
                <asp:Label ID="PurchaseDateLabel" runat="server" Text='<%# Bind("PurchaseDate") %>' />
                <br />
                PurchaseQty:
                <asp:Label ID="PurchaseQtyLabel" runat="server" Text='<%# Bind("PurchaseQty") %>' />
                <br />
                TransactionAmt:
                <asp:Label ID="TransactionAmtLabel" runat="server" Text='<%# Bind("TransactionAmt") %>' />
                <br />

            </ItemTemplate>
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        </asp:FormView>
            </div>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="ExportToExcel4" 
                runat="server" 
                style="margin-left: 1030px" 
                Text="ExportToExcel" 
                OnClick="ExportToExcel4_Click" 
                Visible="true" />
        </p>
    </form>
    

</body>


</asp:Content>

