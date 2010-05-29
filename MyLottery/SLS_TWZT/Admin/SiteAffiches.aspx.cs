﻿using ASP;
using DAL;
using Shove;
using Shove._Web;
using Shove.Web.UI;
using System;
using System.Data;
using System.Web.Profile;
using System.Web.SessionState;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Admin_SiteAffiches : AdminPageBase, IRequiresSessionState
{


    private void BindData()
    {
        DataTable dt = new Tables.T_SiteAffiches().Open("", "SiteID = " + base._Site.ID.ToString(), "[DateTime] desc");
        if (dt == null)
        {
            PF.GoError(4, "数据库繁忙，请重试", "Admin_SiteAffiches");
        }
        else
        {
            PF.DataGridBindData(this.g, dt, this.gPager);
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        base.Response.Redirect("SiteAffichesAdd.aspx", true);
    }

    protected void g_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            base.Response.Redirect("SiteAffichesEdit.aspx?id=" + e.Item.Cells[5].Text, true);
        }
        else if (e.CommandName == "Del")
        {
            int returnValue = -1;
            string returnDescription = "";
            if (Procedures.P_SiteAfficheDelete(base._Site.ID, long.Parse(e.Item.Cells[5].Text), ref returnValue, ref returnDescription) < 0)
            {
                PF.GoError(4, "数据库繁忙，请重试", "Admin_SiteAffiches");
            }
            else if (returnValue < 0)
            {
                PF.GoError(1, returnDescription, "Admin_SiteAffiches");
            }
            else
            {
                Shove._Web.Cache.ClearCache("SiteAffiches");
                Shove._Web.Cache.ClearCache("Default_GetSiteAffiches");
                this.BindData();
            }
        }
    }

    protected void g_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        if (((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem)) || (e.Item.ItemType == ListItemType.EditItem))
        {
            CheckBox box = (CheckBox)e.Item.Cells[2].FindControl("cbisShow");
            box.Checked = _Convert.StrToBool(e.Item.Cells[6].Text, true);
            box = (CheckBox)e.Item.Cells[3].FindControl("cbisCommend");
            box.Checked = _Convert.StrToBool(e.Item.Cells[7].Text, true);
        }
    }

    protected void gPager_PageWillChange(object Sender, PageChangeEventArgs e)
    {
        this.BindData();
    }

    protected void gPager_SortBefore(object source, DataGridSortCommandEventArgs e)
    {
        this.BindData();
    }

    protected override void OnInit(EventArgs e)
    {
        base.RequestLoginPage = base.Request.Url.AbsoluteUri;
        base.RequestCompetences = Competences.BuildCompetencesList(new string[] { "FillContent", "QueryData" });
        base.OnInit(e);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!base.IsPostBack)
        {
            this.BindData();
            this.btnAdd.Visible = base._User.Competences.IsOwnedCompetences(Competences.BuildCompetencesList(new string[] { "FillContent" }));
            this.g.Columns[4].Visible = this.btnAdd.Visible;
        }
    }


}
