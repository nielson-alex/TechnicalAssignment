<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Catalog.aspx.cs" Inherits="Catalog" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Files/Style.css" rel="stylesheet" />
    <style>
    </style>

    <div class="Body">
        <asp:Button ID="btnAddProduct" Text="Add New Product" OnClick="btnAddProduct_Click" runat="server" />
        <asp:Label ID="lblCount" Text="" runat="server" />
        <h1 class="centerText">Product Catalog</h1>

        <asp:UpdatePanel ID="GridRefreshPanel" runat="server">
            <ContentTemplate>
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
            </ContentTemplate>
        </asp:UpdatePanel>
         
        <div>
            <h2 class="centerText">Add New Product to Catalog</h2>
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
    </div>

</asp:Content>
