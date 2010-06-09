﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/WithTopLotteryMenu.master"
    AutoEventWireup="true" CodeFile="SHSSL_ZHFB.aspx.cs" Inherits="TrendCharts_SHSSL_SHSSL_ZHFB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/Core/css.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <table style="width: 100%; height: 40px; background-image: url(../Images/bg11111.jpg);"
        cellspacing="0" cellpadding="0">
        <tbody>
            <tr>
                <td style="width: 280px" align="center" valign="middle">
                    <h1 style="display: inline;">
                        <span class="td" style="font-weight: bold; font-size: 18px;">上海时时乐&nbsp;&nbsp;综合分布走势图</h1>
                </td>
                <td align="right" class="black12">
                    起始期数：<asp:TextBox ID="tb1" runat="server" Height="20px" Width="100px" CssClass="in_text_hui"></asp:TextBox>&nbsp;至&nbsp;<asp:TextBox
                        ID="tb2" runat="server" Height="20px" Width="100px" CssClass="in_text_hui"></asp:TextBox>
                </td>
                <td align="center" width="100" valign="middle">
                    <asp:Button ID="btnSearch" runat="server" Text="搜索" />
                </td>
                <td align="center" valign="middle">
                    <asp:Button ID="btnTop30" runat="server" Text="显示30期" />
                    <asp:Button ID="btnTop50" runat="server" Text="显示50期" />
                    <asp:Button ID="btnTop100" runat="server" Text="显示100期" />
                </td>
            </tr>
        </tbody>
    </table>
    <div id="div2" style="margin: 2px">
    </div>
    <table cellpadding="0" cellspacing="0" border="0" align="center">
        <tr>
            <td>
                <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="false"
                    FooterStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" align="center"
                    bordercolorlight="#808080" bordercolordark="#FFFFFF" RowStyle-HorizontalAlign="Center"
                    CellPadding="0" ShowHeader="true" OnRowCreated="GridView1_RowCreated" ShowFooter="true"
                    DataKeyNames="B_W,S_W,G_W">
                    <FooterStyle HorizontalAlign="Center"></FooterStyle>
                    <RowStyle HorizontalAlign="Center"></RowStyle>
                    <Columns>
                        <asp:BoundField DataField="Isuse" HeaderText="期号">
                            <ItemStyle CssClass="Isuse" Font-Bold="true" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LotteryNumber" HeaderText="开奖号码" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle Width="70" Font-Bold="true" ForeColor="#ff0000" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D1_0" HeaderText="B_0">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D1_1" HeaderText="B_1">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D1_2" HeaderText="B_0">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D1_3" HeaderText="B_1">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D1_4" HeaderText="B_0">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D1_5" HeaderText="B_1">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D1_6" HeaderText="B_0">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D1_7" HeaderText="B_1">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D1_8" HeaderText="B_0">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D1_9" HeaderText="B_1">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D2_0" HeaderText="B_2">
                            <ItemStyle CssClass="itemstyle2" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D2_1" HeaderText="B_3">
                            <ItemStyle CssClass="itemstyle2" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D2_2" HeaderText="B_2">
                            <ItemStyle CssClass="itemstyle2" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D2_3" HeaderText="B_3">
                            <ItemStyle CssClass="itemstyle2" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D2_4" HeaderText="B_2">
                            <ItemStyle CssClass="itemstyle2" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D2_5" HeaderText="B_3">
                            <ItemStyle CssClass="itemstyle2" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D2_6" HeaderText="B_2">
                            <ItemStyle CssClass="itemstyle2" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D2_7" HeaderText="B_3">
                            <ItemStyle CssClass="itemstyle2" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D2_8" HeaderText="B_2">
                            <ItemStyle CssClass="itemstyle2" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D2_9" HeaderText="B_3">
                            <ItemStyle CssClass="itemstyle2" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D3_0" HeaderText="B_4">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D3_1" HeaderText="S_0">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D3_2" HeaderText="B_4">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D3_3" HeaderText="S_0">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D3_4" HeaderText="B_4">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D3_5" HeaderText="S_0">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D3_6" HeaderText="B_4">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D3_7" HeaderText="S_0">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D3_8" HeaderText="B_4">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D3_9" HeaderText="S_0">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="J_O" HeaderText="奇偶">
                            <ItemStyle Width="50" Height="22" />
                        </asp:BoundField>
                        <asp:BoundField DataField="D_X" HeaderText="大小">
                            <ItemStyle Width="50" Height="22" />
                        </asp:BoundField>
                        <asp:BoundField DataField="B_0" HeaderText="B_4">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="B_1" HeaderText="S_0">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="B_2" HeaderText="B_4">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="B_3" HeaderText="S_0">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="B_4" HeaderText="B_4">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="B_5" HeaderText="S_0">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="B_6" HeaderText="B_4">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="B_7" HeaderText="S_0">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="B_8" HeaderText="B_4">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="B_9" HeaderText="S_0">
                            <ItemStyle CssClass="itemstyle1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Z_3" HeaderText="组3">
                            <ItemStyle Width="50" ForeColor="#CCCCCC" />
                        </asp:BoundField>
                        <asp:BoundField DataField="B_Z" HeaderText="豹子号">
                            <ItemStyle Height="22" CssClass="itemstyle1" Width="50" />
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
