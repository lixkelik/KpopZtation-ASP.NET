<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Admin.Master" AutoEventWireup="true" CodeBehind="edit_artist.aspx.cs" Inherits="KpopZtation.View.ArtistFolder.edit_artist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../StyleCSS/editStyle.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="containerEdit">
        <h2 class="labelTitle">Update Artist Data</h2>
        <div>
            <asp:Label ID="artistNameLbl" runat="server" Text="" Visible="false"></asp:Label>
        </div>
        <div>
            <label class="label" for="nameTbx">Artist Name</label>
            <asp:TextBox ID="nameTbx" runat="server" CssClass="input"></asp:TextBox>
        </div>
        <div class="image-container">
            <asp:Image ID="artistImage" runat="server" CssClass="artist-image" Height="150" Width="150" />
        </div>
        <div>
            <label class="label" for="imageUpload">Artist Image</label>
            <asp:FileUpload ID="imageUpload" runat="server" CssClass="file-upload" />
            <asp:Label ID="imageErrorLbl" runat="server" CssClass="error" Text="" Visible ="false"></asp:Label>
        </div>
        <div>
            <asp:Button ID="updateBtn" runat="server" Text="Update" CssClass="button" OnClick="updateBtn_Click"/>
            <asp:Label ID="errorLbl" runat="server" CssClass="error" Text="" Visible="false"></asp:Label>
        </div>
    </div>
</asp:Content>
