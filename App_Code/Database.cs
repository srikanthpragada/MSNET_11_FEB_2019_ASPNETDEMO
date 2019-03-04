using System.Web.Configuration;

/// <summary>
/// Summary description for Database
/// </summary>
public class Database
{
    public static string ConnectionString
    {
        get
        {
           return WebConfigurationManager.ConnectionStrings
                      ["msdbConnectionString"].ConnectionString;
        }
    }

}