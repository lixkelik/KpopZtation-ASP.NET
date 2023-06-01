<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Guest.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KpopZtation.View.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Custom CSS styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: center;
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

        .label-top-left {
            display: block;
            text-align: left;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .checkbox-label {
            font-size: 14px;
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

        .btn:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: #cc0000;
            margin-top: 10px;
            font-size: 14px;
            text-align: center;
        }

        .center-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="center-container">
        <h2>Login</h2>
        <div class="form-group">
            <asp:Label ID="emailLbl" runat="server" Text="Email" CssClass="label-top-left"></asp:Label>
            <div>
                <asp:TextBox ID="emailTbx" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <asp:Label ID="passLbl" runat="server" Text="Password" CssClass="label-top-left"></asp:Label>
            <div>
                <asp:TextBox ID="passTbx" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <asp:CheckBox ID="rememberMeCbx" runat="server" Text="Remember Me" CssClass="checkbox-label" />
        </div>
        <div class="btn-container">
            <asp:Button ID="loginBtn" runat="server" Text="Login" OnClick="loginBtn_Click" CssClass="btn" />
        </div>
        <div>
            <asp:Label ID="errorLbl" runat="server" CssClass="error-message"></asp:Label>
        </div>
    </div>
</asp:Content>
