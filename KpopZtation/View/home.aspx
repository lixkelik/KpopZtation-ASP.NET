<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Guest.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="KpopZtation.View.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="welcomeLbl" runat="server" Font-Bold="True" Font-Size="20pt"></asp:Label>
    </div>
    <div>
        <asp:Label ID="insertLbl" runat="server" Text="Insert Artist" Visible ="false"></asp:Label>
        <asp:Button ID="insertBtn" runat="server" Text="Insert" OnClick="insertBtn_Click" Visible="false"/>
    </div>
    <div>
        <asp:Label ID="artistLbl" runat="server" Text="Available artist: " Font-Size="15pt"></asp:Label>
    </div>
    <div>
        <asp:GridView ID="artistGridView" runat="server" AutoGenerateColumns="False" OnRowDeleting="artistGridView_RowDeleting" OnRowEditing="artistGridView_RowEditing" OnSelectedIndexChanged="artistGridView_SelectedIndexChanged" OnRowDataBound="artistGridView_RowDataBound">
            <Columns>
                <asp:ImageField DataImageUrlField="ArtistImage" HeaderText="Artist Picture">
                    <ControlStyle Height="120px" Width="120px" />
                </asp:ImageField>
                <asp:BoundField DataField="ArtistID" HeaderText="ArtistID" />
                <asp:BoundField DataField="ArtistName" HeaderText="Artist Name" />
                <asp:CommandField ButtonType="Button" SelectText="View Artist" ShowSelectButton="True" />
                <asp:CommandField ButtonType="Button" HeaderText="Admin Control" ShowCancelButton="False" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
