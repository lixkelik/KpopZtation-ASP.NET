<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Admin.Master" AutoEventWireup="true" CodeBehind="edit_album.aspx.cs" Inherits="KpopZtation.View.AlbumFolder.edit_album" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="pageLbl" runat="server" Text="Update Artist Data"></asp:Label>
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
        <asp:TextBox ID="priceTbx" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="stockLbl" runat="server" Text="Stock"></asp:Label>
        <asp:TextBox ID="stockTbx" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Image ID="albumImage" runat="server" Height="150" Width="150" />
    </div>
    <div>
        <asp:Label ID="albumImageLbl" runat="server" Text="Artist Image"></asp:Label>
        <asp:FileUpload ID="imgUpload" runat="server" />
        <asp:Label ID="imageErrorLbl" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <asp:Button ID="updateBtn" runat="server" Text="Update" OnClick="updateBtn_Click"/>
        <asp:Label ID="errorLbl" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
