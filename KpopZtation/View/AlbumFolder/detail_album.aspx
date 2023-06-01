<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Guest.Master" AutoEventWireup="true" CodeBehind="detail_album.aspx.cs" Inherits="KpopZtation.View.AlbumFolder.detail_album" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="titleLbl" runat="server" Text="Album Detail" Font-Bold="True"></asp:Label>
    <div>
        <asp:Image ID="albumImg" runat="server" Height="300px" />
    </div>
    <div>
        <asp:Label ID="albumNameLbl" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <asp:Label ID="descLbl" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <asp:Label ID="priceLbl" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <asp:Label ID="stockLbl" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <asp:TextBox ID="stockTbx" runat="server" Visible="false" TextMode="Number"></asp:TextBox>
        <asp:Button ID="addToStockBtn" runat="server" Text="Add to cart!" OnClick="addToStockBtn_Click" Visible="false"/>
        <asp:Label ID="errorLbl" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
