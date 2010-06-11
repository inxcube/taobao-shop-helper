﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxPro;
using System.Text;
using J.SkyMusic.DbFacade.Services;

public partial class Admins_MenuEdit : BaseAdminPage
{
    protected string SplitChar0 = ((char)23).ToString();
    protected string SplitChar1 = ((char)24).ToString();
    protected string SplitChar2 = ((char)25).ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        AjaxPro.Utility.RegisterTypeForAjax(typeof(Admins_MenuEdit));
        if (!IsPostBack)
        {
            BindParentMenuList();
            BindInnerLinkList();
            if (!IsAdd)
            {
                BindMenuInfo(Request["id"]);
            }
        }
    }

    private bool IsAdd
    {
        get
        {
            return string.IsNullOrEmpty(Request["id"]);
        }
    }

    protected void lbtnSave_Click(object sender, EventArgs e)
    {
        PageFacade facade = PageHelper.GetPageFacade(this.Page);
        MenuItemInfo menu = new MenuItemInfo();

        string parentId = ddlTopMenu.SelectedValue;
        menu.Index = int.Parse(txtIndex.Text);
        if (ddlLinkHtml.SelectedValue == "")
        {
            menu.InnerId = ddlLinkList.SelectedValue;
        }
        else
        {
            menu.InnerId = ddlLinkHtml.SelectedValue;
        }
        menu.IsInner = !rbtnOuter.Checked;
        menu.IsOpenNewWindow = cbOpenNewWindow.Checked;
        menu.Level = string.IsNullOrEmpty(parentId) ? 0 : 1;
        menu.Name = txtName.Text;
        menu.OuterUrl = txtOuterUrl.Text;
        menu.ParentId = parentId;

        facade.AddMenu(menu);
    }

    private void BindMenuInfo(string menuId)
    {
        PageFacade facade = PageHelper.GetPageFacade(this.Page);
        MenuItemInfo menuItem = facade.GetMenuById(menuId);
        txtName.Text = menuItem.Name;
        txtIndex.Text = menuItem.Index.ToString();
        if (string.IsNullOrEmpty(menuItem.ParentId))
        {
            ddlTopMenu.SelectedValue = "";
        }
        else
        {
            ddlTopMenu.SelectedValue = menuItem.ParentId;
            if (menuItem.IsInner)
            {
                rbtnInner.Checked = true;
                if (menuItem.IsListType)
                {
                    ddlLinkList.SelectedValue = menuItem.InnerId;
                }
                else
                {
                    HtmlItemInfo htmlItem = facade.GetHtmlItemById(menuItem.InnerId);
                    if (string.IsNullOrEmpty(htmlItem.ItsListId))
                    {
                        ddlLinkList.SelectedValue = htmlItem.ItsListId ?? "";
                        ddlLinkHtml.SelectedValue = htmlItem.Id;
                    }
                    else
                    {
                        ddlLinkList.SelectedValue = htmlItem.ItsListId;
                        ddlLinkHtml.SelectedValue = htmlItem.Id;
                    }
                }
            }
            else
            {
                rbtnOuter.Checked = true;
                txtOuterUrl.Text = menuItem.OuterUrl;
            }
        }
        cbOpenNewWindow.Checked = menuItem.IsOpenNewWindow;
    }

    private void BindParentMenuList()
    {
        PageFacade facade = PageHelper.GetPageFacade(this.Page);
        IList<MenuItemInfo> menuList = facade.GetTopMenuList();
        ddlTopMenu.DataSource = menuList;
        ddlTopMenu.DataBind();

        ddlTopMenu.Items.Insert(0, new System.Web.UI.WebControls.ListItem("<无>", ""));
    }

    private void BindInnerLinkList()
    {
        PageFacade facade = PageHelper.GetPageFacade(this.Page);
        IList<ListItemInfo> lists = facade.GetListItems();
        ddlLinkList.DataSource = lists;
        ddlLinkList.DataBind();

        ddlLinkList.Items.Add(new System.Web.UI.WebControls.ListItem("<其他>", ""));
    }

    [AjaxMethod(HttpSessionStateRequirement.None)]
    public string GetHtmlItemsById(string listId)
    {
        PageFacade facade = PageHelper.GetPageFacade(this.Page);
        IList<HtmlItemInfo> subList = facade.GetHtmlItemsByParent(listId);
        StringBuilder sb = new StringBuilder();
        foreach (HtmlItemInfo item in subList)
        {
            sb.Append((char)24 + item.Id + (char)25 + item.Name + (char)25 + item.LastUpdateTime.ToString("yyyy-MM-dd HH:mm:ss"));
        }
        return sb.ToString().TrimStart((char)24);
    }
}
