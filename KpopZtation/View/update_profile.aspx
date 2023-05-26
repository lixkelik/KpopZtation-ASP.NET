<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Customer.Master" AutoEventWireup="true" CodeBehind="update_profile.aspx.cs" Inherits="KpopZtation.View.update_profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="titleLbl" runat="server" Text="Update Profile"></asp:Label>
    <div>
        <asp:Label ID="nameLbl" runat="server" Text="Name: "></asp:Label>
        <asp:TextBox ID="nameTbx" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="emailLbl" runat="server" Text="Email: "></asp:Label>
        <asp:TextBox ID="emailTbx" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="genderlbl" runat="server" Text="Gender"></asp:Label>
        <asp:DropDownList ID="genderList" runat="server">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div>
        <asp:Label ID="addresslbl" runat="server" Text="Address"></asp:Label>
        <asp:TextBox ID="addressTbx" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="passlbl" runat="server" Text="Password"></asp:Label>
        <asp:TextBox ID="passTbx" runat="server" TextMode="Password"></asp:TextBox>
    </div>
    <div>
        <asp:Button ID="updateBtn" runat="server" Text="Update" OnClick="updateBtn_Click" />
    </div>
    <div>
        <asp:Label ID="errorLbl" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
