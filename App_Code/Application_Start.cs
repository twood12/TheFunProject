using System.Web.Optimization;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Application_Start
/// </summary>
public class Application_Start
{
    public Application_Start(object sender, EventArgs e)
    {
        BundleTable.EnableOptimizations = true;
    }
}