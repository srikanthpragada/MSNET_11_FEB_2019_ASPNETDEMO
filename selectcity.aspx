<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void btnSave_Click(object sender, EventArgs e)
    {
        HttpCookie c = new HttpCookie("city", ddlCity.SelectedItem.Value);
        c.Expires = DateTime.Now.AddDays(7);
        Response.Cookies.Add(c);
        Response.Redirect("listmovies.aspx");
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Select City</h2>
        City : 
        <asp:DropDownList ID="ddlCity" runat="server">
            <asp:ListItem Value="Vizag">Vizag</asp:ListItem>
            <asp:ListItem Value="Bangalore">Bangalore</asp:ListItem>
            <asp:ListItem Value="Chennai">Chennai</asp:ListItem>
        </asp:DropDownList>
        <p/>
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />

    </form>
</body>
</html>
