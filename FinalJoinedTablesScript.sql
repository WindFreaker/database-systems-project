USE [master]
GO
/****** Object:  Database [yellow]    Script Date: 4/22/2019 3:06:40 PM ******/
CREATE DATABASE [yellow]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'yellow', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.LOCAL\MSSQL\DATA\yellow.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'yellow_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.LOCAL\MSSQL\DATA\yellow_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [yellow] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [yellow].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [yellow] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [yellow] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [yellow] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [yellow] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [yellow] SET ARITHABORT OFF 
GO
ALTER DATABASE [yellow] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [yellow] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [yellow] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [yellow] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [yellow] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [yellow] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [yellow] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [yellow] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [yellow] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [yellow] SET  ENABLE_BROKER 
GO
ALTER DATABASE [yellow] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [yellow] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [yellow] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [yellow] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [yellow] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [yellow] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [yellow] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [yellow] SET RECOVERY FULL 
GO
ALTER DATABASE [yellow] SET  MULTI_USER 
GO
ALTER DATABASE [yellow] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [yellow] SET DB_CHAINING OFF 
GO
ALTER DATABASE [yellow] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [yellow] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [yellow] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'yellow', N'ON'
GO
ALTER DATABASE [yellow] SET QUERY_STORE = OFF
GO
USE [yellow]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [yellow]
GO
/****** Object:  Table [dbo].[Building]    Script Date: 4/22/2019 3:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building](
	[BUILDINGID] [int] NOT NULL,
	[BUILDINGNAME] [varchar](255) NOT NULL,
	[BUILDINGADDRESS] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[BUILDINGID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CLASSBUILDING]    Script Date: 4/22/2019 3:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLASSBUILDING](
	[BUILDINGID] [int] NOT NULL,
	[NUMBEROFCLASSROOMS] [int] NOT NULL,
 CONSTRAINT [PK_CLASSBUILDING] PRIMARY KEY CLUSTERED 
(
	[BUILDINGID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseSections]    Script Date: 4/22/2019 3:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseSections](
	[courseID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[professorID] [int] NOT NULL,
	[buildingID] [int] NOT NULL,
	[courseName] [varchar](255) NOT NULL,
	[NumberOfSeats] [int] NOT NULL,
	[CreditHours] [int] NOT NULL,
 CONSTRAINT [PK_CourseSections] PRIMARY KEY CLUSTERED 
(
	[courseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 4/22/2019 3:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[departmentID] [int] NOT NULL,
	[buildingID] [int] NOT NULL,
	[departmentName] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[departmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DORMS]    Script Date: 4/22/2019 3:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DORMS](
	[BUILDINGID] [int] NOT NULL,
	[NUMBEROFRESIDENTS] [int] NOT NULL,
 CONSTRAINT [PK_DORMS] PRIMARY KEY CLUSTERED 
(
	[BUILDINGID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 4/22/2019 3:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[STUDENTID] [int] NOT NULL,
	[COURSEID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FinancialAid]    Script Date: 4/22/2019 3:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinancialAid](
	[totalAid] [int] NOT NULL,
	[StudentId] [int] NULL,
 CONSTRAINT [PK_FinancialAid] PRIMARY KEY CLUSTERED 
(
	[totalAid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MEMBERSHIP]    Script Date: 4/22/2019 3:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEMBERSHIP](
	[OrgID] [int] NOT NULL,
	[STUDENTID] [int] NOT NULL,
 CONSTRAINT [PK_MEMBERSHIP] PRIMARY KEY CLUSTERED 
(
	[STUDENTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORGANIZATION]    Script Date: 4/22/2019 3:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORGANIZATION](
	[OrgID] [int] NOT NULL,
 CONSTRAINT [PK_ORGANIZATION] PRIMARY KEY CLUSTERED 
(
	[OrgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Professor]    Script Date: 4/22/2019 3:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professor](
	[professorID] [int] NOT NULL,
	[professorEmail] [varchar](255) NOT NULL,
	[professorName] [varchar](60) NOT NULL,
	[Salary] [int] NOT NULL,
	[courseTaught] [varchar](255) NOT NULL,
	[departmentID] [int] NOT NULL,
 CONSTRAINT [PK_Professor] PRIMARY KEY CLUSTERED 
(
	[professorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SPORTS]    Script Date: 4/22/2019 3:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPORTS](
	[MEMBERID] [int] NOT NULL,
	[SPORTNAME] [varchar](50) NOT NULL,
	[INSEASON] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 4/22/2019 3:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [int] NOT NULL,
	[StudentName] [varchar](255) NOT NULL,
	[StudentEmail] [varchar](255) NOT NULL,
	[GPA] [float] NOT NULL,
	[ACTIVE] [bit] NOT NULL,
	[GOODSTANDING] [bit] NOT NULL,
	[totalCreditHours] [int] NOT NULL,
	[SEMESTERHOURS] [int] NOT NULL,
	[BUILDINGID] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[STUDENTORGS]    Script Date: 4/22/2019 3:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STUDENTORGS](
	[MEMBERID] [int] NOT NULL,
	[ORGNAME] [varchar](50) NOT NULL,
	[DUESOWED] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tuition]    Script Date: 4/22/2019 3:06:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tuition](
	[amountDue] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[totalCost] [int] NOT NULL,
	[totalAid] [int] NOT NULL,
 CONSTRAINT [PK_Tuition] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Building] ([BUILDINGID], [BUILDINGNAME], [BUILDINGADDRESS]) VALUES (1, N'Math', N'1234 Main St')
INSERT [dbo].[Building] ([BUILDINGID], [BUILDINGNAME], [BUILDINGADDRESS]) VALUES (2, N'Science', N'4598 Hayes Ln')
INSERT [dbo].[Building] ([BUILDINGID], [BUILDINGNAME], [BUILDINGADDRESS]) VALUES (3, N'English', N'12 Josh St')
INSERT [dbo].[Building] ([BUILDINGID], [BUILDINGNAME], [BUILDINGADDRESS]) VALUES (4, N'Computer Science', N'78 Planters Ln')
INSERT [dbo].[Building] ([BUILDINGID], [BUILDINGNAME], [BUILDINGADDRESS]) VALUES (5, N'Eagle Villiage', N'34 Fair Rd')
INSERT [dbo].[Building] ([BUILDINGID], [BUILDINGNAME], [BUILDINGADDRESS]) VALUES (6, N'Southern Living', N'90 Gentilly Rd')
INSERT [dbo].[Building] ([BUILDINGID], [BUILDINGNAME], [BUILDINGADDRESS]) VALUES (7, N'Centiennial', N'4356 Georgia Ave')
INSERT [dbo].[Building] ([BUILDINGID], [BUILDINGNAME], [BUILDINGADDRESS]) VALUES (8, N'CourtYard', N'9999 College Ave')
INSERT [dbo].[CLASSBUILDING] ([BUILDINGID], [NUMBEROFCLASSROOMS]) VALUES (1, 25)
INSERT [dbo].[CLASSBUILDING] ([BUILDINGID], [NUMBEROFCLASSROOMS]) VALUES (2, 75)
INSERT [dbo].[CLASSBUILDING] ([BUILDINGID], [NUMBEROFCLASSROOMS]) VALUES (3, 15)
INSERT [dbo].[CLASSBUILDING] ([BUILDINGID], [NUMBEROFCLASSROOMS]) VALUES (4, 100)
INSERT [dbo].[CourseSections] ([courseID], [StudentID], [professorID], [buildingID], [courseName], [NumberOfSeats], [CreditHours]) VALUES (1, 321, 1, 1, N'Calculus', 25, 4)
INSERT [dbo].[CourseSections] ([courseID], [StudentID], [professorID], [buildingID], [courseName], [NumberOfSeats], [CreditHours]) VALUES (2, 123, 2, 4, N'Database Systems', 30, 3)
INSERT [dbo].[CourseSections] ([courseID], [StudentID], [professorID], [buildingID], [courseName], [NumberOfSeats], [CreditHours]) VALUES (3, 234, 3, 3, N'World Literature', 50, 3)
INSERT [dbo].[CourseSections] ([courseID], [StudentID], [professorID], [buildingID], [courseName], [NumberOfSeats], [CreditHours]) VALUES (4, 457, 4, 2, N'Intro to Physics', 75, 4)
INSERT [dbo].[Department] ([departmentID], [buildingID], [departmentName]) VALUES (1, 4, N'Computer Science')
INSERT [dbo].[Department] ([departmentID], [buildingID], [departmentName]) VALUES (2, 3, N'Literauture')
INSERT [dbo].[Department] ([departmentID], [buildingID], [departmentName]) VALUES (3, 2, N'Physics')
INSERT [dbo].[Department] ([departmentID], [buildingID], [departmentName]) VALUES (4, 1, N'Math')
INSERT [dbo].[DORMS] ([BUILDINGID], [NUMBEROFRESIDENTS]) VALUES (5, 50)
INSERT [dbo].[DORMS] ([BUILDINGID], [NUMBEROFRESIDENTS]) VALUES (6, 100)
INSERT [dbo].[DORMS] ([BUILDINGID], [NUMBEROFRESIDENTS]) VALUES (7, 90)
INSERT [dbo].[DORMS] ([BUILDINGID], [NUMBEROFRESIDENTS]) VALUES (8, 150)
INSERT [dbo].[FinancialAid] ([totalAid], [StudentId]) VALUES (0, 234)
INSERT [dbo].[FinancialAid] ([totalAid], [StudentId]) VALUES (10000, 123)
INSERT [dbo].[FinancialAid] ([totalAid], [StudentId]) VALUES (15000, 457)
INSERT [dbo].[FinancialAid] ([totalAid], [StudentId]) VALUES (25000, 321)
INSERT [dbo].[FinancialAid] ([totalAid], [StudentId]) VALUES (50000, 111)
INSERT [dbo].[MEMBERSHIP] ([OrgID], [STUDENTID]) VALUES (3, 111)
INSERT [dbo].[MEMBERSHIP] ([OrgID], [STUDENTID]) VALUES (1, 123)
INSERT [dbo].[MEMBERSHIP] ([OrgID], [STUDENTID]) VALUES (2, 234)
INSERT [dbo].[MEMBERSHIP] ([OrgID], [STUDENTID]) VALUES (1, 321)
INSERT [dbo].[MEMBERSHIP] ([OrgID], [STUDENTID]) VALUES (2, 457)
INSERT [dbo].[ORGANIZATION] ([OrgID]) VALUES (1)
INSERT [dbo].[ORGANIZATION] ([OrgID]) VALUES (2)
INSERT [dbo].[ORGANIZATION] ([OrgID]) VALUES (3)
INSERT [dbo].[Professor] ([professorID], [professorEmail], [professorName], [Salary], [courseTaught], [departmentID]) VALUES (1, N'js0112@georgiasouthern.edu', N'John Smith', 30000, N'Calculus', 4)
INSERT [dbo].[Professor] ([professorID], [professorEmail], [professorName], [Salary], [courseTaught], [departmentID]) VALUES (2, N'hb0992@georgiasouthern.edu', N'Hayes Barber', 95000, N'Database Systems', 1)
INSERT [dbo].[Professor] ([professorID], [professorEmail], [professorName], [Salary], [courseTaught], [departmentID]) VALUES (3, N'bp9302@georgiasouthern.edu', N'Brad Pitt', 50000, N'World Literature', 2)
INSERT [dbo].[Professor] ([professorID], [professorEmail], [professorName], [Salary], [courseTaught], [departmentID]) VALUES (4, N'gh7787@georgiasouthern.edu', N'Griffin Harris', 80000, N'Intro to Physics', 3)
INSERT [dbo].[SPORTS] ([MEMBERID], [SPORTNAME], [INSEASON]) VALUES (1, N'Football ', N'No')
INSERT [dbo].[SPORTS] ([MEMBERID], [SPORTNAME], [INSEASON]) VALUES (2, N'Baseball', N'Yes')
INSERT [dbo].[SPORTS] ([MEMBERID], [SPORTNAME], [INSEASON]) VALUES (3, N'Soccer', N'Yes')
INSERT [dbo].[SPORTS] ([MEMBERID], [SPORTNAME], [INSEASON]) VALUES (4, N'Basketball', N'No')
INSERT [dbo].[SPORTS] ([MEMBERID], [SPORTNAME], [INSEASON]) VALUES (5, N'Swimming', N'Yes')
INSERT [dbo].[SPORTS] ([MEMBERID], [SPORTNAME], [INSEASON]) VALUES (6, N'Hockey', N'no')
INSERT [dbo].[SPORTS] ([MEMBERID], [SPORTNAME], [INSEASON]) VALUES (7, N'Badmitten', N'Yes')
INSERT [dbo].[SPORTS] ([MEMBERID], [SPORTNAME], [INSEASON]) VALUES (8, N'Tennis', N'Yes')
INSERT [dbo].[SPORTS] ([MEMBERID], [SPORTNAME], [INSEASON]) VALUES (9, N'Cheerleading', N'No')
INSERT [dbo].[SPORTS] ([MEMBERID], [SPORTNAME], [INSEASON]) VALUES (10, N'Equestrian', N'Yes')
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail], [GPA], [ACTIVE], [GOODSTANDING], [totalCreditHours], [SEMESTERHOURS], [BUILDINGID]) VALUES (111, N'John Kittle', N'jk5555@georgiasouthern.edu', 2, 0, 0, 60, 0, 8)
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail], [GPA], [ACTIVE], [GOODSTANDING], [totalCreditHours], [SEMESTERHOURS], [BUILDINGID]) VALUES (123, N'Nick Row', N'nr0000@georgiasouthern.edu', 3.7, 1, 1, 50, 15, 5)
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail], [GPA], [ACTIVE], [GOODSTANDING], [totalCreditHours], [SEMESTERHOURS], [BUILDINGID]) VALUES (234, N'Isaac Elrod', N'ie7777@georgiasouthern.edu', 4, 1, 1, 15, 15, 6)
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail], [GPA], [ACTIVE], [GOODSTANDING], [totalCreditHours], [SEMESTERHOURS], [BUILDINGID]) VALUES (321, N'Caleb Willson', N'cw0123@georgiasouthern.edu', 3, 1, 1, 45, 12, 5)
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail], [GPA], [ACTIVE], [GOODSTANDING], [totalCreditHours], [SEMESTERHOURS], [BUILDINGID]) VALUES (333, N'John Smith', N'js2110@georgiasouthern.edu', 3.2, 1, 1, 95, 15, 5)
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail], [GPA], [ACTIVE], [GOODSTANDING], [totalCreditHours], [SEMESTERHOURS], [BUILDINGID]) VALUES (457, N'Billy Dumb', N'bd1111@georgiasouthern.edu', 1.5, 1, 0, 30, 10, 7)
INSERT [dbo].[Student] ([StudentID], [StudentName], [StudentEmail], [GPA], [ACTIVE], [GOODSTANDING], [totalCreditHours], [SEMESTERHOURS], [BUILDINGID]) VALUES (999, N'Joey Kool', N'jk9999@georgiasouthern.edu', 1, 0, 0, 69, 2, 6)
INSERT [dbo].[STUDENTORGS] ([MEMBERID], [ORGNAME], [DUESOWED]) VALUES (3, N'SGA', 25)
INSERT [dbo].[Tuition] ([amountDue], [StudentID], [totalCost], [totalAid]) VALUES (0, 111, 50000, 50000)
INSERT [dbo].[Tuition] ([amountDue], [StudentID], [totalCost], [totalAid]) VALUES (40000, 123, 50000, 10000)
INSERT [dbo].[Tuition] ([amountDue], [StudentID], [totalCost], [totalAid]) VALUES (50000, 234, 50000, 0)
INSERT [dbo].[Tuition] ([amountDue], [StudentID], [totalCost], [totalAid]) VALUES (25000, 321, 50000, 25000)
INSERT [dbo].[Tuition] ([amountDue], [StudentID], [totalCost], [totalAid]) VALUES (35000, 457, 50000, 15000)
ALTER TABLE [dbo].[CLASSBUILDING]  WITH CHECK ADD  CONSTRAINT [FK_CLASSBUILDING_Building] FOREIGN KEY([BUILDINGID])
REFERENCES [dbo].[Building] ([BUILDINGID])
GO
ALTER TABLE [dbo].[CLASSBUILDING] CHECK CONSTRAINT [FK_CLASSBUILDING_Building]
GO
ALTER TABLE [dbo].[CourseSections]  WITH CHECK ADD  CONSTRAINT [FK_CourseSections_Professor] FOREIGN KEY([professorID])
REFERENCES [dbo].[Professor] ([professorID])
GO
ALTER TABLE [dbo].[CourseSections] CHECK CONSTRAINT [FK_CourseSections_Professor]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_CLASSBUILDING1] FOREIGN KEY([buildingID])
REFERENCES [dbo].[CLASSBUILDING] ([BUILDINGID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_CLASSBUILDING1]
GO
ALTER TABLE [dbo].[DORMS]  WITH CHECK ADD  CONSTRAINT [FK_DORMS_Building] FOREIGN KEY([BUILDINGID])
REFERENCES [dbo].[Building] ([BUILDINGID])
GO
ALTER TABLE [dbo].[DORMS] CHECK CONSTRAINT [FK_DORMS_Building]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_CourseSections] FOREIGN KEY([COURSEID])
REFERENCES [dbo].[CourseSections] ([courseID])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_CourseSections]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Student] FOREIGN KEY([STUDENTID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Student]
GO
ALTER TABLE [dbo].[FinancialAid]  WITH CHECK ADD  CONSTRAINT [FK_FinancialAid_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[FinancialAid] CHECK CONSTRAINT [FK_FinancialAid_Student]
GO
ALTER TABLE [dbo].[MEMBERSHIP]  WITH CHECK ADD  CONSTRAINT [FK_MEMBERSHIP_ORGANIZATION] FOREIGN KEY([OrgID])
REFERENCES [dbo].[ORGANIZATION] ([OrgID])
GO
ALTER TABLE [dbo].[MEMBERSHIP] CHECK CONSTRAINT [FK_MEMBERSHIP_ORGANIZATION]
GO
ALTER TABLE [dbo].[MEMBERSHIP]  WITH CHECK ADD  CONSTRAINT [FK_MEMBERSHIP_Student] FOREIGN KEY([STUDENTID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[MEMBERSHIP] CHECK CONSTRAINT [FK_MEMBERSHIP_Student]
GO
ALTER TABLE [dbo].[Professor]  WITH CHECK ADD  CONSTRAINT [FK_Professor_Department] FOREIGN KEY([departmentID])
REFERENCES [dbo].[Department] ([departmentID])
GO
ALTER TABLE [dbo].[Professor] CHECK CONSTRAINT [FK_Professor_Department]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_DORMS] FOREIGN KEY([BUILDINGID])
REFERENCES [dbo].[DORMS] ([BUILDINGID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_DORMS]
GO
ALTER TABLE [dbo].[Tuition]  WITH CHECK ADD  CONSTRAINT [FK_Tuition_FinancialAid] FOREIGN KEY([totalAid])
REFERENCES [dbo].[FinancialAid] ([totalAid])
GO
ALTER TABLE [dbo].[Tuition] CHECK CONSTRAINT [FK_Tuition_FinancialAid]
GO
ALTER TABLE [dbo].[Tuition]  WITH CHECK ADD  CONSTRAINT [FK_Tuition_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Tuition] CHECK CONSTRAINT [FK_Tuition_Student]
GO
USE [master]
GO
ALTER DATABASE [yellow] SET  READ_WRITE 
GO
