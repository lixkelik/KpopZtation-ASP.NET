﻿<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Admin.Master" AutoEventWireup="true" CodeBehind="insert_artist.aspx.cs" Inherits="KpopZtation.View.ArtistFolder.insert_artist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        .form-label {
            display: block;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
            text-align: left; 
        }

        .form-control {
            width: 400px;
            max-width: 100%;
            height: 40px;
            border-radius: 5px;
            border: 1px solid #ccc;
            padding: 5px 10px;
            font-size: 16px;
            box-sizing: border-box;
            margin: 0 auto;
        }

        .form-control:focus {
            outline: none;
            box-shadow: 0 0 5px #aaa;
            border-color: #aaa;
        }

        .form-control-file {
            width: 400px;
            max-width: 100%;
            height: 40px;
            padding: 8px 0;
            font-size: 16px;
            border: none;
            background: none;
            box-sizing: border-box;
            margin: 0 auto;
        }

        .btn-container {
            text-align: center;
            margin-bottom: 10px;
        }

        .btn {
            width: 400px;
            max-width: 100%;
            height: 40px;
            border-radius: 5px;
            border: none;
            background-color: #007bff;
            color: #fff;
            font-size: 16px;
            text-transform: uppercase;
            cursor: pointer;
            margin: 0 auto;
        }

        .btn-primary {
            background-color: #007bff;
        }

        .error-label {
            color: #cc0000;
            margin-top: 10px;
            font-size: 14px;
            text-align: center;
            border: 1px solid #cc0000;
            padding: 5px;
            border-radius: 5px;
            background-color: #ffdddd;
            width: 400px;
            max-width: 100%;
            height: 40px;
            box-sizing: border-box;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: center; 
        }

        .center-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="center-container">
        <div style="margin-bottom: 20px;">
            <asp:Label ID="nameLbl" runat="server" Text="Artist Name" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="nameTbx" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div style="margin-bottom: 20px;">
            <asp:Label ID="imageLbl" runat="server" Text="Insert Image" CssClass="form-label"></asp:Label>
            <asp:FileUpload ID="imageUpload" runat="server" CssClass="form-control-file" />
        </div>
        <div class="btn-container">
            <asp:Button ID="insertBtn" runat="server" Text="Insert" OnClick="insertBtn_Click" CssClass="btn btn-primary" />
        </div>
        <div>
            <asp:Label ID="errorLbl" runat="server" Text="" CssClass="error-label" Visible ="false"></asp:Label>
        </div>
    </div>
</asp:Content>
