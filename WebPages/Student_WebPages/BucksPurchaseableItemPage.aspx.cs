using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Data.SqlClient;

public partial class WebPages_Student_WebPages_BucksPurchaseableItemPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void PurchaseItem_Click(object sender, EventArgs e)
    {



        System.Windows.Forms.MessageBox.Show("You're teacher has been notify about your purchase. Your bucks have been removed and you will recieve your item soon", "Important Message");
    }
}