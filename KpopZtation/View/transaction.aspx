<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Customer.Master" AutoEventWireup="true" CodeBehind="transaction.aspx.cs" Inherits="KpopZtation.View.transaction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        body{
            font-family: Arial;
            background-color: #f5f5f5;
        }

        .transaction-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .transaction-grid {
            width: 100%;
            text-align: center;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
        }

        .transaction-grid th,
        .transaction-grid td {
            padding: 10px;
            text-align: center;
            vertical-align: middle;
            border: 1px solid #000;
        }

        .transaction-detail-grid {
            width: 100%;
            text-align: center;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
        }

        .transaction-detail-grid th,
        .transaction-detail-grid td {
            padding: 10px;
            text-align: center;
            vertical-align: middle;
            border: 1px solid #ccc;
        }

        .containerUp {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .album-image {
            height: 100px;
            width: 100px;
            border-radius: 5px;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class ="containerUp">
        <div class="transaction-title">
            <asp:Label ID="titleLbl" runat="server" Text="Transaction History"></asp:Label>
        </div>
        <div>
            <asp:GridView ID="transactionGrid" runat="server" AutoGenerateColumns="False" OnRowDataBound="transactionGrid_RowDataBound" CssClass="transaction-grid">
                <Columns>
                    <asp:BoundField DataField="TransactionID" HeaderText="Transaction ID" SortExpression="TransactionID" ItemStyle-Width="120px"/>
                    <asp:BoundField DataField="TransactionDate" HeaderText="Transaction Date" SortExpression="TransactionDate" ItemStyle-Width="180px"/>
                    <asp:BoundField DataField="Customer.CustomerName" HeaderText="Customer Name" SortExpression="Customer.CustomerName" />
                    <asp:TemplateField HeaderText="Album Order List">
                        <ItemTemplate>
                            <asp:GridView ID="transactionDetailGrid" runat="server" AutoGenerateColumns="false" CssClass="transaction-detail-grid">
                                <Columns>
                                    <asp:TemplateField HeaderText="Album Image">
                                        <ItemTemplate>
                                            <asp:Image ID="AlbumImage" runat="server" ImageUrl='<%# Eval("Album.AlbumImage") %>' CssClass="album-image" />
                                        </ItemTemplate>
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
    </div>
</asp:Content>
