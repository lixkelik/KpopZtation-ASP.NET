<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Admin.Master" AutoEventWireup="true" CodeBehind="edit_artist.aspx.cs" Inherits="KpopZtation.View.ArtistFolder.edit_artist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="pageLbl" runat="server" Text="Update Artist Data"></asp:Label>
    </div>
    <div>
        <asp:Label ID="artistNameLbl" runat="server" Text="Artist Name"></asp:Label>
        <asp:TextBox ID="nameLbl" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Image ID="artistImage" runat="server" Height="70" Width="70" />
    </div>
    <div>
        <asp:Label ID="artistImageLbl" runat="server" Text="Artist Image"></asp:Label>
        <asp:FileUpload ID="imageUpload" runat="server" />
        <asp:Label ID="imageErrorLbl" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <asp:Button ID="updateBtn" runat="server" Text="Update" OnClick="updateBtn_Click"/>
        <asp:Label ID="errorLbl" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
