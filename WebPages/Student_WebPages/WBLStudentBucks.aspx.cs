using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class WebPages_Student_WebPages_WBLStudentBucks : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {



    }


    protected void Item_Click(object sender, EventArgs e)
    {







    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
    protected void ExportToExcel4_Click(object sender, EventArgs e)
    {

        ExportToExcel2(sender, e);

    }
    protected void ExportToExcel2(object sender, EventArgs e)
    {

        Response.Clear();

        Response.Buffer = true;

        Response.AddHeader("content-disposition", "attachment;filename=BuckItems.xls");

        Response.Charset = "";

        Response.ContentType = "application/vnd.ms-excel";

        using (StringWriter sw = new StringWriter())
        {

            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //To Export all pages

            GridView1.AllowPaging = false;

            this.GridView1.DataBind();

            foreach (TableCell cell in GridView1.HeaderRow.Cells)
            {

                cell.BackColor = GridView1.HeaderStyle.BackColor;

            }

            foreach (GridViewRow row in GridView1.Rows)
            {

                foreach (TableCell cell in row.Cells)
                {

                    if (row.RowIndex % 2 == 0)
                    {

                        cell.BackColor = GridView1.AlternatingRowStyle.BackColor;

                    }

                    else
                    {

                        cell.BackColor = GridView1.RowStyle.BackColor;

                    }

                    cell.CssClass = "textmode";

                }

            }
            GridView1.RenderControl(hw);

            //style to format numbers to string

            string style = @"<style> .textmode { } </style>";

            Response.Write(style);

            Response.Output.Write(sw.ToString());

            Response.Flush();

            Response.End();




        }

    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
       server control at run time. */
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            Int16 num = Convert.ToInt16(e.CommandArgument);
            Session["ItemID"] = GridView2.Rows[num].Cells[3].Text;
        }
        Response.Redirect("BucksPurchaseableItemPage.aspx");
    }
}