<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void btnGetCourseFee_Click(object sender, EventArgs e)
    {
        int fee = Int32.Parse(ddlCourse.SelectedItem.Value);
        if (rbMorning.Checked)
            fee = fee - fee * 10 / 100;

        if (cbMaterial.Checked)
            fee += 500;

        lblFee.Text = string.Format("Fee = {0}", fee);
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Course Fee Finder</title>
</head>
<body>
    <h2>Course Fee Finder</h2>
    <form id="form1" runat="server">
        Select Course <br />
        <asp:DropDownList ID="ddlCourse" runat="server">
            <asp:ListItem Value="4000">Python Programming</asp:ListItem>
            <asp:ListItem Value="5000">Data Science With Python</asp:ListItem>
            <asp:ListItem Value="3500">C Programming</asp:ListItem>
            <asp:ListItem Value="5500">MS.NET</asp:ListItem>
        </asp:DropDownList>
        <p />
        Timings <br />
        <asp:RadioButton ID="rbMorning" GroupName="time" runat="server" /> Morning
        <asp:RadioButton ID="rbEvening" GroupName="time"
            runat ="server" Checked="true" /> Evening
        <p />
        <asp:CheckBox ID="cbMaterial" runat="server" />Printed Course Material
        <p />
        <asp:Button ID="btnGetCourseFee" runat="server" Text="Get Course Fee" OnClick="btnGetCourseFee_Click" />
        <p />
        <asp:Label ID="lblFee" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
