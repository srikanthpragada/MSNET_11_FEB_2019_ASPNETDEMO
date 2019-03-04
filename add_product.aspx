<%@ Page Title="" Language="C#"  MasterPageFile="~/Products.master" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        // Connect to database
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand
                ("insert into products(prodname,price,qoh,remarks,catcode) values(@name,@price,@qoh,@remarks,@catcode)", con);
            cmd.Parameters.AddWithValue("@name", txtName.Text);
            cmd.Parameters.AddWithValue("@price", txtPrice.Text);
            cmd.Parameters.AddWithValue("@qoh", txtQoh.Text);
            cmd.Parameters.AddWithValue("@remarks", txtRemarks.Text);
            cmd.Parameters.AddWithValue("@catcode", txtCategory.Text);

            int count = cmd.ExecuteNonQuery();
            if (count == 1)
                lblMsg.Text = "Product has been added successfully!";
        }
        catch(Exception ex)
        {
            lblMsg.Text = "Sorry! Error : " + ex.Message;
        }
        finally
        {
            con.Close();
        }

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Add Product</h2>
    Product Name<br/>
    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    <p/>
    Product Price<br />
    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
    <p />
    Quantity On Hand<br />
    <asp:TextBox ID="txtQoh" runat="server"></asp:TextBox>
    <p />
    Remarks <br />
    <asp:TextBox ID="txtRemarks" runat="server"></asp:TextBox>
    <p />
    Category<br />
    <asp:TextBox ID="txtCategory" runat="server"></asp:TextBox>
    <p />
    <asp:Button ID="btnAdd" runat="server" Text="Add Product" OnClick="btnAdd_Click" />
    <p />
    <asp:Label ID="lblMsg" runat="server" Text="" EnableViewState="false"></asp:Label>

</asp:Content>

