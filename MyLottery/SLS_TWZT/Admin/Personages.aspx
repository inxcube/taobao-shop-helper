﻿<%@ page language="C#" autoeventwireup="true" CodeFile="Personages.aspx.cs" inherits="Admin_Personages" enableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="Shove.Web.UI.4 For.NET 3.5" Namespace="Shove.Web.UI" TagPrefix="ShoveWebUI" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>无标题页</title>
    <link href="../Style/css.css" type="text/css" rel="stylesheet" />
    <link href="../Style/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center;">
        <table cellspacing="0" cellpadding="0" width="90%" border="0" align="center">
            <tr>
                <td style="text-align: left; padding-bottom: 15px; padding-top: 15px;">
                    <asp:DropDownList ID="ddlLotteries" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLotteries_SelectedIndexChanged">
                    </asp:DropDownList>
                    
                    <span style="margin-left: 50px;"></span>
                    <asp:HyperLink ID="hlAdd" runat="server" ForeColor="Red">添加名人</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <asp:DataGrid ID="g" runat="server" Width="100%" AutoGenerateColumns="False" CellPadding="1"
                        BackColor="White" BorderWidth="2px" BorderStyle="None" BorderColor="#E0E0E0"
                        Font-Names="宋体" PageSize="20" OnItemCommand="g_ItemCommand" OnItemDataBound="g_ItemDataBound">
                        <FooterStyle ForeColor="#330099" BackColor="#FFFFCC"></FooterStyle>
                        <SelectedItemStyle Font-Bold="True" ForeColor="#663399"></SelectedItemStyle>
                        <HeaderStyle HorizontalAlign="Center" ForeColor="RoyalBlue" VerticalAlign="Middle"
                            BackColor="Silver"></HeaderStyle>
                        <Columns>
                            <asp:BoundColumn DataField="UserName" SortExpression="UserName" HeaderText="用户名">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundColumn>
                           
                            <asp:BoundColumn DataField="DateTime" SortExpression="DateTime" HeaderText="时间" DataFormatString="{0:yyyy-MM-dd}">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="Order" SortExpression="Order" HeaderText="顺序">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundColumn>
                            <asp:TemplateColumn SortExpression="IsShow" HeaderText="显示">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbisShow" runat="server" Enabled="False"></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="编辑">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <ShoveWebUI:ShoveLinkButton ID="btnEdit" runat="server" CommandName="Edit">修改</ShoveWebUI:ShoveLinkButton>
                                     <ShoveWebUI:ShoveLinkButton ID="btnDelete" runat="server" CommandName="Deletes" AlertText="真的要删除吗？">删除</ShoveWebUI:ShoveLinkButton>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:BoundColumn Visible="False" DataField="ID" SortExpression="ID"></asp:BoundColumn>
                            <asp:BoundColumn Visible="False" DataField="IsShow" SortExpression="IsShow"></asp:BoundColumn>
                        </Columns>
                    </asp:DataGrid>
                </td>
            </tr>
            <tr>
                <td style="height: 30px;">
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    </form>
    <!--#includefile="~/Html/TrafficStatistics/1.htm"-->
</body>
</html>
