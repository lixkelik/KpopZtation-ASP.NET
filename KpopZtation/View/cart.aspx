<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Customer.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="KpopZtation.View.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="titleLbl" runat="server" Text="Your Cart"></asp:Label>
    <div>
        <asp:GridView ID="cartGrid" runat="server" AutoGenerateColumns="False" OnRowDeleting="cartGrid_RowDeleting">
            <Columns>
                <asp:TemplateField HeaderText="Album Image">
                    <ItemTemplate>
                        <asp:Image ID="AlbumImage" runat="server" ImageUrl='<%# Eval("Album.AlbumImage") %>' />
                    </ItemTemplate>
                    <ControlStyle Height="120px" Width="120px" />
                    <ItemStyle Width="120px" />
                </asp:TemplateField>
                <asp:BoundField DataField="Album.AlbumId" HeaderText="ID" SortExpression="AlbumId" />
                <asp:BoundField DataField="Album.AlbumName" HeaderText="Name" SortExpression="AlbumName" />
                <asp:BoundField DataField="Qty" HeaderText="Quantity" SortExpression="Qty" />
                <asp:BoundField DataField="Album.AlbumPrice" HeaderText="Price" SortExpression="AlbumPrice" />
                <asp:CommandField ButtonType="Button" DeleteText="Remove" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </div>
    <div>
        <asp:Label ID="isEmptyLbl" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <asp:Label ID="errorLbl" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <asp:Button ID="checkoutBtn" runat="server" Text="Checkout" OnClick="checkoutBtn_Click"/>
    </div>
</asp:Content>
