﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtrlBlock_Item.ascx.cs"
    EnableViewState="true" Inherits="TOP.Applications.TaobaoShopHelper.WebControls.Template.CtrlBlock_Item" %>
<%@ Register Src="CtrlBlock_Unit.ascx" TagName="CtrlBlock_Unit" TagPrefix="uc1" %>
<div class="TemplateBlock BlockItem">
    <div class="BlockHeader">
        <asp:Label ID="lblHeader" runat="server" CssClass="Title"></asp:Label>
    </div>
    <div class="BlockContent">
        <asp:Repeater ID="rtpInputItems" runat="server">
            <ItemTemplate>
                <uc1:CtrlBlock_Unit ID="ucCtrlBlockUnit" TemplateInfo="<%# Container.DataItem %>"
                    runat="server" />
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
