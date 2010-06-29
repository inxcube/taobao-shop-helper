﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default"
    EnableViewState="false" %>

<%@ Register Src="Controls/CtrlHeader.ascx" TagName="CtrlHeader" TagPrefix="uc1" %>
<%@ Register Src="Controls/CtrlMenu.ascx" TagName="CtrlMenu" TagPrefix="uc2" %>
<%@ Register Src="Controls/CtrlFooter.ascx" TagName="CtrlFooter" TagPrefix="uc3" %>
<%@ Register Src="Controls/CtrlSubMenu.ascx" TagName="CtrlSubMenu" TagPrefix="uc4" %>
<%@ Register Src="Controls/CtrlBackground.ascx" TagName="CtrlBackground" TagPrefix="uc5" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        <%= SiteName %></title>
    <link href="Styles/MainLayout.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="swfobject.js"></script>

    <script type="text/javascript">

        function SetIframeHeight() {
            var a = iframe_sub.document.body.scrollHeight;
            // var c = iframe_sub.document.documentElement.scrollHeight;
            document.getElementById('iframe_sub').style.height = a;
        }
        
        function play() {
            var dewp = document.getElementById("dewplayer");
            if (dewp != null) dewp.dewplay();
        }
    
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <center>
        <div class="MainForm">
            <div class="Header">
                <uc1:CtrlHeader ID="ctrlHeader" runat="server" />
                <div class="Menu1">
                    <uc2:CtrlMenu ID="ctrlMenu1" runat="server" />
                </div>
            </div>
            <uc5:CtrlBackground ID="CtrlBackground1" runat="server" />
            <div id="divSubMenu" class="Menu2">
                <uc4:CtrlSubMenu ID="ctrlSubMenu4" runat="server" />
            </div>
            <div class="SplitLeft" style="height: 600px;">
            </div>
            <div class="Content">
                <iframe id="iframe_sub" name="iframe_sub" width="600px" frameborder="0" scrolling="no"
                    onload="SetIframeHeight();"></iframe>
            </div>
            <div class="Footer">
                <uc3:CtrlFooter ID="ctrlFooter" runat="server" />
            </div>
        </div>
    </center>
    </form>

    <script type="text/javascript">

        if ("<%= AutoPlayMusic %>" == "1") {
            play();
        }
    
    </script>

</body>
</html>