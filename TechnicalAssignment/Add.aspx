<%@ Page Title="Add Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Add" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Files/Style.css" rel="stylesheet" />
    <style>
    </style>

    <div class="Body">
        <asp:Button ID="btnBack" Text="Back" OnClick="btnBack_Click" CausesValidation="false" runat="server" />
        <br />
        <h1 class="centerText">Add New Product to Catalog</h1>
        <hr />
        <asp:Label Text="Product Name:" Font-Bold="true" Width="20%" runat="server" />
        <asp:TextBox ID="tbName" Text="" CssClass="input" runat="server" />
        <asp:RequiredFieldValidator ControlToValidate="tbName" ErrorMessage="Product name is required" ForeColor="Red" runat="server" />
        <br />
        <asp:Label Text="Category:" Font-Bold="true" Width="20%" runat="server" />
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
        <asp:Label ID="lblDescription" Text="Description:" Font-Bold="true" Width="20%" runat="server" />
        <asp:TextBox ID="tbDescription" Text="" CssClass="input" TextMode="MultiLine" Style="resize: none;" runat="server" />
        <br />
        <asp:Label Text="Price (USD):" Font-Bold="true" Width="20%" runat="server" />
        <asp:TextBox ID="tbPrice" Text="" CssClass="input" runat="server" />
        <asp:RequiredFieldValidator ControlToValidate="tbPrice" ErrorMessage="Price is required" ForeColor="Red" runat="server" />
        <br />
        <asp:Label ID="lblQuantity" Font-Bold="true" Width="20%" Text="Quantity:" runat="server" />
        <asp:TextBox ID="tbQuantity" Text="" CssClass="input" TextMode="Number" runat="server" />
        <asp:RequiredFieldValidator ControlToValidate="tbQuantity" ErrorMessage="Quantity is required and must be greater than 0" ForeColor="Red" runat="server" />

        <div id="divConfirm" style="display: none;">
            <asp:Label Text="Is this information correct?" runat="server" />
            <input type="button" id="btnNo" value="No" onclick="closeDivConfirm()" />
            <asp:Button ID="btnYes" Text="Yes" OnClick="btnYes_Click" runat="server" />
        </div>
        <br />

        <input type="button" id="btnSave" value="Save" onclick="openDivConfirm()" />
        <asp:Label ID="lblError" Text="" ForeColor="Red" runat="server" />
    </div>


    <%-- GoogleChart --%>
    <!--Load the AJAX API-->
    <script type="text/javascript">
        function openDivConfirm() {
            var divConfirm = document.getElementById("divConfirm");

            if (divConfirm.style.display != "block") {
                divConfirm.style.display = "block";
            }
        }

        function closeDivConfirm() {
            var divConfirm = document.getElementById("divConfirm");

            if (divConfirm.style.display != "none") {
                divConfirm.style.display = "none";
            }
        }
    </script>
</asp:Content>
