<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Guest.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KpopZtation.View.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../StyleCSS/formStyle.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="center-containerUp">
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
        <div class="form-groupCbx">
            <asp:CheckBox ID="rememberMeCbx" runat="server" Text="Remember Me" CssClass="checkbox-label" />
        </div>
        <div class="btn-container">
            <asp:Button ID="loginBtn" runat="server" Text="Login" OnClick="loginBtn_Click" CssClass="btn" />
        </div>
        <div class="error-container">
            <asp:Label ID="errorLbl" runat="server" CssClass="error-message" Visible ="false"></asp:Label>
        </div>

    </div>
</asp:Content>
