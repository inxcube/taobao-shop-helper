﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using J.SLS.Common.Xml;
using J.SLS.Common;
using J.SLS.Common.Logs;
using J.SLS.Domain;
using J.SLS.Database.DBAccess;

namespace J.SLS.Facade
{
    public class IssueNoticeFacade : BaseFacade
    {
        public DateTime GetCurrentUpdateTime()
        {
            string sql = "SELECT * FROM [T_Temp_UpdateTime]";
            return (DateTime)DbAccess.GetRC1BySQL(sql);
        }

        public void ModifyCurrentUpdateTime(DateTime time)
        {
            string sql = "UPDATE [T_Temp_UpdateTime] SET [CurrentUpdateTime] = '" + time.ToString("yyyy-MM-dd HH:mm:ss") + "'";
            DbAccess.ExecSQL(sql);
        }

        public IList<string> GetRequestTextList(DateTime fromTime)
        {
            NoticeManager noticeManager = new NoticeManager(DbAccess);
            IList<NoticeEntity> list = noticeManager.GetNoticeListFrom(fromTime);
            IList<string> rtn = new List<string>();
            foreach (NoticeEntity entity in list)
            {
                rtn.Add("transType=" + entity.TranType + "&transMessage=" + entity.ResponseText);
            }
            return rtn;
        }

        public void HandleNotice(string response)
        {
            try
            {
                Dictionary<string, string> parameters = XmlAnalyzer.GetParameters(response);
                TranType type = (TranType)Enum.Parse(typeof(TranType), parameters["transType"]);
                switch (type)
                {
                    case TranType.Request101:  // 奖期通知请求
                        AddIssuseNotify(parameters["transMessage"]);
                        break;
                    default:
                        throw new ArgumentOutOfRangeException("不支持的通知类型 - " + type);
                }
            }
            catch (Exception ex)
            {
                string errMsg = "处理通知失败！" + response;
                throw HandleException(LogCategory.Notice, errMsg, ex);
            }
        }

        public IssueNoticeInfo AddIssuseNotify(string xml)
        {
            try
            {
                IssueNoticeInfo info = XmlAnalyzer.AnalyseXmlToCommunicationObject<IssueNoticeInfo>(xml);
                try
                {
                    NoticeEntity noticeEntity = new NoticeEntity();
                    noticeEntity.NoticeId = info.Id;
                    noticeEntity.NoticeVersion = info.Version;
                    noticeEntity.MessengerId = info.MessengerId;
                    noticeEntity.Timestamp = info.Timestamp;
                    noticeEntity.TranType = (int)info.TransactionType;
                    noticeEntity.Digest = info.Digest;
                    noticeEntity.ResponseText = xml;
                    noticeEntity.NotifyTime = DateTime.Now;
                    noticeEntity.XmlHeader = info.XmlHeader;
                    NoticeManager noticeManager = new NoticeManager(DbAccess);
                    noticeManager.AddNotice(noticeEntity);
                }
                catch (Exception ex)
                {
                    string errMsg = "添加通知XML到数据库失败！" + xml;
                    LogWriter.Write(LogCategory.Notice, "添加服务器XML请求到数据库失败", HandleException(LogCategory.Notice, errMsg, ex));
                }

                try
                {
                    IssueEntity issueEntity = new IssueEntity();
                    issueEntity.GameName = info.GameName;
                    issueEntity.IssuseNumber = info.Number;
                    issueEntity.StartTime = info.StartTime;
                    issueEntity.StopTime = info.StopTime;
                    issueEntity.Status = (int)info.Status;
                    issueEntity.BonusCode = info.BonusCode;
                    issueEntity.SalesMoney = info.SalesMoney;
                    issueEntity.BonusMoney = info.BonusMoney;
                    issueEntity.NoticeId = info.Id;
                    IssuseManager issuseManager = new IssuseManager(DbAccess);
                    issuseManager.SaveIssue(issueEntity);

                    return info;
                }
                catch (Exception ex)
                {
                    string errMsg = "添加通知到数据库失败！" + xml;
                    throw HandleException(LogCategory.Notice, errMsg, ex);
                }
            }
            catch (Exception ex)
            {
                string errMsg = "响应服务器奖期通知失败！" + xml;
                throw HandleException(LogCategory.Notice, errMsg, ex);
            }
        }
    }
}
