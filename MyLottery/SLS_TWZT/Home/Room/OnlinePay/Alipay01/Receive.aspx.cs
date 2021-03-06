﻿using Alipay.Gateway;
using ASP;
using DAL;
using Shove;
using Shove._Security;
using Shove._Web;
using Shove.Alipay;
using System;
using System.Data;
using System.Text;
using System.Web.Profile;
using System.Web.SessionState;
using System.Web.UI.HtmlControls;

public partial class Home_Room_OnlinePay_Alipay01_Receive : RoomPageBase, IRequiresSessionState
{

    private SystemOptions so = new SystemOptions();

    protected override void OnLoad(EventArgs e)
    {
        base.isRequestLogin = false;
        base.isAllowPageCache = false;
        base.OnLoad(e);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string charset = "utf-8";
            string notifyService = "notify_verify";
            string sellerEmail = this.so["OnlinePay_Alipay_UserName"].ToString("");
            string notifyID = base.Request.QueryString["notify_id"];
            int notifyType = 2;
            Shove.Alipay.Alipay alipay = new Shove.Alipay.Alipay();
            string str5 = alipay.Get_Http(notifyService, notifyID, sellerEmail, charset, notifyType, 0x1d4c0);
            string[] strArray2 = Alipay.Gateway.Utility.BubbleSort(base.Request.QueryString.AllKeys);
            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < strArray2.Length; i++)
            {
                if ((!string.IsNullOrEmpty(strArray2[i]) && (base.Request.QueryString[strArray2[i]] != "")) && ((strArray2[i] != "sign") && (strArray2[i] != "sign_type")))
                {
                    if (i == (strArray2.Length - 1))
                    {
                        builder.Append(strArray2[i] + "=" + base.Request.QueryString[strArray2[i]]);
                    }
                    else
                    {
                        builder.Append(strArray2[i] + "=" + base.Request.QueryString[strArray2[i]] + "&");
                    }
                }
            }
            string str6 = alipay.GetMD5(builder.ToString(), sellerEmail, charset);
            string str7 = base.Request.QueryString["sign"];
            string str8 = base.Request.QueryString["trade_status"];
            string str9 = base.Request.QueryString["trade_no"];
            string str10 = base.Request.QueryString["out_trade_no"];
            string text1 = base.Request.QueryString["payment_type"];
            string d = base.Request.QueryString["subject"];
            string str = Encrypt.UnEncryptString(PF.GetCallCert(), d);
            double num3 = double.Parse(base.Request.QueryString["total_fee"].ToString());
            string str13 = base.Request.QueryString["seller_email"];
            if (str13 != this.so["OnlinePay_Alipay_UserName"].ToString(""))
            {
                new Log("System").Write("在线支付：收款帐号不匹配！");
                PF.GoError(1, "支付用户信息验证失败", base.GetType().BaseType.FullName);
            }
            else if (((str6 == str7) && (str5 == "true")) && (str8 == "TRADE_FINISHED"))
            {
                Users users;
                if (base._User == null)
                {
                    users = new Users(base._Site.ID)[base._Site.ID, _Convert.StrToLong(str, -1L)];
                }
                else
                {
                    users = new Users(base._Site.ID)[base._Site.ID, base._User.ID];
                }
                if (users == null)
                {
                    new Log("System").Write("在线支付：异常用户数据！");
                    base.Response.Write("<script language='javascript'>window.top.location.href='" + Shove._Web.Utility.GetUrl() + "/Home/Room/MyIcaile.aspx?SubPage=OnlinePay/Fail.aspx'</script>");
                }
                else
                {
                    if (base._User == null)
                    {
                        base._User = new Users(base._Site.ID)[base._Site.ID, users.ID];
                    }
                    if (this.WriteUserAccount(base._User, str10.ToString(), num3.ToString(), "系统交易号：" + str10.ToString() + ",支付宝交易号：" + str9.ToString()))
                    {
                        base.Response.Write("<script language='javascript'>window.top.location.href='http://" + Shove._Web.Utility.GetUrlWithoutHttp() + "/Home/Room/MyIcaile.aspx?SubPage=OnlinePay/OK.aspx'</script>");
                    }
                    else
                    {
                        new Log("System").Write("在线支付：写入返回数据出错！");
                        base.Response.Write("<script language='javascript'>window.top.location.href='http://" + Shove._Web.Utility.GetUrlWithoutHttp() + "/Home/Room/MyIcaile.aspx?SubPage=OnlinePay/Fail.aspx'</script>");
                    }
                }
            }
            else
            {
                new Log("System").Write("在线支付：系统交易号：" + str10 + " 支付宝交易号：" + str9 + " 校验出错！responseTxt系统要求参数为true/false，实际返回：" + str5.ToString() + " trade_status系统要求返回TRADE_FINISHED，实际返回： " + str8.ToString() + " 生成校验码：" + str6.ToString() + "返回校验码：" + str7.ToString());
                base.Response.Write("<script language='javascript'>window.top.location.href='http://" + Shove._Web.Utility.GetUrlWithoutHttp() + "/Home/Room/MyIcaile.aspx?SubPage=OnlinePay/Fail.aspx'</script>");
            }
        }
        catch (Exception exception)
        {
            new Log("System").Write("在线支付：" + exception.Message + " -- 接收数据异常！");
            base.Response.Write("<script language='javascript'>window.top.location.href='http://" + Shove._Web.Utility.GetUrlWithoutHttp() + "/Home/Room/MyIcaile.aspx?SubPage=OnlinePay/Fail.aspx'</script>");
        }
    }

    private bool WriteUserAccount(Users _User, string orderid, string amount, string Memo)
    {
        double money = _Convert.StrToDouble(amount, 0.0);
        if (money != 0.0)
        {
            double num2 = this.so["OnlinePay_Alipay_PayFormalitiesFeesScale"].ToDouble(0.0) / 100.0;
            double formalitiesFees = money - Math.Round((double)(money / (num2 + 1.0)), 2);
            money -= formalitiesFees;
            string returnDescription = "";
            bool flag = _User.AddUserBalance(money, formalitiesFees, orderid, "支付宝支付," + this.so["OnlinePay_Alipay_UserName"].ToString(""), Memo, ref returnDescription) == 0;
            if (flag)
            {
                return flag;
            }
            DataTable table = new Tables.T_UserPayDetails().Open("Result", "[id] = " + _Convert.StrToLong(orderid, 0L).ToString(), "");
            if ((table == null) || (table.Rows.Count == 0))
            {
                new Log("System").Write("在线支付：返回的交易号找不到对应的数据");
                return false;
            }
            if (_Convert.StrToInt(table.Rows[0][0].ToString(), 0) == 1)
            {
                return true;
            }
            new Log("System").Write("在线支付：对应的数据未处理");
        }
        return false;
    }

   
}

