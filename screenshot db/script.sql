USE [ScreenShot]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 06/21/2015 14:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleType] [varchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON
INSERT [dbo].[Roles] ([RoleID], [RoleType]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleID], [RoleType]) VALUES (2, N'Manager')
INSERT [dbo].[Roles] ([RoleID], [RoleType]) VALUES (3, N'Employee')
SET IDENTITY_INSERT [dbo].[Roles] OFF
/****** Object:  Table [dbo].[projects]    Script Date: 06/21/2015 14:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[projects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [varchar](50) NULL,
	[ProjectType] [varchar](50) NULL,
	[ProjectDuration] [varchar](50) NULL,
	[Discription] [varchar](max) NULL,
	[Technology] [varchar](50) NULL,
	[NoofPersonsWorking] [int] NULL,
 CONSTRAINT [PK_projects] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[projects] ON
INSERT [dbo].[projects] ([ProjectID], [ProjectName], [ProjectType], [ProjectDuration], [Discription], [Technology], [NoofPersonsWorking]) VALUES (1, N'Masterchef', N'Health', N'3 months', N'master chef is used to guide the chef', N'dotnett', 12)
INSERT [dbo].[projects] ([ProjectID], [ProjectName], [ProjectType], [ProjectDuration], [Discription], [Technology], [NoofPersonsWorking]) VALUES (4, N'myoffers', N'shoping', N'3', N'online shoping', N'dotnet', 3)
INSERT [dbo].[projects] ([ProjectID], [ProjectName], [ProjectType], [ProjectDuration], [Discription], [Technology], [NoofPersonsWorking]) VALUES (5, N'ispeak', N'speak', N'6', N'texttowave', N'dotnet', 4)
INSERT [dbo].[projects] ([ProjectID], [ProjectName], [ProjectType], [ProjectDuration], [Discription], [Technology], [NoofPersonsWorking]) VALUES (6, N'reverse', N'TEMPLATESOFSQL', N'4', N'SP,TABLE,TRIGGERSFOR TABLEA', N'SQL', 4)
INSERT [dbo].[projects] ([ProjectID], [ProjectName], [ProjectType], [ProjectDuration], [Discription], [Technology], [NoofPersonsWorking]) VALUES (7, N'gftgy', N'gtfg', N'8', N'gtr', N'rdtg', 6)
SET IDENTITY_INSERT [dbo].[projects] OFF
/****** Object:  StoredProcedure [dbo].[sp_insert]    Script Date: 06/21/2015 14:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_insert]
(

@Pname varchar(50),
@PType varchar(50),
@Pduration varchar(50),
@Discription varchar(50),
@Technology varchar(50),
@NoOfWorking int

)
as
begin
insert into projects(ProjectName,ProjectType,ProjectDuration,Discription,Technology,NoofPersonsWorking)values(@Pname,
@PType,@Pduration,@Discription,@Technology,@NoOfWorking)


end
GO
/****** Object:  StoredProcedure [dbo].[sp_update]    Script Date: 06/21/2015 14:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_update]
(
@pid int,
@pname varchar(50),
@ptype varchar(50),
@pduration varchar(50),
@desc varchar(50),
@tech varchar(50),
@noofpersons int
)
as
begin
update projects set ProjectName=@pname,ProjectType=@ptype,ProjectDuration=@pduration,Discription=@desc,Technology=@tech,NoofPersonsWorking=@noofpersons where ProjectID=@pid


end
GO
/****** Object:  StoredProcedure [dbo].[sp_login]    Script Date: 06/21/2015 14:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_login]
(
@uid varchar(20),
@pwd varchar(20),
@roleid int
)
as
begin
select * from EmpDetails where UserName=@uid and Password=@pwd and RoleID=@roleid

end
GO
/****** Object:  StoredProcedure [dbo].[sp_empupdate]    Script Date: 06/21/2015 14:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_empupdate]
(
@eid int,
@ename varchar(20),
@uid varchar(20),
@pwd varchar(20),
@pno varchar(20),
@address varchar(20),
@email varchar(20),
@exp varchar(20),
@qual varchar(20),
@manager varchar(20),
@roleid int
)
as
begin
update EmpDetails set Empname=@ename, 
UserName=@uid,Password=@pwd ,
Phoneno=@pno ,
Address=@address ,
Email=@email,
experience=@exp,
Qualification=@qual,
Manager=@manager,RoleID=@roleid where EmpID=@eid 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Empinsert]    Script Date: 06/21/2015 14:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Empinsert]
(
@ename varchar(20),
@uid varchar(20),
@pwd varchar(20),
@pno varchar(20),
@address varchar(20),
@email varchar(20),
@exp varchar(20),
@qual varchar(20),
@manager varchar(20),
@roleid int
)
as
begin
insert into EmpDetails(Empname,UserName,Password,Phoneno,Address,Email,experience,Qualification,Manager,RoleID)values(@ename,@uid,@pwd,@pno,@address,@email,@exp,@qual,@manager,@roleid)
end
GO
/****** Object:  StoredProcedure [dbo].[delProject]    Script Date: 06/21/2015 14:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delProject]
(
@projectid int
)
as
begin
delete from project_allocations where projectid=@projectid
delete from projects where projectid=@projectid
end
GO
/****** Object:  StoredProcedure [dbo].[delEmp]    Script Date: 06/21/2015 14:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delEmp]
(
@empid int
)
as
begin
delete from project_allocations where managerid=@empid
delete from emp_managerdetails where empid=@empid or managerid=@empid
delete from empdetails where empid=@empid
end
GO
/****** Object:  ForeignKey [FK_Emp_ManagerDetails_EmpDetails]    Script Date: 06/21/2015 14:21:57 ******/
ALTER TABLE [dbo].[Emp_ManagerDetails]  WITH CHECK ADD  CONSTRAINT [FK_Emp_ManagerDetails_EmpDetails] FOREIGN KEY([EmpID])
REFERENCES [dbo].[EmpDetails] ([EmpID])
GO
ALTER TABLE [dbo].[Emp_ManagerDetails] CHECK CONSTRAINT [FK_Emp_ManagerDetails_EmpDetails]
GO
/****** Object:  ForeignKey [FK_Emp_ManagerDetails_EmpDetails1]    Script Date: 06/21/2015 14:21:57 ******/
ALTER TABLE [dbo].[Emp_ManagerDetails]  WITH CHECK ADD  CONSTRAINT [FK_Emp_ManagerDetails_EmpDetails1] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[EmpDetails] ([EmpID])
GO
ALTER TABLE [dbo].[Emp_ManagerDetails] CHECK CONSTRAINT [FK_Emp_ManagerDetails_EmpDetails1]
GO
/****** Object:  ForeignKey [FK_EmpDetails_Roles]    Script Date: 06/21/2015 14:21:57 ******/
ALTER TABLE [dbo].[EmpDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmpDetails_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[EmpDetails] CHECK CONSTRAINT [FK_EmpDetails_Roles]
GO
/****** Object:  ForeignKey [FK_Project_Allocations_EmpDetails]    Script Date: 06/21/2015 14:21:57 ******/
ALTER TABLE [dbo].[Project_Allocations]  WITH CHECK ADD  CONSTRAINT [FK_Project_Allocations_EmpDetails] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[EmpDetails] ([EmpID])
GO
ALTER TABLE [dbo].[Project_Allocations] CHECK CONSTRAINT [FK_Project_Allocations_EmpDetails]
GO
/****** Object:  ForeignKey [FK_Project_Allocations_Project_Allocations]    Script Date: 06/21/2015 14:21:57 ******/
ALTER TABLE [dbo].[Project_Allocations]  WITH CHECK ADD  CONSTRAINT [FK_Project_Allocations_Project_Allocations] FOREIGN KEY([ProjectManagerID])
REFERENCES [dbo].[Project_Allocations] ([ProjectManagerID])
GO
ALTER TABLE [dbo].[Project_Allocations] CHECK CONSTRAINT [FK_Project_Allocations_Project_Allocations]
GO
