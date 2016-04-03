<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPages/WBLCommonMasterPage.master" AutoEventWireup="true" CodeFile="EditItems.aspx.cs" Inherits="WebPages_Admin_WebPages_EditItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <body>
    <form id="form1" runat="server">
    <table>
        <tr>
            <td>
                <asp:LinkButton 
                    ID="lnkBack" 
                    runat="server"
                    OnClick="lnkBack_Click">Back</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTitle" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label 
                    ID="lblTitle2" 
                    runat="server" 
                    Visible="false">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <asp:DetailsView 
                ID="dvEditSubject" 
                runat="server" 
                Height="50px" 
                Width="125px" 
                AutoGenerateRows="False" 
                BackColor="#CCCCCC" 
                BorderColor="#999999" 
                BorderStyle="Solid" 
                BorderWidth="3px" 
                CellPadding="4" 
                CellSpacing="2" 
                DataKeyNames="SubjectID" 
                DataSourceID="sqlEditDeleteSubject" 
                ForeColor="Black"
                Visible="False" AllowPaging="True" >
                <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:TemplateField HeaderText="SubjectID" InsertVisible="False" SortExpression="SubjectID">
                        <EditItemTemplate>
                            <asp:Label ID="lblEditDeleteCourse" runat="server" Text='<%# Eval("SubjectID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEditDeleteCourse" runat="server" Text='<%# Bind("SubjectID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SubjectName" SortExpression="SubjectName">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtSubjectName" runat="server" Text='<%# Bind("SubjectName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtSubjectName" runat="server" Text='<%# Bind("SubjectName") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblSubjectName" runat="server" Text='<%# Bind("SubjectName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="lnkUpdateSubject" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lnkCancelSubject" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEditSubject" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lnkDeleteSubject" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="sqlEditDeleteSubject" runat="server" ConnectionString="<%$ ConnectionStrings:DBXY %>" DeleteCommand="DELETE FROM [Subject] WHERE [SubjectID] = @SubjectID" InsertCommand="INSERT INTO [Subject] ([SubjectName]) VALUES (@SubjectName)" SelectCommand="SELECT * FROM [Subject] WHERE ([SubjectName] = @SubjectName)" UpdateCommand="UPDATE [Subject] SET [SubjectName] = @SubjectName WHERE [SubjectID] = @SubjectID">
                <DeleteParameters>
                    <asp:Parameter Name="SubjectID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SubjectName" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="SubjectName" SessionField="SubjectName" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SubjectName" Type="String" />
                    <asp:Parameter Name="SubjectID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </tr>
    </table>
    </form>
</body>
</asp:Content>

