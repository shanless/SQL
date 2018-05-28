-- Drop Table Statements for the tables in the University Database.
if exists (select * from sysobjects where id = object_id(N'[dbo].[���]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[���]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[�ҵ{]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[�ҵ{]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[���]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[���]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[�Юv]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[�Юv]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[�ǥ�]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[�ǥ�]
GO


-- Create Table Statments for the tables in the University Database

CREATE TABLE [dbo].[�ǥ�] (
	[�ǥͥN��] [char] (11) NOT NULL ,
	[�ǥͩm] [varchar] (30) NOT NULL , 
	[�ǥͦW] [varchar] (30) NOT NULL , 
	[����] [varchar] (30) NOT NULL , 
	[�{] [char] (2) NOT NULL , 
	[�l���ϸ�] [char] (10) NOT NULL , 
	[�D�׬��] [char] (6) NULL , 
	[�Z��] [char] (2) NULL , 
	[�`���Z����] [decimal] (3,2) NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[�ǥ�] WITH NOCHECK ADD 
	CONSTRAINT [PK_Student] PRIMARY KEY  NONCLUSTERED 
	(
		[�ǥͥN��]
	)  ON [PRIMARY] 

GO


CREATE TABLE [dbo].[�Юv] (
	[�Юv�N��] [char] (11) NOT NULL ,
	[�Юv�m] [varchar] (30) NOT NULL , 
	[�Юv�W] [varchar] (30) NOT NULL , 
	[����] [varchar] (30) NOT NULL , 
	[�{] [char] (2) NOT NULL , 
	[�l���ϸ�] [char] (10) NOT NULL , 
	[����] [char] (4) NULL , 
	[�u�����] [datetime] NULL , 
	[�~��] [decimal] (10,2) NULL,
	[�W�Ŧ���] [char] (11) NULL,
	[��t] [char] (6) NULL
 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[�Юv] WITH NOCHECK ADD 
	CONSTRAINT [PK_Faculty] PRIMARY KEY  NONCLUSTERED 
	(
		[�Юv�N��]
	)  ON [PRIMARY] 
GO


CREATE TABLE [dbo].[���] (
	[��إN��] [char] (6) NOT NULL ,
	[��شy�z] [varchar] (50) NOT NULL , 
	[��ؾǤ���] [int] NULL
 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[���] WITH NOCHECK ADD 
	CONSTRAINT [PK_Course] PRIMARY KEY  NONCLUSTERED 
	(
		[��إN��]
	)  ON [PRIMARY] 
GO


CREATE TABLE [dbo].[�ҵ{] (
	[�ҵ{�N��] [int] NOT NULL ,
	[��إN��] [char] (6) NOT NULL , 
	[�}�ҾǴ�] [char] (6) NOT NULL , 
	[�}�Ҧ~��] [int] NOT NULL , 
	[�W�Ҧa�I] [varchar] (30) NULL , 
	[�W�Үɬq] [varchar] (10) NULL , 
	[�Юv�N��] [char] (11) NULL ,
	[�W�Ҥ��] [char] (4) NULL
 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[�ҵ{] WITH NOCHECK ADD 
	CONSTRAINT [PK_offering] PRIMARY KEY  NONCLUSTERED 
	(
		[�ҵ{�N��]
	)  ON [PRIMARY] 
GO


CREATE TABLE [dbo].[���] (
	[�ҵ{�N��] [int] NOT NULL ,
	[�ǥͥN��] [char] (11) NOT NULL , 
	[�׽Ҧ��Z] [decimal] (3,2)  NULL
 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[���] WITH NOCHECK ADD 
	CONSTRAINT [PK_Enrollment] PRIMARY KEY  NONCLUSTERED 
	(
		[�ҵ{�N��],
		[�ǥͥN��]
	)  ON [PRIMARY] 
GO



-- Constraint statements
ALTER TABLE [dbo].[�Юv] WITH NOCHECK ADD  
	CONSTRAINT [FK_Faculty_Supervisor] FOREIGN KEY 
	(
		[�W�Ŧ���]
	) REFERENCES [dbo].[�Юv] (
		[�Юv�N��]
	)
GO


ALTER TABLE [dbo].[�ҵ{] WITH NOCHECK ADD 
	CONSTRAINT [FK_offering_Course] FOREIGN KEY 
	(
		[��إN��]
	) REFERENCES [dbo].[���] (
		[��إN��]
	),
	CONSTRAINT [FK_offering_Faculty] FOREIGN KEY 
	(
		[�Юv�N��]
	) REFERENCES [dbo].[�Юv] (
		[�Юv�N��]
	)
GO

ALTER TABLE [dbo].[���] ADD 
	CONSTRAINT [FK_Enrollment_offering] FOREIGN KEY 
	(
		[�ҵ{�N��]
	) REFERENCES [dbo].[�ҵ{] (
		[�ҵ{�N��]
	),
	CONSTRAINT [FK_offering_Student] FOREIGN KEY 
	(
		[�ǥͥN��]
	) REFERENCES [dbo].[�ǥ�] (
		[�ǥͥN��]
	)
GO


