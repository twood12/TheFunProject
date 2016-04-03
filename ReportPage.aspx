<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReportPage.aspx.cs" Inherits="WebPages_ReportPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:LinkButton 
            ID="lnkBack" 
            runat="server" 
            Text ="Back"
            OnClick="lnkBack_Click">
        </asp:LinkButton>
    </div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div>
        <div style="width:200px; float:left">
            <asp:Label ID="lblSelectReport" runat="server" Text="Select a Report to View: "></asp:Label>
        </div>
        <div style="width:200px; float:initial">
            <asp:DropDownList 
                ID="ddReportList" 
                runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddReportList_SelectedIndexChanged">
                <asp:ListItem>Report List</asp:ListItem>
                <asp:ListItem>Course Evaluation</asp:ListItem>
                <asp:ListItem>StudentTest</asp:ListItem>
            </asp:DropDownList>
        </div>
        </div>
        <div>
            <div style="width:200px; float:left">
                <asp:Label 
                    ID="lblGroupByOptions" 
                    runat="server" 
                    Visible="false" >
                </asp:Label>
            </div>
            <div style="width:200px; float:initial">
                <asp:DropDownList 
                    ID="ddGroupByOptions" 
                    runat="server"
                    Visible="false" Width="130px" >
                </asp:DropDownList>
            </div>
        </div>
        <div>
            <div style ="width:200px; float:left">

            </div>
            <div style ="width:200px; float:initial">
                <asp:Button 
                    ID="btnViewReport" 
                    runat="server" 
                    Text="Display" Width="130px" OnClick="btnViewReport_Click" />
            </div>
        </div>
        <div>
            <asp:SqlDataSource 
                ID="sqlGroupByCourseSubject" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:WBLConnectionString %>" 
                SelectCommand="SELECT DISTINCT [SubjectName] FROM [Subject]">
            </asp:SqlDataSource>
        </div>
        <hr />
        <div>
            <div>
                <div style ="width:342px; float:left"></div>
                <div style ="float:initial">
                <asp:GridView 
                     ID="gvCourseEvaluationReport" 
                     runat="server"
                     Visible="False" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="sqlCourseEvaluation">
                    <Columns>
                        <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                        <asp:BoundField DataField="Difficulty" HeaderText="Difficulty" SortExpression="Difficulty" />
                        <asp:BoundField DataField="SubjectName" HeaderText="SubjectName" SortExpression="SubjectName" />
                        <asp:BoundField DataField="New Things" HeaderText="New Things" ReadOnly="True" SortExpression="New Things" />
                        <asp:BoundField DataField="Learn" HeaderText="Learn" ReadOnly="True" SortExpression="Learn" />
                        <asp:BoundField DataField="Mediums" HeaderText="Mediums" ReadOnly="True" SortExpression="Mediums" />
                        <asp:BoundField DataField="MakeFriends" HeaderText="MakeFriends" ReadOnly="True" SortExpression="MakeFriends" />
                        <asp:BoundField DataField="Motivation" HeaderText="Motivation" ReadOnly="True" SortExpression="Motivation" />
                        <asp:BoundField DataField="Happy" HeaderText="Happy" ReadOnly="True" SortExpression="Happy" />
                        <asp:BoundField DataField="Future" HeaderText="Future" ReadOnly="True" SortExpression="Future" />
                        <asp:BoundField DataField="WorkArtists" HeaderText="WorkArtists" ReadOnly="True" SortExpression="WorkArtists" />
                        <asp:BoundField DataField="Stress" HeaderText="Stress" ReadOnly="True" SortExpression="Stress" />
                        <asp:BoundField DataField="Respect" HeaderText="Respect" ReadOnly="True" SortExpression="Respect" />
                        <asp:BoundField DataField="Negativity" HeaderText="Negativity" ReadOnly="True" SortExpression="Negativity" />
                        <asp:BoundField DataField="Creative" HeaderText="Creative" ReadOnly="True" SortExpression="Creative" />
                        <asp:BoundField DataField="Careers" HeaderText="Careers" ReadOnly="True" SortExpression="Careers" />
                        <asp:BoundField DataField="CareerGoals" HeaderText="CareerGoals" ReadOnly="True" SortExpression="CareerGoals" />
                        <asp:BoundField DataField="Community" HeaderText="Community" ReadOnly="True" SortExpression="Community" />
                        <asp:BoundField DataField="Growth" HeaderText="Growth" ReadOnly="True" SortExpression="Growth" />
                        <asp:BoundField DataField="FinishSchool" HeaderText="FinishSchool" ReadOnly="True" SortExpression="FinishSchool" />
                        <asp:BoundField DataField="FindJob" HeaderText="FindJob" ReadOnly="True" SortExpression="FindJob" />
                    </Columns>
                </asp:GridView>
                    <asp:SqlDataSource ID="sqlCourseEvaluation" runat="server" ConnectionString="<%$ ConnectionStrings:WBLConnectionString %>" SelectCommand="SELECT        Course.CourseName, Course.Difficulty, Subject.SubjectName, AVG(CourseEvaluation.NewThings) AS [New Things], AVG(CourseEvaluation.Learn) AS Learn, AVG(CourseEvaluation.Mediums) AS Mediums, 
                         AVG(CourseEvaluation.MakeFriends) AS MakeFriends, AVG(CourseEvaluation.Motivation) AS Motivation, AVG(CourseEvaluation.Happy) AS Happy, AVG(CourseEvaluation.Future) AS Future, 
                         AVG(CourseEvaluation.WorkArtists) AS WorkArtists, AVG(CourseEvaluation.Stress) AS Stress, AVG(CourseEvaluation.Respect) AS Respect, AVG(CourseEvaluation.Negativity) AS Negativity, 
                         AVG(CourseEvaluation.Creative) AS Creative, AVG(CourseEvaluation.Careers) AS Careers, AVG(CourseEvaluation.CareerGoals) AS CareerGoals, AVG(CourseEvaluation.Community) AS Community, 
                         AVG(CourseEvaluation.Growth) AS Growth, AVG(CourseEvaluation.FinishSchool) AS FinishSchool, AVG(CourseEvaluation.FindJob) AS FindJob
                         FROM            Course INNER JOIN
                         ClassSchedule ON Course.CourseID = ClassSchedule.CourseID INNER JOIN
                         Evaluation ON Course.CourseID = Evaluation.CourseID INNER JOIN
                         CourseEvaluation ON Evaluation.EvaluationID = CourseEvaluation.EvaluationID INNER JOIN
                         Subject ON Course.SubjectID = Subject.SubjectID
                         WHERE (Subject.SubjectID = @SubjectID)
                         GROUP BY Course.CourseName, Course.Difficulty, Subject.SubjectName">
                        <SelectParameters>
                            <asp:SessionParameter Name="SubjectID" SessionField="SubjectID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div> 
        <div>
            <hr />
        </div>
            <div>
                <asp:Label 
                    ID="lblExportToExcel" 
                    runat="server" 
                    Text="Export Report to Excel: " 
                    Align="right"
                    Visible="false" >
                </asp:Label>
            </div>
            <div>
            <asp:Button 
                 ID="btnExportToExcel" 
                 runat="server" 
                 Text="Export"
                 Visible="false"
                 OnClick="btnExportToExcel_Click" />
            </div>
    </form>
</body>
</html>
