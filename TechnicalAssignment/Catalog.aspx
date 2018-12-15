<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Catalog.aspx.cs" Inherits="Catalog" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        
    </style>

    <asp:Button ID="btnAddProduct" Text="Add New Product" OnClick="btnAddProduct_Click" runat="server" />
    <div class="Body">
        <asp:Label ID="lblCount" Text="" runat="server" />
        <asp:GridView ID="GridView1" OnRowDataBound="GridView1_RowDataBound"  AutoGenerateColumns="false" EmptyDataText="No products were found in this catalog" runat="server">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="ProductID" />
                <asp:BoundField HeaderText="Product Name" DataField="Name" />
                <asp:BoundField HeaderText="Category" DataField="Category" />
                <asp:BoundField HeaderText="Description" DataField="Description" />
                <asp:BoundField HeaderText="Price" DataField="Price" />
                <asp:BoundField HeaderText="Quantity" DataField="Quantity" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnDetails" Text="View Details" OnClick="btnDetails_Click" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" Text="Edit" OnClick="btnEdit_Click" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" Text="Delete" OnClick="btnDelete_Click" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>           
    </div>
</asp:Content>
