﻿<%@ page language="C#" autoeventwireup="true" CodeFile="~/TrendCharts/JXSSC/SSC_2X_ZHFBZST.aspx.cs" inherits="Home_TrendCharts_JXSSC_SSC_2X_ZHFBZST" enableEventValidation="false" %>

<%@ Register Src="../../Home/Room/UserControls/Lotteries.ascx" TagName="Lotteries"
    TagPrefix="uc1" %>
<%@ Register Src="../../Home/Room/UserControls/TrendChartHead.ascx" TagName="TrendChartHead"
    TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>时时彩标准二星综合走势图-时时彩走势图-彩票走势图表和数据分析－<%=_Site.Name %></title>
    <meta name="keywords" content="时时彩走势图-时时彩标准二星综合走势图" />
    <meta name="description" content="时时彩走势图-时时彩标准二星综合走势图、彩票走势图表和数据分析。" />
    <style type="text/css">
        .td
        {
            color: #cc0000;
        }
        td
        {
            font-size: 12px;
        }
        body
        {
            font-family: tahoma;
            text-align: center;
            margin: 0px;
            margin-left: 10px;
            margin-right: 10px;
        }
        form
        {
            display: inline;
        }
        .in_text_hui
        {
            height: 18px;
            border: 1px solid #cccccc;
            background-color: #FFFFFF;
            color: #666666;
            font-size: 12px;
            font-family: tahoma;
        }
        .Isuse
        {
            background-color: #DCDCDC;
            color: #676767;
            width: 70px;
        }
        .itemstyle1
        {
            background-color: #FFE8EB;
            color: #999999;
            width: 16px;
        }
        .itemstyle2
        {
            background-color: #FFFFFF;
            color: #999999;
            width: 16px;
        }
        .itemstyle3
        {
            background-color: #ffffff;
            color: #ff0000;
            height: 16px;
            width: 25px;
        }
        .itemstyle4
        {
            background-color: #FFE8EB;
            color: #0000ff;
            height: 16px;
            width: 32px;
        }
        .itemstyle5
        {
            background-color: #cbe5fe;
            color: #999999;
            width: 16px;
        }
        .itemstyle6
        {
            background-color: #f7f7f7;
            color: #0000ff;
            width: 20px;
        }
        #box1
        {
            overflow: hidden;
            width: 1002px;
            margin-right: auto;
            margin-left: auto;
            padding: 0px;
        }
    </style>
    <link href="../../Home/Room/style/css.css" rel="stylesheet" type="text/css" />
     <link rel="shortcut icon" href="../../favicon.ico" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:PlaceHolder ID="phHead" runat="server"></asp:PlaceHolder>
    <uc1:Lotteries ID="Lotteries1" runat="server" />
    <uc2:TrendChartHead ID="TrendChartHead1" runat="server" />
    <div id="box1">
        <table style="width: 100%; height: 40px; background-image: url(../Images/bg11111.jpg);"
            cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td style="width: 280px" align="center" valign="middle">
                        <h1 class="td" style="font-weight: bold; font-size: 18px;display:inline;">
                            时时彩&nbsp;&nbsp;二星综合走势图</h1>
                    </td>
                    <td align="right" class="black12">
                        起始期数：<asp:TextBox ID="tb1" runat="server" Height="20px" Width="100px" CssClass="in_text_hui"></asp:TextBox>&nbsp;至&nbsp;<asp:TextBox
                            ID="tb2" runat="server" Height="20px" Width="100px" CssClass="in_text_hui"></asp:TextBox>
                    </td>
                    <td align="center" width="100" valign="middle">
                        <asp:Button ID="btnSearch" runat="server" Text="搜索" OnClick="btnSearch_Click" />
                    </td>
                    <td align="center" valign="middle">
                        <asp:Button ID="btnTop30" runat="server" Text="显示30期" OnClick="btnTop30_Click" />
                        <asp:Button ID="btnTop50" runat="server" Text="显示50期" OnClick="btnTop50_Click" />
                        <asp:Button ID="btnTop100" runat="server" Text="显示100期" OnClick="btnTop100_Click" />
                    </td>
                </tr>
            </tbody>
        </table>
        <div id="div2" style="margin: 2px">
        </div>
        <div id="div3">
            <table cellspacing="0" cellpadding="1" border="0" style="background-color: #cccccc;
                width: 100%; text-align: left; font-size: 12px;">
                <tr>
                    <td style="background-color: #EFEFEF; text-align: left; font-size: 12px;">
                        <a href="<%= _Site.Url %>" target="_blank" style="text-decoration: none; font-size: 14px;
                            padding-left: 10px;"><%=_Site.Name %>首页</a> <a href="<%= ResolveUrl("~/Lottery/Buy_SSC.aspx") %>"
                                target="_blank" style="padding-left: 10px; text-decoration: none; color: Red;">时时彩投注/合买</a>
                        <a href="<%= ResolveUrl("~/WinQuery/61-0-0.aspx") %>" target="_blank" style="padding-left: 10px;
                            text-decoration: none; color: Red;">时时彩中奖查询</a>
                    </td>
                    <td style="background-color: #EFEFEF; text-align: left;">
                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tr>
                                <td>
                                    <asp:Label ID="lbAd" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbAd1" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbAd2" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="false"
            FooterStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" align="center"
            OnRowCreated="GridView1_RowCreated" bordercolorlight="#808080" bordercolordark="#FFFFFF"
            RowStyle-HorizontalAlign="Center" CellPadding="0" ShowHeader="true" ShowFooter="true">
            <HeaderStyle Font-Size="12px" Height="56px" BackColor="#E8F1F8" />
            <FooterStyle HorizontalAlign="Center" Font-Size="12px" BackColor="#E8F1F8" Height="56px">
            </FooterStyle>
            <RowStyle HorizontalAlign="Center"></RowStyle>
            <Columns>
                <asp:BoundField DataField="Isuse" HeaderText="期号">
                    <ItemStyle CssClass="Isuse" />
                </asp:BoundField>
                <asp:BoundField DataField="LotteryNumber" HeaderText="奖号">
                    <ItemStyle Width="50" Font-Bold="true" />
                </asp:BoundField>
                <asp:BoundField DataField="P_0" HeaderText="0">
                    <ItemStyle CssClass="itemstyle5" />
                </asp:BoundField>
                <asp:BoundField DataField="P_1" HeaderText="1">
                    <ItemStyle CssClass="itemstyle5" />
                </asp:BoundField>
                <asp:BoundField DataField="P_2" HeaderText="2">
                    <ItemStyle CssClass="itemstyle5" />
                </asp:BoundField>
                <asp:BoundField DataField="P_3" HeaderText="3">
                    <ItemStyle CssClass="itemstyle5" />
                </asp:BoundField>
                <asp:BoundField DataField="P_4" HeaderText="4">
                    <ItemStyle CssClass="itemstyle5" />
                </asp:BoundField>
                <asp:BoundField DataField="P_5" HeaderText="5">
                    <ItemStyle CssClass="itemstyle5" />
                </asp:BoundField>
                <asp:BoundField DataField="P_6" HeaderText="6">
                    <ItemStyle CssClass="itemstyle5" />
                </asp:BoundField>
                <asp:BoundField DataField="P_7" HeaderText="7">
                    <ItemStyle CssClass="itemstyle5" />
                </asp:BoundField>
                <asp:BoundField DataField="P_8" HeaderText="8">
                    <ItemStyle CssClass="itemstyle5" />
                </asp:BoundField>
                <asp:BoundField DataField="P_9" HeaderText="9">
                    <ItemStyle CssClass="itemstyle5" />
                </asp:BoundField>
                <asp:BoundField DataField="S_0" HeaderText="0">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="S_1" HeaderText="1">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="S_2" HeaderText="2">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="S_3" HeaderText="3">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="S_4" HeaderText="4">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="S_5" HeaderText="5">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="S_6" HeaderText="6">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="S_7" HeaderText="7">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="S_8" HeaderText="8">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="S_9" HeaderText="9">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="G_0" HeaderText="0">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="G_1" HeaderText="1">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="G_2" HeaderText="2">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="G_3" HeaderText="3">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="G_4" HeaderText="4">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="G_5" HeaderText="5">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="G_6" HeaderText="6">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="G_7" HeaderText="7">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="G_8" HeaderText="8">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="G_9" HeaderText="9">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="H_Z" HeaderText="和值">
                    <ItemStyle CssClass="itemstyle6" />
                </asp:BoundField>
                <asp:BoundField DataField="H_Z_W" HeaderText="和尾">
                    <ItemStyle CssClass="itemstyle3" />
                </asp:BoundField>
                <asp:BoundField DataField="C_Z" HeaderText="差值">
                    <ItemStyle CssClass="itemstyle4" />
                </asp:BoundField>
                <asp:BoundField DataField="J_O" HeaderText="奇偶比">
                    <ItemStyle CssClass="itemstyle3" />
                </asp:BoundField>
                <asp:BoundField DataField="D_X" HeaderText="大小比">
                    <ItemStyle CssClass="itemstyle4" />
                </asp:BoundField>
                <asp:BoundField DataField="Z_H" HeaderText="质合比">
                    <ItemStyle CssClass="itemstyle3" />
                </asp:BoundField>
                <asp:BoundField DataField="L_G" HeaderText="连号">
                    <ItemStyle CssClass="itemstyle4" />
                </asp:BoundField>
                <asp:BoundField DataField="T_H" HeaderText="同号有无">
                    <ItemStyle Width="30" ForeColor="#FF0000" />
                </asp:BoundField>
                <asp:BoundField DataField="C_F_H" HeaderText="上期重复号码个数">
                    <ItemStyle CssClass="itemstyle4" Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="C_G" HeaderText="0—9出号个数">
                    <ItemStyle ForeColor="#FF0000" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
        </asp:GridView>
        <div style="margin: 1px; text-align: left; font-size: 12px;">
            <table cellspacing="0" cellpadding="1" border="0" style="background-color: #cccccc;
                width: 100%; text-align: left;">
                <tr>
                    <td style="background-color: #EFEFEF; text-align: left;">
                        <a href="<%= _Site.Url %>" target="_blank"
                            style="text-decoration: none; font-size: 14px; padding-left: 10px;"><%=_Site.Name %>首页</a>
                        <a href="<%= ResolveUrl("~/Lottery/Buy_SSC.aspx") %>" target="_blank" style="padding-left: 10px;
                            text-decoration: none; color: Red;">时时彩投注/合买</a> <a href="<%= ResolveUrl("~/WinQuery/61-0-0.aspx") %>"
                                target="_blank" style="padding-left: 10px; text-decoration: none; color: Red;">时时彩中奖查询</a><span
                                    class='blue14' style='padding-right: 8px;'>时时彩:</span><a href='SSC_5X_ZHFB.aspx'
                            target='mainFrame'>标准五星综合走势图</a> | <a href='SSC_5X_ZST.aspx' target='mainFrame'>标准五星走势图</a>
                        | <a href='SSC_5X_HZZST.aspx' target='mainFrame'>五星和值走势图</a> | <a href='SSC_5X_KDZST.aspx'
                            target='mainFrame'>五星跨度走势图</a> | <a href='SSC_5X_PJZZST.aspx' target='mainFrame'>五星平均值走势图</a>
                        | <a href='SSC_5X_DXZST.aspx' target='mainFrame'>五星大小走势图</a> | <a href='SSC_5X_JOZST.aspx'
                            target='mainFrame'>五星奇偶走势图</a> | <a href='SSC_5X_ZHZST.aspx' target='mainFrame'>五星质合走势图</a>
                        | <a href='SSC_4X_ZHFB.aspx' target='mainFrame'>标准四星综合走势图</a> |<a href='SSC_4X_ZST.aspx'
                            target='mainFrame'>标准四星走势图</a> | <a href='SSC_4X_HZZST.aspx' target='mainFrame'>四星和值走势图</a>
                        | <a href='SSC_4X_KDZST.aspx' target='mainFrame'>四星跨度走势图</a> | <a href='SSC_4X_PJZZST.aspx'
                            target='mainFrame'>四星平均值走势图</a> | <a href='SSC_4X_DXZST.aspx' target='mainFrame'>四星大小走势图</a>
                        | <a href='SSC_4X_JOZST.aspx' target='mainFrame'>四星奇偶走势图</a> | <a href='SSC_4X_ZHZST.aspx'
                            target='mainFrame'>四星质合走势图</a> | <a href='SSC_3X_ZHZST.aspx' target='mainFrame'>标准三星综合走势图</a>
                        | <a href='SSC_3X_ZST.aspx' target='mainFrame'>标准三星走势图</a> | <a href='SSC_3X_HZZST.aspx'
                            target='mainFrame'>三星和值走势图</a> | <a href='SSC_3X_HZWZST.aspx' target='mainFrame'>三星和值尾走势图</a>
                        | <a href='SSC_3X_KDZST.aspx' target='mainFrame'>三星跨度走势图</a> | <a href='SSC_3X_DXZST.aspx'
                            target='mainFrame'>三星大小走势图</a> | <a href='SSC_3X_JOZST.aspx' target='mainFrame'>三星奇偶走势图</a>
                        <a href='SSC_3X_ZhiHeZST.aspx' target='mainFrame'>三星质合走势图</a> | <a href='SSC_3X_DX_012_ZST.aspx'
                            target='mainFrame'>单选012路走势图</a> | <a href='SSC_3X_ZX_012_ZST.aspx' target='mainFrame'>
                                组选012路走势图</a> | <a href='SSC_2X_ZHFBZST.aspx' target='mainFrame'>标准二星综合走势图</a>
                        | <a href='SSC_2X_HZZST.aspx' target='mainFrame'>二星和值走势图</a> | <a href='SSC_2X_HZWZST.aspx'
                            target='mainFrame'>二星和尾走势图</a> | <a href='SSC_2XPJZZST.aspx' target='mainFrame'>二星均值走势图</a>
                        | <a href='SSC_2X_KDZST.aspx' target='mainFrame'>二星跨度走势图</a> | <a href='SSC_2X_012ZST.aspx'
                            target='mainFrame'>二星012路走势图</a> | <a href='SSC_2X_MaxZST.aspx' target='mainFrame'>二星最大值走势图</a>
                        | <a href='SSC_2X_MinZST.aspx' target='mainFrame'>二星最小值走势图</a> | <a href='SSC_2X_DXDSZST.aspx'
                            target='mainFrame'>大小单双走势图</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <asp:PlaceHolder ID="phFoot" runat="server"></asp:PlaceHolder>
    </form>
    <!--#includefile="../../Html/TrafficStatistics/1.htm"-->
</body>
</html>