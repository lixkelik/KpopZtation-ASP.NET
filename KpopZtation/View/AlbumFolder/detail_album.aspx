<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Guest.Master" AutoEventWireup="true" CodeBehind="detail_album.aspx.cs" Inherits="KpopZtation.View.AlbumFolder.detail_album" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../StyleCSS/detailAlbumStyle.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="containerAlbm">
        <div class="product-card">
            <asp:Label ID="titleLbl" runat="server" Text="Album Detail" CssClass="product-title" Font-Bold="True"></asp:Label>
            <asp:Image ID="albumImg" runat="server" CssClass="product-image" />
            <div class="product-description">
                <asp:Label ID="albumNameLbl" runat="server" Text=""></asp:Label>
            </div>
            <div class="product-description">
                <asp:Label ID="descLbl" runat="server" Text=""></asp:Label>
            </div>
            <div class="product-price">
                <asp:Label ID="priceLbl" runat="server" Text=""></asp:Label>
            </div>
            <div class="stock-label">
                <asp:Label ID="stockLbl" runat="server" Text=""></asp:Label>
            </div>
            <div class="stock-controls">
                <asp:TextBox ID="stockTbx" runat="server" Visible="false" TextMode="Number" CssClass="stock-input"></asp:TextBox>
                <asp:Button ID="addToStockBtn" runat="server" Text="Add to Cart" OnClick="addToStockBtn_Click" Visible="false" CssClass="add-to-cart-button" />
            </div>
            <div>
                <asp:Label ID="errorLbl" runat="server" Text="" CssClass="error-message"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
