<%@ Page Title="" Language="C#" MasterPageFile="~/Products.master" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    protected void btnGet_Click(object sender, EventArgs e)
    {
        // Connect to database
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand
                ("select * from products where prodid = @id", con);
            cmd.Parameters.AddWithValue("@id", txtId.Text);

            SqlDataReader dr = cmd.ExecuteReader();
            if (!dr.Read())
                lblMsg.Text = "Sorry! Product Id Not Found!";
            else
            {
                // display data to user for editing 
                txtName.Text = dr["prodname"].ToString();
                txtQoh.Text = dr["qoh"].ToString();
                txtPrice.Text = dr["price"].ToString();
                txtRemarks.Text = dr["remarks"].ToString();
                txtCategory.Text = dr["catcode"].ToString();
            }

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

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        // Connect to database
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand
                ("update products set prodname = @name, price = @price, qoh = @qoh, remarks = @remarks, catcode = @catcode where prodid = @id", con);
            cmd.Parameters.AddWithValue("@id", txtId.Text);
            cmd.Parameters.AddWithValue("@name", txtName.Text);
            cmd.Parameters.AddWithValue("@price", txtPrice.Text);
            cmd.Parameters.AddWithValue("@qoh", txtQoh.Text);
            cmd.Parameters.AddWithValue("@remarks", txtRemarks.Text);
            cmd.Parameters.AddWithValue("@catcode", txtCategory.Text);

            int count = cmd.ExecuteNonQuery(); // Update
            if (count == 1)
                lblMsg.Text = "Updated successfully!";
            else
                lblMsg.Text = "Could not update due to error!";
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
    <h2>Update Product</h2>
Product Id : <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
    <asp:Button ID="btnGet" runat="server" Text="Get Details" OnClick="btnGet_Click" />
    <asp:Label ID="lblMsg" runat="server" Text="" EnableViewState="false"></asp:Label>
    <h4>Product Information</h4>

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
    <asp:Button ID="btnUpdate" runat="server" Text="Update Product" OnClick="btnUpdate_Click"/>
    <p />
</asp:Content>

