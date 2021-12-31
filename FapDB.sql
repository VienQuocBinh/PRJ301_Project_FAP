USE [FapDB]
GO
/****** Object:  UserDefinedFunction [dbo].[getNameFPT]    Script Date: 8/31/2018 2:49:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getNameFPT] ( @str NVARCHAR(4000) )
RETURNS NVARCHAR(2000)
AS
BEGIN
    DECLARE @retval NVARCHAR(2000);

    SET @str=RTRIM(LTRIM(@str));
    SET @retval=LEFT(@str,1);

    WHILE CHARINDEX(' ',@str,1)>0 BEGIN
        SET @str=LTRIM(RIGHT(@str,LEN(@str)-CHARINDEX(' ',@str,1)));
        SET @retval+=LEFT(@str,1);
    END

    RETURN @retval;
END
GO
/****** Object:  Table [dbo].[Academic]    Script Date: 8/31/2018 2:49:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Academic](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Academic] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Academic_Student]    Script Date: 8/31/2018 2:49:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Academic_Student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rollNumber] [varchar](10) NOT NULL,
	[oldRollnumber] [varchar](10) NULL,
	[memberCode] [nvarchar](20) NOT NULL,
	[enrollDate] [date] NOT NULL,
	[mode] [nvarchar](20) NOT NULL,
	[studentId] [int] NOT NULL,
 CONSTRAINT [PK_Academic_Student] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campus]    Script Date: 8/31/2018 2:49:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Campus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campus_Academic]    Script Date: 8/31/2018 2:49:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campus_Academic](
	[campusId] [int] NOT NULL,
	[academicId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parent]    Script Date: 8/31/2018 2:49:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[phoneNumber] [int] NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[job] [nvarchar](50) NOT NULL,
	[placeWork] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Parent] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialized]    Script Date: 8/31/2018 2:49:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialized](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nameSpecialized] [nvarchar](50) NOT NULL,
	[code] [varchar](2) NOT NULL,
 CONSTRAINT [PK_Specialized] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 8/31/2018 2:49:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](25) NOT NULL,
	[lastName] [nvarchar](25) NOT NULL,
	[DOB] [date] NOT NULL,
	[gender] [bit] NOT NULL,
	[cardNo] [int] NULL,
	[cardDate] [date] NULL,
	[cardPlace] [nvarchar](255) NULL,
	[address] [nvarchar](255) NOT NULL,
	[telephone] [int] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[specializedId] [int] NULL,
	[campusId] [int] NULL,
	[parentId] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Academic] ON 

INSERT [dbo].[Academic] ([id], [username], [password]) VALUES (1, N'admin', N'123456')
SET IDENTITY_INSERT [dbo].[Academic] OFF
SET IDENTITY_INSERT [dbo].[Academic_Student] ON 

INSERT [dbo].[Academic_Student] ([id], [rollNumber], [oldRollnumber], [memberCode], [enrollDate], [mode], [studentId]) VALUES (12, N'FU-HL1', NULL, N'HoaPNSB1', CAST(N'2018-08-08' AS Date), N'cao dang', 1)
INSERT [dbo].[Academic_Student] ([id], [rollNumber], [oldRollnumber], [memberCode], [enrollDate], [mode], [studentId]) VALUES (15, N'FU-HL1024', NULL, N'HoaPSE1024', CAST(N'2018-08-16' AS Date), N'chinh quy', 1024)
INSERT [dbo].[Academic_Student] ([id], [rollNumber], [oldRollnumber], [memberCode], [enrollDate], [mode], [studentId]) VALUES (16, N'FU-HL2', NULL, N'NhatTQSE2', CAST(N'2018-08-17' AS Date), N'Cao Dang', 2)
INSERT [dbo].[Academic_Student] ([id], [rollNumber], [oldRollnumber], [memberCode], [enrollDate], [mode], [studentId]) VALUES (18, N'FU-HCM1025', NULL, N'ThuyNPHSB1025', CAST(N'2018-08-08' AS Date), N'abcd', 1025)
INSERT [dbo].[Academic_Student] ([id], [rollNumber], [oldRollnumber], [memberCode], [enrollDate], [mode], [studentId]) VALUES (19, N'FU-HL1027', NULL, N'ĐucPVIA1027', CAST(N'2018-08-16' AS Date), N'dai hoc', 1027)
INSERT [dbo].[Academic_Student] ([id], [rollNumber], [oldRollnumber], [memberCode], [enrollDate], [mode], [studentId]) VALUES (20, N'FU-HL1028', NULL, N'HoaPSE1028', CAST(N'2018-08-16' AS Date), N'chinh quy', 1028)
SET IDENTITY_INSERT [dbo].[Academic_Student] OFF
SET IDENTITY_INSERT [dbo].[Campus] ON 

INSERT [dbo].[Campus] ([id], [name]) VALUES (8, N'FU-HL')
INSERT [dbo].[Campus] ([id], [name]) VALUES (9, N'FU-HCM')
INSERT [dbo].[Campus] ([id], [name]) VALUES (10, N'FU-DN')
INSERT [dbo].[Campus] ([id], [name]) VALUES (11, N'FU-CT')
INSERT [dbo].[Campus] ([id], [name]) VALUES (12, N'MSE')
INSERT [dbo].[Campus] ([id], [name]) VALUES (13, N'FE-LAO')
SET IDENTITY_INSERT [dbo].[Campus] OFF
INSERT [dbo].[Campus_Academic] ([campusId], [academicId]) VALUES (8, 1)
SET IDENTITY_INSERT [dbo].[Parent] ON 

INSERT [dbo].[Parent] ([id], [name], [phoneNumber], [address], [email], [job], [placeWork]) VALUES (1, N'Phạm Văn Quang', 986246813, N'Ninh Bình', N'quangpd@gmail.com', N'Free', N'Ninh Bình')
INSERT [dbo].[Parent] ([id], [name], [phoneNumber], [address], [email], [job], [placeWork]) VALUES (2, N'Trần Quang Hải', 684235774, N'Vinh', N'hai7x@gmail.com', N'Bác Si', N'Vinh')
INSERT [dbo].[Parent] ([id], [name], [phoneNumber], [address], [email], [job], [placeWork]) VALUES (3, N'Nguyễn Hải Nam', 169125486, N'Cà Mau', N'namesimple@gmail.com', N'Công An', N'Cà Mau')
INSERT [dbo].[Parent] ([id], [name], [phoneNumber], [address], [email], [job], [placeWork]) VALUES (4, N'Đỗ Quang Thắng', 159631547, N'Hưng Yên', N'hongvan@gmail.com', N'Giáo Viên', N'Hưng Yên')
SET IDENTITY_INSERT [dbo].[Parent] OFF
SET IDENTITY_INSERT [dbo].[Specialized] ON 

INSERT [dbo].[Specialized] ([id], [nameSpecialized], [code]) VALUES (1, N'Kỹ Thuật Phần Mềm', N'SE')
INSERT [dbo].[Specialized] ([id], [nameSpecialized], [code]) VALUES (2, N'An Toàn Thông Tin', N'IA')
INSERT [dbo].[Specialized] ([id], [nameSpecialized], [code]) VALUES (3, N'Quản Trị Kinh Doanh', N'SB')
SET IDENTITY_INSERT [dbo].[Specialized] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId]) VALUES (1, N'Phạm Ngọc', N'Hòa', CAST(N'1998-03-20' AS Date), 1, NULL, NULL, NULL, N'FPT University, Thạch Hòa, Thạch Thất, Hà Nội, +84968038714', 968038714, N'thaycacac@gmail.com', 3, 8, NULL)
INSERT [dbo].[Student] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId]) VALUES (2, N'Trần Quang', N'Nhật', CAST(N'1998-03-10' AS Date), 1, NULL, NULL, NULL, N'Vinh', 123456789, N'NhatTQSE2@fpt.edu.vn', 1, 8, NULL)
INSERT [dbo].[Student] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId]) VALUES (3, N'Nguyễn Xuân', N'Cường', CAST(N'1998-05-20' AS Date), 1, NULL, NULL, NULL, N'Bắc Ninh', 968034874, N'cuongnx98@gmail.com', 1, 8, NULL)
INSERT [dbo].[Student] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId]) VALUES (4, N'Đỗ Quang', N'Hiệp', CAST(N'1997-09-30' AS Date), 1, NULL, NULL, NULL, N'Hưng Yên', 968481349, N'hongthuy@gmail.com', 1, 8, NULL)
INSERT [dbo].[Student] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId]) VALUES (1024, N'Phạm', N'Hòa', CAST(N'2018-08-09' AS Date), 1, NULL, NULL, NULL, N'FPT University, Thạch Hòa, Thạch Thất, Hà Nội, +84968038714', 968038714, N'thaycacac@gmail.com', 1, 8, NULL)
INSERT [dbo].[Student] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId]) VALUES (1025, N'Nguyễn Phương Hồng', N'Thủy', CAST(N'2018-08-10' AS Date), 0, NULL, NULL, NULL, N'FPT University, Thạch Hòa, Thạch Thất, Hà Nội, +84968038714', 968038714, N'ThuyNPHSB1025@fpt.edu.vn', 3, 9, NULL)
INSERT [dbo].[Student] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId]) VALUES (1027, N'Phan Văn', N'Đức', CAST(N'2018-08-16' AS Date), 1, NULL, NULL, NULL, N'Hà Nội', 968038714, N'ÐucPVIA1027@fpt.edu.vn', 3, 8, NULL)
INSERT [dbo].[Student] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId]) VALUES (1028, N'Phạm', N'Hòa', CAST(N'2018-08-24' AS Date), 1, NULL, NULL, NULL, N'FPT University, Thạch Hòa, Thạch Thất, Hà Nội, +84968038714', 968038714, N'HoaPSE1028@fpt.edu.vn', 1, 8, NULL)
SET IDENTITY_INSERT [dbo].[Student] OFF
ALTER TABLE [dbo].[Academic_Student]  WITH CHECK ADD  CONSTRAINT [FK_Academic_Student_Student] FOREIGN KEY([studentId])
REFERENCES [dbo].[Student] ([id])
GO
ALTER TABLE [dbo].[Academic_Student] CHECK CONSTRAINT [FK_Academic_Student_Student]
GO
--ALTER TABLE [dbo].[Academic_Student]  WITH CHECK ADD  CONSTRAINT [FK_Academic_Student_Student1] FOREIGN KEY([studentId])
--REFERENCES [dbo].[Student] ([id])
GO
ALTER TABLE [dbo].[Academic_Student] CHECK CONSTRAINT [FK_Academic_Student_Student1]
GO
ALTER TABLE [dbo].[Campus_Academic]  WITH CHECK ADD  CONSTRAINT [FK_Campus_Academic_Academic] FOREIGN KEY([academicId])
REFERENCES [dbo].[Academic] ([id])
GO
ALTER TABLE [dbo].[Campus_Academic] CHECK CONSTRAINT [FK_Campus_Academic_Academic]
GO
ALTER TABLE [dbo].[Campus_Academic]  WITH CHECK ADD  CONSTRAINT [FK_Campus_Academic_Campus] FOREIGN KEY([campusId])
REFERENCES [dbo].[Campus] ([id])
GO
ALTER TABLE [dbo].[Campus_Academic] CHECK CONSTRAINT [FK_Campus_Academic_Campus]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Campus] FOREIGN KEY([campusId])
REFERENCES [dbo].[Campus] ([id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Campus]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Parent] FOREIGN KEY([parentId])
REFERENCES [dbo].[Parent] ([id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Parent]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Specialized] FOREIGN KEY([specializedId])
REFERENCES [dbo].[Specialized] ([id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Specialized]
GO