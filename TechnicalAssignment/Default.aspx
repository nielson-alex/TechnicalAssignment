<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link href="Files/Style.css" rel="stylesheet" />
    <style>
    </style>

    <div class="Body">
        <asp:Button ID="btnAdd" Text="Add New Product" OnClick="btnAdd_Click" runat="server" />
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
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Button_Search" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>      
        <asp:Button ID="Button_Search" Style="display: none;" runat="server" />
    </div>
    <script type="text/javascript">
        $(document).ready(function () {

            window.setInterval(function () {
                f2();
            }, 5000);
            f2();
        });

        function f2() {
            __doPostBack('<%= Button_Search.ClientID %>', '');
        }

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
