<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Admin.Master" AutoEventWireup="true" CodeBehind="edit_album.aspx.cs" Inherits="KpopZtation.View.AlbumFolder.edit_album" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .containerEdit {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }

        h2 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }


        .input {
            display: flex;
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            margin-bottom: 20px;
            box-sizing: border-box;
        }

        .input:focus {
            outline: none;
            box-shadow: 0 0 5px #aaa;
            border-color: #aaa;
        }


        .image-container {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }

        .album-image {
            max-width: 150px;
            max-height: 150px;
            object-fit: cover;
            border-radius: 10%;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }

        .file-upload {
            margin-top: 10px;
            margin-bottom: 20px;
        }

        .button {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            box-sizing: border-box;
            margin: 10px 0 10px 0;
        }

        .error {
            color: #cc0000;
            margin-top: 10px;
            font-size: 14px;
            text-align: center;
            border: 1px solid #cc0000;
            padding: 5px;
            border-radius: 5px;
            background-color: #ffdddd;
            width: 100%;
            height: 40px;
            box-sizing: border-box;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: center; 
        }
        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="containerEdit">
        <h2>Update Album Data</h2>
        <div>
            <label for="nameTbx">Album Name</label>
            <asp:TextBox ID="nameTbx" runat="server" CssClass="input"></asp:TextBox>
        </div>
        <div>
            <label for="descTbx">Description</label>
            <asp:TextBox ID="descTbx" runat="server" CssClass="input"></asp:TextBox>
        </div>
        <div>
            <label for="priceTbx">Price</label>
            <asp:TextBox ID="priceTbx" runat="server" type="number" CssClass="input"></asp:TextBox>
        </div>
        <div>
            <label for="stockTbx">Stock</label>
            <asp:TextBox ID="stockTbx" runat="server" type="number" CssClass="input"></asp:TextBox>
        </div>
        <div class="image-container">
            <asp:Image ID="albumImage" runat="server" CssClass="album-image" Height="150" Width="150" />
        </div>
        <div class="form-group">
            <label for="imgUpload">Album Image</label>
            <asp:FileUpload ID="imgUpload" runat="server" CssClass="file-upload" />
        </div>
        <div>
            <asp:Button ID="updateBtn" runat="server" Text="Update" CssClass="button" OnClick="updateBtn_Click" />
            <asp:Label ID="errorLbl" runat="server" CssClass="error" Text="" Visible ="false"></asp:Label>
        </div>
    </div>
</asp:Content>
