<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        // find out city name from cookie, if present otherwise redirect to selectcity.aspx
        HttpCookie c = Request.Cookies["city"];
        if (c == null)
            Response.Redirect("selectcity.aspx");
        else
            lblMovies.Text = "Movies in city : " + c.Value;

        Response.Write("No. of online users = " + Application["count"]);
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movies</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lblMovies" runat="server" Text=""></asp:Label>
        <p />
        <a href="selectcity.aspx">Change City</a>
    </form>
</body>
</html>
