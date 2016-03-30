<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        RegisterRoutes(RouteTable.Routes);
    }
 
    static void RegisterRoutes(RouteCollection routes)
    {
        routes.MapPageRoute("DisplayBlog", "WebPages/Common_WebPages/{PostID}/{Subject}.aspx", "~/WebPages/Common_WebPages/DisplayBlog.aspx");
        
    }
       
</script>
