﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/WithTopLotteryMenu.master"
    AutoEventWireup="true" CodeFile="SSQ_ZHFB.aspx.cs" Inherits="TrendCharts_SSQ_SSQ_ZHFB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/Core/css.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <table style="width: 100%; height: 40px; background-image: url(../Images/bg11111.jpg);"
        cellspacing="0" cellpadding="0">
        <tbody>
            <tr>
                <td style="width: 280px;" align="center" valign="middle">
                    <h1 style="display: inline;">
                        <span class="td" style="font-weight: bold; font-size: 18px;">双色球&nbsp;&nbsp;综合分布图走势图</h1>
                </td>
                <td align="right" class="black12" valign="middle">
                    起始期数：<asp:TextBox ID="tb1" runat="server" Width="100px" CssClass="in_text_hui"></asp:TextBox>&nbsp;至&nbsp;<asp:TextBox
                        ID="tb2" runat="server" Width="100px" CssClass="in_text_hui"></asp:TextBox>
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
    <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="false"
        FooterStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" align="center"
        bordercolorlight="#808080" bordercolordark="#FFFFFF" RowStyle-HorizontalAlign="Center"
        CellPadding="0" ShowHeader="true" OnRowCreated="GridView1_RowCreated" ShowFooter="true">
        <Columns>
            <asp:BoundField DataField="Isuse" HeaderText="期号">
                <ItemStyle CssClass="Isuse" />
            </asp:BoundField>
            <asp:BoundField DataField="B_1" HeaderText="01">
                <ItemStyle CssClass="itemstyle1" Height="18px" />
            </asp:BoundField>
            <asp:BoundField DataField="B_2" HeaderText="02">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_3" HeaderText="03">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_4" HeaderText="04">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_5" HeaderText="05">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_6" HeaderText="06">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_7" HeaderText="07">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_8" HeaderText="08">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_9" HeaderText="09">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_10" HeaderText="10">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_11" HeaderText="11">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_12" HeaderText="12">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_13" HeaderText="13">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_14" HeaderText="14">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_15" HeaderText="15">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_16" HeaderText="16">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_17" HeaderText="17">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_18" HeaderText="18">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_19" HeaderText="19">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_20" HeaderText="20">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_21" HeaderText="21">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_22" HeaderText="22">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_23" HeaderText="23">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_24" HeaderText="24">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_25" HeaderText="25">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_26" HeaderText="26">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_27" HeaderText="27">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_28" HeaderText="28">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_29" HeaderText="29">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_30" HeaderText="30">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_31" HeaderText="31">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_32" HeaderText="32">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="B_33" HeaderText="33">
                <ItemStyle CssClass="itemstyle1" />
            </asp:BoundField>
            <asp:BoundField DataField="BQ_0" HeaderText="蓝球">
                <ItemStyle Width="30" />
            </asp:BoundField>
            <%--<asp:BoundField DataField="K_0" HeaderText="快乐星期天">
                    <ItemStyle Width="130" ForeColor="#FF0000" Font-Bold="true" />
                </asp:BoundField>--%>
            <asp:BoundField DataField="L_012" HeaderText="012路">
                <ItemStyle CssClass="itemstyle3" />
            </asp:BoundField>
            <asp:BoundField DataField="C_H" HeaderText="重号">
                <ItemStyle Width="40" />
            </asp:BoundField>
            <asp:BoundField DataField="L_H" HeaderText="连号">
                <ItemStyle CssClass="itemstyle3" />
            </asp:BoundField>
            <asp:BoundField DataField="Z_H" HeaderText="总和">
                <ItemStyle />
            </asp:BoundField>
            <asp:BoundField DataField="S_Q" HeaderText="三区比">
                <ItemStyle CssClass="itemstyle3" />
            </asp:BoundField>
            <asp:BoundField DataField="J_O" HeaderText="奇偶比">
                <ItemStyle />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
</asp:Content>
