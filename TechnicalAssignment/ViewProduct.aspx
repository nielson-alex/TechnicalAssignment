<%@ Page Title="View Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ViewProduct.aspx.cs" Inherits="ViewProduct" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        
    </style>

    <div class="Body">
        <asp:Label ID="lblName" Text="Product Name: " Font-Bold="true" runat="server" />
        <asp:TextBox ID="tbName" Text="" Enabled="false" runat="server" />
        <br />
        <asp:Label ID="lblCategory" Text="Category: " Font-Bold="true" runat="server" />
        <asp:TextBox ID="tbCategory" Text="" Enabled="false" runat="server" />
        <br />
        <asp:Label ID="lblPrice" Text="Price " Font-Bold="true" runat="server" />
        <asp:TextBox ID="tbPrice" Text="" Enabled="false" runat="server" />
        <br />
        <asp:Label ID="lblQuantity" Text="Quantity " Font-Bold="true" runat="server" />
        <asp:TextBox ID="tbQuantity" Text="" Enabled="false" runat="server" />
    </div>
</asp:Content>
