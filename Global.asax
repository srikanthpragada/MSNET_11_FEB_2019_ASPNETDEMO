<%@ Application Language="C#" %>

<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        Application["count"] = 0;
    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown
    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs
    }

    void Session_Start(object sender, EventArgs e)
    {
        Application["count"] = (int)Application["count"] + 1;
    }

    void Session_End(object sender, EventArgs e)
    {
        Application["count"] = (int)Application["count"] - 1;
    }

</script>
