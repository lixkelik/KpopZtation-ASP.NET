<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Unauthorized.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KpopZtation.View.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="emailLbl" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="emailTbx" runat="server" TextMode="Email"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="passLbl" runat="server" Text="Password"></asp:Label>
        <asp:TextBox ID="passTbx" runat="server" TextMode="Password"></asp:TextBox>
    </div>
    <div>
        <asp:CheckBox ID="rememberMeCbx" runat="server" Text="Remember Me"/>
    </div>
    <div>
        <asp:Button ID="loginBtn" runat="server" Text="Login" OnClick="loginBtn_Click"/>
        <asp:Label ID="errorLbl" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
