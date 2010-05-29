 CREATE TABLE [T_User_Login] ( [UserId] [nvarchar] (50) NOT NULL , [UserName] [nvarchar] (50) NULL , [Password] [nvarchar] (32) NULL , [IsCanLogin] [bit] NULL , [RegisterTime] [datetime]  NULL )
 ALTER TABLE [T_User_Login] WITH NOCHECK ADD CONSTRAINT [PK_T_User_Login] PRIMARY KEY  NONCLUSTERED ( [UserId] )

 INSERT [T_User_Login] ( [UserId] , [UserName] , [Password] , [IsCanLogin] , [RegisterTime] ) VALUES ( 'admin' , '系统管理员' , 'c3284d0f94606de1fd2af172aba15bf' , 1 , '2010-05-27 13:36:36.677' )

