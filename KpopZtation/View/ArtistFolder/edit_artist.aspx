﻿<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Admin.Master" AutoEventWireup="true" CodeBehind="edit_artist.aspx.cs" Inherits="KpopZtation.View.ArtistFolder.edit_artist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
            font-family: Arial;
        }
        .containerEdit {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }

        .label {
            font-size: 18px;
            font-weight: 400;
            margin-bottom: 10px;
        }

        .labelTitle {
            font-size: 25px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .input {
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

        .artist-image {
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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="containerEdit">
        <h2 class="labelTitle">Update Artist Data</h2>
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
