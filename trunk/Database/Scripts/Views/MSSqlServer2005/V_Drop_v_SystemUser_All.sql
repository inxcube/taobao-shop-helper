IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_SystemUser_All]'))
DROP VIEW [dbo].[v_SystemUser_All]