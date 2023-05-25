<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Admin.Master" AutoEventWireup="true" CodeBehind="insert_artist.aspx.cs" Inherits="KpopZtation.View.ArtistFolder.insert_artist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="nameLbl" runat="server" Text="Artist Name"></asp:Label>
        <asp:TextBox ID="nameTbx" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="imageLbl" runat="server" Text="Insert Image"></asp:Label>
        <asp:FileUpload ID="imageUpload" runat="server" />
    </div>
    <div>
        <asp:Button ID="insertBtn" runat="server" Text="Insert" OnClick="insertBtn_Click"/>
        <asp:Label ID="errorLbl" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
