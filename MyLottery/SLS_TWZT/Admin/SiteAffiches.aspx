﻿<%@ page language="C#" autoeventwireup="true" CodeFile="SiteAffiches.aspx.cs" inherits="Admin_SiteAffiches" enableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="Shove.Web.UI.4 For.NET 3.5" Namespace="Shove.Web.UI" TagPrefix="ShoveWebUI" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="../Style/css.css" type="text/css" rel="stylesheet" />
    <link href="../Style/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <table cellspacing="0" cellpadding="0" width="90%" border="0" align="center">
                <tr>
                    <td align="center">
                        <asp:DataGrid ID="g" runat="server" Width="100%" AutoGenerateColumns="False" CellPadding="1" BackColor="White" BorderWidth="2px" BorderStyle="None" BorderColor="#E0E0E0" Font-Names="宋体" PageSize="20" AllowPaging="True" AllowSorting="True" OnItemCommand="g_ItemCommand" OnItemDataBound="g_ItemDataBound">
                            <FooterStyle ForeColor="#330099" BackColor="#FFFFCC"></FooterStyle>
                            <SelectedItemStyle Font-Bold="True" ForeColor="#663399"></SelectedItemStyle>
                            <HeaderStyle HorizontalAlign="Center" ForeColor="RoyalBlue" VerticalAlign="Middle" BackColor="Silver"></HeaderStyle>
                            <Columns>
                                <asp:BoundColumn DataField="DateTime" SortExpression="DateTime" HeaderText="时间">
                                    <HeaderStyle HorizontalAlign="Center" Width="16%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Title" SortExpression="Title" HeaderText="标题">
                                    <HeaderStyle HorizontalAlign="Center" Width="50%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:TemplateColumn SortExpression="isShow" HeaderText="显示">
                                    <HeaderStyle HorizontalAlign="Center" Width="6%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbisShow" runat="server" Enabled="False"></asp:CheckBox>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn SortExpression="isCommend" HeaderText="推荐">
                                    <HeaderStyle HorizontalAlign="Center" Width="6%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbisCommend" runat="server" Enabled="False"></asp:CheckBox>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="编辑">
                                    <HeaderStyle HorizontalAlign="Center" Width="14%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <ShoveWebUI:ShoveLinkButton ID="btnEdit" runat="server" CommandName="Edit">修改</ShoveWebUI:ShoveLinkButton>&nbsp;
                                        <ShoveWebUI:ShoveLinkButton ID="btnDel" runat="server" CommandName="Del" AlertText="您确信要删除此条站点公告吗？">删除</ShoveWebUI:ShoveLinkButton>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn Visible="False" DataField="id" SortExpression="id"></asp:BoundColumn>
                                <asp:BoundColumn Visible="False" DataField="isShow" SortExpression="isShow">                                
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn Visible="False" DataField="isCommend" SortExpression="isCommend">                               
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundColumn>
                            </Columns>
                            <PagerStyle Visible="False" HorizontalAlign="Center" ForeColor="#330099" BackColor="#FFFFCC"></PagerStyle>
                        </asp:DataGrid>
                        <ShoveWebUI:ShoveGridPager ID="gPager" runat="server" Width="100%" ShowSelectColumn="False" DataGrid="g" AlternatingRowColor="Linen" GridColor="#E0E0E0" HotColor="MistyRose" Visible="False" OnPageWillChange="gPager_PageWillChange" OnSortBefore="gPager_SortBefore" />
                    </td>
                </tr>
                <tr>
                    <td align="center" style="height: 46px">
                        <ShoveWebUI:ShoveConfirmButton ID="btnAdd" runat="server" Text="增加" Width="60px" OnClick="btnAdd_Click" /></td>
                </tr>
            </table>
            <br />
        </div>
    </form>
    <!--#includefile="~/Html/TrafficStatistics/1.htm"-->
</body>
</html>