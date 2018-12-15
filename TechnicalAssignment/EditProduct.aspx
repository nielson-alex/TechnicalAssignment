<%@ Page Title="Edit Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="EditProduct.aspx.cs" Inherits="EditProduct" %>

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

        #MainContent_btnBack {
            float: right;
        }
        #MainContent_lblDescription {
            vertical-align: top;
        }

        .input {
            display: inline-block;
            font-size: 16px;
            margin: 0 0 2% 0;
            width: 75%;
        }
    </style>

    <div class="Body">
        <asp:Button ID="btnBack" Text="Back" OnClick="btnBack_Click" runat="server" />
        <h1 class="centerText">Edit Product</h1>
        <hr />
        <asp:Label ID="lblName" Text="Product Name:" Font-Bold="true" Width="20%" runat="server" />
        <asp:TextBox ID="tbName" Text="" CssClass="input" runat="server" />
        <br />
        <asp:Label ID="lblCategory" Text="Category:" Font-Bold="true" Width="20%" runat="server" />
        <asp:TextBox ID="tbCategory" Text="" CssClass="input" Enabled="false" runat="server" />
        <br />
        <asp:Label ID="lblPrice" Text="Price:" Font-Bold="true" Width="20%" runat="server" />
        <asp:TextBox ID="tbPrice" Text="" CssClass="input" Enabled="false" runat="server" />
        <br />
        <asp:Label ID="lblQuantity" Text="Quantity:" Font-Bold="true" Width="20%" runat="server" />
        <asp:TextBox ID="tbQuantity" Text="" CssClass="input" Enabled="false" runat="server" />

        <br />
        <asp:Button ID="btnUpdate" Text="Update" OnClick="btnUpdate_Click" runat="server" />
    </div>
</asp:Content>
