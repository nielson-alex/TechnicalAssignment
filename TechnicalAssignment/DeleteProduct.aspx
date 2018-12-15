<%@ Page Title="Edit Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="DeleteProduct.aspx.cs" Inherits="DeleteProduct" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        
    </style>

    <div class="Body">
        <asp:Label ID="lblName" Text="Product Name: " Font-Bold="true" runat="server" />
        <asp:TextBox ID="tbName" Text="" runat="server" />
        <br />
        <asp:Label ID="lblCategory" Text="Category: " Font-Bold="true" runat="server" />
        <asp:TextBox ID="tbCategory" Text="" Enabled="false" runat="server" />
        <br />
        <asp:Label ID="lblPrice" Text="Price " Font-Bold="true" runat="server" />
        <asp:TextBox ID="tbPrice" Text="" Enabled="false" runat="server" />
        <br />
        <asp:Label ID="lblQuantity" Text="Quantity " Font-Bold="true" runat="server" />
        <asp:TextBox ID="tbQuantity" Text="" Enabled="false" runat="server" />

        <br />
        <asp:Button ID="btnUpdate" Text="Update" OnClick="btnUpdate_Click" runat="server" />
    </div>
</asp:Content>
