<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Guest.Master" AutoEventWireup="true" CodeBehind="detail_album.aspx.cs" Inherits="KpopZtation.View.AlbumFolder.detail_album" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
            font-family: Arial;
            background-color: #f2f2f2;
        }

        .containerAlbm {
            width:500px;
            margin: 0 auto;
        }

        .product-card {
            display: flex;
            margin: 0 auto;
            flex-direction: column;
            align-items: center;
            text-align: center;
            background-color: #f5f5f5;
            border-radius: 5px;
            margin-bottom: 20px;
            max-width: 500px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }

        .product-image {
            width: 200px;
            height: 200px;
            object-fit: cover;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .product-title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .product-description {
            margin-bottom: 10px;
        }

        .product-price {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .stock-label {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .stock-controls {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }

        .stock-input {
            width: 60px;
            margin-right: 10px;
            padding: 5px;
            border-radius: 3px;
            border: 1px solid #ccc;
        }

        .add-to-cart-button {
            padding: 8px 16px;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .add-to-cart-button:hover {
            background-color: #45a049;
        }

        .error-message {
            color: red;
            font-weight: bold;
        }
    </style>
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
