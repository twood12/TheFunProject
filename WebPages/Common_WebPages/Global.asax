<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<script RunAt="server">
    void Application_Start(object sender, EventArgs e)
    {
        RegisterRoutes(RouteTable.Routes);
    }
 
    static void RegisterRoutes(RouteCollection routes)
    {
        routes.MapPageRoute("DisplayBlog", "Blog/{PostID}/{Subject}.aspx", "~/DisplayBlog.aspx");
        
    }
</script>
