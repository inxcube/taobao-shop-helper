﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using J.SLS.Facade;
using System.Configuration;

public abstract class BaseMaster : System.Web.UI.MasterPage
{
    public string SiteName
    {
        get { return ConfigurationManager.AppSettings["SiteName"]; }
    }

    public string SiteRoot
    {
        get
        {
            string UrlAuthority = Request.Url.GetLeftPart(UriPartial.Authority);
            if (Request.ApplicationPath == null || Request.ApplicationPath == "/")
            {
                //直接安装在Web站点
                return UrlAuthority;
            }
            else
            {
                //安装在虚拟子目录下
                return UrlAuthority + Request.ApplicationPath;
            }
        }
    }

    public string UserId
    {
        get
        {
            if (CurrentUser == null)
            {
                return null;
            }
            return CurrentUser.UserId;
        }
    }

    public void SetCurrentUser(string userId)
    {
        UserFacade facade = new UserFacade();
        CurrentUser = facade.GetUserInfo<LoginInfo>(userId);
    }

    public LoginInfo CurrentUser
    {
        get
        {
            return Session["CurrentLoginUser"] as LoginInfo;
        }
        set
        {
            Session["CurrentLoginUser"] = value;
        }
    }

    public void RedirectToDefault()
    {
        Response.Redirect("~/Default.aspx");
    }
}