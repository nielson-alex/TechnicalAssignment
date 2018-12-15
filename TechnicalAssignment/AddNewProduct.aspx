<%@ Page Title="Add Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AddNewProduct.aspx.cs" Inherits="AddNewProduct" %>

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
            <asp:ListItem Text="Apparel" Value="Apparel" />
            <asp:ListItem Text="Books" Value="Books" />
            <asp:ListItem Text="Electronics" Value="Electronics" />
            <asp:ListItem Text="Home & Office" Value="Home & Office" />
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
            <asp:Label Text="Does this look right?" runat="server" />
            <input type="button" id="btnNo" value="No" onclick="closeDivConfirm()" />
            <asp:Button ID="btnYes" Text="Yes" OnClick="btnSave_Click1" runat="server" />
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
