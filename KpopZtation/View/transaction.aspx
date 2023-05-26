<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Customer.Master" AutoEventWireup="true" CodeBehind="transaction.aspx.cs" Inherits="KpopZtation.View.transaction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="titleLbl" runat="server" Text="Transaction History"></asp:Label>
    <div>
        <asp:GridView ID="transactionGrid" runat="server" AutoGenerateColumns ="False" OnRowDataBound="transactionGrid_RowDataBound">
            <Columns>
                <asp:BoundField DataField="TransactionID" HeaderText="Transaction ID" SortExpression="TransactionID" />
                <asp:BoundField DataField="TransactionDate" HeaderText="Transaction Date" SortExpression="TransactionDate" />
                <asp:BoundField DataField="Customer.CustomerName" HeaderText="Customer Name" SortExpression="Customer.CustomerName" />
                <asp:TemplateField HeaderText="Album Order List">
                <ItemTemplate>
                    <asp:GridView ID="transactionDetailGrid" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField HeaderText="Album Image">
                                <ItemTemplate>
                                    <asp:Image ID="AlbumImage" runat="server" ImageUrl='<%# Eval("Album.AlbumImage") %>' />
                                </ItemTemplate>
                                <ControlStyle Height="120px" Width="120px" />
                                <ItemStyle Width="120px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Album.AlbumName" HeaderText="Album Name" SortExpression="Album.AlbumName" />
                            <asp:BoundField DataField="Qty" HeaderText="Quantity" SortExpression="TransactionDetail.Qty" />
                            <asp:BoundField DataField="Album.AlbumPrice" HeaderText="Album Price" SortExpression="Album.AlbumPrice" />
                        </Columns>
                    </asp:GridView>
                </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Label ID="isEmptyLbl" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
