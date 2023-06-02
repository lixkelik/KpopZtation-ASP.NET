<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Guest.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="KpopZtation.View.Authentication.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
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

        .center-containerUp {
            position: absolute;
            left: 50%;
            top: 50%;
            margin-left: -200px;
            margin-top: -300px;
            max-width: 400px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="center-containerUp">
        <asp:Label ID="register" runat="server" Text="Create your account" Font-Bold="True" Font-Size="XX-Large" Height="70px"></asp:Label>
        <div class="form-group">
            <asp:Label ID="namelbl" runat="server" Text="Name" CssClass="label-top-left"></asp:Label>
            <asp:TextBox ID="nameTbx" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="emailLbl" runat="server" Text="Email" CssClass="label-top-left"></asp:Label>
            <asp:TextBox ID="emailTbx" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="genderlbl" runat="server" Text="Gender" CssClass="label-top-left"></asp:Label>
            <asp:DropDownList ID="genderList" runat="server" CssClass="form-control">
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <asp:Label ID="addreslbl" runat="server" Text="Address" CssClass="label-top-left"></asp:Label>
            <asp:TextBox ID="addresTbx" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="passlbl" runat="server" Text="Password" CssClass="label-top-left"></asp:Label>
            <asp:TextBox ID="passTbx" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        </div>
        <div class="btn-container">
            <asp:Button ID="registerBtn" runat="server" Text="Register" OnClick="registerBtn_Click" CssClass="btn" />
        </div>
        <div>
            <asp:Label ID="errorLbl" runat="server" CssClass="error-message" Visible ="false"></asp:Label>
        </div>
    </div>
</asp:Content>
