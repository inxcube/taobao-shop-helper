CREATE VIEW [dbo].[v_SystemUser_All]
AS
SELECT     Id, Password, UserName, LoginName, CreateDate, CreateUserId, LastUpdateDate, LastUpdateUserId, CurrentVersion
FROM         dbo.SystemUser
