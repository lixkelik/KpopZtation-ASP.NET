<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Customer.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="KpopZtation.View.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="StyleCSS/cartStyle.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="title">
        <asp:Label ID="titleLbl" runat="server" Text="Your Cart"></asp:Label>
    </div>
    <div class="cart-grid">
        <asp:GridView ID="cartGrid" runat="server" AutoGenerateColumns="False" OnRowDeleting="cartGrid_RowDeleting" CssClass="grid-view">
            <Columns>
                <asp:TemplateField HeaderText="Album Image">
                    <ItemTemplate>
                        <asp:Image ID="AlbumImage" runat="server" ImageUrl='<%# Eval("Album.AlbumImage") %>' CssClass="album-image" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Album.AlbumId" HeaderText="ID" SortExpression="AlbumId" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide"/>
                <asp:BoundField DataField="Album.AlbumName" HeaderText="Name" SortExpression="AlbumName" />
                <asp:BoundField DataField="Qty" HeaderText="Quantity" SortExpression="Qty" />
                <asp:BoundField DataField="Album.AlbumPrice" HeaderText="Price" SortExpression="AlbumPrice" />
                <asp:CommandField ButtonType="Button" DeleteText="Remove" ShowDeleteButton="True" ControlStyle-CssClass="btn" />
            </Columns>
            <HeaderStyle CssClass="grid-view-header" />
        </asp:GridView>
    </div>
    <div class="empty-message">
        <asp:Label ID="isEmptyLbl" runat="server" Text=""></asp:Label>
    </div>
    <div class="checkout-button">
        <asp:Button ID="checkoutBtn" runat="server" Text="Checkout" OnClick="checkoutBtn_Click" CssClass="btn" />
    </div>
    <div>
        <asp:Label ID="errorLbl" runat="server" Text="" Visible="false" CssClass="error-message"></asp:Label>
    </div>
</asp:Content>
