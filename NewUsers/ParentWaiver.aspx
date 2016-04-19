<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ParentWaiver.aspx.cs" Inherits="NewUsers_ParentWaiver" %>

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
    <form id="form1" runat="server">
    <div>
       

        <h2>ACCIDENT WAIVER AND RELEASE OF LIABILITY FORM</h2>
        <hr />
        <p>
            I HEREBY ASSUME ALL OF THE RISKS OF PARTICIPATING IN ANY/ALL ACTIVITIES ASSOCIATED WITH THIS PROGRAM, including by way of example and not limitation, any risks that may arise from negligence or carelessness on the part of the persons or entities being released, from dangerous or defective equipment or property owned, maintained, or controlled by them, or because of their possible liability without fault. 
        </p>
        <br />
        <p>
            I certify that I am physically fit, have sufficiently prepared or trained for participation in this activity, and have not been advised to not participate by a qualified medical professional. I certify that there are no health-related reasons or problems which preclude my participation in this activity. 
I acknowledge that this Accident Waiver and Release of Liability Form will be used by the program holders, sponsors, and organizers of the activity in which I may participate, and that it will govern my actions and responsibilities at said activity. 

        </p>
        <br />
        <p>
            In consideration of my application and permitting me to participate in this activity, I hereby take action for myself, my executors, administrators, heirs, next of kin, successors, and assigns as follows: 
(A) I WAIVE, RELEASE, AND DISCHARGE from any and all liability, including but not limited to, liability arising from the negligence or fault of the entities or persons released, for my death, disability, personal injury, property damage, property theft, or actions of any kind which may hereafter occur to me including my traveling to and from this activity, THE FOLLOWING ENTITIES OR PERSONS: Words, Beats, and Life, (WBL) and/or their directors, officers, employees, volunteers, representatives, and agents, and the activity holders, sponsors, and volunteers; 
(B) INDEMNIFY, HOLD HARMLESS, AND PROMISE NOT TO SUE the entities or persons mentioned in this paragraph from any and all liabilities or claims made as a result of participation in this activity, whether caused by the negligence of release or otherwise. 


        </p>
        <br />
        <p>
            I acknowledge that WBL and their directors, officers, volunteers, representatives, and agents are NOT responsible for the errors, omissions, acts, or failures to act of any party or entity conducting a specific activity on their behalf. 

        </p>
        <br />

        <p>
            I acknowledge that this activity may involve a test of a person's physical and mental limits and carries with it the potential for death, serious injury, and property loss. The risks include, but are not limited to, those caused by terrain, facilities, temperature, weather, condition of participants, equipment, vehicular traffic, lack of hydration, and actions of other people including, but not limited to, participants, volunteers, monitors, and/or producers of the activity. These risks are not only inherent to participants, but are also present for volunteers. 

        </p>
        <br />
        <p>
            I hereby consent to receive medical treatment which may be deemed advisable in the event of injury, accident, and/or illness during this activity. 
I understand while participating in this activity, I may be photographed. I agree to allow my photo, video, or film likeness to be used for any legitimate purpose by the activity holders, producers, sponsors, organizers, and assigns. 

        </p>
        <br />
        <p>
            The Accident Waiver and Release of Liability Form shall be construed broadly to provide a release and waiver to the maximum extent permissible under applicable law. 
I CERTIFY THAT I HAVE READ THIS DOCUMENT AND I FULLY UNDERSTAND ITS CONTENT. I AM AWARE THAT THIS IS A RELEASE OF LIABILITY AND A CONTRACT AND I SIGN IT OF MY OWN FREE WILL. 


        </p>
        <br />

        <asp:Label ID="lblParentSignature" Text="Parent/Guardian  Signature " runat="server" AssociatedControlID="txtParentSignature"/>
        <asp:TextBox ID="txtParentSignature" runat="server"></asp:TextBox>

        <asp:Label ID="lblSignatureDate" Text="Date" runat="server" AssociatedControlID="txtSignatureDate"/>
        <asp:TextBox ID="txtSignatureDate" runat="server"></asp:TextBox>


        <asp:Button ID="btnApplySignature" runat="server" OnClick="btnApplySignature_Click" Text="Submit Signature" />

    </div>
    </form>
</body>
</html>
