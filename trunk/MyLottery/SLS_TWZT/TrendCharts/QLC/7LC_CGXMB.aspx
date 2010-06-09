﻿<%@ page language="C#" autoeventwireup="true" CodeFile="~/TrendCharts/QLC/7LC_CGXMB.aspx.cs" inherits="Home_TrendCharts_7LC_7LC_CGXMB" enableEventValidation="false" %>

<%@ Register Src="../../Home/Room/UserControls/Lotteries.ascx" TagName="Lotteries"
    TagPrefix="uc1" %>
<%@ Register Src="../../Home/Room/UserControls/TrendChartHead.ascx" TagName="TrendChartHead"
    TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>7乐彩常规项目表-7乐彩走势图-彩票走势图表和数据分析－<%=_Site.Name %></title>
    <meta name="keywords" content="7乐彩走势图-7乐彩常规项目表" />
    <meta name="description" content="7乐彩走势图-7乐彩常规项目表、彩票走势图表和数据分析。" />
    <style type="text/css">
        .td
        {
            color: #cc0000;
        }
        td, th
        {
            font-size: 14px;
            font-family: tahoma;
            text-align: center;
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
            width: 80px;
        }
        .itemstyle1
        {
            background-color: #ffe8eb;
            width: 60px;
        }
        .itemstyle2
        {
            background-color: #FDFCDF;
            width: 60px;
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
                            7乐彩&nbsp;&nbsp;常规项目表走势图</h1>
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
                            padding-left: 10px;"><%=_Site.Name %>首页</a> <a href="<%= ResolveUrl("~/Lottery/Buy_QLC.aspx") %>"
                                target="_blank" style="padding-left: 10px; text-decoration: none; color: Red;">七乐彩投注/合买</a>
                        <a href="<%= ResolveUrl("~/WinQuery/13-0-0.aspx") %>" target="_blank" style="padding-left: 10px;
                            text-decoration: none; color: Red;">七乐彩中奖查询</a>
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
        <div style="margin: 2px">
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" FooterStyle-HorizontalAlign="Center"
            HeaderStyle-HorizontalAlign="Center" align="center" bordercolorlight="#808080"
            Width="100%" bordercolordark="#FFFFFF" RowStyle-HorizontalAlign="Center" CellPadding="0"
            ShowHeader="true" ShowFooter="true">
            <HeaderStyle BackColor="#e8f1f8" Height="35px" Font-Bold="false" Font-Size="14px" />
            <FooterStyle BackColor="#e8f1f8" Height="35px" Font-Bold="true" Font-Size="14px" />
            <RowStyle Font-Bold="true" />
            <Columns>
                <asp:BoundField DataField="Isuse" HeaderText="期号" FooterText="期号">
                    <ItemStyle CssClass="Isuse" />
                </asp:BoundField>
                <asp:BoundField DataField="R_Q" HeaderText="基本号码" FooterText="基本号码">
                    <ItemStyle Width="180" ForeColor="#FF0000" />
                </asp:BoundField>
                <asp:BoundField DataField="B_Q" HeaderText="特别号码" FooterText="特别号码">
                    <ItemStyle Width="100" ForeColor="#0000FF" BackColor="#ffe8eb" />
                </asp:BoundField>
                <asp:BoundField DataField="Z_H" HeaderText="号码和值 " FooterText="号码和值 ">
                    <ItemStyle Width="80" BackColor="#FDFCDF" />
                </asp:BoundField>
                <asp:BoundField DataField="J_O" HeaderText="奇偶比" FooterText="奇偶比">
                    <ItemStyle CssClass="itemstyle1" Height="18px" />
                </asp:BoundField>
                <asp:BoundField DataField="D_X" HeaderText="大小比" FooterText="大小比">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="Q3" HeaderText="三区比" FooterText="三区比">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="L_H" HeaderText="连号组数" FooterText="连号组数">
                    <ItemStyle Width="100" BackColor="#FDFCDF" />
                </asp:BoundField>
                <asp:BoundField DataField="W_H" HeaderText="尾号相同组数" FooterText="尾号相同组数">
                    <ItemStyle Width="120" BackColor="#ffe8eb" />
                </asp:BoundField>
                <asp:BoundField DataField="C_H" HeaderText="重复号" FooterText="重复号">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <div style="margin: 1px; text-align: left; font-size: 12px;">
            <table cellspacing="0" cellpadding="1" border="0" style="background-color: #cccccc;
                width: 100%; text-align: left;">
                <tr>
                    <td style="background-color: #EFEFEF; text-align: left;">
                         <a href="<%= _Site.Url %>" target="_blank" style="text-decoration: none; font-size: 14px;
                            padding-left: 10px;"><%=_Site.Name %>首页</a> <a href="<%= ResolveUrl("~/Lottery/Buy_QLC.aspx") %>"
                                target="_blank" style="padding-left: 10px; text-decoration: none; color: Red;">七乐彩投注/合买</a>
                        <a href="<%= ResolveUrl("~/WinQuery/13-0-0.aspx") %>" target="_blank" style="padding-left: 10px;
                            text-decoration: none; color: Red;">七乐彩中奖查询</a>
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