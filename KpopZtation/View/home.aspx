<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Guest.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="KpopZtation.View.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="welcomeLbl" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <asp:GridView ID="artistGridView" runat="server" AutoGenerateColumns="False" OnRowDeleting="artistGridView_RowDeleting" OnRowEditing="artistGridView_RowEditing" OnSelectedIndexChanged="artistGridView_SelectedIndexChanged" OnRowDataBound="artistGridView_RowDataBound">
            <Columns>
                <asp:BoundField DataField="ArtistID" HeaderText="ArtistID" />
                <asp:BoundField DataField="ArtistName" HeaderText="Artist Name" />
                <asp:ImageField DataImageUrlField="ArtistImage" HeaderText="Artist Picture">
                    <ControlStyle Height="120px" Width="120px" />
                </asp:ImageField>
                <asp:CommandField ButtonType="Button" SelectText="View Artist" ShowSelectButton="True" />
                <asp:CommandField ButtonType="Button" HeaderText="Admin Control" ShowCancelButton="False" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
