<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Catalog.aspx.cs" Inherits="Catalog" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
                .Body {
            box-shadow: 0px 0px 5px #000000;
            margin: 3% auto 0 auto;
            padding: 2%;
            width: 80%;
        }

                        .centerText {
            text-align: center;
        }

        hr {
            border-bottom: 1px dotted #000000;
        }

        #MainContent_GridView1 {
            margin: 0 auto;
            width: 80%;
        }

        .gvButton {
            display: block;
            margin: 0 auto;
        }
    </style>

    
    <div class="Body">
        <asp:Button ID="btnAddProduct" Text="Add New Product" OnClick="btnAddProduct_Click" runat="server" />
        <asp:Label ID="lblCount" Text="" runat="server" />
        <h1 class="centerText">Product Catalog</h1>
        <asp:GridView ID="GridView1" OnRowDataBound="GridView1_RowDataBound"  AutoGenerateColumns="false" EmptyDataText="No products were found in this catalog" runat="server">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="ProductID" HeaderStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="Product Name" DataField="Name" HeaderStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="Category" DataField="Category" HeaderStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="Description" DataField="Description" HeaderStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="Price" DataField="Price" HeaderStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="Quantity" DataField="Quantity" HeaderStyle-HorizontalAlign="Center" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnDetails" Text="View Details" CssClass="gvButton" OnClick="btnDetails_Click" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" Text="Edit" CssClass="gvButton" OnClick="btnEdit_Click" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" Text="Delete" CssClass="gvButton" OnClick="btnDelete_Click" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>           
    </div>
</asp:Content>
