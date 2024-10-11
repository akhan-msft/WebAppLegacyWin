using log4net;
using System;
using System.Diagnostics;
using System.Configuration;

namespace WebAppLegacyWin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private static readonly ILog _log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        protected void Page_Load(object sender, EventArgs e)
        {
            _log.Info($"App - Home Page loaded");

            Trace.Write("This is an informational message.");

            // Logging a warning message
            Trace.Warn("This is a warning message.");

            // Read the configuration value
            string myVersion = ConfigurationManager.AppSettings["appVersion"];
            _log.Info($"myVersion: {myVersion}");

            // Display the configuration value on the page
            MySettingLabel.Text = myVersion;


        }
       
    }
}