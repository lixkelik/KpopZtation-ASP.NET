<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Guest.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="KpopZtation.View.Authentication.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../StyleCSS/formStyle.css" />
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
