SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendence]    Script Date: 2/28/2024 9:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendence](
	[aid] [int] IDENTITY(1,1) NOT NULL,
	[leid] [int] NOT NULL,
	[sid] [varchar](150) NOT NULL,
	[description] [varchar](150) NOT NULL,
	[isPresent] [bit] NOT NULL,
	[capturedtime] [datetime] NOT NULL,
 CONSTRAINT [PK_Attendence] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 2/28/2024 9:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[sid] [varchar](150) NOT NULL,
	[gid] [int] NOT NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 2/28/2024 9:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[lid] [int] NOT NULL,
	[lname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lession]    Script Date: 2/28/2024 9:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lession](
	[leid] [int] IDENTITY(1,1) NOT NULL,
	[gid] [int] NOT NULL,
	[tid] [int] NOT NULL,
	[rid] [int] NOT NULL,
	[lid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[isAttended] [bit] NOT NULL,
 CONSTRAINT [PK_Lession] PRIMARY KEY CLUSTERED 
(
	[leid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 2/28/2024 9:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[rid] [int] NOT NULL,
	[rname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2/28/2024 9:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[sid] [varchar](150) NOT NULL,
	[sname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentGroup]    Script Date: 2/28/2024 9:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentGroup](
	[gid] [int] NOT NULL,
	[gname] [varchar](150) NOT NULL,
	[subid] [int] NOT NULL,
	[lid] [int] NOT NULL,
 CONSTRAINT [PK_StudentGroup] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 2/28/2024 9:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subid] [int] NOT NULL,
	[suname] [varchar](150) NOT NULL,
	[credit] [int] NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 2/28/2024 9:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[tid] [int] NOT NULL,
	[tname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'sonnt', N'123', N'Ngo Tung Son')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'thuyntt', N'123', N'Nguyen Thi Thu Thuy')
GO
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES ('HE1', 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES ('HE1', 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES ('HE2', 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES ('HE2', 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES ('HE3', 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES ('HE3', 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES ('HE4', 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES ('HE4', 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES ('HE5', 2)
GO
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (1, N'sonnt')
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (2, N'thuyntt')
GO
SET IDENTITY_INSERT [dbo].[Lession] ON 

INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (1, 1, 1, 1, 1, CAST(N'2024-02-28' AS Date), 0)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (2, 1, 1, 1, 1, CAST(N'2024-03-01' AS Date), 0)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (3, 1, 1, 1, 1, CAST(N'2024-03-06' AS Date), 0)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (4, 2, 2, 1, 2, CAST(N'2024-02-28' AS Date), 0)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (5, 2, 2, 1, 2, CAST(N'2024-03-01' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Lession] OFF
GO
INSERT [dbo].[Room] ([rid], [rname]) VALUES (1, N'BE102')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (2, N'DE112')
GO
INSERT [dbo].[Student] ([sid], [sname]) VALUES ('HE1', N'Student 1')
INSERT [dbo].[Student] ([sid], [sname]) VALUES ('HE2', N'Student 2')
INSERT [dbo].[Student] ([sid], [sname]) VALUES ('HE3', N'Student 3')
INSERT [dbo].[Student] ([sid], [sname]) VALUES ('HE4', N'Student 4')
INSERT [dbo].[Student] ([sid], [sname]) VALUES ('HE5', N'Student 5')
GO
INSERT [dbo].[StudentGroup] ([gid], [gname], [subid], [lid]) VALUES (1, N'SE1818-PRJ301', 1, 1)
INSERT [dbo].[StudentGroup] ([gid], [gname], [subid], [lid]) VALUES (2, N'SE1818-Math', 2, 2)
GO
INSERT [dbo].[Subject] ([subid], [suname], [credit]) VALUES (1, N'PRJ301', 3)
INSERT [dbo].[Subject] ([subid], [suname], [credit]) VALUES (2, N'Math', 3)
GO
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (1, N'Slot 1')
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (2, N'Slot 2')
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (3, N'Slot 3')
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (4, N'Slot 4')
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (5, N'Slot 5')
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (6, N'Slot 6')
GO
ALTER TABLE [dbo].[Attendence]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_Lession] FOREIGN KEY([leid])
REFERENCES [dbo].[Lession] ([leid])
GO
ALTER TABLE [dbo].[Attendence] CHECK CONSTRAINT [FK_Attendence_Lession]
GO
ALTER TABLE [dbo].[Attendence]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_Lession1] FOREIGN KEY([leid])
REFERENCES [dbo].[Lession] ([leid])
GO
ALTER TABLE [dbo].[Attendence] CHECK CONSTRAINT [FK_Attendence_Lession1]
GO
ALTER TABLE [dbo].[Attendence]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Attendence] CHECK CONSTRAINT [FK_Attendence_Student]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Student]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_StudentGroup] FOREIGN KEY([gid])
REFERENCES [dbo].[StudentGroup] ([gid])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_StudentGroup]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_Lecturer]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_Room] FOREIGN KEY([rid])
REFERENCES [dbo].[Room] ([rid])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_Room]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_StudentGroup] FOREIGN KEY([gid])
REFERENCES [dbo].[StudentGroup] ([gid])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_StudentGroup]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_TimeSlot] FOREIGN KEY([tid])
REFERENCES [dbo].[TimeSlot] ([tid])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_TimeSlot]
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD  CONSTRAINT [FK_StudentGroup_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[StudentGroup] CHECK CONSTRAINT [FK_StudentGroup_Lecturer]
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD  CONSTRAINT [FK_StudentGroup_Subject] FOREIGN KEY([subid])
REFERENCES [dbo].[Subject] ([subid])
GO
ALTER TABLE [dbo].[StudentGroup] CHECK CONSTRAINT [FK_StudentGroup_Subject]
GO




