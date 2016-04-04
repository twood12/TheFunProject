<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="System.Web.Optimization" %>
<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        RegisterRoutes(RouteTable.Routes);
        BundleConfig.RegisterBundles(BundleTable.Bundles);
        BundleTable.Bundles.Add(new System.Web.Optimization.ScriptBundle("~/bundle/js")
            .Include("~/Scripts/*.js"));

    }

    static void RegisterRoutes(RouteCollection routes)
    {
        routes.MapPageRoute("DisplayBlog", "WebPages/Common_WebPages/{PostID}/{Subject}.aspx", "~/WebPages/Common_WebPages/DisplayBlog.aspx");

    }

    //public class Global : HttpApplication
    //{
    //    protected void Applicaiton_Start(object sender, EventArgs e)
    //    {
    //        BundleConfig.RegisterBundles(BundleTable.Bundles);
    //    }

    //}
</script>