﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace TOP.Applications.TaobaoShopHelper._Common
{
    public class BaseControl : UserControl
    {
        public string TOP_SessionKey
        {
            get
            {
                if (Session["TOP_SessionKey"] == null)
                {
                    LastAsseccPageUrl = Request.Url.AbsolutePath;
                    // "~/Authorizes/UnAuthorize.aspx"
                    Response.Redirect(AppUrlHelper.Url_UnAuthorize, true);
                }
                return (string)Session["TOP_SessionKey"];
            }
            set
            {
                Session["TOP_SessionKey"] = value;
            }
        }

        public string CurrentUserId
        {
            get
            {
                if (Session["CurrentUserId"] == null)
                {
                    LastAsseccPageUrl = Request.Url.AbsolutePath;
                    // "~/Authorizes/UnLogin.aspx"
                    Response.Redirect(AppUrlHelper.Url_UnLogin, true);
                }
                return (string)Session["CurrentUserId"];
            }
            set
            {
                Session["CurrentUserId"] = value;
            }
        }

        public string CurrentUserName
        {
            get
            {
                if (Session["CurrentUserName"] == null)
                {
                    return string.Empty;
                }
                return (string)Session["CurrentUserName"];
            }
            set
            {
                Session["CurrentUserName"] = value;
            }
        }

        public string CurrentLoginName
        {
            get
            {
                if (Session["CurrentLoginName"] == null)
                {
                    return string.Empty;
                }
                return (string)Session["CurrentLoginName"];
            }
            set
            {
                Session["CurrentLoginName"] = value;
            }
        }

        public string LastAsseccPageUrl
        {
            get
            {
                if (Session["LastAsseccPageUrl"] == null)
                {
                    return string.Empty;
                }
                return (string)Session["LastAsseccPageUrl"];
            }
            set
            {
                Session["LastAsseccPageUrl"] = value;
            }
        }
    }
}
