USE [QuizOnline]
GO
/****** Object:  Table [dbo].[Progress]    Script Date: 3/31/2021 3:18:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Progress](
	[progressld] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](16) NULL,
	[quizId] [int] NULL,
	[examResult] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[progressld] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgressDetail]    Script Date: 3/31/2021 3:18:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgressDetail](
	[progressId] [int] NULL,
	[termId] [int] NOT NULL,
	[progress] [int] NOT NULL,
	[learned] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 3/31/2021 3:18:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[username] [varchar](16) NOT NULL,
	[quizId] [int] IDENTITY(1,1) NOT NULL,
	[quizName] [nvarchar](50) NOT NULL,
	[quizDescription] [nvarchar](200) NOT NULL,
	[createdDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[quizId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizDetail]    Script Date: 3/31/2021 3:18:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizDetail](
	[quizId] [int] NOT NULL,
	[termId] [int] IDENTITY(1,1) NOT NULL,
	[key] [nvarchar](max) NOT NULL,
	[value] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[termId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/31/2021 3:18:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[username] [varchar](16) NOT NULL,
	[password] [varchar](16) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Progress] ON 

INSERT [dbo].[Progress] ([progressld], [username], [quizId], [examResult]) VALUES (1, N'havusontung007', 1, 0.9)
INSERT [dbo].[Progress] ([progressld], [username], [quizId], [examResult]) VALUES (2, N'thanhgq', 2, 0.9)
INSERT [dbo].[Progress] ([progressld], [username], [quizId], [examResult]) VALUES (4, N'havusontung007', 5, 0.8)
SET IDENTITY_INSERT [dbo].[Progress] OFF
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([username], [quizId], [quizName], [quizDescription], [createdDate]) VALUES (N'havusontung007', 1, N'VNI101', N'Món ăn Việt Nam', CAST(N'2021-03-31' AS Date))
INSERT [dbo].[Quiz] ([username], [quizId], [quizName], [quizDescription], [createdDate]) VALUES (N'thanhgq', 2, N'VNI102', N'Địa danh nổi tiếng ở Việt Nam', CAST(N'2021-03-21' AS Date))
INSERT [dbo].[Quiz] ([username], [quizId], [quizName], [quizDescription], [createdDate]) VALUES (N'havusontung007', 5, N'VNI103', N'Địa điểm du lịch ở Việt Nam phổ biến ?', CAST(N'2021-03-21' AS Date))
SET IDENTITY_INSERT [dbo].[Quiz] OFF
SET IDENTITY_INSERT [dbo].[QuizDetail] ON 

INSERT [dbo].[QuizDetail] ([quizId], [termId], [key], [value]) VALUES (1, 4, N'Hòa Lạc', N'Bún bò ngon nhất là ở đâu ?')
INSERT [dbo].[QuizDetail] ([quizId], [termId], [key], [value]) VALUES (1, 5, N'Thanh Hóa', N'Nem chua có xuất sứ ở đâu ?')
INSERT [dbo].[QuizDetail] ([quizId], [termId], [key], [value]) VALUES (1, 6, N'Vũng Tàu', N'Nơi nào sau đây ở Việt Nam có vùng biển được bình chọn là đẹp nhất năm 2018 ?')
INSERT [dbo].[QuizDetail] ([quizId], [termId], [key], [value]) VALUES (1, 7, N'Hà Nội', N'Đâu là thử đô của Việt Nam ?')
INSERT [dbo].[QuizDetail] ([quizId], [termId], [key], [value]) VALUES (2, 8, N'Ai Cập', N'Kim tự tháp Giza thuộc đất nước nào sau đây ?')
INSERT [dbo].[QuizDetail] ([quizId], [termId], [key], [value]) VALUES (2, 9, N'Anh', N'Tháp đồng hồ Big Ben thuộc đất nước nào ?')
INSERT [dbo].[QuizDetail] ([quizId], [termId], [key], [value]) VALUES (2, 10, N'Trung Quốc', N'Vạn lý trường thành nằm ở đâu ?')
INSERT [dbo].[QuizDetail] ([quizId], [termId], [key], [value]) VALUES (2, 11, N'Brazil', N'Đất nước nào có sản lượng cà phê cao nhất thế giới ?')
INSERT [dbo].[QuizDetail] ([quizId], [termId], [key], [value]) VALUES (5, 12, N'Avatar', N'Trong những bộ phim sau đây, phim nào đạt doanh thu cao nhất từ trước đến nay ?')
INSERT [dbo].[QuizDetail] ([quizId], [termId], [key], [value]) VALUES (5, 13, N'Avenger : Endgame', N'Bộ phim nào đạt doanh thu cao nhất năm 2020 ?')
INSERT [dbo].[QuizDetail] ([quizId], [termId], [key], [value]) VALUES (5, 14, N'Avenger : Infinity War', N'Bộ phim nào đạt doanh thu cao nhất năm 2019 ?')
INSERT [dbo].[QuizDetail] ([quizId], [termId], [key], [value]) VALUES (5, 15, N'Inception', N'Trong những bộ phim sau đây, bộ phim nào có sự xuất hiện của nam diễn viên Leonardo Dicaprio')
SET IDENTITY_INSERT [dbo].[QuizDetail] OFF
INSERT [dbo].[User] ([username], [password], [email], [fullName]) VALUES (N'havusontung007', N'tumotden0', N'havusontung007@gmail.com', N'Hà Vũ Sơn Tùng')
INSERT [dbo].[User] ([username], [password], [email], [fullName]) VALUES (N'thanhgq', N'thanhgiap', N'thanhgq@gmail.com', N'Giáp Quang Thành')
ALTER TABLE [dbo].[Progress] ADD  DEFAULT ((0)) FOR [examResult]
GO
ALTER TABLE [dbo].[Progress]  WITH CHECK ADD FOREIGN KEY([quizId])
REFERENCES [dbo].[Quiz] ([quizId])
GO
ALTER TABLE [dbo].[Progress]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[ProgressDetail]  WITH CHECK ADD FOREIGN KEY([progressId])
REFERENCES [dbo].[Progress] ([progressld])
GO
ALTER TABLE [dbo].[ProgressDetail]  WITH CHECK ADD FOREIGN KEY([termId])
REFERENCES [dbo].[QuizDetail] ([termId])
GO
ALTER TABLE [dbo].[ProgressDetail]  WITH CHECK ADD FOREIGN KEY([termId])
REFERENCES [dbo].[QuizDetail] ([termId])
GO
ALTER TABLE [dbo].[ProgressDetail]  WITH CHECK ADD FOREIGN KEY([termId])
REFERENCES [dbo].[QuizDetail] ([termId])
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[QuizDetail]  WITH CHECK ADD FOREIGN KEY([quizId])
REFERENCES [dbo].[Quiz] ([quizId])
GO
ALTER TABLE [dbo].[QuizDetail]  WITH CHECK ADD FOREIGN KEY([quizId])
REFERENCES [dbo].[Quiz] ([quizId])
GO
