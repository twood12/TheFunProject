using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Admin_WebPages_ReportPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lnkBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("SearchEngine.aspx", false);
    }
    protected void btnViewReport_Click(object sender, EventArgs e)
    {
        if (ddReportList.SelectedIndex == 1)
        {
            Session["SubjectID"] = getIdForTable("SubjectID", "Subject", "SubjectName", ddGroupByOptions.SelectedValue);
            gvCourseEvaluationReport.DataBind();
            gvCourseEvaluationReport.Visible = true;
        }
        else if (ddReportList.SelectedIndex == 2)
        {

        }
        else if (ddReportList.SelectedIndex == 3)
        {
            gvClassEnrollment.DataBind();
            gvClassEnrollment.Visible = true;
            //btnExportToExcel.Visible = true;
        }
    }

    // This method will get the ID from a table -> the Parameter must be unique to that table
    private int getIdForTable(string idColumn, string tableName, string parameterName, string parameterValue)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCSS"].ToString());
        con.Open();
        SqlCommand select = new SqlCommand("Select " + idColumn + " from " + tableName + " where " + parameterName + "= @" + parameterName, con);
        select.Parameters.AddWithValue("@" + parameterName, parameterValue);
        SqlDataReader reader = select.ExecuteReader();

        int id = 0;

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                id = Int32.Parse(reader[0].ToString());
            }
        }
        con.Close();
        return id;

    }
    protected void ddReportList_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Course Evaluation -> Aggregate Report by Subject
        if (ddReportList.SelectedIndex == 1)
        {
            setupCourseEvalReport();
        }
    }
    private void setupCourseEvalReport()
    {
        ddGroupByOptions.DataSource = sqlGroupByCourseSubject;
        ddGroupByOptions.DataTextField = "SubjectName";
        ddGroupByOptions.DataValueField = "SubjectName";
        ddGroupByOptions.DataBind();
        lblGroupByOptions.Text = "Select a Subject: ";
        lblGroupByOptions.Visible = true;
        ddGroupByOptions.Visible = true;
    }
    // Exporting Grids to Excel
    static void ExportGridToExcel(GridView gv)
    {
        HttpContext context = HttpContext.Current;
        context.Response.Clear();
        context.Response.Buffer = true;
        context.Response.AddHeader("content-disposition", "attachment;filename=ManageBucks.xlsx");
        context.Response.Charset = "";
        context.Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            //To Export all pages
            gv.AllowPaging = false;
            foreach (TableCell cell in gv.HeaderRow.Cells)
            {
                cell.BackColor = gv.HeaderStyle.BackColor;
            }

            foreach (GridViewRow row in gv.Rows)
            {
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = gv.AlternatingRowStyle.BackColor;
                    }

                    else
                    {
                        cell.BackColor = gv.RowStyle.BackColor;
                    }

                    cell.CssClass = "textmode";
                }
            }
            gv.RenderControl(hw);
            //style to format numbers to string
            string style = @"<style> .textmode { } </style>";
            context.Response.Write(style);
            context.Response.Output.Write(sw.ToString());
            context.Response.Flush();
            context.Response.End();
        }
    }
    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        // Course Evaluation Report Export
        if (ddReportList.SelectedIndex == 1)
        {
            ExportGridToExcel(gvCourseEvaluationReport);
        }
        else if (ddReportList.SelectedIndex == 3)
        {
            ExportGridToExcel(gvClassEnrollment);
        }


    }
    public override void VerifyRenderingInServerForm(Control control)
    {

    }
}