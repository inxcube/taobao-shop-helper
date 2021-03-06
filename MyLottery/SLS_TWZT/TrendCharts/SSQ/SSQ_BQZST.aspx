﻿<%@ page language="C#" autoeventwireup="true" CodeFile="~/TrendCharts/SSQ/SSQ_BQZST.aspx.cs" inherits="Home_TrendCharts_SSQ_SSQ_BQZST" enableEventValidation="false" %>

<%@ Register Src="../../Home/Room/UserControls/Lotteries.ascx" TagName="Lotteries" TagPrefix="uc1" %>
<%@ Register Src="../../Home/Room/UserControls/TrendChartHead.ascx" TagName="TrendChartHead"
    TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>双色球蓝球走势图-双色球走势图-彩票走势图表和数据分析－<%=_Site.Name %></title>
<meta name="keywords" content="双色球走势图-双色球蓝球走势图" />
<meta name="description" content="双色球走势图-双色球蓝球走势图、彩票走势图表和数据分析。" />
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
            text-align: center;
            margin: 0px;
            margin-left: 10px;
            margin-right: 10px;
            font-family: tahoma;
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
            width: 68px;
        }
        .itemstyle1
        {
            background-color: #ffe8eb;
            width: 20px;
            color: #999999;
        }
        .itemstyle2
        {
            background-color: #ffffff;
            width: 20px;
            color: #999999;
        }
        .itemstyle3
        {
            background-color: #ffe8eb;
            width: 20px;
            color: #ff0000;
        }
        .itemstyle4
        {
            background-color: #ffe8eb;
            width: 20px;
            color: #0000ff;
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

    <script type="text/javascript" language="javascript">
<!--
        function Style(obj, statcolor, color) {

            if (obj.style.backgroundColor == "") {
                obj.style.backgroundColor = "#FFFFFF";
                obj.style.color = statcolor;
            }
            else {
                obj.style.backgroundColor = "";
                obj.style.color = color;
            }
        }
//-->
    </script>

    <script src="../../JavaScript/TrendChart/wz_jsgraphics.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
        function DrawLine(ojbCurrnetTd, ojbPrevTd, color) {
            var ax = getCPX(document.getElementById(ojbCurrnetTd));
            var ay = getCPY(document.getElementById(ojbCurrnetTd));
            var bx = getCPX(document.getElementById(ojbPrevTd));
            var by = getCPY(document.getElementById(ojbPrevTd));

            var jgdiv1 = new jsGraphics("div2");

            jgdiv1.setColor(color);
            jgdiv1.setStroke(1);
            jgdiv1.drawLine(ax, ay, bx, by);
            jgdiv1.paint();
        }

        function getTop(obj) {
            var _offset = obj.offsetTop;
            if (obj.offsetParent != null) _offset += getTop(obj.offsetParent);
            return _offset;
        }

        function getLeft(obj) {
            var _offset = obj.offsetLeft;
            if (obj.offsetParent != null) _offset += getLeft(obj.offsetParent);
            return _offset;
        }

        function getCPX(obj) {
            return getLeft(obj) + obj.offsetWidth / 2;
        }
        function getCPY(obj) {
            return getTop(obj) + obj.offsetHeight / 2;
        }
        window.onresize = function RedrawLine() {
            _removeDiv();

            DrawLines();
        }
    </script>
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
                        <h1 class="td" style="font-weight: bold; font-size: 18px;display:inline;">双色球&nbsp;&nbsp;蓝球走势图</h1>
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
                                            <a href="<%= _Site.Url %>" target="_blank" style="text-decoration: none; font-size: 14px;padding-left: 10px;"><%=_Site.Name %>首页</a>
                    <a href="<%= ResolveUrl("~/Lottery/Buy_SSQ.aspx") %>" target="_blank" style="padding-left: 10px; text-decoration: none; color: Red;">双色球投注/合买</a>
                        <a href="<%= ResolveUrl("~/WinQuery/5-0-0.aspx") %>" target="_blank" style="padding-left: 10px; text-decoration: none; color: Red;">双色球中奖查询</a>
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
        <div style="margin: 1px">
        </div>
        <table cellpadding="0" cellspacing="0" border="0" align="center">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="false"
                        FooterStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" align="center"
                        bordercolorlight="#808080" bordercolordark="#FFFFFF" RowStyle-HorizontalAlign="Center"
                        CellPadding="0" ShowHeader="true" OnRowCreated="GridView1_RowCreated" ShowFooter="true">
                        <Columns>
                            <asp:BoundField DataField="Isuse" HeaderText="期号">
                                <ItemStyle CssClass="Isuse" />
                            </asp:BoundField>
                            <asp:BoundField DataField="R_Q" HeaderText="红球">
                                <ItemStyle Width="120" ForeColor="#FF0000" />
                            </asp:BoundField>
                            <asp:BoundField DataField="B_Q" HeaderText="蓝球">
                                <ItemStyle Width="40" ForeColor="#0000FF" />
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
                                <ItemStyle CssClass="itemstyle1" Height='20px' />
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
                            <asp:BoundField DataField="J" HeaderText="16">
                                <ItemStyle Width="20" />
                            </asp:BoundField>
                            <asp:BoundField DataField="O" HeaderText="16">
                                <ItemStyle CssClass="itemstyle3" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Z" HeaderText="16">
                                <ItemStyle Width="20" BackColor="#f7f7f7" />
                            </asp:BoundField>
                            <asp:BoundField DataField="H" HeaderText="16">
                                <ItemStyle Width="20" ForeColor="#FF0000" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Q_0" HeaderText="16">
                                <ItemStyle Width="20" BackColor="#ffe8eb" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Q_1" HeaderText="16">
                                <ItemStyle CssClass="itemstyle3" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Q_2" HeaderText="16">
                                <ItemStyle CssClass="itemstyle4" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Q1_1" HeaderText="16">
                                <ItemStyle CssClass="itemstyle2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Q1_2" HeaderText="16">
                                <ItemStyle CssClass="itemstyle2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Q1_3" HeaderText="16">
                                <ItemStyle CssClass="itemstyle2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Q1_4" HeaderText="16">
                                <ItemStyle CssClass="itemstyle2" Width="36px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="W_J" HeaderText="16">
                                <ItemStyle CssClass="itemstyle1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="W_M" HeaderText="16">
                                <ItemStyle CssClass="itemstyle1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="W_S" HeaderText="16">
                                <ItemStyle CssClass="itemstyle1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="W_H" HeaderText="16">
                                <ItemStyle CssClass="itemstyle1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="W_T" HeaderText="16">
                                <ItemStyle CssClass="itemstyle1" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td style="background-color: #1576c7; text-align: center" height="30">
                    说明： 金=09 10 水=01 12 13 火=06 07 木=03 04 15 16 土=02 05 08 11 14
                </td>
            </tr>
        </table>
        <asp:Label ID="lbline" runat="server"></asp:Label>

        <script type="text/javascript">
            DrawLines();
        </script>

        <div style="margin: 1px; text-align: left; font-size: 12px;">
            <table cellspacing="0" cellpadding="1" border="0" style="background-color: #cccccc;
                width: 100%; text-align: left;">
                <tr>
                    <td style="background-color: #EFEFEF; text-align: left;">
                        
                                            <a href="<%= _Site.Url %>" target="_blank" style="text-decoration: none; font-size: 14px;padding-left: 10px;"><%=_Site.Name %>首页</a>
                    <a href="<%= ResolveUrl("~/Lottery/Buy_SSQ.aspx") %>" target="_blank" style="padding-left: 10px; text-decoration: none; color: Red;">双色球投注/合买</a>
                        <a href="<%= ResolveUrl("~/WinQuery/5-0-0.aspx") %>" target="_blank" style="padding-left: 10px; text-decoration: none; color: Red;">双色球中奖查询</a>
                                    <span class='blue14' style='padding-left: 30px;
                                        padding-right: 8px;'>双色球:</span><a href='SSQ_CGXMB.aspx' target='mainFrame'>常规项目表走势图</a>
                        | <a href='SSQ_ZHFB.aspx' target='mainFrame'>综合分布图走势图</a> | <a href='SSQ_3FQ.aspx' target='mainFrame'>
                            3分区分布图走势图</a> | <a href='SSQ_DX.aspx' target='mainFrame'>大小分析走势图</a> | <a href='SSQ_JO.aspx'
                                target='mainFrame'>奇偶分析走势图</a> | <a href='SSQ_ZH.aspx' target='mainFrame'>质合分析走势图</a>
                        | <a href='SSQ_HL.aspx' target='mainFrame'>红蓝球走势图</a> | <a href='SSQ_BQZST.aspx'
                            target='mainFrame'>蓝球综合走势图</a>
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
