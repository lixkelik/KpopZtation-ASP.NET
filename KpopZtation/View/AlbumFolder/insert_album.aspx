<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Admin.Master" AutoEventWireup="true" CodeBehind="insert_album.aspx.cs" Inherits="KpopZtation.View.AlbumFolder.insert_album" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="titleLbl" runat="server" Text="Insert an Album"></asp:Label>
    </div>
    <div>
        <asp:Label ID="nameLbl" runat="server" Text="Album Name"></asp:Label>
        <asp:TextBox ID="nameTbx" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="descLbl" runat="server" Text="Description"></asp:Label>
        <asp:TextBox ID="descTbx" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="priceLbl" runat="server" Text="Price"></asp:Label>
        <asp:TextBox ID="priceTbx" runat="server" TextMode="Number"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="stockLbl" runat="server" Text="Stock"></asp:Label>
        <asp:TextBox ID="stockTbx" runat="server" TextMode="Number"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="imageLbl" runat="server" Text="Image"></asp:Label>
    </div>
    <div>
        <asp:FileUpload ID="imgUpload" runat="server" />
    </div>
    <div>
        <asp:Button ID="insertBtn" runat="server" Text="Insert Album" OnClick="insertBtn_Click"/>
    </div>
    <div>
        <asp:Label ID="errorLbl" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
