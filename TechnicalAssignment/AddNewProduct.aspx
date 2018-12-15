<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AddNewProduct.aspx.cs" Inherits="AddNewProduct" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        
    </style>

    <div class="Body">
        <asp:Button ID="btnBack" Text="Back" OnClick="btnBack_Click" CausesValidation="false" runat="server" />
        <asp:Label Text="Product Name:" runat="server" />
        <asp:TextBox ID="tbName" Text="" runat="server" />
        <asp:RequiredFieldValidator ControlToValidate="tbName" ErrorMessage="Product name is required" ForeColor="Red" runat="server" />
        <br />
        <asp:Label Text="Category:" runat="server" />
        <asp:DropDownList ID="ddlCategory" runat="server">
            <asp:ListItem />
            <asp:ListItem Text="Apparel" Value="Apparel" />
            <asp:ListItem Text="Books" Value="Books" />
            <asp:ListItem Text="Electronics" Value="Electronics" />
            <asp:ListItem Text="Home & Office" Value="Home & Office" />
        </asp:DropDownList>
        <asp:RequiredFieldValidator ControlToValidate="ddlCategory" ErrorMessage="Category is required" ForeColor="Red" runat="server" />
        <br />
        <asp:Label Text="Description" runat="server" />
        <asp:TextBox ID="tbDescription" Text="" TextMode="MultiLine" Style="resize: none;" runat="server" />
        <br />
        <asp:Label Text="Price:" runat="server" />
        $<asp:TextBox ID="tbPrice" Text="" runat="server" />
        <asp:RequiredFieldValidator ControlToValidate="tbPrice" ErrorMessage="Price is required" ForeColor="Red" runat="server" />
        <br />
        <asp:Label ID="lblQuantity" Text="Quantity:" runat="server" />
        <asp:TextBox ID="tbQuantity" Text="" TextMode="Number" runat="server" />
        <asp:RequiredFieldValidator ControlToValidate="tbQuantity" ErrorMessage="Quantity is required and must be greater than 0" ForeColor="Red" runat="server" />

        <div id="divConfirm" style="display: none;">
            <asp:Label Text="Does this look right?" runat="server" />
            <input type="button" id="btnNo" value="No" onclick="closeDivConfirm()" />
            <asp:Button ID="btnYes" Text="Yes" OnClick="btnSave_Click1" runat="server" />
        </div>
        <%--<br />
        <asp:Label Text="City:" runat="server" />
        <asp:TextBox ID="tbCity" Text="" runat="server" />
        <br />
        <asp:Label Text="State:" runat="server" />
        <asp:TextBox ID="tbState" Text="" runat="server" />
        <br />
        <asp:Label Text="Zip Code:" runat="server" />
        <asp:TextBox ID="tbZip" Text="" runat="server" />--%>

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
