<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Guest.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="KpopZtation.View.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .containerUp {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .welcome {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
            font-size: 28px;
            font-weight: bold;
        }

        .insert-label {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .insert-button {
            font-size: 16px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .artist-section {
            margin-bottom: 20px;
        }

        .artist-label {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .artist-grid {
            width: 100%;
            text-align: center;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
        }

        .artist-grid th,
        .artist-grid td {
            padding: 10px;
            text-align: center;
            vertical-align: middle;
            border: 1px solid #ccc;
        }

        .artist-image {
            max-width: 100px;
            max-height: 100px;
            border-radius: 5px;
        }

        .admin-control-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .artist-grid .btn {
            font-size: 14px;
            height: 40px;
            padding: 5px 25px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .artist-grid .btn:hover {
            background-color: #0056b3;
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

        .artist-grid-header {
            background-color: #333;
            color: #fff;
        }

        .Hide {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="containerUp">
        <div class="welcome">
            <asp:Label ID="welcomeLbl" runat="server" Text="Welcome" Font-Bold="True" Font-Size="20pt" />
        </div>
        <div id="divID" class="insert-section">
            <asp:Label ID="insertLbl" runat="server" Text="Insert Artist" Visible="false" CssClass="insert-label"></asp:Label>
            <div>
                <asp:Button ID="insertBtn" runat="server" Text="Insert" OnClick="insertBtn_Click" Visible="false" CssClass="insert-button" />
            </div>
        </div>
        <div class="artist-section">
            <asp:Label ID="artistLbl" runat="server" Text="Available Artists" CssClass="artist-label"></asp:Label>
        </div>
        <div>
            <asp:GridView ID="artistGridView" runat="server" AutoGenerateColumns="False" OnRowDeleting="artistGridView_RowDeleting" OnRowEditing="artistGridView_RowEditing" OnSelectedIndexChanged="artistGridView_SelectedIndexChanged" OnRowDataBound="artistGridView_RowDataBound" CssClass="artist-grid">
                <Columns>
                    <asp:TemplateField HeaderText="Artist Picture">
                        <ItemTemplate>
                            <asp:Image ID="artistImage" runat="server" ImageUrl='<%# Eval("ArtistImage") %>' CssClass="artist-image" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ArtistID" HeaderText="ArtistID" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" />
                    <asp:BoundField DataField="ArtistName" HeaderText="Artist Name" />
                    <asp:CommandField ButtonType="Button" SelectText="View Artist" ShowSelectButton="True" ControlStyle-CssClass="btn" />
                    <asp:CommandField ButtonType="Button" HeaderText="Admin Control" ShowCancelButton="False" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" ControlStyle-CssClass="btn" />
                </Columns>
                <HeaderStyle CssClass="artist-grid-header" />
            </asp:GridView>
        </div>
        
    </div>
</asp:Content>
