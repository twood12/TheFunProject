using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net.NetworkInformation;
using System.Net.Security;
using System.Net.Sockets;
using System.Net.Mail;
using System.Net;
using Microsoft.Exchange.WebServices;
using Microsoft.Exchange;
using Microsoft.Exchange.WebServices.Data;

public partial class WebPages_Common_WebPages_Inbox : System.Web.UI.Page
{
    protected void Page_PreInit(Object sender, EventArgs e)
    {
        if ((string)Session["MemberType"] == "Student")
        {
            this.MasterPageFile = "~/NestedMasterPages/WBLStudentMasterPage.master";
        }

        else if ((string)Session["MemberType"] == "Teacher")
        {
            this.MasterPageFile = "~/NestedMasterPages/WBLTeacherMasterPage.master";
        }

        else if ((string)Session["MemberType"] == "Admin")
        {
            this.MasterPageFile = "~/NestedMasterPages/WBLAdminMasterPage.master";
        }


    }




    protected void Page_Load(object sender, EventArgs e)
    {
        Session["Password"] = TextBox1.Text;
        string[] emails = new String[10];



    }
    protected void Notfication_Click(object sender, EventArgs e)
    {

    }
    protected void NewMessage_Click(object sender, EventArgs e)
    {
        Response.Redirect("Email.aspx");
    }

    protected void GotoInbox_Click(object sender, EventArgs e)
    {

        ExchangeService service = new ExchangeService(ExchangeVersion.Exchange2013_SP1);

        service.Credentials = new WebCredentials(TextBox2.Text, TextBox1.Text);
        //service.AutodiscoverUrl("someuser@somedomain.org");
        service.Url = new System.Uri("https://www.outlook.com/ews/Exchange.asmx");


        FindItemsResults<Item> findResults = service.FindItems(
           WellKnownFolderName.Inbox,
           new ItemView(10));
        ServiceResponseCollection<GetItemResponse> items =
        service.BindToItems(findResults.Select(item => item.Id), new PropertySet(BasePropertySet.FirstClassProperties, EmailMessageSchema.From, EmailMessageSchema.ToRecipients));


        foreach (Item item in findResults.Items)
        {
            item.Load();
            this.TextBox3.Text += "\r\n From: " + ((Microsoft.Exchange.WebServices.Data.EmailMessage)(item)).From.Address;
            this.TextBox3.Text += "\r\n Subject: " + item.Subject;
            this.TextBox3.Text += "\r\n" + EmailMessageSchema.TextBody;

        }






    }
}