<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Guest.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="KpopZtation.View.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="StyleCSS/homeStyle.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="containerUp">
        <div class="welcome">
            <asp:Label ID="welcomeLbl" runat="server" Text="Welcome" Font-Bold="True" Font-Size="20pt" />
        </div>
        <div id="divID" class="insert-section">
            <asp:Label ID="insertLbl" runat="server" Text="Insert Artist" Visible="false" CssClass="insert-label"></asp:Label>
            <div>
                <asp:Button ID="insertBtn" runat="server" Text="Insert" OnClick="insertBtn_Click" Visible="false" CssClass="insert-button" />
            </div>
        </div>
        <div class="artist-section">
            <asp:Label ID="artistLbl" runat="server" Text="Available Artists" CssClass="artist-label"></asp:Label>
        </div>
        <div>
            <asp:GridView ID="artistGridView" runat="server" AutoGenerateColumns="False" OnRowDeleting="artistGridView_RowDeleting" OnRowEditing="artistGridView_RowEditing" OnSelectedIndexChanged="artistGridView_SelectedIndexChanged" OnRowDataBound="artistGridView_RowDataBound" CssClass="artist-grid">
                <Columns>
                    <asp:TemplateField HeaderText="Artist Picture">
                        <ItemTemplate>
                            <asp:Image ID="artistImage" runat="server" ImageUrl='<%# Eval("ArtistImage") %>' CssClass="artist-image" Height="100px" Width="100px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ArtistID" HeaderText="ArtistID" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
<HeaderStyle CssClass="Hide"></HeaderStyle>

<ItemStyle CssClass="Hide"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="ArtistName" HeaderText="Artist Name" />
                    <asp:CommandField ButtonType="Button" SelectText="View Artist" ShowSelectButton="True" ControlStyle-CssClass="btn" >
<ControlStyle CssClass="btn"></ControlStyle>
                    </asp:CommandField>
                    <asp:CommandField ButtonType="Button" HeaderText="Admin Control" ShowCancelButton="False" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" ControlStyle-CssClass="btn" >
<ControlStyle CssClass="btn"></ControlStyle>
                    </asp:CommandField>
                </Columns>
                <HeaderStyle CssClass="artist-grid-header" />
            </asp:GridView>
        </div>
        
    </div>
</asp:Content>
