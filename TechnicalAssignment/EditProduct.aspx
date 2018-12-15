<%@ Page Title="Edit Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="EditProduct.aspx.cs" Inherits="EditProduct" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Files/Style.css" rel="stylesheet" />
    <style>
    </style>

    <div class="Body">
        <asp:Button ID="btnBack" Text="Back" OnClick="btnBack_Click" runat="server" />
        <h1 id="h1" class="centerText" runat="server"></h1>
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
