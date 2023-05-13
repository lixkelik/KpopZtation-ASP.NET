<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Guest.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="KpopZtation.View.Authentication.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="register" runat="server" Text="Create your account"></asp:Label>
    </div>
    <div>
        <asp:Label ID="namelbl" runat="server" Text="Name"></asp:Label>
        <asp:TextBox ID="nameTbx" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="emailLbl" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="emailTbx" runat="server" TextMode="Email"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="genderlbl" runat="server" Text="Gender"></asp:Label>
        <asp:DropDownList ID="genderList" runat="server">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div>
        <asp:Label ID="addreslbl" runat="server" Text="Address"></asp:Label>
        <asp:TextBox ID="addresTbx" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="passlbl" runat="server" Text="Password"></asp:Label>
        <asp:TextBox ID="passTbx" runat="server" TextMode="Password"></asp:TextBox>
    </div>
    <div>
        <asp:Button ID="registerBtn" runat="server" Text="Register" OnClick="registerBtn_Click" />
    </div>
    <div>
        <asp:Label ID="errorLbl" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
