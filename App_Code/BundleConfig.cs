using System.Web.Optimization;
using System.Web.UI;

/// <summary>
/// Summary description for BundleConfig
/// </summary>
public class BundleConfig
{
    // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkID=303951
    public static void RegisterBundles(BundleCollection bundles)
    {
        bundles.Add(new ScriptBundle("~/bundles/WebFormsJs").Include(
                        "~/Scripts/WebForms/WebForms.js",
                        "~/Scripts/WebForms/WebUIValidation.js",
                        "~/Scripts/WebForms/MenuStandards.js",
                        "~/Scripts/WebForms/Focus.js",
                        "~/Scripts/WebForms/GridView.js",
                        "~/Scripts/WebForms/DetailsView.js",
                        "~/Scripts/WebForms/TreeView.js",
                        "~/Scripts/WebForms/WebParts.js"));

        bundles.Add(new ScriptBundle("~/bundles/calendar").Include(
            "~/Scripts/jquery-2.2.1.js",
            "~/Scripts/moment.js",
            "~/Scripts/jquery-ui-1.11.4.js",
            "~/Scripts/fullcalendar.js",
            "~/Scripts/qTip/jquery.qtip.js",
            "~/Scripts/StudentCalendarScript.js",
            "~/Scripts/geolocation.js"
            ));

        bundles.Add(new ScriptBundle("~/bundles/adminCalendar").Include(
           "~/Scripts/jquery-2.2.1.js",
           "~/Scripts/moment.js",
           "~/Scripts/jquery-ui-1.11.4.js",
           "~/Scripts/fullcalendar.js",
           "~/Scripts/qTip/jquery.qtip.js",
           "~/Scripts/CalendarScript.js",
           "~/Scripts/geolocation.js"
           ));

        bundles.Add(new ScriptBundle("~/Content/Master/css").Include(
            "~/Content/GlobalStyleSheet.css"
            ));


        bundles.Add(new StyleBundle("~/Content/css").Include(
            "~/Content/fullcalendar.css",
            "~/Content/themes/base/button.css",
            "~/Content/themes/base/dialog.css",
            "~/Content/themes/base/draggable.css",
            "~/Content/CalendarStyleSheet.css",
            "~/Content/themes/base/theme.css",
            "~/Content/themes/base/base.css",
            "~/Content/themes/base/all.css",
            "~/Scripts/qTip/jquery.qtip.css"
            ));

        BundleTable.EnableOptimizations = false;

        // Order is very important for these files to work, they have explicit dependencies
        bundles.Add(new ScriptBundle("~/bundles/MsAjaxJs").Include(
                "~/Scripts/WebForms/MsAjax/MicrosoftAjax.js",
                "~/Scripts/WebForms/MsAjax/MicrosoftAjaxApplicationServices.js",
                "~/Scripts/WebForms/MsAjax/MicrosoftAjaxTimer.js",
                "~/Scripts/WebForms/MsAjax/MicrosoftAjaxWebForms.js"));

        // Use the Development version of Modernizr to develop with and learn from. Then, when you’re
        // ready for production, use the build tool at http://modernizr.com to pick only the tests you need
        bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

        ScriptManager.ScriptResourceMapping.AddDefinition(
            "respond",
            new ScriptResourceDefinition
            {
                Path = "~/Scripts/respond.min.js",
                DebugPath = "~/Scripts/respond.js",
            });
    }

}