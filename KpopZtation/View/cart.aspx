<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Customer.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="KpopZtation.View.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        body{
            font-family: Arial;
        }
        .title {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        .cart-grid {
            margin-bottom: 20px;
            display: flex;
            justify-content: center;
        }

        .empty-message {
            text-align: center;
            margin-bottom: 20px;
            font-size: 16px;
            color: #888;
        }

        .error-message {
            color: #cc0000;
            margin-top: 10px;
            font-size: 14px;
            text-align: center;
            border: 1px solid #cc0000;
            padding: 5px;
            border-radius: 5px;
            background-color: #ffdddd;
            width: 300px;
            max-width: 100%;
            height: 40px;
            box-sizing: border-box;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .success-message {
            color: black;
            margin-top: 10px;
            font-size: 14px;
            text-align: center;
            border: 1px solid lawngreen;
            padding: 5px;
            border-radius: 5px;
            background-color: lightgreen;
            width: 300px;
            max-width: 100%;
            height: 40px;
            box-sizing: border-box;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .checkout-button {
            text-align: center;
            margin-bottom: 20px;
        }

        .btn {
            width: 300px;
            max-width: 100%;
            height: 40px;
            border-radius: 5px;
            border: none;
            background-color: #007bff;
            color: #fff;
            font-size: 16px;
            font-weight:600;
            cursor: pointer;
            margin: 0 auto;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .grid-view {
            width: 100%;
            border-collapse: collapse;
            display: flex;
            justify-content: center;
        }

        .grid-view th,
        .grid-view td {
            padding: 8px;
            text-align: center;
        }

        .grid-view th {
            background-color: #f5f5f5;
            font-weight: bold;
        }

        .grid-view tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .grid-view tr:hover {
            background-color: #f2f2f2;
        }

        .album-image {
            max-width: 80px;
            max-height: 80px;
            border-radius: 5px;
        }

        .grid-view .btn {
            width: 120px;
            background-color: #ff3366;
            color: #fff;
            font-size: 14px;
        }

        .grid-view .btn:hover {
            background-color: #cc0044;
        }

        .Hide {
            display:none; 
        }
    </style>
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
