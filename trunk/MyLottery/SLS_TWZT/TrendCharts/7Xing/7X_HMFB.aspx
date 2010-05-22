﻿<%@ page language="C#" autoeventwireup="true" CodeFile="~/TrendCharts/7Xing/7X_HMFB.aspx.cs" inherits="_7Xing_7X_HMFB" enableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>七星彩开奖号码大小分布图</title>
    <style type="text/css">
        body
        {
            font-family: tahoma;
            margin: 0px;
            margin-left: 10px;
            margin-right: 10px;
            text-align: center;
        }
        body, td, th
        {
            font-size: 12px;
            font-family:宋体;
        }
    </style>

    <script type="text/javascript" language="javascript">

        function Style(obj, statcolor, color) {

            if (obj.style.backgroundColor == "") {
                obj.style.backgroundColor = statcolor;
                obj.style.color = "#FFFFFF";
            }
            else {
                obj.style.backgroundColor = "";
                obj.style.color = color;
            }
        }
    </script>

    
</head>
<body>
    <form id="form1" runat="server">
    <table style="width: 100%; height: 40px; background-image: url(../Images/bg11111.jpg);"
        cellspacing="0" cellpadding="0">
        <tbody>
            <tr>
                <td align="center" valign="middle" style="width: 300px; font-weight: bold; font-size: 18px;
                    color: #CC0000">
                    七星彩&nbsp;&nbsp;综合分布图
                </td>
                <td style="width: 700px; color: blue; font-style: normal; height: 6px;" align="left">
                    选择最近期数
                    <asp:RadioButton ID="RadioButton1" runat="server" Text="100期" AutoPostBack="True"
                        GroupName="group" OnCheckedChanged="RadioButton1_CheckedChanged1" />
                    <asp:RadioButton ID="RadioButton2" runat="server" Text="50期" AutoPostBack="True"
                        OnCheckedChanged="RadioButton2_CheckedChanged" GroupName="group" />
                    <asp:RadioButton ID="RadioButton3" runat="server" Text="30期" AutoPostBack="True"
                        Checked="true" OnCheckedChanged="RadioButton3_CheckedChanged" GroupName="group" />
                    <asp:RadioButton ID="RadioButton4" runat="server" Text="20期" AutoPostBack="True"
                        GroupName="group" OnCheckedChanged="RadioButton4_CheckedChanged1" />
                    <asp:RadioButton ID="RadioButton5" runat="server" Text="10期" AutoPostBack="True"
                        GroupName="group" OnCheckedChanged="RadioButton5_CheckedChanged1" />
                </td>
            </tr>
        </tbody>
    </table>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
            <tr>
                <td align="center" style="background-color: #FFFFFF;">
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tbody>
                            <tr style="background-color: #EEEEEE">
                                <td style="background-color: #EFEFEF; text-align: left; font-size: 12px; width: 500px;">
                                    <a href="<%= _Site.Url %>" target="_blank" style="text-decoration: none; font-size: 14px;
                                        padding-left: 10px;"><%=_Site.Name %>首页</a> <a href="<%= ResolveUrl("~/Lottery/Buy_QXC.aspx") %>"
                                            target="_blank" style="padding-left: 10px; text-decoration: none; color: Red;">七星彩投注/合买</a>
                                    <a href="<%= ResolveUrl("~/WinQuery/3-0-0.aspx") %>" target="_blank" style="padding-left: 10px;
                                        text-decoration: none; color: Red;">七星彩中奖查询</a>
                                </td>
                                <td align="center" style="height: 24PX">
                                    <b>七星彩开奖号码大小分布图</b>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr style="background-color: #FFFFFF">
                <td valign="top" style="border-color: #FFFFFF">
                    <table style="width: 100%" border="1" align="center" cellpadding="0" cellspacing="0"
                        bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF">
                        <tr align="center" valign="middle">
                            <td valign="top">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" UseAccessibleHeader="False"
                                    ShowFooter="True" Width="100%" bordercolorlight="#808080" bordercolordark="#FFFFFF"
                                    OnRowCreated="GridView1_RowCreated" align="center" CellPadding="0">
                                    <Columns>
                                        <asp:BoundField DataField="Isuse" HeaderText="期数">
                                            <ItemStyle Width='70px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="A_0" HeaderText="A_0">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="A_1" HeaderText="A_1">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="A_2" HeaderText="A_2">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="A_3" HeaderText="A_3">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="A_4" HeaderText="A_4">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="A_5" HeaderText="A_5">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="A_6" HeaderText="A_6">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="A_7" HeaderText="A_7">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="A_8" HeaderText="A_8">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="A_9" HeaderText="A_9">
                                            <ItemStyle Width='13px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="C_0" HeaderText="C_0">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="C_1" HeaderText="C_1">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="C_2" HeaderText="C_2">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="C_3" HeaderText="C_3">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="C_4" HeaderText="C_4">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="C_5" HeaderText="C_5">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="C_6" HeaderText="C_6">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="C_7" HeaderText="C_7">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="C_8" HeaderText="C_8">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="C_9" HeaderText="C_9">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="W_0" HeaderText="W_0">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="W_1" HeaderText="W_1">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="W_2" HeaderText="W_2">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="W_3" HeaderText="W_3">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="W_4" HeaderText="W_4">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="W_5" HeaderText="W_5">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="W_6" HeaderText="W_6">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="W_7" HeaderText="W_7">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="W_8" HeaderText="W_8">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="W_9" HeaderText="W_9">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Q_0" HeaderText="Q_0">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Q_1" HeaderText="Q_1">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Q_2" HeaderText="Q_2">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Q_3" HeaderText="Q_3">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Q_4" HeaderText="Q_4">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Q_5" HeaderText="Q_5">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Q_6" HeaderText="Q_6">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Q_7" HeaderText="Q_7">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Q_8" HeaderText="Q_8">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Q_9" HeaderText="Q_9">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="B_0" HeaderText="B_0">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="B_1" HeaderText="B_1">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="B_2" HeaderText="B_2">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="B_3" HeaderText="B_3">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="B_4" HeaderText="B_4">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="B_5" HeaderText="B_5">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="B_6" HeaderText="B_6">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="B_7" HeaderText="B_7">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="B_8" HeaderText="B_8">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="B_9" HeaderText="B_9">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="S_0" HeaderText="S_0">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="S_1" HeaderText="S_1">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="S_2" HeaderText="S_2">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="S_3" HeaderText="S_3">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="S_4" HeaderText="S_4">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="S_5" HeaderText="S_5">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="S_6" HeaderText="S_6">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="S_7" HeaderText="S_7">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="S_8" HeaderText="S_8">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="S_9" HeaderText="S_9">
                                            <ItemStyle Width='10px' BackColor="#D0E6F7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="G_0" HeaderText="G_0">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="G_1" HeaderText="G_1">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="G_2" HeaderText="G_2">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="G_3" HeaderText="G_3">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="G_4" HeaderText="G_4">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="G_5" HeaderText="G_5">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="G_6" HeaderText="G_6">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="G_7" HeaderText="G_7">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="G_8" HeaderText="G_8">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="G_9" HeaderText="G_9">
                                            <ItemStyle Width='10px' />
                                        </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</body>
</html>
