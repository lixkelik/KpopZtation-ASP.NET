<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Guest.Master" AutoEventWireup="true" CodeBehind="detail_artist.aspx.cs" Inherits="KpopZtation.View.ArtistFolder.detail_artist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../StyleCSS/detailArtistStyle.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="containerUp">
        <div class="page-title">
            <asp:Label ID="titleLbl" runat="server" Text="Artist Detail" Font-Bold="True" Font-Size="25px"></asp:Label>
        </div>
        <div class="artist-image">
            <asp:Image ID="artistImg" runat="server" Height="150px" Width="150px" CssClass="artist-image"/>
        </div>
        <div class="artist-name">
            <asp:Label ID="artistName" runat="server" Font-Bold="True" Font-Size="18px"></asp:Label>
        </div>
        <div class="insert-album">
            <asp:Label ID="insertLbl" runat="server" Text="Insert Album" Visible="False" Font-Bold="True"></asp:Label>
            <div class="insert-button-container">
                <asp:Button ID="insertBtn" runat="server" Text="Insert" Visible="false" OnClick="insertBtn_Click" CssClass="insert-button" />
            </div>
        
        </div>
        <div class="album-label">
            <asp:Label ID="albumLbl" runat="server" Text="Artist released album:" Font-Bold="True" Font-Size="22px"></asp:Label>
        </div>
        <div class="empty-message">
            <asp:Label ID="isEmptyLbl" runat="server" Text="No album released by this artist :(" Visible="false"></asp:Label>
        </div>
        <div>
            <asp:GridView ID="albumGrid" runat="server" AutoGenerateColumns="False" OnRowDataBound="albumGrid_RowDataBound" CellPadding="3" CellSpacing="2" OnRowDeleting="albumGrid_RowDeleting" OnRowEditing="albumGrid_RowEditing" OnSelectedIndexChanged="albumGrid_SelectedIndexChanged" CssClass="album-grid">
              <Columns>
                <asp:TemplateField HeaderText="Image">
                  <ItemTemplate>
                    <asp:Image ID="albumImage" runat="server" ImageUrl='<%# Eval("AlbumImage") %>' Height="120px" Width="120px" />
                  </ItemTemplate>
                  <ControlStyle Height="120px" Width="120px" />
                </asp:TemplateField>
                <asp:BoundField DataField="AlbumID" HeaderText="ID" SortExpression="AlbumId" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide"/>
                <asp:BoundField DataField="AlbumName" HeaderText="Name" SortExpression="AlbumName" />
                <asp:BoundField DataField="AlbumPrice" HeaderText="Price" SortExpression="AlbumPrice" />
                <asp:BoundField DataField="AlbumStock" HeaderText="Stock" SortExpression="AlbumStock" />
                <asp:BoundField DataField="AlbumDescription" HeaderText="Description" SortExpression="AlbumDescription" />
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" ControlStyle-CssClass="gridview-button" />
                <asp:CommandField ButtonType="Button" HeaderText="Admin Control" ShowCancelButton="False" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" ControlStyle-CssClass="gridview-button" />
              </Columns>
              <RowStyle CssClass="album-grid-row" />
              <HeaderStyle CssClass="album-grid-header" />
              <SelectedRowStyle CssClass="album-grid-selected-row" />
            </asp:GridView>
        </div>
        <div class="error-message">
            <asp:Label ID="errorLbl" runat="server" Text=""></asp:Label>
        </div>
    </div>
    
</asp:Content>
