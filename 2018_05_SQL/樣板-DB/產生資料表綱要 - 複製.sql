-- Drop Table Statements for the tables in the University Database.
if exists (select * from sysobjects where id = object_id(N'[dbo].[選修]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[選修]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[課程]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[課程]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[科目]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[科目]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[教師]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[教師]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[學生]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[學生]
GO


-- Create Table Statments for the tables in the University Database

CREATE TABLE [dbo].[學生] (
	[學生代號] [char] (11) NOT NULL ,
	[學生姓] [varchar] (30) NOT NULL , 
	[學生名] [varchar] (30) NOT NULL , 
	[城市] [varchar] (30) NOT NULL , 
	[州] [char] (2) NOT NULL , 
	[郵遞區號] [char] (10) NOT NULL , 
	[主修科目] [char] (6) NULL , 
	[班級] [char] (2) NULL , 
	[總成績等級] [decimal] (3,2) NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[學生] WITH NOCHECK ADD 
	CONSTRAINT [PK_Student] PRIMARY KEY  NONCLUSTERED 
	(
		[學生代號]
	)  ON [PRIMARY] 

GO


CREATE TABLE [dbo].[教師] (
	[教師代號] [char] (11) NOT NULL ,
	[教師姓] [varchar] (30) NOT NULL , 
	[教師名] [varchar] (30) NOT NULL , 
	[城市] [varchar] (30) NOT NULL , 
	[州] [char] (2) NOT NULL , 
	[郵遞區號] [char] (10) NOT NULL , 
	[等級] [char] (4) NULL , 
	[聘僱日期] [datetime] NULL , 
	[薪資] [decimal] (10,2) NULL,
	[上級老闆] [char] (11) NULL,
	[科系] [char] (6) NULL
 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[教師] WITH NOCHECK ADD 
	CONSTRAINT [PK_Faculty] PRIMARY KEY  NONCLUSTERED 
	(
		[教師代號]
	)  ON [PRIMARY] 
GO


CREATE TABLE [dbo].[科目] (
	[科目代號] [char] (6) NOT NULL ,
	[科目描述] [varchar] (50) NOT NULL , 
	[科目學分數] [int] NULL
 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[科目] WITH NOCHECK ADD 
	CONSTRAINT [PK_Course] PRIMARY KEY  NONCLUSTERED 
	(
		[科目代號]
	)  ON [PRIMARY] 
GO


CREATE TABLE [dbo].[課程] (
	[課程代號] [int] NOT NULL ,
	[科目代號] [char] (6) NOT NULL , 
	[開課學期] [char] (6) NOT NULL , 
	[開課年份] [int] NOT NULL , 
	[上課地點] [varchar] (30) NULL , 
	[上課時段] [varchar] (10) NULL , 
	[教師代號] [char] (11) NULL ,
	[上課日期] [char] (4) NULL
 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[課程] WITH NOCHECK ADD 
	CONSTRAINT [PK_offering] PRIMARY KEY  NONCLUSTERED 
	(
		[課程代號]
	)  ON [PRIMARY] 
GO


CREATE TABLE [dbo].[選修] (
	[課程代號] [int] NOT NULL ,
	[學生代號] [char] (11) NOT NULL , 
	[修課成績] [decimal] (3,2)  NULL
 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[選修] WITH NOCHECK ADD 
	CONSTRAINT [PK_Enrollment] PRIMARY KEY  NONCLUSTERED 
	(
		[課程代號],
		[學生代號]
	)  ON [PRIMARY] 
GO



-- Constraint statements
ALTER TABLE [dbo].[教師] WITH NOCHECK ADD  
	CONSTRAINT [FK_Faculty_Supervisor] FOREIGN KEY 
	(
		[上級老闆]
	) REFERENCES [dbo].[教師] (
		[教師代號]
	)
GO


ALTER TABLE [dbo].[課程] WITH NOCHECK ADD 
	CONSTRAINT [FK_offering_Course] FOREIGN KEY 
	(
		[科目代號]
	) REFERENCES [dbo].[科目] (
		[科目代號]
	),
	CONSTRAINT [FK_offering_Faculty] FOREIGN KEY 
	(
		[教師代號]
	) REFERENCES [dbo].[教師] (
		[教師代號]
	)
GO

ALTER TABLE [dbo].[選修] ADD 
	CONSTRAINT [FK_Enrollment_offering] FOREIGN KEY 
	(
		[課程代號]
	) REFERENCES [dbo].[課程] (
		[課程代號]
	),
	CONSTRAINT [FK_offering_Student] FOREIGN KEY 
	(
		[學生代號]
	) REFERENCES [dbo].[學生] (
		[學生代號]
	)
GO


