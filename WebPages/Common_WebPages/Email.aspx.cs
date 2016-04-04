using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Windows.Forms;

public partial class WebPages_Common_WebPages_Email : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["password"] = TextBox4.Text;

    }
    protected void Send_Click(object sender, EventArgs e)
    {

        MailMessage mail = new MailMessage();
        mail.Subject = TextBox3.Text;
        mail.From = new MailAddress(TextBox2.Text);
        mail.To.Add(TextBox1.Text);
        mail.Body = TextArea1.InnerText;
        mail.IsBodyHtml = true;



        SmtpClient smtp = new SmtpClient("smtp.outlook.com", 587);
        smtp.EnableSsl = true;
        smtp.UseDefaultCredentials = false;
        NetworkCredential netCre = new NetworkCredential(TextBox2.Text, TextBox4.Text);
        smtp.Credentials = netCre;


        try
        {
            smtp.Send(mail);
            MessageBox.Show("Message sent", "Important Message");
        }
        catch (Exception)
        {
            MessageBox.Show("Message failed to send.", "Important Message");
        }
        Response.Redirect("Inbox.aspx");












    }

    public MailAddress to { get; set; }


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
}