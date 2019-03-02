<%@ Page Title="" Language="C#" MasterPageFile="~/Products.master" %>

<script runat="server">
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>List Products</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        DataKeyNames="prodid" DataSourceID="sdsProducts" Width="100%" AllowPaging="True">
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
    <asp:SqlDataSource ID="sdsProducts" runat="server"
        ConnectionString="<%$ ConnectionStrings:msdbConnectionString %>"
        SelectCommand="SELECT * FROM [products] ORDER BY [prodid]"></asp:SqlDataSource>
</asp:Content>

