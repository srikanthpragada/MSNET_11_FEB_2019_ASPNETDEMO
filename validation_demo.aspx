<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        Min :
        <asp:TextBox ID="txtMin" runat="server" required="required"></asp:TextBox>
        Max :
        <asp:TextBox ID="txtMax" runat="server" required="required"></asp:TextBox>
        <asp:CompareValidator 
            ControlToValidate="txtMin" 
            ControlToCompare="txtMax"
            Operator="LessThanEqual"
            ID="CompareValidator1"
            Type="Integer"
            runat="server" 
            ErrorMessage="Min must be <= max value"></asp:CompareValidator>
        <p />
        <asp:Button ID="btnProcess" runat="server" Text="Process" />
    </form>
</body>
</html>
