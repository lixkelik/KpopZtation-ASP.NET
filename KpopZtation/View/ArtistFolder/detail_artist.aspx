<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Guest.Master" AutoEventWireup="true" CodeBehind="detail_artist.aspx.cs" Inherits="KpopZtation.View.ArtistFolder.detail_artist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="titleLbl" runat="server" Text="Artist Detail" Font-Bold="True" Font-Size="25pt"></asp:Label>
    </div>
    <div>
        <asp:Image ID="artistImg" runat="server" Height="150px" Width="150px" />
    </div>
    <div>
        <asp:Label ID="artistName" runat="server" Font-Bold="True" Font-Size="15pt"></asp:Label>
    </div>
    <div>
        <asp:Label ID="insertLbl" runat="server" Text="Insert Album" Visible ="false"></asp:Label>
        <asp:Button ID="insertBtn" runat="server" Text="Insert" Visible="false" OnClick="insertBtn_Click"/>
    </div>
    <div>
        <asp:Label ID="albumLbl" runat="server" Text="Artist released album: " BorderWidth="2px" Font-Size="16pt"></asp:Label>
    </div>
    <div>
        <asp:GridView ID="albumGrid" runat="server" AutoGenerateColumns="False" OnRowDataBound="albumGrid_RowDataBound" CellPadding="3" CellSpacing="2" OnRowDeleting="albumGrid_RowDeleting" OnRowEditing="albumGrid_RowEditing">
            <Columns>
                <asp:ImageField DataImageUrlField="AlbumImage" HeaderText="Image">
                    <ControlStyle Height="120px" Width="120px" />
                </asp:ImageField>
                <asp:BoundField DataField="AlbumID" HeaderText="ID" SortExpression="AlbumId" />
                <asp:BoundField DataField="AlbumName" HeaderText="Name" SortExpression="AlbumName" />
                <asp:BoundField DataField="AlbumPrice" HeaderText="Price" SortExpression="AlbumPrice" />
                <asp:BoundField DataField="AlbumStock" HeaderText="Stock" SortExpression="AlbumStock" />
                <asp:BoundField DataField="AlbumDescription" HeaderText="Description" SortExpression="AlbumDescription" />
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                <asp:CommandField ButtonType="Button" HeaderText="Admin Control" ShowCancelButton="False" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True"/>
            </Columns>
        </asp:GridView>
    </div>
    <div>
        <asp:Label ID="errorLbl" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
