<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Admin.Master" AutoEventWireup="true" CodeBehind="transaction_report.aspx.cs" Inherits="KpopZtation.View.transaction_report" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
            font-family: Arial;
        }

        .report-container {
            width: 100%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }

        .report-title {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .report-viewer {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="report-container">
        <h2 class="report-title">Transaction Report</h2>
        <div class="report-viewer">
            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
        </div>
    </div>
</asp:Content>
