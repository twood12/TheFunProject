<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserRegistration.aspx.cs" Inherits="UserRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            color: white;
            background-color: #172129;
            margin-top: 40px;
            
            font-size: 14px;
            font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    
            background-repeat: no-repeat;
        }

        #buttonBox{
            margin-top: 20px;

        }

        div {
            margin-top: 15px;
        }


    </style>
</head>
<body>

    <div
        class="container">
        <header>
          <img src="http://www.wblinc.org/wp-content/uploads/2015/05/logo-transparent-04-30-15.png" alt="Words Beats & Life Inc. | Teaching Convening Presenting Hip-Hop Since 2002" />
            
        </header>
        </div>
    <form id="registration" runat="server">
         <h2>Words, Beats, and Life Apply Form</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new: </h4>
        <hr />
        <asp:RadioButtonList ID="userTypeList" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table">
            <asp:ListItem Text="Student" Value="student"></asp:ListItem>
        </asp:RadioButtonList> 
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtFirstName">First Name:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtFirstName"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstName"
                     ErrorMessage="The first name field is required." />
            </div>
        </div>
        
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtLastName">First Name:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtLastName"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastName"
                     ErrorMessage="The last name field is required." />
            </div>
        </div>
        
        
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtEmail">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtEmail"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                     ErrorMessage="The email field is required." />
            </div>
        </div>
        <div>
            <asp:Label runat="server" AssociatedControlID="txtPassword">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword"
                     ErrorMessage="The password field is required." />
            </div>
        </div>
        <div>
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                     Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="txtPassword" ControlToValidate="ConfirmPassword"
                     Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
        <div id="buttonBox">
            
        <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register"/>
            
        </div>
    </div>
    
    </form>
</body>
</html>
