<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Guest.Master" AutoEventWireup="true" CodeBehind="detail_artist.aspx.cs" Inherits="KpopZtation.View.ArtistFolder.detail_artist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body{
            font-family: Arial;
        }

        .containerUp {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .insert-button-container{
            text-align: start;
        }

        .insert-button {
            width: 150px;
            max-width: 100%;
            height: 40px;
            border-radius: 5px;
            border: none;
            background-color: #007bff;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }

        .insert-button:hover {
            background-color: #0056b3;
        }

        .album-grid {
            width: 100%;
            text-align: center;
            margin: 0 auto;
            border-collapse: collapse;
        }

        .album-grid-row {
            background-color: #f2f2f2;
        }

        .album-grid-header {
            background-color: #333;
            color: #fff;
            height: 40px;
        }

        .album-grid-selected-row {
            background-color: #ffd700;
        }

        .album-grid .gridview-button {
          width: 80px;
          height: 30px;
          border-radius: 3px;
          border: none;
          background-color: #007bff;
          color: #fff;
          font-size: 14px;
          cursor: pointer;
        }

        .album-grid .gridview-button:hover {
          background-color: #0056b3;
        }


        .page-title {
            text-align: center;
            margin-bottom: 20px;
        }
        

        .artist-image,
        .artist-name{
            text-align: center;
            margin-bottom: 20px;
        }
        .artist-image img {
            border-radius: 10%;
        }
        .album-label {
            text-align: start;
            margin-bottom: 20px;
        }

        .error-message {
            text-align: center;
        }

        .empty-message {
            text-align: center;
            margin-bottom: 20px;
            font-size: 16px;
            color: #888;
        }

        .Hide {
            display:none; 
        }

    </style>
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
