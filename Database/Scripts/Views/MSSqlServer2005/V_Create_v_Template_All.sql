CREATE VIEW [dbo].[v_Template_All]
AS
SELECT     Id, Name, [Content], CreateDate, CreateUserId, LastUpdateDate, LastUpdateUserId, CurrentVersion
FROM         dbo.Template
