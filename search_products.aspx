<%@ Page Title="" Language="C#" MasterPageFile="~/Products.master" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        // Connect to database
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand
                ("select * from products where prodname like @name", con);
            cmd.Parameters.AddWithValue("@name", "%" + txtName.Text + "%");
            SqlDataReader reader = cmd.ExecuteReader();
            gvProducts.DataSource = reader;
            gvProducts.DataBind();
           
        }
        catch(Exception ex)
        {
            Response.Write("Error : " + ex.Message);
        }
        finally
        {
            con.Close();
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Search Products</h2>
Name : <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
    <p />

    <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False"
        DataKeyNames="prodid" Width="100%">
        <Columns>
            <asp:BoundField DataField="prodid" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="prodid" />
            <asp:BoundField DataField="prodname" HeaderText="Name" SortExpression="prodname" />
            <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
            <asp:BoundField DataField="qoh" HeaderText="Qoh" SortExpression="qoh" />
            <asp:BoundField DataField="remarks" HeaderText="Remarks" SortExpression="remarks" />
            <asp:BoundField DataField="catcode" HeaderText="Category" SortExpression="catcode" />
            <asp:HyperLinkField DataNavigateUrlFields="prodid" 
                DataNavigateUrlFormatString="delete_product.aspx?id={0}" 
                Text="Delete" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:HyperLinkField>
        </Columns>
    </asp:GridView>

</asp:Content>

