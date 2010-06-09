﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using J.SLS.Facade;
using System.Configuration;
using J.SLS.Common.Logs;
using System.Web.UI;
using System.Web.UI.WebControls;

public abstract class BaseMaster : System.Web.UI.MasterPage
{
    private BaseHelper _h = null;
    private BaseHelper helper
    {
        get
        {
            if (_h == null)
            {
                _h = new BaseHelper(this.Page);
            }
            return _h;
        }
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
    }

    public string SiteName
    {
        get { return helper.SiteName; }
    }

    public string SiteRoot
    {
        get { return helper.SiteRoot; }
    }

    public string UserId
    {
        get
        {
            if (CurrentUser == null)
            {
                return "";
            }
            return CurrentUser.UserId;
        }
    }

    public void SetCurrentUser(string userId)
    {
        helper.SetCurrentUser(userId);
    }

    public UserInfo CurrentUser
    {
        get
        {
            UserInfo user = helper.CurrentUser;
            if (user == null)
            {
                HiddenField hidd = this.FindControl("HidUserID") as HiddenField;
                if (hidd.Value != "")
                {
                    UserFacade facade = new UserFacade();
                    user = facade.GetUserInfo(hidd.Value);
                }
            }
            return user;
        }
        set { helper.CurrentUser = value; }
    }

    public ILogWriter LogWriter
    {
        get { return helper.LogWriter; }
    }

    public void RedirectToUrl(string url)
    {
        helper.RedirectToUrl(url);
    }

    public void RedirectToDefault()
    {
        helper.RedirectToUrl("~/Default.aspx");
    }

    public void RedirectToLogin(Page basePage, string message)
    {
        helper.RedirectToLogin(basePage, message);
    }

    protected string GetParamsUrl(string url, Dictionary<string, string> parameters)
    {
        return helper.GetParamsUrl(url, parameters);
    }
}