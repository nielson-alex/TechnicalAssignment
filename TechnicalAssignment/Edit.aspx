<%@ Page Title="Edit Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Edit" %>

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
        <asp:RequiredFieldValidator ControlToValidate="tbName" ErrorMessage="Product name is required" ForeColor="Red" runat="server" />
        <br />
        <asp:Label ID="lblCategory" Text="Category:" Font-Bold="true" Width="20%" runat="server" />
        <asp:DropDownList ID="ddlCategory" CssClass="input" runat="server">
            <asp:ListItem />
            <asp:ListItem Text="Books" Value="Books" />
            <asp:ListItem Text="Clothing" Value="Clothing" />
            <asp:ListItem Text="Electronics" Value="Electronics" />
            <asp:ListItem Text="Home & Office" Value="Home & Office" />
            <asp:ListItem Text="Sports" Value="Sports" />
            <asp:ListItem Text="Video Games" Value="Video Games" />
            <asp:ListItem Text="Other" Value="Other" />
        </asp:DropDownList>
        <asp:RequiredFieldValidator ControlToValidate="ddlCategory" ErrorMessage="Category is required" ForeColor="Red" runat="server" />
        <br />
        <asp:Label ID="lblPrice" Text="Price:" Font-Bold="true" Width="20%" runat="server" />
        <asp:TextBox ID="tbPrice" Text="" CssClass="input" runat="server" />
        <asp:RequiredFieldValidator ControlToValidate="tbPrice" ErrorMessage="Price is required" ForeColor="Red" runat="server" />
        <br />
        <asp:Label ID="lblQuantity" Text="Quantity:" Font-Bold="true" Width="20%" runat="server" />
        <asp:TextBox ID="tbQuantity" Text="" CssClass="input" runat="server" />
        <asp:RequiredFieldValidator ControlToValidate="tbQuantity" ErrorMessage="Quantity is required and must be greater than 0" ForeColor="Red" runat="server" />
        <br />
        <asp:Button ID="btnUpdate" Text="Update" OnClick="btnUpdate_Click" runat="server" />
        <asp:Label ID="lblError" Text="" ForeColor="Red" runat="server" />
    </div>
</asp:Content>
