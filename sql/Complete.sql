USE [Nutzungsarten]
GO
/****** Object:  Table [dbo].[BUONutzungsarten]    Script Date: 10.04.2021 15:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BUONutzungsarten](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Bezeichnung] [nvarchar](50) NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[ErstelltAm] [datetime] NULL,
	[AktualisiertAm] [datetime] NULL,
 CONSTRAINT [PK_BUONutzungsarten] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Debitorengruppen]    Script Date: 10.04.2021 15:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Debitorengruppen](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Bezeichnung] [nvarchar](50) NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[ErstelltAm] [datetime] NULL,
	[AktualisiertAm] [datetime] NULL,
	[IstStandard] [bit] NULL,
 CONSTRAINT [PK_Debitorengruppen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExterneNutzungsarten]    Script Date: 10.04.2021 15:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExterneNutzungsarten](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Bezeichnung] [nvarchar](50) NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[ErstelltAm] [datetime] NULL,
	[AktualisiertAm] [datetime] NULL,
	[Debitorengruppen_ID] [bigint] NULL,
	[BUONutzungsarten_ID] [bigint] NULL,
 CONSTRAINT [PK_ExterneNutzungsarten] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Debitorengruppen] ON 

INSERT [dbo].[Debitorengruppen] ([ID], [Bezeichnung], [Guid], [ErstelltAm], [AktualisiertAm], [IstStandard]) VALUES (1, N'Standard', N'7795e7ee-c599-429e-bddb-bbb670eb7592', CAST(N'2021-04-08T16:05:57.673' AS DateTime), CAST(N'2021-04-08T16:05:57.673' AS DateTime), 1)
INSERT [dbo].[Debitorengruppen] ([ID], [Bezeichnung], [Guid], [ErstelltAm], [AktualisiertAm], [IstStandard]) VALUES (8, N'XXX', N'edff9dc3-8afc-4361-8b4e-92e5e3335e4f', CAST(N'2021-04-08T16:43:21.813' AS DateTime), CAST(N'2021-04-08T16:43:49.090' AS DateTime), 0)
INSERT [dbo].[Debitorengruppen] ([ID], [Bezeichnung], [Guid], [ErstelltAm], [AktualisiertAm], [IstStandard]) VALUES (9, N'ZZZ', N'a2e5228b-0f9c-4ce3-b5cf-5461925ce621', CAST(N'2021-04-08T16:45:57.523' AS DateTime), CAST(N'2021-04-08T16:54:08.253' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Debitorengruppen] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_BUONutzungsarten_Bezeichnung]    Script Date: 10.04.2021 15:03:01 ******/
ALTER TABLE [dbo].[BUONutzungsarten] ADD  CONSTRAINT [UQ_BUONutzungsarten_Bezeichnung] UNIQUE NONCLUSTERED 
(
	[Bezeichnung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_BUONutzungsarten_Guid]    Script Date: 10.04.2021 15:03:01 ******/
ALTER TABLE [dbo].[BUONutzungsarten] ADD  CONSTRAINT [UQ_BUONutzungsarten_Guid] UNIQUE NONCLUSTERED 
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Debitorengruppen_Bezeichnung]    Script Date: 10.04.2021 15:03:01 ******/
ALTER TABLE [dbo].[Debitorengruppen] ADD  CONSTRAINT [UQ_Debitorengruppen_Bezeichnung] UNIQUE NONCLUSTERED 
(
	[Bezeichnung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Debitorengruppen_Guid]    Script Date: 10.04.2021 15:03:01 ******/
ALTER TABLE [dbo].[Debitorengruppen] ADD  CONSTRAINT [UQ_Debitorengruppen_Guid] UNIQUE NONCLUSTERED 
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ExterneNutzungsarten_Bezeichnung_Debitorengruppen_ID]    Script Date: 10.04.2021 15:03:01 ******/
ALTER TABLE [dbo].[ExterneNutzungsarten] ADD  CONSTRAINT [UQ_ExterneNutzungsarten_Bezeichnung_Debitorengruppen_ID] UNIQUE NONCLUSTERED 
(
	[Bezeichnung] ASC,
	[Debitorengruppen_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_ExterneNutzungsarten_Guid]    Script Date: 10.04.2021 15:03:01 ******/
ALTER TABLE [dbo].[ExterneNutzungsarten] ADD  CONSTRAINT [UQ_ExterneNutzungsarten_Guid] UNIQUE NONCLUSTERED 
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BUONutzungsarten] ADD  CONSTRAINT [DF_BUONutzungsarten_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[BUONutzungsarten] ADD  CONSTRAINT [DF_BUONutzungsarten_ErstelltAm]  DEFAULT (getutcdate()) FOR [ErstelltAm]
GO
ALTER TABLE [dbo].[BUONutzungsarten] ADD  CONSTRAINT [DF_BUONutzungsarten_AktualisiertAm]  DEFAULT (getutcdate()) FOR [AktualisiertAm]
GO
ALTER TABLE [dbo].[Debitorengruppen] ADD  CONSTRAINT [DF_Debitorengruppen_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[Debitorengruppen] ADD  CONSTRAINT [DF_Debitorengruppen_ErstelltAm]  DEFAULT (getutcdate()) FOR [ErstelltAm]
GO
ALTER TABLE [dbo].[Debitorengruppen] ADD  CONSTRAINT [DF_Debitorengruppen_AktualisiertAm]  DEFAULT (getutcdate()) FOR [AktualisiertAm]
GO
ALTER TABLE [dbo].[Debitorengruppen] ADD  CONSTRAINT [DF_Debitorengruppen_IstStandard]  DEFAULT ((0)) FOR [IstStandard]
GO
ALTER TABLE [dbo].[ExterneNutzungsarten] ADD  CONSTRAINT [DF_ExterneNutzungsarten_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[ExterneNutzungsarten] ADD  CONSTRAINT [DF_ExterneNutzungsarten_ErstelltAm]  DEFAULT (getutcdate()) FOR [ErstelltAm]
GO
ALTER TABLE [dbo].[ExterneNutzungsarten] ADD  CONSTRAINT [DF_ExterneNutzungsarten_AktualisiertAm]  DEFAULT (getutcdate()) FOR [AktualisiertAm]
GO
ALTER TABLE [dbo].[ExterneNutzungsarten]  WITH CHECK ADD  CONSTRAINT [FK_ExterneNutzungsarten_BUONutzungsarten_ID] FOREIGN KEY([BUONutzungsarten_ID])
REFERENCES [dbo].[BUONutzungsarten] ([ID])
GO
ALTER TABLE [dbo].[ExterneNutzungsarten] CHECK CONSTRAINT [FK_ExterneNutzungsarten_BUONutzungsarten_ID]
GO
ALTER TABLE [dbo].[ExterneNutzungsarten]  WITH CHECK ADD  CONSTRAINT [FK_ExterneNutzungsarten_Debitorengruppen_ID] FOREIGN KEY([Debitorengruppen_ID])
REFERENCES [dbo].[Debitorengruppen] ([ID])
GO
ALTER TABLE [dbo].[ExterneNutzungsarten] CHECK CONSTRAINT [FK_ExterneNutzungsarten_Debitorengruppen_ID]
GO
