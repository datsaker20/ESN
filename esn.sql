

USE [ESN]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/30/2023 11:24:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpAuditLogs]    Script Date: 5/30/2023 11:24:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpAuditLogs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NULL,
	[ServiceName] [nvarchar](256) NULL,
	[MethodName] [nvarchar](256) NULL,
	[Parameters] [nvarchar](1024) NULL,
	[ExecutionTime] [datetime] NOT NULL,
	[ExecutionDuration] [int] NOT NULL,
	[ClientIpAddress] [nvarchar](64) NULL,
	[ClientName] [nvarchar](128) NULL,
	[BrowserInfo] [nvarchar](512) NULL,
	[Exception] [nvarchar](2000) NULL,
	[ImpersonatorUserId] [bigint] NULL,
	[ImpersonatorTenantId] [int] NULL,
	[CustomData] [nvarchar](2000) NULL,
	[ReturnValue] [nvarchar](max) NULL,
	[ExceptionMessage] [nvarchar](1024) NULL,
 CONSTRAINT [PK_dbo.AbpAuditLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpBackgroundJobs]    Script Date: 5/30/2023 11:24:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpBackgroundJobs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobType] [nvarchar](512) NOT NULL,
	[JobArgs] [nvarchar](max) NOT NULL,
	[TryCount] [smallint] NOT NULL,
	[NextTryTime] [datetime] NOT NULL,
	[LastTryTime] [datetime] NULL,
	[IsAbandoned] [bit] NOT NULL,
	[Priority] [tinyint] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AbpBackgroundJobs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpDynamicEntityProperties]    Script Date: 5/30/2023 11:24:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpDynamicEntityProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EntityFullName] [nvarchar](250) NULL,
	[DynamicPropertyId] [int] NOT NULL,
	[TenantId] [int] NULL,
 CONSTRAINT [PK_dbo.AbpDynamicEntityProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpDynamicEntityPropertyValues]    Script Date: 5/30/2023 11:24:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpDynamicEntityPropertyValues](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[EntityId] [nvarchar](max) NULL,
	[DynamicEntityPropertyId] [int] NOT NULL,
	[TenantId] [int] NULL,
 CONSTRAINT [PK_dbo.AbpDynamicEntityPropertyValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpDynamicProperties]    Script Date: 5/30/2023 11:24:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpDynamicProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyName] [nvarchar](250) NULL,
	[InputType] [nvarchar](max) NULL,
	[Permission] [nvarchar](max) NULL,
	[TenantId] [int] NULL,
	[DisplayName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AbpDynamicProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpDynamicPropertyValues]    Script Date: 5/30/2023 11:24:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpDynamicPropertyValues](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[TenantId] [int] NULL,
	[DynamicPropertyId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.AbpDynamicPropertyValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpEditions]    Script Date: 5/30/2023 11:24:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpEditions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[DisplayName] [nvarchar](64) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterUserId] [bigint] NULL,
	[DeletionTime] [datetime] NULL,
	[LastModificationTime] [datetime] NULL,
	[LastModifierUserId] [bigint] NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AbpEditions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpEntityChanges]    Script Date: 5/30/2023 11:24:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpEntityChanges](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ChangeTime] [datetime] NOT NULL,
	[ChangeType] [tinyint] NOT NULL,
	[EntityChangeSetId] [bigint] NOT NULL,
	[EntityId] [nvarchar](48) NULL,
	[EntityTypeFullName] [nvarchar](192) NULL,
	[TenantId] [int] NULL,
 CONSTRAINT [PK_dbo.AbpEntityChanges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpEntityChangeSets]    Script Date: 5/30/2023 11:24:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpEntityChangeSets](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BrowserInfo] [nvarchar](512) NULL,
	[ClientIpAddress] [nvarchar](64) NULL,
	[ClientName] [nvarchar](128) NULL,
	[CreationTime] [datetime] NOT NULL,
	[ExtensionData] [nvarchar](max) NULL,
	[ImpersonatorTenantId] [int] NULL,
	[ImpersonatorUserId] [bigint] NULL,
	[Reason] [nvarchar](256) NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AbpEntityChangeSets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpEntityPropertyChanges]    Script Date: 5/30/2023 11:24:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpEntityPropertyChanges](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EntityChangeId] [bigint] NOT NULL,
	[NewValue] [nvarchar](512) NULL,
	[OriginalValue] [nvarchar](512) NULL,
	[PropertyName] [nvarchar](96) NULL,
	[PropertyTypeFullName] [nvarchar](192) NULL,
	[TenantId] [int] NULL,
	[NewValueHash] [nvarchar](max) NULL,
	[OriginalValueHash] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AbpEntityPropertyChanges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpFeatures]    Script Date: 5/30/2023 11:24:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpFeatures](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
	[EditionId] [int] NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AbpFeatures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpLanguages]    Script Date: 5/30/2023 11:24:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpLanguages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[Name] [nvarchar](128) NOT NULL,
	[DisplayName] [nvarchar](64) NOT NULL,
	[Icon] [nvarchar](128) NULL,
	[IsDisabled] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterUserId] [bigint] NULL,
	[DeletionTime] [datetime] NULL,
	[LastModificationTime] [datetime] NULL,
	[LastModifierUserId] [bigint] NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AbpLanguages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpLanguageTexts]    Script Date: 5/30/2023 11:24:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpLanguageTexts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[LanguageName] [nvarchar](128) NOT NULL,
	[Source] [nvarchar](128) NOT NULL,
	[Key] [nvarchar](256) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[LastModificationTime] [datetime] NULL,
	[LastModifierUserId] [bigint] NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AbpLanguageTexts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpNotifications]    Script Date: 5/30/2023 11:24:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpNotifications](
	[Id] [uniqueidentifier] NOT NULL,
	[NotificationName] [nvarchar](96) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[DataTypeName] [nvarchar](512) NULL,
	[EntityTypeName] [nvarchar](250) NULL,
	[EntityTypeAssemblyQualifiedName] [nvarchar](512) NULL,
	[EntityId] [nvarchar](96) NULL,
	[Severity] [tinyint] NOT NULL,
	[UserIds] [nvarchar](max) NULL,
	[ExcludedUserIds] [nvarchar](max) NULL,
	[TenantIds] [nvarchar](max) NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
	[TargetNotifiers] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AbpNotifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpNotificationSubscriptions]    Script Date: 5/30/2023 11:24:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpNotificationSubscriptions](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NOT NULL,
	[NotificationName] [nvarchar](96) NULL,
	[EntityTypeName] [nvarchar](250) NULL,
	[EntityTypeAssemblyQualifiedName] [nvarchar](512) NULL,
	[EntityId] [nvarchar](96) NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AbpNotificationSubscriptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpOrganizationUnitRoles]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpOrganizationUnitRoles](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[RoleId] [int] NOT NULL,
	[OrganizationUnitId] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AbpOrganizationUnitRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpOrganizationUnits]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpOrganizationUnits](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[ParentId] [bigint] NULL,
	[Code] [nvarchar](95) NOT NULL,
	[DisplayName] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterUserId] [bigint] NULL,
	[DeletionTime] [datetime] NULL,
	[LastModificationTime] [datetime] NULL,
	[LastModifierUserId] [bigint] NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AbpOrganizationUnits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpPermissions]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpPermissions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[Name] [nvarchar](128) NOT NULL,
	[IsGranted] [bit] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
	[RoleId] [int] NULL,
	[UserId] [bigint] NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AbpPermissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpRoles]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[TenantId] [int] NULL,
	[Name] [nvarchar](32) NOT NULL,
	[DisplayName] [nvarchar](64) NOT NULL,
	[IsStatic] [bit] NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterUserId] [bigint] NULL,
	[DeletionTime] [datetime] NULL,
	[LastModificationTime] [datetime] NULL,
	[LastModifierUserId] [bigint] NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
	[NormalizedName] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.AbpRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpSettings]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpSettings](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[LastModificationTime] [datetime] NULL,
	[LastModifierUserId] [bigint] NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AbpSettings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpTenantNotifications]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpTenantNotifications](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [int] NULL,
	[NotificationName] [nvarchar](96) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[DataTypeName] [nvarchar](512) NULL,
	[EntityTypeName] [nvarchar](250) NULL,
	[EntityTypeAssemblyQualifiedName] [nvarchar](512) NULL,
	[EntityId] [nvarchar](96) NULL,
	[Severity] [tinyint] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AbpTenantNotifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpTenants]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpTenants](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EditionId] [int] NULL,
	[TenancyName] [nvarchar](64) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[ConnectionString] [nvarchar](1024) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterUserId] [bigint] NULL,
	[DeletionTime] [datetime] NULL,
	[LastModificationTime] [datetime] NULL,
	[LastModifierUserId] [bigint] NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AbpTenants] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserAccounts]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserAccounts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NOT NULL,
	[UserLinkId] [bigint] NULL,
	[UserName] [nvarchar](256) NULL,
	[EmailAddress] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterUserId] [bigint] NULL,
	[DeletionTime] [datetime] NULL,
	[LastModificationTime] [datetime] NULL,
	[LastModifierUserId] [bigint] NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AbpUserAccounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserClaims]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserClaims](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NOT NULL,
	[ClaimType] [nvarchar](256) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AbpUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserLoginAttempts]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserLoginAttempts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[TenancyName] [nvarchar](64) NULL,
	[UserId] [bigint] NULL,
	[UserNameOrEmailAddress] [nvarchar](256) NULL,
	[ClientIpAddress] [nvarchar](64) NULL,
	[ClientName] [nvarchar](128) NULL,
	[BrowserInfo] [nvarchar](512) NULL,
	[Result] [tinyint] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.AbpUserLoginAttempts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserLogins]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserLogins](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AbpUserLogins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserNotifications]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserNotifications](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NOT NULL,
	[TenantNotificationId] [uniqueidentifier] NOT NULL,
	[State] [int] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[TargetNotifiers] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AbpUserNotifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserOrganizationUnits]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserOrganizationUnits](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NOT NULL,
	[OrganizationUnitId] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AbpUserOrganizationUnits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserRoles]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserRoles](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NOT NULL,
	[RoleId] [int] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AbpUserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUsers]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUsers](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AuthenticationSource] [nvarchar](64) NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[TenantId] [int] NULL,
	[EmailAddress] [nvarchar](256) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Surname] [nvarchar](64) NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[EmailConfirmationCode] [nvarchar](328) NULL,
	[PasswordResetCode] [nvarchar](328) NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[AccessFailedCount] [int] NOT NULL,
	[IsLockoutEnabled] [bit] NOT NULL,
	[PhoneNumber] [nvarchar](32) NULL,
	[IsPhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](128) NULL,
	[IsTwoFactorEnabled] [bit] NOT NULL,
	[IsEmailConfirmed] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterUserId] [bigint] NULL,
	[DeletionTime] [datetime] NULL,
	[LastModificationTime] [datetime] NULL,
	[LastModifierUserId] [bigint] NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
	[NormalizedUserName] [nvarchar](256) NOT NULL,
	[NormalizedEmailAddress] [nvarchar](256) NOT NULL,
	[Coin] [int] NULL,
 CONSTRAINT [PK_dbo.AbpUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpWebhookEvents]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpWebhookEvents](
	[Id] [uniqueidentifier] NOT NULL,
	[WebhookName] [nvarchar](max) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[CreationTime] [datetime] NOT NULL,
	[TenantId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletionTime] [datetime] NULL,
 CONSTRAINT [PK_dbo.AbpWebhookEvents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpWebhookSendAttempts]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpWebhookSendAttempts](
	[Id] [uniqueidentifier] NOT NULL,
	[WebhookEventId] [uniqueidentifier] NOT NULL,
	[WebhookSubscriptionId] [uniqueidentifier] NOT NULL,
	[Response] [nvarchar](max) NULL,
	[ResponseStatusCode] [int] NULL,
	[CreationTime] [datetime] NOT NULL,
	[LastModificationTime] [datetime] NULL,
	[TenantId] [int] NULL,
 CONSTRAINT [PK_dbo.AbpWebhookSendAttempts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpWebhookSubscriptions]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpWebhookSubscriptions](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [int] NULL,
	[WebhookUri] [nvarchar](max) NOT NULL,
	[Secret] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Webhooks] [nvarchar](max) NULL,
	[Headers] [nvarchar](max) NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AbpWebhookSubscriptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppAuthorFollow]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppAuthorFollow](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[userFollow] [int] NULL,
 CONSTRAINT [PK_AppAuthorFollow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppBook]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppBook](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[cover_book] [nvarchar](500) NULL,
	[price] [bigint] NULL,
	[description] [nvarchar](max) NULL,
	[status] [int] NULL,
	[is_deleted] [bit] NULL,
	[lastModified] [datetime] NULL,
	[ownerId] [int] NULL,
	[createdAt] [datetime] NULL,
	[approverId] [int] NULL,
	[is_publish] [bit] NULL,
	[request_approve_date] [datetime] NULL,
	[approve_reject_date] [datetime] NULL,
	[view_count] [int] NULL,
	[is_book_free] [bit] NULL,
	[views] [int] NULL,
	[rev] [int] NULL,
	[book_no] [varchar](100) NULL,
	[old_id] [int] NULL,
	[isCompleted] [bit] NULL,
 CONSTRAINT [PK_App_Book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppBookBuy]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppBookBuy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[bookId] [int] NULL,
	[userId] [int] NULL,
	[chapterId] [int] NULL,
	[price] [bigint] NULL,
	[isAllBook] [bit] NULL,
	[buyDate] [datetime] NULL,
 CONSTRAINT [PK_AppBookBuy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppBookCategory]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppBookCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_AppBookCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppBookInterest]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppBookInterest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[bookId] [int] NULL,
	[userId] [int] NULL,
 CONSTRAINT [PK_AppBookInterest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppBookRate]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppBookRate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[bookId] [int] NULL,
	[userId] [int] NULL,
	[rate] [int] NULL,
	[rateComment] [nvarchar](500) NULL,
	[rateDate] [datetime] NULL,
 CONSTRAINT [PK_AppBookRate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppBookRateComment]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppBookRateComment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[rateId] [int] NULL,
	[userId] [int] NULL,
	[comment] [nvarchar](500) NULL,
	[commentDate] [datetime] NULL,
 CONSTRAINT [PK_AppBookRateComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppBookReport]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppBookReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[bookId] [int] NULL,
	[userId] [int] NULL,
	[report_comment] [nvarchar](500) NULL,
	[report_date] [datetime] NULL,
	[type] [tinyint] NULL,
	[status] [tinyint] NULL,
	[chapterId] [int] NULL,
 CONSTRAINT [PK_AppBookReport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppCategory]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[order] [int] NULL,
	[is_display] [bit] NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [PK_AppCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppChapter]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppChapter](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](500) NULL,
	[content_public] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[price] [bigint] NULL,
	[status] [int] NULL,
	[book_id] [int] NULL,
	[is_deleted] [bit] NULL,
	[createdAt] [datetime] NULL,
	[lastModifiedAt] [datetime] NULL,
	[is_publish] [bit] NULL,
	[request_approve_date] [datetime] NULL,
	[approve_reject_date] [datetime] NULL,
	[approverId] [int] NULL,
	[rev] [int] NULL,
	[chapter_no] [varchar](100) NULL,
 CONSTRAINT [PK_AppChapter] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppCoinBalance]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppCoinBalance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[bookId] [int] NULL,
	[amount] [int] NULL,
	[content] [nvarchar](2000) NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_AppCoinBalance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppConfig]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppConfig](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [varchar](50) NULL,
	[Label] [nvarchar](100) NULL,
	[Value] [nvarchar](250) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_AppConfig] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppNotifications]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppNotifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[bookId] [int] NULL,
	[chapterId] [int] NULL,
	[noti_content] [nvarchar](500) NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_AppNotifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppNotiUser]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppNotiUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NotiId] [int] NULL,
	[UserId] [int] NULL,
	[IsRead] [bit] NULL,
 CONSTRAINT [PK_AppNotiUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppPaymentHistory]    Script Date: 5/30/2023 11:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppPaymentHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[code] [varchar](200) NULL,
	[amount] [int] NULL,
	[created_at] [datetime] NULL,
	[status] [int] NULL,
	[approve_at] [datetime] NULL,
	[approve_user] [int] NULL,
 CONSTRAINT [PK_AppPaymentHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201809270654064_InitialMigrations', N'DoAn', 0x1F8B0800000000000400ED3DCB72DC3892F78DD87FA8A8D3CC444F9524B7DD6E873413B264F568DAB2352EF5ECC65E14140995B86691357CC8D26CEC97ED613F697F61013EF17E9020AB28337451114022814C2412C844E6FFFDCFFF1EFFF96913CC1E419CF85178323F5C1CCC67207423CF0FD727F32CBDFFE3DBF99FFFF4AFFF72FCC1DB3CCDFE5ED57B85EAC1966172327F48D3EDBBE532711FC0C649161BDF8DA324BA4F176EB4593A5EB43C3A38F8797978B80410C41CC29ACD8EBF6461EA6F40FE03FE3C8B42176CD3CC09AE220F0449F91D96AC72A8B34FCE06245BC70527F3D3BBED59B4D93AE133FAB8803FAFE3E83F819BE63F3F40B8E9F3450CFFFF16C55FE7B3D3C07720922B10DCCF674E1846A993C221BCFB2D01AB348EC2F56A0B3F38C1CDF316C07AF74E90807268EF9AEABAA33C3842A35C360D2B506E96A4D1C610E0E1AB72DA9674F356933FAFA7154E6C315168D4F9E4C279CD3C3FFD18ADE733BAB37767418C2AE673BFC8EB41EE58540D7E98A1CFFF01E2680109B389C21F6A3E79B578BB80ACF2C3EC2C0BD22C062721C8D2D8097E985D677781EFFE0A9E6FA2AF203C09B320C0D18308C232E203FC0409BD0571FAFC05DC97485F7AF3D9926CB7A41BD6CDB036C5702EC3F4CD8FF3D927D8B97317809AFAD8D0576914835F4008622705DEB593A6200E110C90CF1FD33BD5D70D089D30257A7C75A46A045933669094375981F8D17701FA51B583DC0DA9349F5D394F1F41B84E1F4EE647AFDFCC6717FE13F0AA2FE5807F0B7DB8E461A334CE80AAAF2B903E44DE205D5D3B6821C3294F245D1D1E1CFD68A1AF0F4FC0CD10CD6FFC6664E790EAC56F864934A19D6771B962090E30047716F890E12EB7A79E178344361B6F6CCC45D19D82C487476F2D74F53E8EBE217E0FEF23495FAF0F8FAC9018ED321831788C7B707060A1ABCB0DFC9544A103E5478BF58C376F2543CE72190ED9D7B13DD6E365B375483794F78EFB751D4759E8FD35BA2BE82BDF598806C982699F6F34D3E652F705A705756561D9184A23D8F169BC96CBE41FDFBEFE496F0B30ECFC267E3E834C9162F37CF8C618CA27F09442485664FD472711C352ACF3E4F4CE09BD280435DFBC8FA20038A13116D7B11FC539D79454811A2FB9869A1AA6BB4F0C1C6B3B630E4C43286ACB990F481F8DC20B08164A811548D39C1B155AEC760B45445EB0285B260B2E246BEAEDECBD93008C3614C2F29DABC08CD9045473FFC979F4D7F928F900E7B32F20C8CB93077F5B22C69D86DBBAC5451C6DBE448168E6AB8AB7AB288B5DC42F914EED1B275E83B41B0B9810BD6C52137DD4A7182E2BD8DB68148AE0AB5E3699733FD906CEB3A26F4D75D7B0EFCBE41C04F0DCD159281760DA6880794BA1CC556F485791E7DF97CCDE0D462BF4F77BCBB0B057F4B5499CDE25B0D44D4BCE7D816A6BABF38CA5B3A821E3FDDD0932E92D87EE01EA45295C0501CDD6D015647E3F6FE83E2F78008652B3C821B3B7A0CD5AFFE884EBCC5903D5D03E46AE13F8FF2CE403A7FDA4590C2C0B7A59923B55475CE995959D8B38A8F3F80942AAB3D233694F2F5B7BE2C8B81BF09476959308C6A865E53EEA4DD5E4EE4466D6370003AB6D906A164C539675C5373F1D1EBC7DDBCF0631892C85C8FA14A5F5E4E89822F0FAC9826E3D2E43C42F99EF99DF8F634356C88E9F7B594E0AD395898141DD11EA46314A4B16C89A3195F6731B56C8A6BBD324019BBBE0F96F19DC83E11257D9EF6D0EB761C5F6DCA3727F78048CED0367E1A682211B1622486AEA7A7578F09325EB749079C01BB0CB4AA518A4B3F1EC10ABEC2E71637FDB7DB7A0217D073B873D97A79D6F59932CDF812CDF6F31F1395E3B61798885C3521E7AF1FAC9826E3D1D772DCB916B270654238DA30BE44D1957BFDEDD7D624F07E4E9866E94C75D9943C7D9831F7890F9B91E1DB4DCB96D6A37DE1CC24A8C2787B826CF8B438675B15EFBC0B9C2448D7335BA56FBC13588377E92E4470C3D6372963E4471750DCA349F0CC92FD2907C99FC12435CBB0BDCFDD68ED052EBB822108864C105D49B899845593A6D0839334F3CED0944A4E838810844B2E002DA9709343FED1971A062BE24AFC744AC984F9CA4DD199463CD5C1E2E0ED0DF1EABEE3D5BF5CF417DE9213B96DA7969D1C72EF0123D1A5788B6AE0DDBFEBD03F97A7212988E2062185C8D1E49D25BA252A3C8D365CC9983A9607AD4C0F8448C1D5189C20E2BE363875730C58EE605318A6C4D0A4FBA021F59A696F1D1ADDEF31331B244250A4FAC8C8F225EA1D3F380629AEC28058D7AF5D294829E4F6B681A51CDD230A2720DB1F28E1591497939DFCF2BB5365AC9878DE307EA27BE3DA1BC139D6895C5E12EFABD7692E45B14CBAC193D5D05E4443E8BC27B3FDEE44B4171FDFCCA8A776735DE2F2001E9203D7E8CDCAF51967E083DA494FC96BAA6EAD1A9EBC2757001670B78F48BCF164FE82F931A232B5EAED70F51083E659B3BB4B774E55E15EA586725EB741FC00AB819F289800783CD7600F7E29B6FD185E3C24DC412012E137C29D98077EAA6FE23E80A0769561FA3B5DFEA4C301D8B5EDEB12870FC0D5F47CE15EFAABC518FB1CF8C668C9799AAECAA035A019B7F40A3CB0488F57840CB810A0E6874191FBBDE0F683964D9018D5B818F6CE7035A2E83247C5795D3D8E59F05381565B68F8A396CC151912EE323A63A2ACAB0CBAF79C57895C51446F9573E2E45912916E5C5B90491A606854B55C047A72EED7C84CEA54E5B6344DE78F27711F7B533BFB99C3208808523A7464FAA7712F0DF17EF458620E5B2B4ED6ACA1B4FAB690F57534E19F8EDD1F7A407C39E6E17AA9E07780265C4ED1A765921B3D716D889D7F78BD7CD1D21C626A8353D30F23B887519E97161DBDB62625909CB76BAD3DED153504B3126BFD7CB16C34025DDDE7EF2614CEF7804EB6D7A363A3D1B1DCD53A3FE9E8D8E412EB6F788E004737A69CE103D7B488AE2796A886477370E848A4E7B3ACE42C53A842C849662D9A744B45B09036FCB0A3819F246A95B76319F1592506440634B99FB7A4E15DB46B4B20B81198D2D15E1D8C594268B3D5C82E7041B264B4478C9C2097736EF957DC80C7C822A2274B58C7C46176DA7AE5BF8CAB4BB6B2B9B4F7717E2BE7676DD965FFCFBE15743396AD1097250F7C5C9CB4636F6EF717336B7AF9DC2B5BDD9B69686388C49248AFB6A2512AD9E66ACDF1C5752F373AC2DD6F4E244A84CE453A2A7EE7D7D0109F6442DD7DDE0E2CD57735154B83B0C77A96324B9BA5D58F3204CD7D50672A155C7C48C771B097AA80908DEA5495AD6D853F6350D9124DA7CA76049233893D044EA0ACF9A66BE670A6AB6C15689202BD765721138EB26096DFB6C7915CC4E721F6EB91E888367B84597A4784EE9383257003D49A95D9FBECD67B9ED1BEEE3CC941255DF8320FAF6298A374E50374131A8656DE8EA8A2E4EEFA24740B5395274F1177FFDD0547ECD12B720A384B47CEB91196525E1244B88C3D2B5D041CA5951CCE02ACB5F6D35549257FF37270E9B0997D7FD10C7515C577E25AF7CE1A418DD39CB5449499EC2684647726363E1D90BC7624A51432A5D868F4EE07BA223911EF94A20CDC34B3D42E63237818BA032CBF0492AE88D3863EA89A6722BE574F9468D693E31795BEC595AD9FC2745F3F06B187D0B3F3CA19DDF094AF7E0B2ED5B795BF4B211789FB3B46EF0B31A57EC4DA100635A226BAD1B81B2DA45047241DA958185C224250FD4013C5D31F805AF7BA8338BA74912B97E3E3CD24C2248C34876FE21F4664639199BC385207D666EE347393AE0767332FF03335CDD1EEB387C4C8F741F87E498601F9FC342199C9DE62660A8873989EB78ACBA0667D423BF40D51DA0D082BE831E88A248787E98B27ABE1FBAFED6094C464201D13C2E2024EBEEE89273B00521D2F44D68A88307E666C0A253F74ACDA56AEA8E9718AFCA59581CC351C44C1A41281B46624F9A24471D2C16ECCEA6D3178769557DB12BA4150B2AC73F00FB29E74507872612EF4E380F7F592BA23FF7992D79EBD2AB8CE263C2E13DECF15D2F4CC7998801D88C33689D5EAB43F80ED90A73F0905394E7EB216730D9462B7C61AD80C915831D1885C560306E612754A76BEAFA66779C83BBDD48A9CCF5C0E9C8393C979D61398783C1509CC399509DAE29FBFEEE3887F13992925AEC7ED4918784FE4AC33292088DA1B84934BF3AFDF31C2F76C85745100839D1A98810BB5391A8F8131426E595497F2A12391183311B31E871A84878300F2945B9913D76C760BC3822143AD76C78EEFE388E333D43B11D672AC6C17B45C0162999A9E82DBBE33732560C8548F166BE3FE622666128B622463C0E86AA03EF4849C946E169A112896072386400E9430F69281EA187BDF76CC244B61651551CE6BA21ACDEB297C01C5C2717613000BF8826742CD7024CD471299515D702AD3867A7D702220C86E29C115F0BF083C14B49AD732DD08A87767F2D204563286E7A11D7024CDC7E29E515E7371E37F5A44F0B530650E80C757E134DCF50CCD8F2FC56C574DA09EF715ED08AC82D7B4EDB10BC8A74A02FCF246F70071366621C06601EF1C48E45A7E2BC7156505BA157B5E6A29DEA56621C86E3A211EB57D44B7405A5250E56ADB9C7DC85CA3AF30CEFFBC49F4F9D8E77EDEC248A0EA0A0B28E52DE9A8576AF982B10198EA346A89C178F49609B14B6C01E36E09195CEEF503978E23DB382A8965EB509370B70011FAAC115E40C2EA18F110A31DEBC63A9DE4F96651C9E238190EF523890880AC5DB0205C87265F380D582500182F4A5E441A21D6015003F3AE13A73D6803B575BB490721A54D5B4E1DD40526AC2BCC9A9AE804B785273E0B28F4D0D00AEB2BB3AD3A70A385E57AB23DA0D91D701EB95A9008A1F6C59709CB3A1025E991D8081541C7C158D9128E1352E24B246E32A75081742E931A801A6CA04C105535AD535C088E6A2B16529804856A72E3DD8D7B83C68A2C0A05AC0C500B566A98CB0239AA83A7E8F2EDDCAF01452F2D561303480AAE68EAEA33573A891CE7AE6D5638063BB25B347085E4BCCB036B2770F7C759FD0ACF41E58D413C0D97A18CDC1F42D0506BCD91AE9AB327296346650ECACCF993D4DCF7E62706ADF7E6C601C6E91CC9BDA95DF04748BC92BDC534B71CC4E175E2C1E05568B3725E5762199061C0067E0F8966169C478AC3BD1B045B7791CD439B7792D26807377A782D2760288407A8209105E44B1A8F32EA2CC278077EDD4D704B0C1F004B3203F17B383109E8BCDE743780AEE6D524A854A34151CA74B0ED6A4DB658B6193DE9214800A473B2326F46AC1B085462516759E59C97C0278D6200C0A81B39D69285560C104703CD358A449DF34F341932E6554FB123F3B836D341AC178F98E532CCA8CEB94F9A8194F290C8448F36A316EC6D1873374B933106BB3546C7A5C92C9A1F428DE187F15D104E86D7A42AF16F3091868D3E3BB5D8866C160D3937B6898CFC7909B1EE333209A0FBD2D40E859603E0B836E01BC00D0EC44A88CDCBA666E6C18F5C584643A2486ED1E388217675A38157AB24262AB6D371503490C3AA4B5701AD4770F026363BBE10F73AB208C992D9C060399A932A1B59B983E24671519AC36E6D465C7CB95FB00364EF9E17809ABB8609B664E0091004152155C39DB2D52639A96E597D96AEBB8C8F7E28FABF9EC691384C9C9FC214DB7EF96CB24079D2C36BE1B4749749F2EDC68B374BC68797470F0F3F2F070B929602C5D4220D3A6A7BA27283A9C35A04A519E060F5CF87192A2B438770E0AF072E66D986A22D395E0F2B0EA95B64EB114ACAE11AB16E8FFDA5A26494B52B4BC88E1FFDFA2F86B63E562AD8225685877BD41C6C53C621FC611E2A6B0F1CA750227E604083C8B826C138AED9CE2D64DC83F1C46F3551F5265D1C4E188AC9C62282B103FFA6E99A008074514E8C3BB02E943E4B1E0F0EFFAD0AE1D44E3345FB43834FCBB3EB40F4FC0CDD0222FA209E200A9A21630CFCB3C8202B84DB13E6C26AA300E99293485CBD208FFAE0F8D88108C83230A4C6614C951CE4CD69FF5615D6EE0AF240A71E73662ED72CADB41E7AF6B7E0D034AE5BE014576348252D87716DAF192927A8CCF03237AA90D9196E55A929E7221E84FDCB3AE08E6725F03463F1B00ECAE884A8883A83F1AC1398DD70903A7F868B021C570ABCF4D97C486547FD587F409EA04B01D2B5C89027D7848A1E3C2230A0C966B727AE7845E14029A807881C1E654878025B6A6FAABC13227A2DE120B9D283184C897790A5FDF9D890FDAE0DA9FFCE0C7CE3397212A00FD0810CC6192D81FC57E94392CA8B41735AAF88682088238CC731FF9FE6CFC7CFFEA83551464BD4CD0FF9FEF7F67465F7248BF1F0D65ED9D0D58DDCE54AB2B9321E320CA4FDFAB58B32A820AA2EEBF0462A40617F1618546CBFDA5BE1DEB7D6369414861CB7E244D77F900A9BC0D9C6716105160A29CD5190448D5ACFE6C801BF90E85C04EFE444501932BCBC81233F5964D0746EBB96C8D363DF02743C73F5E0CFD6549F79642A5F127EFF17693E397DEE2A25307CACBD76BACCB2D97BEA82ABE18493E3F41594D58D1577F9FE4A818E224475F901C2DDED10C2A4B6F185356DE670B79CA87B4EF32B5C29E15896489814DA9B4E312E6A4F29B3E945F0175B3967F18F6043BC99617205BC8A731FDC916E6798DB9505183E8E93C88F5CBD1B1985283FD9EB15D89AC563208154958484D89C10D6A4D7216265DD606EA699280CD5DF0FCB7CC09D0C2E598C395954DFB65AE83EBAF26BE0055E633D211A0FA6AEA9B4019A7EA8F46B6E020F380C785C7149AEF9E097FFB34B3A64F3256F6BC781879CB3C53EE267BD5E0F65DABB3E31DD4DFBE30C9E0499A08A509FBD4B33F29C2BC5B36971C6A10FB2E2D9AB44F94971D30F6588A3C9A6F233624A00CC26459986EC4261948BC7119C0678289A1D2C66D820DC4323A49C8D1728CE5CD2F31EC969537F5E7EF752558DDB7F9416147C4B355C8561C82288C6B0E85F1C510C4C5DD270F2E339A22D61B354D8D4F5D0C4DF953300A071BD13B799B2BBE0533F09BF543FF73505F1BD0AA1C5630CE7DCDBE5E8E1282FB2EBD4D565FCD34FC7B270B5256C32F3F4FA70531C4E9B4B04F3A524BD95B3C6CED77676E217BF9CDFA91BDA759FA0071A86E703936687E0DB3DD9D157FCDD75DC8F50F1BC70FB80F04C99221778A5516870C90FAA3C9AD549240EE636EA5AAAF86B30475AD7B3FDEE4C467AFA90455CCB1FD021290B2F039C506123472BF4659FA21F4CE9D14FC96529B26A7D860DDB82EE4900B387AE0715E82718A4D76D31A35AE871B5D6A30DB0F51083E659B3B1494809867BCC00453AC61C9062CBEFC3A2616563743B654A8E36CB6B499952832C1FCE65B74E1B850F40A66992D37818E2F0C16365D6AF41CCF4DFD474043ACBE9AE917795C34BEEA82154D7AA07C16273DF005E881C280A53695C1224C753B8D50D076DFAF86ED98D4F3C1B32FC0B1CF86B0387E8EF8F76901192F2061A04F9B0BA808D0DE6E0109DA7E1F0B281F3CFCF6E87BB4EE4715196893651BC6E79828D82B26EDFBB6B5EAA3258B0E79EBBA6F1C6A6CD999C4B188D3078806D1DECC345A23B725E7C0CE1745D3138D6999634C3CD4430D411E197301A00B68DFE5C1F4FC63723DB6F9FC639269F542EC5F8EB5965B7B1EB04A2CF35C8E13025130A40E73168521C813A0AFD298F1D5614B7771413E5D664F5AE108252842A8CEBBD7EF4D4795BFAFDD6587B0F5BE2B7E760E82F995A41F7EE541AABEEFC2CBC2BE6FC464699C84F3249C9BC54D64321DC05E526544ED60361182D877596D5BF5B527FBD17F9F63B1B415D53131747E8F91F0BF8084716AAEBE0D21AD76285986BA0AA4FB6A7911A80766DF258C1D89C0B914E5E246D730B8A84A9D94F62E2D3EBDF05531E4BB785E7F2D57C6F8DFC7DB5919F43CD01079E5BB39477C471A2E93E28BAE52F75E7EA97FD729BECAF45A44DEAF7C1E5016AF7CFC4999EA8BCEB7555499CF2A371328C89E13A89F2E5085C5EA1F41A1883415AE2083DC8324BD89BE82F0647E747078349F9D06BE9314D9D8CA4C62EFDC3C418C1386515AE66AD3482D76F80AA51603DE664937374F5086A024891770D2932132D56F36CAEC5B33BAC777E7CFA103C15FF8013CB5DE56156FAF9CE7BF388FA058C4959DA3915A44AB84FC790EEEFD901366FBF857F04C7354C5BD5FC0FD4C247A8E9774C3638EF842A33D99DFF9F0E801E9988BC75F006433B85F79D70E3C8CC421AA08F281CC679FB220404EDA27F37B2748982546F7D008B3A29FBC9306461AB3C6741A44B5EE4844CD60ACF0646105A0F0D189DD07279ECFAE9CA78F205CA70F905F5FBF31058D270EB30B194F2226817C7870F4A329682A9D5801DD83244FF3DF8644E62411E3525B0B18735A920CFD8DF1C0F183936C4E8FDE9A4226CE5012D0AF914434A5569D5A4CC661070707A69079F9C5BAAC337E3EB1D64B1F4F23D669E4F80E2C15F88AB45B6316C5750E2F7DE6D4855BE4F422E1FE6EE33CFDDE7CBFA8F37A15D0928D13046DC40891D38B966FCC667E197AE0E964FE5F79E377B3CB7FBFC5726EDD62B07E987D8EA19AF36E7634FB6F639C88BC606299ABB5D0F0946015DFA4564676D862644D52B10297D40F9F5B097F427BEFB82D517ABBBE5CD39616749A1985924856B7A42AAA3AE5A6D11AA86F5E329E4943B6AE219BAA335A78958EAE06DBEE88563847C76ABC7D303A6888D3BA612D400F4801AAD33B1532A71329B5A5579D3A5E4F82DCAEE039BAB8AB19CFAAED65C92AD7DB2B732D8A0852A37DE4D1028DDDB0619A82297EA479BECB5223CDF2DDF420BE21DE164C3BE3DD0F91A72D1678899894D75F6C9B81540C5ECF93A01A52B730D701FA9475AEE296A4C5CD0E9EE8AABD009DA4F02485BB49E13C7D530B7988DA4DA72EEB9291CC3E65574256B1BF2C9FE9F257E2FA468AF6E7C476977F9318B12E46E44E3F43ACE02CF4FF91013F5FA88808E6A72DE6799F84837F3667609E7981E15FAD1D9578EF67D90444BDFB932E62633390F2B95F1F8369584483927A46DEEA2560B74BE83A5F93059E6072405980896581B2006DC4028DC982A4528E648DC7AA217596AFBDB968685C9ED2B2FD969473B795A4B82D7AA8AF587F6C61A352EF233D229C1BD53A4937D50ED023F24714F263DE617A9CA6579D693C3259CCF8CDAAE42FDD60A03B42A6DB315E10EEF149B8C9C365BC01544DBB18CF8A60C53255F2756F57946D4EE1D34DE074843790B2D76CB61585BC635A0C2467B9F97E06EA9B9B9766AC3AFD1ECBFA9E24629D7BACBD44DC8F65CD82AA222B9AB99514ADBA6C8BAD0F65945A3B1677963CA2A78E881A501A8E52D3EC45F41009A62C5E82F529CAF6CD8DA7CA3CD5CD085DA69CDA674BB6869022DA779255A3D77E35668B05D2E9C035D84EAB3134A2BDFEA8B4B7953C45948EF639A0A23BCA6DA52FA5969F354B5BF6EAAA521A763773DBA3855D8C0C596219BF3EB6C83AD1965DB04DDA2DCB871341E22D29F6C63E669CEC5B763BE0A4E0EAB62F71F26E71795853A5A0336DB5D72C88045BDA3CA6E708C8CFAFD51E572AA9966DBF4536B15617AD8F4EA5D505561523B43D0C2A9E5D37669E545AD9344F2AEDCB53698B1C573ACA665E73BA49DD1FA709395F680659A8B379E96B8C7AF1159ACC5EDF9F735293FB4A6761E535A785F5A2161695E1CBF251E41ACFF6D5E9A867C4D25A37EB55C589A15F144373AC57A3B4CB6933BCAE917D32318F8CDDAD9884ACBD90E91CBA69F2B4B1BEF405E9B2F4A29CD0CDC62A18F6C19F7C7AF203A6273F433EF919A5A0D2144CA33416F6A29BEC36C60F9106C1AE6B8812669BC3269B1A4CD6418B20A436AC00D3C5BD08D67471FF322FEEAB5C5E3AF73165DD51EE00A33BA01AE281271FEB72C66AE39BD2A75F89AE1C1991EDF67B13E2FB2A81EDDA68AA445BDAA69AB2C1580FF6830A54EDDBBADBAAB928B27267D55A0315ACFD2D3F19D86D91D74AF89EBB9D4F61875B4E76DE0EDB3D1161C73AD014B2AFCA5F1B8B9E29570063AF29F3AF51F721BD50F0551BCF83F6BB85918837BEC5E5351AABA8DF873BDCAEF22DCF98768BB34BA708F5FC9C6E96A6ABCCEED66AFF938CB34D8E01F9FAB282967AD91BAD54E32812BC46033EBE98A2498CE074CD4B55D709A09553E67E1F954E932472FD1C41F2C29C4AE050C58D27B1FB107A33E42C82C5952F504269DF16F5B72BA840F828442944E0647EB0581C3239223F87C554CF4EF3DB67385227711D8F9D10380E4F84049D9A03C3852E2251FA03D30D5C73004529F11DE4FD9EA4B1E3B329FEAE633F74FDAD13509340D5D35CCA68703544BAE41C6C418816287FA83A3D629610B6E31A3E35DBAA79385E621C24672C46869E3DF801D431C54CC5EE121845D9420E9BD16415C32E12151AC0B7C4331AE94CAD330F77EC3AFD36417F76C241F933C8DCDB3811F24CF17413A363F181A45D4FF207F3B1A71028BFF6C241F90007E09A661C3A9D8932A70EC828CD5ED98D5B1492043561A4070FCE08E9AD2D1914F97287A33A76A93F51BD6FAA531694DD519DB66F4CA4EF9BF43C8BD20EE98F6C35FBAB1494EF832804CAAFA3E799621CE3500AAEEB70711DB9A5BF53EC351BFB0FC385533A6A0662C7330E4642D8EFAFC0295E6F51FD171F47CD2DF530C6C124254BDB103562758427255E866C188D44C8DF400E75DE64D6F60B58D7DA6B7A1FCE9939B5873A677ED7D4DE87F3654EED41CF97DF35C9F7E65C99D35DE7B8A045AE977E5CD0A6EF4E8E0BD583F69D3052F9226B28F5A07A278641A93E8D5A829483188B9250527D283561A2FA5E280B25D56D7B4BEC0FDD0774713020FDAE5D1B4AB20FAA254E2B7E57BA62E14905DBA4B00588EBA7B31EB8F0E32445F101EE9C0430D447ADA0D652D63FCD20D37E8CA042D6786695746C8A56EE03D8382773EF0E398D17CE5DA777DBAA42C2E10FB297F78EFB751D4759E8FD35BA2B7CA299EE387504FD1235D59DD34E574CCF740541B765357587B50C657AAA4B045D94E5EA2E38B9B67914E4D512745D5568D577911F5CA7FFA2A6020754498D07EB67CF20C05611F48C5734EB99CD042AC582ADAE8111DE488D1DEB32C660C4561160415754F7CE39EA31DD73EA08FAC74FBEAA9E8B032FD359F15900BFB09FA82017FB2203B9F82C808C0AF520975E595CF06599A48FD2114DA7A3D2D2CBEDA82C9374541AB7753A1250A2299274A34711316FA938AA3686A8BA108564627A14551420C056D7C545D8B7A22F3DA2D5AFFBB974AB4B25A42BEB183063FD1056CC937515156B9615F57AD7202BBF9A040B3392F2DF9F70B1D096D6BCCA2C26983EC9E82C027FFB19D6865465741CF4F987CE7A42B06F8CDA2CF6AAC79AD345F4B52539608DC910FB88732642D3A19C188C88F0F970D842C9B4F01DC80DA0B5981EDC019A332142FF68CEE11343B4F820192AB357D6CDCAAF960686DD900A4727BA45B530448682BC566D07875F048A0627BC2CDCF7C131171FA211CA6F48F67E98A522261A1CC709D1C29008E5B16E567EB5333042D9178C4E680AEB3844E1B1256FCE29B533E452DB150C96E3DD658192B8765EB72A3EDA1954A3620BC6C57748EA38341EDDEC518BF1ADE18C4DEE7FD371780CD52C518C7123110DACAF6DA1D781E96C091AAE15FB3C4485D4943B1098A3B963A9C931637306AD327677A427791CCFDB549F6C0D50B1225576DDFD1FA0E46829335F5A394B0E303C1DC1A365AFDB034A56AFF66B5B535D76BC2C6E22CA0FF0275C6ECE1AC0E18020C9BF1E2FBF64218A3250FC3A0789BF6E401C37A15E1BA0551D74E35299DB288CAA2A5460822B903A9E933AA771EADF3B6E0A8B51AAC05CF4E4B1F05170C13BE05D869FB3749BA555006A7C3290A94ED6FFF192C1F9F87371356F6308104D1F0566F81CBECFFCC0ABF1BEE0C43A11804036C032B0869F87D085E0D6CF35A44F51A809A89CBEDA74790336DB00024B3E872B0745CF35C70D32EC47B076DCE7EB3A538D08889A10E4B41F9FFBCE3A76364909A3690F7F421EF6364F7FFA7F5E4C661421E00100, N'6.2.0-61023')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201810150846132_Upgraded_To_ABP_v3_9_0', N'DoAn', 0x1F8B0800000000000400ED3DCB72DC3892F78DD87FA8A8D3CC444F9524B7DD6E873413B264F568DAB2352EF5ECC65E14140995B86691357CC8D26CEC97ED613F697F61013EF17E9020AB28F35645008904329148201399FFF73FFF7BFCE7A74D307B0471E247E1C9FC7071309F81D08D3C3F5C9FCCB3F4FE8F6FE77FFED3BFFECBF1076FF334FB7B55EF15AA075B86C9C9FC214DB7EF96CBC47D001B27596C7C378E92E83E5DB8D166E978D1F2E8E0E0E7E5E1E112401073086B363BFE9285A9BF01F91FF8F72C0A5DB04D3327B88A3C1024E57758B2CAA1CE3E391B906C1D179CCC4FEFB667D166EB84CFE8E302FEBD8EA3FF046E9AFFFD00E1A6CF1731FCFD2D8ABFCE67A781EF40245720B89FCF9C308C5227854378F75B0256691C85EBD5167E70829BE72D80F5EE9D2001E5D0DE35D5754779708446B96C1A56A0DC2C49A38D21C0C357E5B42DE9E6AD267F5E4F2B9CD862A2D0A8F3C985F39A797EFA315ACF677467EFCE821855CCE77E91D783DCB1A81AFC30439FFF03C4D102126613853FD47CF26AF1F3E26071F0C3EC2C0BD22C062721C8D2D8097E985D677781EFFE0A9E6FA2AF203C09B320C0D18308C232E203FC0409BD0571FAFC05DC97485F7AF3D9926CB7A41BD6CDB036C5702EC3F4CD8FF3D927D8B97317809AFAD8D0576914835F4008622705DEB593A6200E110C90CF1FD33BD5D70D089D30257A7C75A46A045933669094375981F8D17701FA53B583DC0DA9349F5D394F1F41B84E1F4EE647AFDFCC6717FE13F0AA2FE5807F0B7DB8E461A334CE80AAAF2B903E44DE205D5D3B6821C3294F245D1D1E1CFD68A1AF0F4FC0CD10CD6FFC6664E790EAC57F864934A19D6771B962090E30047716F890E12EB7A79E178344361B6F6CCC45D19D82C487476F2D74F53E8EBE217E0FEF23495FAF0F8FAC9018ED321831788C7B707060A1ABCB0DFC9744A103E5478BF58C376F2543CE72190ED9D7B13DD6E365B375483794F78EFB751D4759E8FD35BA2BE82BDF598806C982699F6F34D3E652F705A705756561D9184A23D8F169BC96CBE41FDFBEFE496F0B30ECFC267E3E834C9162F37CF8C618CA27F09442485664FD472711C352ACF3E4F4CE09BD280435DFBC8FA20038A13116D7B11FC539D79454811A2FB9869A1AA6BB4F0C1C6B3B630E4C43286ACB990F481F8DC20B08164A811548D39C1B155AEC760B45445EB0285B260B2E246BEAEDECBD93008C3614C2F29DABC08CD9045473FFC979F4D7F928F900E7B32F20C8CB93077F5B22C69D86DBBAC5451C6DBE448168E6AB8AB7AB288B5DC42F914EED1B275E83B41B0B9810BD6C52137DD4A7182E2BD8DB68148AE0AB5E3699733FD906CEB3A26F4D75D7B0EFCBE41C04F0DCD159281760DA6880794BA1CC556F485791E7DF97CCDE0D462BF4F77BCBB0B057F4B5499CDE25B0D44D4BCE7D816A6BABF38CA5B3A821E3FDDD0932E92D87EE01EA45295C0501CDD6D015647E3F6FE83E2F78008652B3C821B3B7A0CD5AFFE884EBCC5903D5D03E46AE13F8FF2CE403A7FDA4590C2C0B7A59923B55475CE995959D8B38A8F3F80942AAB3D233694F2F5B7BE2C8B81BF09476959308C6A865E53EEA4DD5E4EE4466D6370003AB6D906A164C539675C5373F1D1EBC7DDBCF0631892C85C8FA14A5F5E4E89822F0FAC9826E3D2E43C42F99EF99DF8F634356C88E9F7B594E0AD395898141DD11EA46314A4B16C89A3195F6731B56C8A6BBD324019BBBE0F96F19DC83E11257D9EF6D0EB761C5F6DCA3727F78048CED0367E1A682211B1622486AEA7A7578F09325EB749079C01BB0CB4AA518A4B3F1EC10ABEC2E71637FDB7DB7A0217D073B873D97A79D6F59932CDF812CDF6F31F1395E3B61798885C3521E7AF1FAC9826E3D1D772DCB916B270654238DA30BE44D1957BFDEDD7D624F07E4E9866E94C75D9943C7D9831F7890F9B91E1DB4DCB96D6A37DE1CC24A8C2787B826CF8B438675B15EFBC0B9C2448D7335BA56FBC13588377E92E4470C3D6372963E4471750DCA349F0CC92FD2907C99FC12435CBB0BDCFDD68ED052EBB822108864C105D49B899845593A6D0839334F3CED0944A4E838810844B2E002DA9709343FED1971A062BE24AFC744AC984F9CA4DD199463CD5C1EA299DC6BD5BD67ABFE39A82F3D64C7523B2F2DFAD8055EA247E30AD1D6B561DBBF77205F4F4E02D311440C83ABD123497A4B546A1479BA8C397330154C8F1A189F88B1232A51D861657CECF00AA6D8D1BC204691AD49E14957E023CBD4323EBAD57B7E224696A844E18995F151C42B747A1E504C931DA5A051AF5E9A52D0F3690D4D23AA591A4654AE2156DEB12232292FE7FB79A5D6462BF9B071FC40FDC4B7279477A297ACB238DC45BFD74E927C8B629935A3A7AB809CC8675178EFC79B7C2928AE9F5F59F1EEACC6FB0524201DA4C78F91FB35CAD20FA1879492DF52D7543D3A755DB80E2EE06C018F7EF1D9E209FD65526364C5CBF5FA210AC1A76C7387F696AE270915EA586725EB741FC00AB819F289800783CD7600F7E29B6FD185E3C24DC412012E137C29D98077EAA6FE23E80A0769561FA3B5DFEA4C301D8B5EDEB12870FC0D5F47CE15EFAABC518FB1CF8C668C9799AAECAA035A019B7F40A3CB0488F57840CB810A0E6874191FBBDE0F683964D9018D5B818F6CE7035A2E83247C5795D3D8E59F05381565B68F8A396CC151912EE323A63A2ACAB0CBAF79C57895C51446F9573E2E45912916E5C5B90491A606854B55C047A72EED7C84CEA54E5B6344DE78F27711F7B533BFB99C3208808523A7464FAA7712F0E78BF72243907259DA7635E58DA7D5B487AB29A70CFCF6E87BD283614FB70B55CF033C8132E2760DBBAC90D96B0BECC4EBFBC5EBE68E106313D49A1E18F91DC4BA8CF4B8B0ED6D31B1AC84653BDD69EFE829A8A51893DFEB658B61A0926E6F3FF930A6773C82F5363D1B9D9E8D8EE6A9517FCF46C72017DB7B44708239BD3467889E3D2445F13C3544B2BB1B074245A73D1D67A1621D4216424BB1EC5322DAAD8481B765059C0C79A3D42DBB98CF0A492832A0B1A5CC7D3DA78A6D235AD985C08CC6968A70EC624A93C51E2EC173820D932522BC64E1843B9BF7CA3E64063E411511BA5A463EA38BB653D72D7C65DADDB595CDA7BB0B715F3BBB6ECB2FFEFDF0ABA11CB5E80439A8FBE2E465231BFBF7B8399BDBD74EE1DADE6C5B4B431CC62412C57DB51289564F33D66F8E2BA9F939D6166B7A71225426F229D153F7BEBE80047BA296EB6E70F1E6ABB9282ADC1D86BBD431925CDD2EAC7910A6EB6A03B9D0AA6362C6BB8D043DD40404EFD2242D6BEC29FB9A8648126DBE53B0A4119C4968227585674D33DF330535DB60AB449095EB32B9089C759384B67DB6BC0A6627B90FB75C0FC4C133DCA24B523CA7741C992B809EA4D4AE4FDFE6B3DCF60DF771664A89AAEF41107DFB14C51B27A89BA018D4B23674754517A777D123A0DA1C29BAF88BBF7E682ABF66895B9051425ABEF5C88CB292709225C461E95AE820E5AC28667095E5AFB61A2AC9ABFF9B1387CD84CBEB7E88E328AE2BBF9257BE70528CEE9C65AAA4244F6134A323B9B1B1F0EC856331A5A821952EC34727F03DD191488F7C2590E6E1A51E2173999BC045509965F82415F4469C31F54453B99572BA7CA3C6349F98BC2DF62CAD6CFE93A279F8358CBE851F9ED0CEEF04A57B70D9F6ADBC2D7AD908BCCF595A37F8598D2BF6A65080312D91B5D68D4059ED2202B920EDCAC04261929207EA009EAE18FC82D73DD499C5D324895C3F1F1E692611A461243BFF107A33A39C8CCDE142903E33B7F1A31C1D70BB3999FF8119AE6E8F751C3EA647BA8F43724CB08FCF61A10CCE4E731330D4C39CC4753C565D8333EA915FA0EA0E506841DF410F4451243C3F4C593DDF0F5D7FEB042623A180681E171092757774C939D8821069FA2634D4C103733360D1A97BA5E6523575C74B8C57E52C2C8EE12862268D20940D23B1274D92A30E160B7667D3E98BC3B4AABED815D28A0595E31F80FD94F3A28343138977279C87BFAC15D19FFBCC96BC75E95546F131E1F01EF6F8AE17A6E34CC4006CC619B44EAFD5217C876C853978C829CAF3F59033986CA315BEB056C0E48AC10E8CC2623018B7B013AAD335757DB33BCEC1DD6EA454E67AE074E41C9ECBCEB09CC3C16028CEE14CA84ED7947D7F779CC3F81C49492D763FEAC843427FA561194984C650DC249A5F9DFE798E173BE4AB2208849CE8544488DDA94854FC090A93F2CAA43F15899C88C1988D18F43854243C988794A2DCC81EBB63305E1C110A9D6B363C777F1CC7999EA1D88E3315E3E0BD22608B94CC54F496DDF11B192B8642A47833DF1F7311B330145B11231E0743D58177A4A464A3F0B450894430391C3280F4A18734148FD0C3DE7B3661225B8BA82A0E73DD10566FD94B600EAE938B3018805F44133A966B0126EAB894CA8A6B81569CB3D36B0111064371CE88AF05F8C1E0A5A4D6B91668C543BBBF1690A2311437BD886B01266EBF94F28AF31B8F9B7AD2A78529032874863ABF89A66728666C797EAB623AED84F7382F6845E4963DA76D085E453AD097679237B8830933310E03308F7862C7A25371DE382BA8ADD0AB5A73D14E752B310EC371D188F52BEA25BA82D21207ABD6DC63EE42659D7986F77DE2CFA74EC7BB767612450750505947296FCD42BB57CC15880CC7512354CE8BC724B04D0A5B600F1BF0C84AE777A81C3CF19E5941544BAFDA849B05B8800FD5E00A720697D0C70885186FDEB154EF27CB320ECF9140C877291C484485E26D810264B9B279C06A41A80041FA52F220D10EB00A801F9D709D396BC09DAB2D5A48390DAA6ADAF06E20293561DEE45457C0253CA93970D9C7A6060057D95D9DE953051CAFABD511ED86C8EB80F5CA5400C50FB62C38CED95001AFCC0EC0402A0EBE8AC64894F01A171259A371953A840BA1F418D400536582E08229ADEA1A604473D1D8B2144024AB53971EEC6B5C1E345160502DE062805AB35446D8114D541DBF47976E65780A29F9EA30181A40557347D7D19A39D448673DF3EA31C0B1DD92D92304AF2566581BD9BB07BEBA4F68567A0F2CEA09E06C3D8CE660FA960203DE6C8DF45519394B1A332876D6E7CC9EA6673F3138B56F3F36300EB748E64DEDCA6F02BAC5E415EEA9A53866A70B2F168F02ABC59B9272BB904C030E8033707CCBB034623CD69D68D8A2DB3C0EEA9CDBBC1613C0B9BB5341693B0144203DC104082FA258D4791751E613C0BB76EA6B02D860788259909F8BD94108CFC5E6F3213C05F73629A542259A0A8ED325076BD2EDB2C5B0496F490A4085A39D11137AB560D842A3128B3ACFAC643E013C6B100685C0D9CE34942AB06002389E692CD2A46F9AF9A0499732AA7D899F9DC1361A8D60BC7CC7291665C675CA7CD48CA7140642A479B51837E3E8C319BADC1988B5592A363D2EC9E4507A146F8CBF8A6802F4363DA1578BF9040CB4E9F1DD2E44B360B0E9C93D34CCE763C84D8FF11910CD87DE1620F42C309F8541B7005E0068762254466E5D3337368CFA6242321D12C3760F1CC18B332D9C0A3D5921B1D5B69B8A8124061DD25A380DEABB0781B1B1DDF087B95510C6CC164E8381CC5499D0DA4D4C1F92B38A0C561B73EAB2E3E5CA7D001BA7FC70BC84555CB04D332780488020A90AAE9CED16A9314DCBF2CB6CB5755CE47BF1C7D57CF6B409C2E464FE90A6DB77CB6592834E161BDF8DA324BA4F176EB4593A5EB43C3A38F8797978B8DC1430962E219069D353DD13141DCE1A50A5284F83072EFC3849515A9C3B07057839F3364C3591E94A707958F54A5BA7580A56D788550BF4BBB69649D292142D2F62F8FB5B147F6DAC5CAC55B0040DEBAE37C8B89847ECC33842DC14365EB94EE0C49C00816751906D42B19D53DCBA09F987C368BEEA43AA2C9A381C9195530C6505E247DF2D1314E1A088027D7857207D883C161CFE5D1FDAB583689CE68B1687867FD787F6E109B8195AE44534411C2055D402E67999475000B729D687CD4415C6213385A670591AE1DFF5A111118271704481C98C2239CA99C9FAB33EACCB0DFC974421EEDC46AC5D4E793BE8FC75CDAF6140A9DC37A0C88E46500AFBCE423B5E52528FF17960442FB521D2B25C4BD2532E04FD897BD615C15CEE6BC0E8670380DD1551097110F5472338A7F13A61E0141F0D36A4186EF5B9E992D890EAAFFA903E419D00B663852B51A00F0F29745C784481C1724D4EEF9CD08B424013102F30D89CEA10B0C4D6547F3558E644D45B62A113258610F9324FE1EBBB33F1411B5CFB931FFCD879E6324405A01F0182394C12FBA3D88F32870595F6A24615DF501041108779EE23DF9F8D9FEF5F7DB08A82AC9709FAFDF9FE7766F42587F4FBD150D6DED980D5ED4CB5BA3219320EA2FCF4BD8A35AB22A820EAFE4B20466A70111F5668B4DC5FEADBB1DE3796168414B6EC47D274970F90CADBC0796601110526CA599D418054CDEACF06B891EF5008ECE44F541430B9B28C2C31536FD97460B49ECBD668D3037F3274FCE3C5D05F96746F29541A7FF21E6F37397EE92D2E3A75A0BC7CBDC6BADC72E98BAAE28B91E4F31394D584157DF5F7498E8A214E72F405C9D1E21DCDA0B2F4863165E57DB690A77C48FB2E532BEC5991489618D8944A3B2E614E2ABFE943F91550376BF987614FB0936C7901B2857C1AD39F6C619ED7980B1535889ECE8358BF1C1D8B2935D8EF19DB95C86A258350918485D49418DCA0D6246761D2656DA09E2609D8DC05CF7FCB9C002D5C8E395C59D9B45FE63AB8FE6AE20B50653E231D01AAAFA6BE099471AAFE68640B0E320F785C784CA1F9EE99F0B74F336BFA246365CF8B8791B7CC33E56EB2570D6EDFB53A3BDE41FDED0B930C9EA489509AB04F3DFB9322CCBB6573C9A106B1EFD2A249FB4479D901638FA5C8A3F936624302CA204C9685E9466C9281C41B97017C2698182A6DDC26D8402CA393841C2DC758DEFC12C36E5979537FFE5E5782D57D9B1F1476443C5B856CC52188C2B8E650185F0C415CDC7DF2E032A32962BD51D3D4F8D4C5D0943F05A370B011BD93B7B9E25B3003BF593FF43F07F5B501ADCA6105E3DCD7ECEBE52821B8EFD2DB64F5D54CC3BF77B2206535FCF2F3745A10439C4E0BFBA423B594BDC5C3D67E77E616B297DFAC1FD97B9AA50F1087EA06976383E6D730DBDD59F1D77CDD855CFFB071FC80FB40902C1972A7586571C800A93F9ADC4A2509E43EE656AAFA6A384B50D7BAF7E34D4E7CF69A4A50C51CDB2F2001290B9F536C204123F76B94A51F42EFDC49C16F29B569728A0DD68DEB420EB980A3071EE72518A7D86437AD51E37AB8D1A506B3FD1085E053B6B94341098879C60B4C30C51A966CC0E2CBAF6362617533644B853ACE664B9B59892213CC6FBE45178E0B45AF6096D97213E8F8C26061D3A546CFF1DCD47F0434C4EAAB997E91C745E3AB2E58D1A407CA6771D2035F801E280C586A53192CC254B7D308056DF7FD6AD88E493D1F3CFB021CFB6C088BE3E7887F9F1690F1021206FAB4B9808A00EDED1690A0EDF7B180F2C1C36F8FBE47EB7E5491813659B6617C8E8982BD62D2BE6F5BAB3E5AB2E890B7AEFBC6A1C6969D491C8B387D806810EDCD4CA335725B720EEC7C51343DD1989639C6C4433DD410E491311700BA80F65D1E4CCF3F26D7639BCF3F2699562FC4FEE5586BB9B5E701ABC432CFE53821100543EA30675118823C01FA2A8D195F1DB6741717E4D365F6A4158E50822284EABC7BFDDE7454F9FBDA5D76085BEFBBE267E720985F49FAE1571EA4EAFB2EBC2CECFB464C96C649384FC2B959DC4426D301EC255546D40E661321887D97D5B6555F7BB21FFDFA1C8BA5ADA88E89A1F37B8C84FF05248C5373F56D0869B543C932D45520DD57CB8B403D30FB2E61EC4804CEA5281737BA86C14555EAA4B47769F1E985AF8A21DFC5F3FA6BB932C6FF3EDECECAA0E78186C82BDFCD39E23BD27099145F7495BAF7F24BFDBF4EF155A6D722F27EE5F380B278E5E34FCA545F74BEADA2CA7C56B9994041F69C40FD74812A2C56FF080A45A4A9700519E41E24E94DF4158427F3A383C3A3F9EC34F09DA4C8C65666127BE7E609629C308CD232579B466AB1C35728B518F0364BBAB9798232042549BC80939E0C91A97EB35166DF9AD13DBE3B7F0E1D08FEC20FE0A9F5B6AA787BE53CFFC57904C522AEEC1C8DD4225A25E4DF7370EF879C30DBC7BF82679AA32AEEFD02EE6722D173BCA41B1E73C4171AEDC9FCCE87470F48C75C3CFE02209BC1FDCABB76E061240E5145900F643EFB94050172D23E99DF3B41C22C31BA87469815FDE49D3430D29835A6D320AA7547226A066385270B2B00858F4EEC3E38F17C76E53C7D04E13A7D80FCFAFA8D29683C71985DC878123109E4C383A31F4D4153E9C40AE81E24799AFF37243227891897DA5AC098D39264E86F8C078E1F9C64737AF4D61432718692807E8D24A229B5EAD462320E3B38383085CCCB2FD6659DF1F389B55EFA781AB14E23C77760A9C057A4DD1AB328AE7378E933A72EDC22A71709F7771BE7E9F7E6FB459DD7AB80966C9C20682346889C5EB47C6336F3CBD0034F27F3FFCA1BBF9B5DFEFB2D9673EB1683F5C3EC730CD59C77B3A3D97F1BE344E40513CB5CAD8586A704ABF826B532B2C316236B928A15B8A47EF8DC4AF813DA7BC76D89D2DBF5E59AB6B4A0D3CC289444B2BA255551D529378DD6407DF392F14C1AB2750DD9549DD1C2AB747435D87647B4C2393A56E3ED83D141439CD60D6B017A400A509DDEA990399D48A92DBDEAD4F17A12E47605CFD1C55DCD78566D2F4B56B9DE5E996B5144901AED238F1668EC860DD3144CF123CDF35D961A6996EFA607F10DF1B660DA19EF7E883C6DB1C04BC4A4BCFE62DB0CA462F07A9E04D590BA85B90ED0A7AC7315B7242D6E76F04457ED05E824852729DC4D0AE7E99B5AC843D46E3A7559978C64F629BB12B28AFD65F94C97BF12D73752B43F27B6BBFC9BC48875312277FA19620567A1FF8F0CF8F9424544303F6D31CFFB241CFCB33903F3CC0B0CFF6AEDA8C47B3FCB2620EADD9F74111B9B8194CFFDFA184CC3221A94D433F2562F01BB5D42D7F99A2CF0049303CA024C2C0B9405682316684C16249572246B3C560DA9B37CEDCD4543E3F29496EDB7A49CBBAD24C56DD1437DC5FA630B1B957A1FE911E1DCA8D649BAA976801E913FA2901FF30ED3E334BDEA4CE391C962C66F56257FE90603DD1132DD8EF182708F4FC24D1E2EE30DA06ADAC57856042B96A992AF7BBBA26C730A9F6E02A723BC8194BD66B3AD28E41DD3622039CBCDF73350DFDCBC3463D5E9F758D6F72411EBDC63ED25E27E2C6B16541559D1CCADA468D5655B6C7D28A3D4DAB1B8B3E4113D7544D480D270949A662FA287483065F112AC4F51B66F6E3C55E6A96E46E832E5D43E5BB2358414D1BE93AC1ABDF6AB315B2C904E07AEC1765A8DA111EDF547A5BDADE429A274B4CF0115DD516E2B7D29B5FCAC59DAB2575795D2B0BB99DB1E2DEC6264C812CBF8F5B18FD589B6EC826DD26E593E9C08126F49F506631F334EF62DBB1D70527075DB973879B7B83CACA952D099B6DA6B1644822D6DED4ECF11909F5FAB3DAE54522DDB7E8B6C62AD2E5A1F9D4AAB0BAC2A46687B18543CBB6ECC3CA9B4B2699E54DA97A7D21639AE7494CDBCE67493BA3F4E1372BED00CB25067F3D2D718F5E22B3499BDBE3FE7A426F795CEC2CA6B4E0BEB452D2C2AC397E5A3C8359EEDABD351CF88A5B56ED6AB8A1343BF2886E658AF466997D366785D23FB64621E19BB5B3109597B21D33974D3E469637DE90BD265E94539A19B8D5530EC833FF9F4E4074C4F7E867CF2334A41A5299846692CEC4537D96D8C1F220D825DDB9712669BC3269B1A4CD6418B20A436AC00D3C5BD08D67471FF322FEEAB5C5E3AF73165DD51EE00A33BA01AE281271FEB72C66AE39BD2A75F89AE1C1991EDF67B13E2FB2A81EDDA68AA445BDAA69AB2C1580FF6830A54EDDBBADBAAB928B27267D55A0315ACFD2D3F19D86D91D74AF89EBB9D4F61875B4E76DE0EDB3D1161C73AD014B2AFCA5F1B8B9E29570063AF29F3AF51F721BD50F0551BCF83F6BB85918837BEC5E5351AABA8DF873BDCAEF22DCF98768BB34BA708F5FC9C6E96A6ABCCEED66AFF938CB34D8E01F9FAB282967AD91BAD54E32812BC46033EBE98A2498CE074CD4B55D709A09553E67E1F954E932472FD1C41F2C29C4AE050C58D27B1FB107A33E42C82C5952F504269DF16F5B72BA840F828442944E0647EB0581C3239223F87C554CF4EF3DB67385227711D8F9D10380E4F84049D9A03C3852E2251FA03D30D5C73004529F11DE4FD9EA4B1E3B329FEAE633F74FDAD13509340D5D35CCA68703544BAE41C6C418816287FA83A3D629610B6E31A3E35DBAA79385E621C24672C46869E3DF801D431C54CC5EE121845D9420E9BD16415C32E12151AC0B7C4331AE94CAD330F77EC3AFD36417F76C241F933C8DCDB3811F24CF17413A363F181A45D4FF207F3B1A71028BFF6C241F90007E09A661C3A9D8932A70EC828CD5ED98D5B1492043561A4070FCE08E9AD2D1914F97287A33A76A93F51BD6FAA531694DD519DB66F4CA4EF9BF43C8BD20EE98F6C35FBAB1494EF832804CAAFA3E799621CE3500AAEEB70711DB9A5BF53EC351BFB0FC385533A6A0662C7330E4642D8EFAFC0295E6F51FD171F47CD2DF530C6C124254BDB103562758427255E866C188D44C8DF400E75DE64D6F60B58D7DA6B7A1FCE9939B5873A677ED7D4DE87F3654EED41CF97DF35C9F7E65C99D35DE7B8A045AE977E5CD0A6EF4E8E0BD583F69D3052F9226B28F5A07A278641A93E8D5A829483188B9250527D283561A2FA5E280B25D56D7B4BEC0FDD0774713020FDAE5D1B4AB20FAA254E2B7E57BA62E14905DBA4B00588EBA7B31EB8F0E32445F101EE9C0430D447ADA0D652D63FCD20D37E8CA042D6786695746C8A56EE03D8382773EF0E398D17CE5DA777DBAA42C2E10FB297F78EFB751D4759E8FD35BA2B7CA299EE387504FD1235D59DD34E574CCF740541B765357587B50C657AAA4B045D94E5EA2E38B9B67914E4D512745D5568D577911F5CA7FFA2A6020754498D07EB67CF20C05611F48C5734EB99CD042AC582ADAE8111DE488D1DEB32C660C4561160415754F7CE39EA31DD73EA08FAC74FBEAA9E8B032FD359F15900BFB09FA82017FB2203B9F82C808C0AF520975E595CF06599A48FD2114DA7A3D2D2CBEDA82C9374541AB7753A1250A2299274A34711316FA938AA3686A8BA108564627A14551420C056D7C545D8B7A22F3DA2D5AFFBB974AB4B25A42BEB183063FD1056CC937515156B9615F57AD7202BBF9A040B3392F2DF9F70B1D096D6BCCA2C26983EC9E82C027FFB19D6865465741CF4F987CE7A42B06F8CDA2CF6AAC79AD345F4B52539608DC910FB88732642D3A19C188C88F0F970D842C9B4F01DC80DA0B5981EDC019A332142FF68CEE11343B4F820192AB357D6CDCAAF960686DD900A4727BA45B530448682BC566D07875F048A0627BC2CDCF7C131171FA211CA6F48F67E98A522261A1CC709D1C29008E5B16E567EB5333042D9178C4E680AEB3844E1B1256FCE29B533E452DB150C96E3DD658192B8765EB72A3EDA1954A3620BC6C57748EA38341EDDEC518BF1ADE18C4DEE7FD371780CD52C518C7123110DACAF6DA1D781E96C091AAE15FB3C4485D4943B1098A3B963A9C931637306AD327677A427791CCFDB549F6C0D50B1225576DDFD1FA0E46829335F5A394B0E303C1DC1A365AFDB034A56AFF66B5B535D76BC2C6E22CA0FF02F5C6ECE1AC0E18020C9BF1E2FBF64218A3250FC3B0789BF6E401C37A15E1BA0551D74E35299DB288CAA2A5460822B903A9E933AA771EADF3B6E0A8B51AAC05CF4E4B1F05170C13BE05D869FB3749BA555006A7C3290A94ED6FFF192C1F9F87371356F6308104D1F0566F81CBECFFCC0ABF1BEE0C43A11804036C032B0869F87D085E0D6CF35A44F51A809A89CBEDA74790336DB00024B3E872B0745CF35C70D32EC47B076DCE7EB3A538D08889A10E4B41F9FFBCE3A76364909A3690FFF421EF6364F7FFA7FDA69D83821E00100, N'6.2.0-61023')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201901110613114_Upgraded_To_ABP_v4_1_0', N'DoAn', 0x1F8B0800000000000400ED3DD972E4B891EF1BB1FF50514FB6635C25A9A77B7A3A243BD43AC6F2B4BAE596C6BBB12F0A8A844ADC6691651E6AC91BFB65FBB09FB4BFB0004FDC0709B28A12DFAA082091402612096422F3FFFEE77F0FFFFCB40E668F204EFC283C9AEF2FF6E63310BA91E787ABA37996DEFFF1FDFCCF7FFAD77F393CF3D64FB3BF57F5DEA07AB065981CCD1FD274F361B94CDC07B07692C5DA77E32889EED3851BAD978E172D0FF6F67E5EEEEF2F01043187B066B3C3AF5998FA6B90FF817F4FA2D0059B347382CBC80341527E8725D739D4D967670D928DE382A3F9F1DDE6245A6F9CF0197D5CC0BF5771F49FC04DF3BF67106EFA7C1EC3DFDFA3F8DB7C761CF80E44F21A04F7F399138651EAA470081F7E4BC0751A47E1EA7A033F38C1CDF306C07AF74E908072681F9AEABAA3DC3B40A35C360D2B506E96A4D1DA10E0FE9B72DA9674F356933FAFA7154E6C315168D4F9E4C279CD3C3FFD14ADE633BAB30F27418C2AE673BFC8EB41EE58540D7E98A1CFFF01E2680109B38EC21F6A3EF97101196AB1F7C3EC240BD22C064721C8D2D8097E985D657781EFFE0A9E6FA26F203C0AB320C0D18308C232E203FC0409BD0171FAFC15DC97485F78F3D9926CB7A41BD6CDB036C5702EC2F4DD8FF3D967D8B97317809AFAD8D0AFD32806BF8010C44E0ABC2B274D411C2218209F3FA677AAAF1B103A614AF4F8E640D508B266CC20296F720DE247DF05E84FD50E7237A4D27C76E93C7D02E12A7D389A1FBC7D379F9DFB4FC0ABBE9403FE2DF4E192878DD23803AABE2E41FA1079837475E5A0850CA73C9174B5BF77F0A385BECE9E809B219ADFF8CDC84E21D58BFF0C9368423BCDE272C5121C6008EE24F021C35D6C8E3D2F06896C36DED9988BA23B0589F70FDE5BE8EA631C7D47FC1EDE4792BEDEEE1F582131DA653062F018776F6FCF4257176BF82F894207CA8F16EB196FDE4A869CE4321CB2AF637BAC87CB66EB906E281F1DF7DB2A8EB2D0FB6B7457D057BEB3100D9205D33EDF68A6CDA5EE0B4E0BEACAC2B2319446B0E3E3782597C93FBE7FFB93DE1660D8F94DFC7C029922C5E679FF9D3194CFE0298590ACC8FA4F4E2286A558E7C9F19D137A51086ABEF91845017042632CAE623F8A73AE29A902355E720D35354C779F1838D676C61C988650D4963367481F8DC27308164A816B90A639372AB4D8CD068A88BC6051B64C165C48D6D4DBD9472701186D2884E53B578119B309A8E6FEB3F3E8AFF251F201CE675F419097270FFEA6448C3B0DB7758BF3385A7F8D02D1CC57156FAFA32C7611BF443AB56F9C7805D26E2C6042F4B2494DF4519F62B8AC606FA35128826F7AD9644EFD641338CF8ABE35D55DC3BE2F925310C0734767A15C8069A301E62D853257BD215D469E7F5F327B3718ADD0DFED2DC3C25ED1D726717C97C052372D39F705AAADADCE3396CEA2868CF77727C8A4B71CBA07A817A5701504345B439790F9FDBCA1FBBCE001184ACD2287CCDE82366BFD9313AE3267055443FB14B94EE0FFB3900F9CF6936631B02CE865496E551D71A55756762EE2A0CEE32708A9CE4ACFA43DBD6CED8923E36EC053DA554E2218A39695BBA8375593BB159959DF000CACB641AA59304D59D615DFFDB4BFF7FE7D3F1BC424B21422EB7394D693A3638AC0EB270BBAF5B80C11BF64BE677E3F8E0D59213B7EEE6539294C572606067547A81BC5282D59206BC654DACF6D58219BEE8E9304ACEF82E7BF65700F864B5C65BFB739DC8615DB738FCAFDE11130B60F9C859B0A866C588820A9A9EBCDFEDE4F96ACD341E6016FC02E2B956290CEC6B3435C6777891BFB9BEEBB050DE915EC1CF65C9EB6BE654DB27C0BB27CB7C5C49778E584E521160E4B79E8C5EB270BBAF574DCB52C47AE9C18508D348E2E9037655CFD767BF7893D1D90A71BBA511E77650E1D270F7EE041E6E77A74D072E7B6A9DD7873082B319E1CE29A3C2F0E19D6C57AED03E70A1335CED5E85AED0757205EFB49921F31F48CC959FA10C5D53528D37C3224BF4843F245F24B0C71ED2E70775B3B424BADE38A4020920517506F26621665E9B421E4CC3CF1B4271091A2E3042210C9820B685726D0FCB467C4818AF992BC1E13B1623E71927627508E357399CFE44EABEE3D5BF54F417DE9213B96DA7969D1C72EF0123D1AAF116D5D1BB6FD7B07F2F5E424301D41C430B81A3D92A4B744A54691A7CB98330753C1F4A881F189183BA212851D56C6C70EAF608A1DCD0B6214D99A149E74053EB24C2DE3A35BBDE7276264894A149E58191F45BC42A7E701C534D9510A1AF5EAA529053D9FD6D034A29AA56144E51A62E51D2B2293F272BE9F576A6DB492B3B5E307EA27BE3DA1BC15BDE43A8BC36DF47BE524C9F7289659337ABA0AC8897C1285F77EBCCE9782E2FAF98D15EFCE6ABC5F4102D2417AFC14B9DFA22C3D0B3DA494FC96BAA6EAD1B1EBC275700E670B78F48BCF164FE82F921A232B5EAE570F51083E67EB3BB4B7743D49A850C73A2B59A7FB00AE819B219F087830586F06702FBEF91E9D3B2EDC442C11E022C197920D78C76EEA3F82AE709066F5295AF9ADCE04D3B1E8E51D8B02C75FF375E45CF1AECA1BF518FBCC68C67899A9CAAE3AA015B0F90734BA4C80588F07B41CA8E0804697F1B1EBFD809643961DD0B815F8C8763EA0E53248C27755398D5DFE5980535166FBA898C3161C15E9323E62AAA3A20CBBFC9A578C57594C61947FE5E352149962515E9C4B10696A50B854057C74EAD2CE47E85CEAB43546E48D277F17715F5BF39BCB2983005838726AF4A47A27017FBE782F32042997A56D5753DE785A4D3BB89A72CAC06F8FBE273D18F674BB50F53CC01328236ED7B0CB0A99BDB6C04EBCBE5BBC6EEE08313641ADE98191DF41ACCA488F0BDBDE1613CB4A58B6D39DF6969E825A8A31F95A2F5B0C0395747BFBC98731BDE311ACB7E9D9E8F46C74344F8DFA7B363A06B9D8DE238213CCE9A53943F4EC21298AE7A92192DDED38102A3AEDE9380B15EB10B2105A8A659F12D16E250CBC2D2BE064C81BA56ED9C57C56484291018D2D65EEEB39556C1BD1CA2E046634B654846317539A2CF670099E136C982C11E1250B27DCD9BC57F62133F009AA88D0D532F2195DB41DBB6EE12BD3EEAEAD6C3EDD5D88FBDADA755B7EF1EF87DF0CE5A84527C841DD17272F1BD9D85FE3E66C6E5F3B866B7BBD692D0D7118934814F7D54A245A3DCD58BF39AEA4E697585BACE9C5895099C8A7444FDDFBFA0A12EC895AAEBBC1C59BAFE6A2A8707718EE52C7487275BBB0E64198AEAB0DE442AB8E8919EF3612F4501310BC4B93B4ACB1A3EC6B1A2249B4F94EC192467026A189D4159E35CD7CC714D46C8DAD124156AE8BE43C70564D12DAF6D9F22A989DE43EDC723D1007CF708B2E49F19CD271642E017A9252BB3E7D9FCF72DB37DCC7992925AA7E0441F4FD7314AF9DA06E826250CBDAD0D5155D1CDF458F806A73A0E8E22FFEEAA1A9FC96256E41460969F9D62333CA4AC249961087A56BA18394B3A298C1EB2C7FB5D550495EFDDF9C386C265C5EF72C8EA3B8AEFC465EF9DC4931BA7396A992923C85D18C8EE4C6C6C2B3178EC594A28654BA081F9DC0F74447223DF295409A87977A84CC656E0217416596E19354D01B71C6D4134DE556CAE9F29D1AD37C62F2B6D8B3B4B2F94F8AE6E1B730FA1E9E3DA19DDF094AF7E0B2ED7B795BF4B211785FB2B46EF0B31A57EC4DA100635A226BAD1B81B2DA45047241DA958185C224250FD4013C5D31F815AFBBAF338BC74912B97E3E3CD24C2248C348767E167A33A39C8CCDE142903E33B7F1A31C1D70BB399AFF8119AE6E8F751C3EA647BA8F7D724CB08F2F61A10CCE8E731330D4C39CC4753C565D8333EA915FA0EA0E506841DF410F4451243C3F4C593DDF0F5D7FE3042623A180681E171092757774C929D8801069FA2634D4C103733360D1A97BA5E6523575874B8C57E52C2C8EE12862268D20940D23B1274D92A3F6160B7667D3E98BC3B4AABED815D28A0595E31F80FD94F3A283431389772B9C87BFAC15D19FFBCC96BC75E95546F131E1F01EF6F8AE17A6E34CC4006CC619B44EAFD5217C8B6C853978C829CAF3F59033986CA315BEB056C0E48AC10E8CC2623018B7B013AAD335757DB33DCEC1DD6EA454E67AE074E41C9ECBCEB09CC3C16028CEE14CA84ED7947D7F7B9CC3F81C49492D763FEAC843427FA561194984C650DC249A5F9DFE798E175BE4AB2208849CE8544488EDA94854FC090A93F2CAA43F15899C88C1988D18F43854243C988794A2DCC81EDB63305E1C110A9D2B363C777F1CC7999EA1D88E3315E3E0BD22608B94CC54F496EDF11B192B8642A47833DF1F7311B330145B11231E0743D58177A4A464A3F0B450894430391C3280F4A18734148FD0C3DE793661225B8BA82A0E73DD10566FD94B600EAE938B3018805F44133A966B0126EAB894CA8A6B81569CB3D56B0111064371CE88AF05F8C1E0A5A4D6B91668C543DBBF1690A2311437BD886B01266EBF94F28AF31B8F9B7AD2A78529032874863ABF89A66728666C797EAB623A6D85F7382F6845E4963DA76D085E453AD097679237B8830933310E03308F7862C7A25371DE382BA8ADD0AB5A73D156752B310EC371D188F52BEA25BA82D21207ABD6DC63EE42659D7986F77DE2CFA74EC7DB767612450750505947296FCD42DB57CC15880CC7512354CE8BC724B04D0A5B600F1BF0C84AA777A81C3CF19E5941544BAFDA849B05B8800FD5E00A720697D0A70885186FDEB154EF27CB320ECF9140C877291C484485E26D810264B9B279C06A41A80041FA52F220D10EB00A809F9C7095392BC09DAB0D5A48390DAA6ADAF06E20293561DEE45457C0253CA93970D9C7A60600AFB3BB3AD3A70A385E57AB23DA0D91D701EB95A9008A1F6C59709CB3A1025E991D8081541C7C158D9128E1352E24B246E32A75081742E931A801A6CA04C105535AD535C088E6A2B16529804856A72E3DD8D7B83C68A2C0A05AC0C500B566A98CB0239AA83A7E8F2EDDCAF01452F2D561303480AAE68EAEA33573A891CE7AE6D5638063BB25B347085E4BCCB036B2770F7C759FD0ACF41E58D413C0D97A18CDC1F42D0506BCD91AE9AB327296346650ECACCF993D4DCF7E62706ADF7E6C601C6E91CC9BDA95DF04748BC92BDC534B71CC4E175E2C1E05568B3725E5762199061C0067E0F8966169C478AC3BD1B045B7791CD439B7792D26807377A782D2760288407A8209105E44B1A8F32EA2CC278077EDD4D704B0C1F004B3203F17B383109E8BCDE743780AEE6D524A854A34151CA74B0ED6A4DB658B6193DE9214800A473B2326F46AC1B085462516759E59C97C0278D6200C0A81B39D69285560C104703CD358A449DF34F341932E6554FB123F3B836D341AC178F98E532CCA8CEB94F9A8194F290C8448F36A316EC6D1873374B933106BB3546C7A5C92C9A1F428DE187F15D104E86D7A42AF16F3091868D3E3BB5D8866C160D3937B6898CFC7909B1EE333209A0FBD2D40E859603E0B836E01BC00D0EC44A88CDCBA666E6C18F5C584643A2486ED1E388217675A38157AB24262AB6D371503490C3AA4B5701AD4770F026363BBE10F73AB208C992D9C060399A932A1B59B983E24671519AC36E6D46587CB6BF701AC9DF2C3E1125671C126CD9C00220182A42AB874361BA4C6342DCB2FB3EB8DE322DF8B3F5ECF674FEB204C8EE60F69BAF9B05C2639E864B1F6DD384AA2FB74E146EBA5E345CB83BDBD9F97FBFBCB750163E9120299363DD53D41D1E1AC00558AF23478E0DC8F9314A5C5B973508097136FCD541399AE04978755AFB4758AA560758D58B540BF6B6B99242D49D1F23C86BFBF47F1B7C6CAC55A054BD0B0EE6A8D8C8B79C43E8C23C44D61E36BD7099C981320F0240AB27528B6738A5B3721FF7018CD577D489545138723B2728AA15C83F8D177CB04453828A2401FDE25481F228F05877FD78776E5201AA7F9A2C5A1E1DFF5A19D3D0137438BBC88268803A48A5AC03C2DF3080AE036C5FAB099A8C23864A6D0142E4B23FCBB3E342242300E8E2830995124473933597FD68775B186FF9228C49DDB88B5CB296F079DBFAEF9350C2895FB0614D9D1084A61DF5968874B4AEA313E0F8CE8A536445A966B497ACA85A03F71CFBA2298CB7D0D18FD6C00B0BB222A210EA2FE6804E7385E250C9CE2A3C18614C3AD3E375D121B52FD551FD267A813C076AC70250AF4E121858E0B8F283058AEC9F19D137A51086802E205069B531D0296D89AEAAF06CB9C887A4B2C74A2C410225FE6297C7DB7263E68836B7FF2831F3BCF5C86A800F42340308749627F14FB51E6B0A0D25ED4A8E21B0A2208E2304F7DE4FBB3F6F3FDAB0F565190F52241BFBFDCFFCE8CBEE4907E3F1ACADA3B1BB0BA9DA956572643C641949F5EAB58B32A820AA2EEBE0462A40617F1618546CBFDA5BE1DEB7D6369414861CB7E244D77F900A9BC099C6716105160A29CD5190448D5ACFE6C801BF90E85C04EFE444501932BCBC81233F5964D0746EBB96C8D363DF02743C73F5E0CFD6549F79642A5F127EFF17693E397DEE2A25307CACBD76BACCB2D97BEA82ABE18493E3F41594D58D1577F9FE4A818E224475F901C2DDED10C2A4B6F185356DE670B79CA87B4EB32B5C29E15896489814DA9B4E312E6A4F29B3E945F0175B3967F18F6043BC99617205BC8A731FDC916E6798DB9505183E8E93C88F5CBD1B1985283FD9EB15D89AC563208154958484D89C10D6A4D7216265DD606EA719280F55DF0FCB7CC09D0C2E598C395954DFB65AE83EBAF26BE0055E633D211A0FA6AEA9B4019A7EA8F46B6E020F380C785C7149AEF9E097FFB34B3A64F3256F6BC781879CB3C53EE267BD5E0765DABB3E31DD4DFBE30C9E0499A08A509FBD4B33F29C2BC5B36971C6A10BB2E2D9AB44F94971D30F6588A3C9A6F233624A00CC26459986EC4261948BC7119C0678289A1D2C66D820DC4323A49C8D1728CE5CD2F31EC969537F5E7D7BA12ACEEDBFCA0B023E2D92A642B0E4114C63587C2F86208E2E2EE920797194D11EB8D9AA6C6A72E86A6FC291885838DE89DBCCD15DF8219F8CDFAA1FF29A8AF0D68550E2B18E7BE665F2F4709C17D97DE26ABAF661AFEBD930529ABE1979FA7D38218E2745AD8251DA9A5EC2D1EB6F6BB33B790BDFC66FDC8DEE32C7D80385437B81C1B34BF86D9EECE8ABFE6EB36E4FAD9DAF103EE0341B264C89DE23A8B430648FDD1E4562A4920F731B752D557C35982BAD6BD1FAF73E2B3D754822AE6D87E05094859F89C6203091AB9DFA22C3D0BBD532705BFA5D4A6C929365837AE0B39E41C8E1E789C97609C6293DDB4468DEBE146971ACCF6431482CFD9FA0E052520E6192F30C1146B58B2018B2FBF8E8985D5CD902D15EA38EB0D6D66258A4C30BFF91E9D3B2E14BD825966CB4DA0E30B83854D971A3DC77353FF11D010ABAF66FA451E178DAFBA6045931E289FC5490F7C017AA03060A94D65B00853DD4E2314B4DDF5AB613B26F57CF0EC0B70ECB3212C8E9F23FE7D5A40C60B4818E8D3E6022A02B4B75B4082B6AF6301E58387DF1E7D8FD6FDA822036DB26CC3F81C13053BC5A47DDFB6567DB464D1216F5D778D438D2D3B93381671FA00D120DA9B99466BE4B6E41CD8F9A2687AA2312D738C89877AA821C823632E007401EDBA3C989E7F4CAEC7369F7F4C32AD5E88FDCBB1D6726BC7035689659ECB7142200A86D4614EA230047902F4EB34667C75D8D26D5C904F97D993563842098A10AAF3EEF57BD351E5EF6B77D9216CBDEB8A9F9D83607E25E987DF7890AAEFDBF0B2B0EF1B31591A27E13C09E7667113994C07B0975419513B984D8420765D56DB567DEDC97EF4EB4B2C96B6A23A2686CED71809FF2B4818A7E6EADB10D26A8B9265A8AB40BAAF9617817A60765DC2D891089C4B512E6E740D838BAAD44969EFD2E2D30B5F1543BE8BE7F5D772658CFF7DBC9D9541CF030D9157BE9D73C42BD27099145F7495BAF7F24BFDBF4EF155A6D722F27EE5F380B278E5E34FCA545F74BEADA2CA7C56B9994041F69C40FD74812A2CAEFF11148A4853E11232C83D48D29BE81B088FE6077BFB07F3D971E03B49918DADCC24F6C1CD13C4386118A565AE368DD462FB6F506A31E0AD977473F30465084A927801273D192253FD66A3CCBE35A37BFC70FA1C3A10FCB91FC053EB6D55F1F6D279FE8BF3088A455CD9391AA945B44AC8BFA7E0DE0F3961B60F7F05CF344755DCFB15DCCF44A2E77049373CE4882F34DAA3F99D0F8F1E908EB978FC05403683FB9577E5C0C3481CA28A201FC87CF6390B02E4A47D34BF7782845962740F8D302BFAC93B61E6F222F4C0D3D1FCBF6617C949000B410CBC0FB373D4C10FF01B9435FFC840F961F6DF381269CC5AE3691CAA854B8ED40CC6359E6DAC00143E3AB1FBE0C4F3D9A5F3F40984ABF40132FCDB77A6A0F1CC637621E359C82490F7F70E7E34054DE5232BA07B9067D2FCBF219770B29061EC62088C396E4986FECE78E0F8C94B36A707EF4D2113873009E8B748A49A52ABCE4D26E3B0BDBD3D53C8BC04655DD6193F21199719B4A885E521EB34727C0B97EE188ABC5D6396E57512307DE6D4855B240523E1FE6EED3CFDDE7CC3A9138315D092B513046DC40891148C966FE21D0C35FE30BBF8F75B2C69D72D06EB87D99718EA491F6607E446A6851391584C2C73B5161A9E53ACE21BE9DEAC3DB2FD16236BB29215B8A47EF8DC4AF813EA7FC76D8952FCF5E59AB6B4A0F3D428B44CB2BA255D53D529370FD7407DF3B2F94C2AF6EEA9D8A6FA90D6C04A575B837D7B442282A3A435FE465A84ACE571DDB096C07BE614A482F67422A5B6F8AB93D7EB89A0DB6B78922F6E8BC6B3EC7B59F3CAF5F6C65C0D23C2E4689F99B44063777C5AAA86B18CD21B20E961D065AD929E05DD3431BE2F812D9876C6BB1B32535BAEF07249296FF0D836032939BC9E2749372AEDC65C0BE953DABA8A8B9E16975378B22F4C844FFBC0B40F8C6B1FC87360B590C8A8DD74F2DC3DD94CE600B32BA3AB086C96CFB5F95B7D7D4B4FFBB372BB1BD4490E59974372D7AB21444096AF323F5FE98808E6274EE691A584837F3667609E8D86E15FAD2D99787569D98E46BDBE942E62635B9AF2D1651F8369584483927A96F2EA3D66B79BFC3A6B96059E603271598089E5E2B2006DC4028DC945A5D2AE648DC7AA627596AFBBA04BF11946E3069ADE1C6E4941795B899ADBA287FA9EFAC716A737F546D423C2B969B39378546D213D227F40213FE62DAAC7697AD399C62313E68CFBB34A80D30D06BA2765BA1DE325E94B3E8B37F9D88C7790AA6917136611B45AA6CCBEEDED9AB6CD3DC0741B3ADD420C29E7AFD8B43D0A89CBB41848D27313470DD43737C1D1588F252F79B7E94926D759F0DA9BB976432EB0A0AA189F66EE4545AB2E1B73EB7325A5998FC5AD298F2DAB23E30614A7A354967B915D44AA338B17813B2D0B77CD1FAC4AA2D6CD97A0CC9EF6A21D1234C424D1BE93B41CBD02AF315B2C904E87CEC1F67A8DA111EDF547A5BDB1E5E9D27414E80175F5516E6C7DE9E5FC0C72DAC25B5799D3B07E9A5B8077611F25E3FF581E601F3B699DB5CE2ED826879DE5F395208B9D5473317656E4A4B2B3DB01279F5DB78D8D93C40E5B04C64A0D9DB6AEBD824464ABD3D62FF53C4AF9C9EADAE34A65A8B3ED00CB66A9EBA277D279E9BAC0AA02EEB687410587ECC6CC93523D29D593526DA4541719E774D4DDBCE6741DBD7BAA634F979C9A214FEAE47CFA3AAB5EB4932651DFEBF3726B52D9E9ACCCBCE6B432A795499E14888C7F964F535778F6BF4EA755A335A165DFA82A4E2B625A110A23E428CDABDA2B46D7D9627235786DEBC58A65CFDA6BB1CEB1E026972DEBB24390C04F2F6C12DD6CAC92E545BCAD98DECF81E9FDDC90EFE74629E93425DB286DBEBD6847DB0D1A466476B16B8154C26C735E66B31DCA3A681116D9862D66329F4CE693C97C62742155E537D4B9932AEB8E720B19F48C6DE3886C88079E90B1CB29AF8D8F529FEE41BA72E43599E05FDB2EB0AB22DCAEA5ACCA5EA86D302B1B8CF56E624CB79ECCBDE46DD58B28287DE73380867E80B5BFE52762BC2D720A0A8330B4F361ED709FCBCEDB7EBB3B6576AC034D211B0AE2ADB1849AD2AC30A6AD32F7257571D30B05DFB4711369BFA918ED04C6F7D5BC4663DD115EC46D75570199A7BBBCC5F9AD5376107E424E4BF35DA6E634BB3E538FB34D7E17F902B582965A6E182D75E3D831BC4603BE169A62C88C52F2180E8497A8B413C0DD384FEFF6A1F0384922D7CF11248D1354FA9E2AE90789DD59E8CD906B109614A44009650D5DD4DF2EA10EE4A3E0CC1081A3F9DE62B1CFA418FE1216B49A1DE737FD70A44EE23A1E3B21701C9E08093A3113860B5D44A2F407A61BB8EA010A6EE43BE8BD4792C68ECF6688BD8AFDD0F5374E404D02554F5398A0C1D510E99253B001211211FCA1EAF488599DD88E6BF8D46CABE6E1708971909CB118297EF2E007504D163315BB4F6114650B396C4693550CBBC8736B00DF12CF6864C3B6CE3CDCB1EBF4DBC40ADB0A07E52F8773EFF644C833C56B678C8EC50792763DC91FEC51088540F9B5170ECA073800D734E3D0E94C94787B404669F6CA6EDCA29024A809233D787046486F6DC9A048B73E1CD531F3C544F5BEA94ED98AB64775DA923391BE6FD2F36C675BA43FB24AEDAE5250BE47A31028BF8E9E678A718C4329B8AA834476E496FE4EB1576CC44F0C174EE9A819881DCF38180961BFBB02A778EC47F55F7C1C35B7D4C3180793942C6D43D488D5119E947819B2613412217F323BD4799359DB2F605D6BAFE95D3867E6D41EEA9CF9AAA9BD0BE7CB9CDA839E2F5F35C977E65C99D35DE7B8A045AE977E5CD0A6EF568E0B55F882AD3052F9FA6D28F5A07A938741A93E8D5A829483188B9250527D283561A2FA4E280B25D56D7B4BEC0EDD0774713020FDB65D1B4AB20FAA254E2B7E5BBA62E14905DBA4B00588EB67CA1E38F7E32445B118EE9C0430D447ADA0D652D63FCE20D37E8AA042D6786695746C8AAEDD07B0768EE6DE1DF27B2F9CBB8EEF36558584C31F642F1F1DF7DB2A8EB2D0FB6B7457B87533DD71EA08FA256AAA3BA79DAE989EE90A826ECB6AEA0E6B19CAF4549708BA28CBD55D1C6FD0C2CA79A2CA62CFA320AF96A0EBAA42ABBE6FC053AAD77F51538103AAA4C6837D2AC020C05611F48C5734EB994D612CC582ADAE8111DE488D1DEB32C660C4561160415754F7CE39EA31DD73EA08FAC74FBEAA9E8B032FD359F15900BFB09FA82017FB2203B9F82C808C0AF520975E595CF06599A48FD2114DA7A3D2D2CBEDA82C9374541AB7753A1250A2299274A34711316FA938AA3686A8BA10C5CF627A14551420C056D7C545D8B7A22F3DA2D58110B874AB4B25A42BEB183063FDE457CC937515156B9615F57AD7202BBF9A040B3392F25FC070B1D096D6BCCA2C26983EC9E82C027FFB19D6865465741CF4F987CE7A42B06F8CDA2CF6AAC79AD345F4B52539608DC910FB88732642D3A19C188C88F0F970D842C9B4F01DC80DA0B5981EDC019A332142FF68CEE11343B4F820192AB357D6CDCAAF960686DD900A4727BA45B530448682BC566D07875F048A0627BC2CDCF5C131171FA211CA6F48767E98A522261A1CC709D1C29008E5B16E567EB5333042D9178C4E680AEB3844E1B1256FCE29B533E452DB150C96E3DD658192B8765EB72A3EDA1954A3620BC6C57748EA38341EDDEC518BF1ADE18C4DEE7FD371780CD52C518C7123110DACAF6DA1D781E96C091AAE15BB3C4485D4943B1098A3B965A9C931637306AD327677A427791CCFDB549F6C0D50B1225576DDDD1FA0E46829335F5A394B0E303C1DC1A365AFDB014A56AFF66B5B535D76B82C6E22CA0FF02F5C6ECE0AC0E18020C9BF1E2EBF66218A3250FC3B0589BF6A401C3661751BA0551D74E35299DB288CAA2A5460824B903A9E933AC771EADF3B6E0A8B5172CC5CF4E4890B501CC63BE05D845FB27493A555B06F7C3290A94ED6FFE192C1F9F04B71356F6308104D1F0566F8127ECCFCC0ABF13EE7445B11804036C032B4879F872B86E056CF35A4CF51A809A89CBEDA747903D69B00024BBE84D70E8A546C8E1B64D84F60E5B8CF5775622311103521C8693F3CF59D55ECAC931246D31EFE853CECAD9FFEF4FF2EED8F0160E60100, N'6.2.0-61023')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201902080730036_Upgrade_ABP_To_4_2_0', N'DoAn', 0x1F8B0800000000000400ED3DD972E4B891EF1BB1FF50514FB6635C25A9A77B7A3A243BD43AC6F248DD724BE3DDD817054542256EB3C8320FB5E48DFDB27DD84FDA5F588027EE8304594535DFAA082091C84C2412C804F2FFFEE77F0FFFFCBC0E664F204EFC283C9AEF2FF6E63310BA91E787ABA379963EFCF1FDFCCF7FFAD77F393CF3D6CFB3BF57F5DEA07AB065981CCD1FD374F361B94CDC47B07692C5DA77E328891ED2851BAD978E172D0FF6F67E5EEEEF2F01043187B066B3C32F5998FA6B90FF817F4FA2D0059B347382ABC80341527E87253739D4D927670D928DE382A3F9F1FDE6245A6F9CF0057D5CC0BFD771F49FC04DF3BF67106EFA721EC3DFDFA2F8EB7C761CF80E44F206040FF399138651EAA470081F7E4BC04D1A47E1EA66033F38C1EDCB06C07A0F4E908072681F9AEABAA3DC3B40A35C360D2B506E96A4D1DA10E0FE9B926C4BBA792BE2CF6BB242C2168442A3CE890BE99A797E7A19ADE633BAB30F27418C2AE6B45FE4F5A0742CAA063FCCD0E7FF0071B4808C5947E10FB59CFCB83858EC2DF67E989D64419AC5E02804591A3BC10FB3EBEC3EF0DD5FC1CB6DF4158447611604387A104158467C809F20A337204E5FBE808712E90B6F3E5B92ED9674C3BA19D6A618CE4598BEFB713EFB043B77EE0350731F1BFA4D1AC5E0171082D8498177EDA42988430403E4F4637AA7FABA05A113A6448F6F0E548DA068C60C92F22637207EF25D80FE54EDA074432ECD6757CEF3250857E9E3D1FCE0EDBBF9ECDC7F065EF5A51CF06FA10FA73C6C94C61950F57505D2C7C81BA4AB6B074D6448F244D2D5FEDEC18F16FAFA02A084867F77824C362EF8D3425F67CFC0CD907CDDFA0D154FA18415FF1981D484769AC5A57620A4CD10DC49E043E1BED81C7B5E0C1219E5DFD9A07BD19D429CF60FDE5BE8EA631C7D43732B7C88247DBDDD3FB0C262B4A261CCE04D92BDBD3D0B5D5DACE1BF240A1DA8AB5AE80EBC792B7D7592AF17507C1DDB633D5C36CB9474F1FAE8B85F57719485DE5FA3FB82BFF2558C68902C98F6F9A2362D64755F902CA82B0BD3C6501BC18E8FE3955CFFFFF8FEED4F7ACB8D61E7B7F1CB09148A14A3F3FE3B63289FC0730A2159D1F5974E2286A598E7C9F1BD137A51086AB9F91845017042632CAE633F8A73A929B902AD6B720E35354C579F1838D656C61C988652D4D63367C8F68DC27308166A811B90A6B9342A2CE6CD06AA88BC6051B64C165C48D64CE9D9472701186F2884E52B578119B308A868FFC979F257F928F900E7B32F20C8CB93477F5322C625C35DDDE23C8ED65FA24044F9AAE2DD4D94C52E929748A7F6AD13AF40DA4D044C985E36A9993EEA1D135714EC2D340A43F04D2F8BCCA99F6C02E745D1B7A6B96BD8F745720A02B8C7E9AC940B306D2CC0BCA550E7AA17A4ABC8F31F4A61EF06A315FABBBD6458582BFA5A248EEF1358EAA6A5E4BE42B3B5D57EC6D25ED450F054270FDA1BA8576570150C349B435750F8FDBCA1FBB2E00118CACC2287CC9EB83673FDD2095799B302AAA15D46AE13F8FF2CF403A7FD64590CAC0B7A99925B35475CE991959D833868F3F80942AAB3D133594FAFDB7AE2E8B85BF09C76D59308C6A875E52EDA4D1571B7A233EB138081CD36C8350B6E30CBB6E2BB9FF6F7DEBFEF678198549642657D8AD29A383AAE08BC7EB2A05B8FCB11F14BE67BE6E7E3D89015BAE3E75EA693C27565E260507784BA518CD29207B2164CA5AFDE8617B2E9EE3849C0FA3E78F95B06D76038C555B1023687DB88627BE951855A3C01C6F7818B7053C1500C0B15247575BDD9DFFBC992773AC83CE00DD86565520CD2D97856889BEC3E71637FD37DB5A0217D072B87BDF0AAAD2F59932EDF822EDF6D35F1395E3961B98985C34A916B53A51EF036C9820761DAF65AD62788A8C6CE720A06CDA8AEFAC9DAB1D8B86648B7D931CD0CCB33E3DA8941C8CAB24248A0F696E9FDB7DB3B71EFE908693AC31EE581902CE4E9E4D10F3C28FCDC98275AEFDC35B59B7827612526D6495C9317E724C3BA98AF7DE05C61A2C6B91A5DABF5E01AC46B3F49F24DB85EB845963E4671E528609A4FA116AF32D4E222F92586B8BE76EB084DB58E33028148165C40BD0551B0285B36BFB5098858D191800844B2E002DA15029A9F871849A0825E92BB9C2251CC0927697702F55843CB7D44C99D36DD7B8E7B3905F5B1A0ECE0C6CE5DA44F51BC469E77E541513F81BC7D2C42AF31E4F80689966B23F8E6C181D36A8AE29976406218DC0D0552E47744A5661F4197315B1EA682E94E079313317644250A3BAC8C8F1D5EC1143B5A16C428B235293CE90A7C64995AC63BC7DAE448C4C81295283CB1323E8A78854EF7770A32D9B1491AEBEEB5D9243D6F161B3301114FE9D3EA25EAA3C1E16CEDF881FABA7B4F78209142542BBDB8AA38362B97EEB747F55616DA7619B4151BED268BC36DF47BED24C9B72896B95E7B3A95C9997C12850F3E9C97682A283C016FAC84A257E3FD0212900ED2E365E47E8DB2F42CF49081F65BEA9A9A8AC7AE0BE7C139A416F0E8EBE92D7C8F17498D919590FCEBC728049FB2F53D5A67BBEEAA54A8639D95A2D37D0037C0CD500017DC24AD3703DC85B8FD169D3B2E5C502D31E022C1A7920D78C76EEA3F81699737EDF2681881E3AFF9267FBE8FA8CA1B6B1FFBCC18FA7899E90E44B5DF2C60F3F79B749900B11EF79B3950C17E932EE363D7FB7E33872CDB6F722BF091EDBCDFBC8C56BE60AB59745096D3D8E59F05381565B677BE396CC1CE972EE323A6DAF9CAB0CB0FCDC57895C51446F9573E2E45912916A51B4282485383C2A52AE0A35397763E11C8B54E5BD74EDE788A1E12F7B5B538DD9C330880855DA3464FC3BC1EB8DB5E670429D7A56D6753DE789A4D3B389B72CEC06F4FBE27DDDBF5744050F53CC0954B2369D789CB1609FB1491BDA3B26E23AA7BB715B5663C4B7E8CB02A5F965DD88E5D99445622B29D8EA5B774F5DCD29BB6DFEB618BE1C348DDEE9AF3614CF70605F36DBAA63E5D531FCDD5C6FEAEA98F412FB60FF0E03C1EF7DA623B7A8E3715BD1FACA192DDEDC4432A3AED693B0B0DEB108A109A8A659F12D56E25C5C5E4C8FBAE6DCB2EEEB342138A1C686C29735ECFA962DB8956762170A3B1A5221CBBB8D2646F9D97E0398F9B932522BC64CF977776EF957DC81C7C822A2274B59C7C46076DC7AE5B84BBB43B6B2B9B4F6717E2BEB676DC961FFCFBE157433D6A318E71D008C4697D7D85EBABB98BEC184ECFF5A6B542C3614C5A4DDC572BAD66754362FDF0B7527C9F636DCDA4F77086CACB3DE586B3916A30C12ECDE5E6179CBCF96C2E8A8A8885E1CE658C3457B733671E84E9C4D9402FB4EA98A078B791A0ABA380905D9AA5658D1D155FD337A3448BEFF47AD408B615D3BB6A7AF3245B63B34490C8EF22390F9C559323BB7D82CD0A6627BD0F975C0FC4C10B5CA24B56BCA4F4C33A57005D0CA9A397BECD67B9FB1AAEE30C4989AA1F41107D2BEE07D64DD0B3F5B23674754517C7F7D113A0DA1C28BAF88BBF7A6C2ABF65995BB051C25ABE03C88CB39217684B88C3F2B5B0414AAA28287893E577A71A2EC9ABFF9B13870DC1E575CFE2388AEBCA6FE495CF9D14E33B679A2A39C93318CDF8482E6C2C3C7BEFD39872D4904B17E19313F89E684BA4C7BE124873FD518F91B9CE4DE024A83C2B7C960A7A23F6987AAAA95C4A395DBE53639A13266F8B5D0E2B9BFFA4681E7E0DA36FE1D9335AF99DA08CF02DDBBE97B745F70B81F7394BEB063FAB71C56EF60930A635B2D6BC1118AB5D542017A45D1D58184C52F6401BC0D355835FF0BAFB3A543C4E92C8F5F3E1919E0E41E656B2F3B3D09B19A5716D3617828CBBB99B1EA5F581CBCDD1FC0FCC70757BAC1F26647AA4FBD827C704FBF81C16C6E0EC38F7E2423BCC495CC763CD3548518FFC024D7780DE5AF41D744D133D0DE887296BE7FBA1EB6F9CC064241410CDED0242B2EE8E2E39051B10224BDF84873A786091022C3A75AF142D55A43B5C62B22A1761F1A3962261D27895B3112476A7494AD4DE62C1AE6C3A7D718456D5173B435A89A072FC03889F922E3A38344F136F45F2F0CBB122FE736FCA92A72EBDEA283E261CD9C3EECFF522741C420C20669C41EBF45A6DC2B72856588C869CA3BC700DB980C9165AE12569054CAE1AEC20282C0683490B4B509DAEA9E39BED490E1E3923E5323788A6A3E4F0A26E86951C0E0643490E87A03A5D53FEFDED490E13362465B53882A8A30C09438E861524111A43499388BE3AFDF3022FB62857C53B0E72A6538F3A6CCF44A29E90A030298F4CFA339148420C266CC4A0C76122E1EF714839CA7D9C637B02C67B0A8442E79A7DAFBC3F89E3906728B1E390621CB257BCB9226533F500CBF6E48D7CEE8542A4B8F6DE9F701154184AAC88118F43A0EAB773A4AC641FD2696112896072246400ED430F692819A187BDF362C2BCB52DE2AAF8E1ED86B17AD35E0273709B5C84C100F22222E8588E059877D0A55C561C0BB4929CAD1E0B8830184A72467C2CC07F9E5ECA6A9D63815632B4FD6301291A4349D3AB38166032094839AFD8BFF1A4A9277B5A98C4804267A8FD9B883C430963CBFD5BF52CD356648F730956C46ED98DD886E1D56305FAFA4C728D76306526C66100E11113762C3615E79AB282DB0ABBAAB5146DD5B612E3309C148DD8BEA22E932B382D09B06A2D3DE62154D68567F8D8273E3D753ADE76B093E882BF82CB3A46796B11DABE61AE406438891AA1715E5C26816D52D802BBD8803F8E747A8FCAC133EF9A1544B58CAA4DB869910BF8D00CAE2067700A5D46E895F0E61E4B757FB22CE3C81C0984BC97C281445428EE16284096339B07AC56840A10642C250F121D00AB0078E984ABCC59012EAD366822E53CA8AA69C3BB85ACD484799B735D019788A4E6C0652F9B1A00BCC9EEEBD4A72AE0785DAD8EE830C4F22D7DA6135E3D63E03A809540F15D330B8EB3F154C0138D586B84484FF11A17EA5EA371955A840BA10C47D40053658AE082295DF61A6044B4681C650A2092A9AFCB0FF6AA2F0F9AE8E1502DE062805A542A5FE01111AA7EDF47976FE5DB1752F6D56F6C680055D18EAEA34539D448673EF3EA31C0B1A598598004573166581BD9A50AFE5E8230DBF46E6FD404E0AC6B8C59627A510303DEACBBF4391C49250D0A8A6F0270A8A7796D80189CFAE20036308EB448E8A6BE276002BA05F18AD8D7521DB3E4C28BC5A3C06AF148522E171232E0003803C7970C4B23C6DFC2130D5B7454C8419D7354D882009C83411594B604201EDA13104078CAC5A2CE3BE5322700EF4CAB2F02B08FE509A820DF74B383106EBACDE921DC62F74694D2A012918213D1C9C19A8CE96C316C3214930250E16867C4845D2D18B6D063C5A2CEF359991380E76AC2A01038DB214369020B08C0097B63912603DFCC074DC6AB51ED4BFCEC0CB6B16804E3E54765B128337159E6A366C2B0301022CBABC5B8992822CED0E59146AC4354B1E871592687D2A37A6382614404D05BF4842133E6041868D1E3C77488A860B0E8C9C33FCCE931E4A2C7042488E8A1B70408C316CCA930E812C07B209A2584CA83AEEB43C786511F4C48C821F19AF72011BC77A885A4D0D3151247703B520CA431E827AF8564509F3D083C99ED863FCCA982F04D6D21190C74A6CA3FD78E307D68CEEAD9B1DA5354971D2E6FDC47B076CA0F874B58C5059B34730288040892AAE0CAD96C9019D3B42CBFCC6E368E0BD13FF9E3CD7CF6BC0EC2E468FE98A69B0FCB6592834E166BDF8DA3247A48176EB45E3A5EB43CD8DBFB79B9BFBF5C1730962EA19069BF56DD13541DCE0A50A5288F8307CEFD384951DA9C7B07BD1E73E2AD996A22BF98E0F0B0EA95767DB11CAC8E11AB16E877ED8A93A42D295A9EC7F0F7B728FEDAB8D0589763091AD65DAD91E7327F0E1093087153D8F8C6750227E6BC3E781205D93A143B51C5AD9BF7047118CD577D4895BB14872372A18AA1DC80F8C977CB04463828A2401FDE15481F238F05877FD78776ED201EA7F9A4C5A1E1DFF5A17D01691687651A381C1C51A00FEFEC19B819521AC5D3873844AAA805CCD3326FA1006E53AC0F9B79021987CC149AC265798E7FD787463C678C83230A4C288AF4328792F5677D58176BF82F89423C128FD0059CF276D0F97A825FC38053792043918D8DE014F69D8576B8A4B42813A0C1A8726A81A5D706AD95838A77E86FF960E326CCD7110D18FD2C28B0BBE209451C44FDD108CE71BC4A1838C54783052E86A643EE0A2516B8FAAB3EA44FD0C680ED58E54A14E8C3430622171E5160305D93E37B27F4A210D00CC40B0C16BBFABD5A62A9ABBF1A4C73E2895E62A213258610F93A4F1198BC35F5413B70FBD31FFC87FECC75880A403F0A048BEE24D64771D0670E0B6E028A1AD5638C82E70E7198A73E0A545AFBF9FAD587A828D87A91A0DF9F1F7E67C65F7248BF1F0D67EDED3558DBCED4AAE358DDC6F6F6EB526B565550C1D4DDD7408CD6E0223EACD268B9BED4A76DBD2F2C2D18296CD98FA6E9AE1F20973781F3C202220A4C8CB33ADD01699AD59F0D70232FCD10D8C9EFD32860727519596266DEB2B9CB683B97ADD1A6073E317482F9C5D05F97766FA9549AE0F71E4F4B3941F42D0E4E75A0BC7EBBC6BADE72E983AAE28B91E6F313948285557DF5F7498F8A214E7AF415E9D1E2D2CFA0BAF496718DE57DB6D0A77C48BBAE532BEC5995489618F8A84ABF30E19E2ABFE943F91550276BF9876177B0936E7905BA85BC6AD39F6E61AEEB982B1535889EF68358BF1C1B8B293558EF19DF95C86B258350B18485D494189CA0D62C6761D2656DA01E270958DF072F7FCB9C004D5C8E7B5D59D9B45FE638B8FE6A125B50A56923030BAAAFA6B10E9473AAFE68E40B0E320F785C784CA1F9EA99F0974F336FFAA4636577A187D1B7CC9DEA6EBA570D6ED7AD3A3BD146FDAD0B930E9EB489509BF01F3CE84F93701F4E30D7207A60765D7354EFDE11017782B7F0C45078E9907188BCF2ED9C724D338EC38E21679B859936BE59D66485A3E26481718C60E4D1721BB12F86CA204CBEBCE90C7AD281C42D3513EDD7324A897905A94DA012FB94D2E83421675F61AC6F7E8961B7ACBEA93F7FAF33C1EABACD7F337A44326B6CD932D14F8267B3772966D28CA748F446CD53E3730E86A77C128C22A4ADEF7D71CB7DF090FBDE53501FD4D1A61C566072E215AF9DC0FF27EFC0882E1BE76A69DFDABF41AFACBAF4E25B7D35DB373C385990B2FB86F2F3B40711439CF620BB6479B5D4E8C585F77ED7FB161A9DDFAC2F5F74A56551AF322DDC94B7817EB676FC807BB5565447BF97E32C7D8474ACBC499C78187E0D33BB87A54D1B8AD85B9BC4146D4BC7EEABDD4D16870C90FAA3C9795D92C019C49CD7555F0DA904ADD0071F4A19623E7B8027A8628EED1790809485CF2936580522F76B94A567A177EAA4E0B7945AF839C506F3C675A1849CC3D1038F732B95536C6211D4A871A36DE952036A3F4621F894ADEFD1832B049DF102134CB186A518B0F8F2EB98447BB8198AEB8076DA7A43877C10452698DF7E8BCE1D172E1F022AB3E526D0F189C1C2A64B4D20A3845B4F8086587D9DEC4E31C4C9EE7C2576A7F0E1649BC667F15C7E3B0B54D076D70FB8ED84E2E483675F8EC03E1BC2E2C447E3DFA709643C81840F0EDB9C4045A288761348D0F6FB9840F9E0E1B727DFA3ED34AAC8C0F22BDB30771588829D12D2BECF8CAB3E5A8AE83863A6EC48A89DC8AB491D03EC31EAFE04BDBDB36CB4AE7A4B41C59D0F75A6AB5DD334C78478A80B5E827C56E60A4017D0AEEB83E9DAD87465C1E6B5B149A7D513B17F3DD65A6FEDF84377629DE772821E8882216D9893280C218390F32F8D998823B6743ACC9E0EB335A46AD2A054FECF7E4F3AAA3CA2ED0E3B84AD77DDF0B3B311CC8F24FDF02B0F52F57D1B1111F6E31826453A29D2912A5232FBF100BE8D2A8B7207178710C4AEEB55DB66AA3D3D8D7E7D8EC59A5154C7C429F93D66BBF8021226E0B9FA3684B6DAA26619EAD88EEEABE5A19D1E985DD730763402E700938B1B5DC3E0502975523A6AB3F8F4CA67C59037F179FDB59C19E3BF916F67664CEF5EECA085CBA405A4ABD4BD975FEAFF755AC032251F912B30A703CAFC978F3F29D303D239FA8A2AF35915120215D94B02EDD305AAB0B8F9475018224D852B28200F20496FA3AF203C9A1FECED1FCC67C781EF244506C732FBE007374F02E584619496F91D35D211EEBF41E90881B75ED2CDCD931A222849E2059C9486884DF55D883263DF8CEEF1C3E94BE840F0E77E0077AD7755C5BB2BE7E52FCE13282671E59368B416D12A21FF9E82073FE43CA57FF82B78A125AA92DE2FE06126523D874BBAE121477DA1D11ECDEF7DB8F5807CCCD5E32F008A195CAFBC6B076E46E2105504F940E6B34F5910A0E0E7A3F9831324CC14A37B689459D14FDE0943CB8BD003CF47F3FF9A5D2427012C0431F03ECCCE51073FC06F50D7FC2303E587D97FE348A431EB39A771A8262E39523318377886C20250F8E4C4EEA313CF6757CEF3250857E92314F8B7EF4C41E3D90AED42C633174A20EFEF1DFC680A9AC86248C2FEDDDA79FEBD293C2A876101D1833298E6FF0DA58E93B910133F4360CCF64D42CA77C684C47772321E1DBC37854C6CEA24A0DF22156DCAAD3A9FA14C62F7F6F64C21F3921A7699B7FC24865C61D0E21696BBB0D3C8719340BA022972FD8D796DA81307EA0BA72EDC2291A0422FE92D607532C1025AB27682A08D1A211209D2FA4DBC22A2C61F6617FF7E8725FABBC360FD30FB1C43BBEBC3EC805C18B5702292118A75AED644C3F3105672235DEBB547B6DF62644D26C30297D40F5F5A297F623BD17159A23612FA7A4D5B5BD0B9AD14562B59DD92EDAAEA949BBB6FA0BE7919C026937DF74C76537B486B605C6B55BA6E8F4845708CB426D6488B91B53EAE1BD61A78CF9C83D4B3439D58A9ADFEAA4C749A2AE8EE267A488BD3A7F14CFB5EE6BC72BEBD3137C3882779B4F74C5AA0B133432D53C35847E90D908C58E83257C948856E96183F36C1164C3BE3DD0D9DA9AD5778F9E79427826C9B818C1C5ECF93A61B9575636E85F4A96D5DC5414F8BC3293C4120A6C2A775605A07C6B50EE479F35A6864D46EDA79EE9E6E26F306DAD5D1D54B6996F7B5F93D7D7DCF51FBBD72BB13D4490F59D743F250AE21544096CF323F9FE98809E63B4EE682A544827F3617609E8FA6956792BC7169D98F46DDBC944E62635F9AF2C2651F8369444483937A9EF7EA2E66B793FC3AD39E156F3595BDCF024C2C7F9F05682356684CFE3A9575256B3C5613ABB37EDD055B8A2F301A27D0F4E270472ACABB4AD5DC153DD4E7D43FB6D8BDA917A21E11CE5D9B9DD4A36A09E911F9030AF9312F513D92E94D671E8F4C99735309AA9438AFD15895F76BDE1F576F7AB58FA7E345918BA4B0C329E028BDB8ADE798F1FC1AC817C1743B4647C46B9ECF4DD646632BAD6ADA254CA078C05DB6617CDB9B2BA4CD59DBE471984EFA86D4F3D76C722F85C6655A0CA4E9B9E9E506EA9B9B066DB21E776FB5E94927D7B932C76EFF69D9DB1A4B73D1AACBC2DCFAEC86DAFD8E2574506B936A7153AAD5D5188DE55E74179110D1C2F1389D0DD16EE4E32834EDAE4574562917BB450395B9165F754891861226DA77D2C5A3DF1E68508B05D2694B3B9825A13134A2BDFEA8B497CD3CB9A28E793EE04E6094CB665F563F2FE3A4E5582151CA49CBDDF0B34E6A2F43BA466F2F24DA058BA057E6F46113D4992EED826DF25E5ADE870A325F4A6D30E3C0694EFA4BBB1D707260765BA239892FDB3B8FD85497ED4D3D22C3A5B6A5AC17DDCE4F70D91E572AABA5ED607C36B365170B9ACE65D90556F5F0F764D14F16FD64D10F64D117C92A756CEDBCE674D2BE7BD65E4FE7B79A2F26D5793DF5CD4CBDC7929A1C9FDF5F906C9305536766E635A79939CD4CD2B82792855ADE005DE389433B6D308DE68496EBA6AA38CD886946D88D671CD92AA21B473245517C6FF3C58A5BD1DA65D3CE4F494ED168D6758720F7A7DEAB6B74B3B16A965771356BBA7E0BA6EBB7435EBF1DA5A6D3D46CA37438F7621D6DF7CD4122D1945DA7A112669BFD329B2855D6418B57DA27F7C9E43E99DC2783BB4FAAD4A83A675265DD512E2183EEB16D6C910DF1C073B976D9E5B5092BEA33A247F381BE5D57FBDF9BE2DE55AD6BD7B955E53FD5F671950DC67A9C30A6834AE628F1AEEA459486A2B3D9AEB1A463EDEFF8A95CEF8AACA4C26757DA458A76388265E9B6DFEE18981DEB4024641F7F796BACA1A6C44A8C37AACC9E4B9DB5F4C2C1376D223BDA2F2A462B81F11133AFD15857845771C0DC5541E60973EF7079EB940F889FD2D712BDCBE4BE66275EEA71B6C9E8249FA056D052EB0DA3A96EFC920DAFD180B78BA6176D46A9790C0732D0235543EFA7777B53789C2491EBE70892FE042A615795E687C4EE2CF466289A074B0354A084F20E2FEA6F57D006F2D173EC1081A3F9DE62B1CF2429FF1C16BC9A1DE787F370A44EE23A1E4B10380E4F84049D8A0DC3852E2251FA03D30D9CF5003DB5E43BE8564592C68ECFE698BE8EFDD0F5374E401181AAA7A94CD0E06A8874C929D88010A908FE50757AC41C456CC7357C8ADA2A3A1C2E3109920B16A3C54F1EFD009AC962A162D7298CA36C2147CC68B68A611799B20DE05B9219A69B0184873B769D7E9B97CBB62241F94DE33C203D11CA4C713B1AE363F181E45D4FFA07BBC74121507EED4582F2010E2035CD38743AAB96A82D0A4AB3567693168526414D18EDC18333427E6B6B06CA30D91ED731F7C5C4F5BEB94EF98AB6C775DA9333B1BE6FD6F37C675BE43FF24AEDAE51505E21A31028BF8E5E668A718CC328B8AE9FACEC282DFDED62AFD9F747315C38A5A31620763CE3102484FDEE2A9CE27E1ED57FF171D4D2520F631C42528AB40D55233647785AE275E886D16884FC96EB50FB4D666EBF8279AD3DA777619F99737BA87DE677CDED5DD85FE6DC1E747FF95DB37C67F69539DF75B60B5AEC7AEDDB056DFE6E65BB50BD38B015412A2FAC0D651E54D7E83028D5A7516B9072106331124AAE0F65264C5CDF0963A1E4BAED6889DDE1FB80210E06ACDF766843C9F641ADC469C66FCB562C22A9609B14B600717DB3D803E77E9CA4E8F9847B27010CF7512B68B594F58F3328B4971134C89AC8AC928F4DD18DFB08D6CED1DCBB4771EF4570D7F1FDA6AA9070E483ECE5A3E37E5DC551167A7F8DEE8BB06EA63B4E1D41BF444D75E774D015D3335D41D06D594DDD61AD43999EEA12411765B9BA8BE30D9A58B94C5C3AE12A735680C7415E2D41D75585567DDF82E754AFFFA2A6020754498D077B55804180AD22E819AF68D6339BB45C8A055B5D0323BC911A3B7E165E062B7E350136BCCAE6986860A18D81BA77CEA693E99E5347D03FBE0757F52CA0B894C27A142D56680672F159001915EA412EE3C3B8E0CB32491F65489C4E47A5CF99DB515926E9A874B3EB7424E0445324E9468F2362D9524954ED965175217A7C8BE951545180005B5D171761DF8ABEF49856BFA2C0E55B5D2A615D59C74018EBCBC76299ACABA844B3ACA8D7BB065BF9D5245898B1947F17878B85B6B6E6556631C12C5BC67A1244FECFB036A451A5735580BFFDAD09827D630C78717C3FD69C2EA20F50C9016B10431CADCE218466683B311811E3F3E1B08512B2F043D90DA0B5200F1E8ACD218830529BB30DC6102D3E4886CAAC9575B3F2ABA5816167B5C2D189CE732D0C91E120AF55DBC1E14792A2C1098F2D777D70CC118C6884F2B39A9D1F6669888906C70987B43024C278AC9B955FED0C8C30F605A3133AE53A0E51B86DC99B734AED0CB9B4760583E5C49959E0246E9DD7AD8A8F7606D598D88271F143A33A0E8DC7377BDC62A27C3863934702751C1EC3354B1C63025A4403EB6B59E875603A4B824690C72E0F51A135E5A10CE6686E596B721CEA9C41ABDCEE1DF9496EC7F336D5275B0354CC48958779F70728D95ACA1CA956F692030C4F47F168790E778093D5FB01B5D7AB2E3B5C162711E507F8174E376705E0704090E45F0F975FB210BD7750FC3B0589BF6A401C366FF23640AB3AE8C4A572FC51185555A82712AE40EA784EEA1CC7A9FFE0B8292C46C93073D593673D408F38DE03EF22FC9CA59B2CAD5E0AC789819C86B2FE0F970CCE879F0B27818D2140347DF444C4E7F063E6075E8DF739E7DD170108E48D2C1F19F1F3B78E21B8D54B0DE953146A022AC9573B516FC17A134060C9E7F0C641CF1C9BE30605F612AC1CF7E5BACE8A2402A2660449F6C353DF59C5CE3A296134EDE15F28C3DEFAF94FFF0FE6E2FC1E5CF40100, N'6.2.0-61023')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201905080308372_Upgrade_ABP_To_4_5_0', N'DoAn', 0x1F8B0800000000000400ED3DD972E4B891EF1BB1FF50514FB6635C92FAF24C8764478D8EB1ECEE96ACD27837F645419190C46D1659E6A196BCB15FB60FFB49FB0B0BF0C47D9020AB58CDB72A024824321389442281FCBFFFF9DFE33FBDAC83D93388133F0A4FE6478BC3F90C846EE4F9E1E3C93C4B1F7EFFE3FC4F7FFCD77F393EF7D62FB3BF57F5DEA27AB065989CCC9FD274F3F1E020719FC0DA49166BDF8DA3247A48176EB43E70BCE8E0CDE1E14F074747070082984358B3D9F14D16A6FE1AE47FE0DFD32874C126CD9CE073E4812029BFC392550E75F6C5598364E3B8E064BEBCDF9C46EB8D13BEA28F0BF8F73A8EFE13B869FEF71CC24D5F2F62F8FB5B147F9DCF9681EF402457207898CF9C308C52278543F8F86B0256691C858FAB0DFCE004B7AF1B00EB3D384102CAA17D6CAAEB8EF2F00D1AE541D3B002E566491AAD0D011EBD2DC97640376F45FC794D5648D8825068D43971215D33CF4F3F458FF319DDD9C7D320461573DA2FF27A503A1655831F66E8F37F80385A40C6ACA3F0875A4EDE2DDE2F0E17873FCC4EB320CD627012822C8D9DE087D975761FF8EE5FC1EB6DF4158427611604387A104158467C809F20A337204E5F6FC04389F4A5379F1D90ED0EE8867533AC4D319CCB30FDF06E3EFB023B77EE0350731F1BFA2A8D62F00B0841ECA4C0BB76D214C421820172FA31BD537DDD82D00953A2C7B76F548DA068C60C92F2262B103FFB2E407FAA7650BA2197E6B3CFCECB27103EA64F27F337EF3FCC6717FE0BF0AA2FE5807F0D7D38E561A334CE80AAAFCF207D8ABC41BABA76D04486244F245D1D1DBE7967A1AF1B002534FCBB1364B271C19F16FA3A7F016E86E4EBD66FA8780625ACF8CF08A426B4B32C2EB503216D86E04E031F0AF7E566E97931486494FF6083EE45770A713A7AF3A385AE7E8EA36F686E850F91A4AFF7476FACB018AD6818337893E4F0F0D04257976BF82F894207EAAA16BA036FDE4A5F9DE6EB05145FC7F6588F0F9A654ABA78FDECB85F1FE3280BBDBF44F7057FE5AB18D1205930EDF3456D5AC8EABE2059505716A68DA136821D2FE347B9FE7FF7E3FB3FE82D37869DDFC6AFA75028528CCE471F8CA17C012F29846445D77F7212312CC53C4F96F74EE84521A8E5E6E7280A80131A63711DFB519C4B4DC915685D9373A8A961BAFAC4C0B1B632E6C03494A2B69E3947B66F145E40B0500BAC409AE6D2A8B098371BA822F28245D9325970215933A5673F3B09C07843212C5FB90ACC98454045FB2FCEB3FF988F920F703EBB01415E9E3CF99B12312E19EEEA161771B4BE890211E5AB8A77AB288B5D242F914EED5B277E0469371130617AD9A466FAA8774C5C51B0B7D0280CC1B7BD2C32677EB2099C5745DF9AE6AE61DF97C91908E01EA7B3522EC0B4B100F396429DAB5E903E479EFF500A7B3718ADD0DFF12523FF70FAE4848F40A5348ABA7FF6619DF87581B79CEC518A4D3955EC70BC00855BB7F9CA8451BF2834DD966300E00AA4A68E0EB8060A4741BDB3B1496E04F80222A8DA97FF6463AFACB7EB14DA17D5DF82D409DFCEC09871C734C0CC0C493DD6CA9055EE6664E41F48906D940709615222E219DA757A7E01DF54BE433B8EA5ABD87FF4432718A6B7EAAF420FFC64C5DB5BFEDD35DDD36AA95FA1B9DF76B5878DA7B9BA3DDFEDFE7AC0AD9ACAE72F290891742A5CBF76CE4C3ABBA93BBAC96F8093C8BDF9568EBC7A3B3114BB6730C5A3369EA06ABAA35AF0AD27A6A2D47C626B77B29F2C38E8FAF2CC2DEF1358EAA6A538ECA1AA6E25C296D49FA10A531951DAA7567BE5E52E186836873E43E1F7F386EEEB82076028DF36396436CCA599EB9FA0A2C91CF5C6EA53E43A81FFCF423F70DA4FEEDC8175412F5372AB3E60576A59D8B1FD2E1338448454674FF3E4B2DE6F973547C7DD8217E57E56A527118C51EBCA5DB49B2AE26E4567D616FDC0661BE49A858D98655BF1C31F8E0E7FFCB19F056252590A95F5254A6BE2E8C47FE1F59305DD7A5CCEB75F32DF33F7576343B6E3DC355DFBE54E2393A82E7547A81BC5282D857DD682A90C90B611FAD974B74C12B0BE0F5EFF96C135184E715580B6CDE14A0F25AD1C0DACC0336002CE70116E2A188A61A182A4F1856F8F0EFF60292438C83CE00DD86565520CD2D978568855769FB8B1BFE9BE5AD090BE8395C39E877AEB4BD6A4CBB7A0CB775B4D5CC58F4E586E62E1B0527454A1520F789B64C183306D7B2DEB134454E30865269282645457FD64CD2D36AE19D26D764C33C3F2CCB8766210B2B2AC1012A8BD657AFFFDF63CEE3DB990261FF6281D42B24086D3273FF0A0F073631868BD73D7D46EE217849598D805714D5EDC820CEB62BEF6817385891AE76A74ADD6836B10AFFD24C937E17AE11659FA14C5D54101D37C0AB5D8CB508BCBE49718E2BAEFD6119A6A1D670402912CB8807A0BA26051B66C7E6B1310B1A22301118864C105B42B0434F7871849A0825E92077444A298134ED2EE14EAB186964788923B6DBAF71CF772066AB7A0CC7163E701882F51BC4627EF4A47513FB727FB5884F6F19EE70A89966B23F8E6C181D36A8AE29976406218DC0D0552E47744A5661F4197315B1EA682E94E079313317644250A3BAC8C8F1D5EC1143B5A16C428B235293CE90A7C64995AC63BC7DAE4E087EDE7BD1095283CB1323E8A78854EF1F80599ECD8248D75B76F3649CF9BC5C64C40C4539E69F512F5D1E070BE76FC407DC3AA273C904821AA95A7B8AA38362BF7BCB647F55616DA7619B4151B6D95C5E136FABD7692E45B14CB8E5E7BF2CAE44C3E8DC2071FCE4B34151427016FAD84A257E3BD01094807E9F153E47E8DB2F43CF49081F66BEA9A9A8A4BD785F3E002520B78F49B602DCE1E2F931A232B21F9D74F5108BE64EB7BB4CE76DD55A950C73A2B45A7FB0056C0CD500017DC24AD3703DC85B8FD165D382E5C502D31E032C1A7920D784B37F59FC1B4CB9B7679348CC0F1D77C933FDF4754E58DB58F7D660C7DBCCC7407A2DA6F16B0F9FB4DBA4C80588FFBCD1CA860BF4997F1B1EB7DBF994396ED37B915F8C876DE6F7E8A1E7DC156B3E8A02CA7B1CB3F0B702ACA6CEF7C73D8829D2F5DC6474CB5F39561973BCDC57895C51446F9573E2E45912916E531840491A606854B55C047A72EEDEC11C8B54EDBA39DBCF1143D24EE6B6B71BA396710000BBB468D9E8679B27DB74F9D11A45C97B69D4D79E36936EDE06CCA3903BF3DFB9E746FD79383A0EA79802B9746D2AE13972D12F629227B4765DD4654F76E2B6ACD7896DC8DF058A6F358D88E5D99445622B29DDCD25BBA7A6E2991C8F7EA6C317C18A9DB5D733E8CE9DEA060BE4DD7D4A76BEAA3B9DAD8DF35F531E8C5F6011E9CC7E3F62DB6A3E7785351D2160D95EC6E271E52D1694FDB596858875084D0542CFB94A8762B7905A783BCEFDAB6EC727C566842D1011A5BCAF8EB39556C1FA2955D088ED1D852118E5D8ED26409A64AF09C8C526489082F59CEA8CEC77B651FB2033E411511BA5A877C468EB6A5EB16E12EED7C6D65F3C97721EE6B6BEEB6DCF1EF875F0DF5A8C538C6412310A7F5750FD757F323B2259C9EEB4D6B8586C398B49AB8AF565ACDEA86C4BAF3B7527C57B1B666D27B384375CABDAFE948864CEA720312ECD25C6E7EC1C99BCFE6A2A8885818CE2F63A4B9BAF99C7910268FB3815E68D53141F16E234157470121BB344BCB1A3B2ABEA66F468916DFE9F5A8116C2BA677D5F4E649B6C66689207BFA657211388F498D937CDA1040127E46F64E7A1F2EB91E888357B84497AC784DE987753E037431A48E5EFA369FE5C7D7701D67484A54FD1904D1B7E27E60DD043D5B2F6B43575774B1BC8F9E01D5E68DA28B3FFB8F4F4DE5F72C730B364A58CB669235E3EAF9339CF0909B595264E2F241C264A71D96ABB9ECA3F958924541C25F371E51FD485EBD9EED15D15BD09C7FE8664677C9ABBF25C461A95ED87D7A245F65F97D355D92FF9B1387227AD375CFE3388AEBCA6FE5952F9C149B6B1CD5A8E424CF4837E323694CB0F0ECBD0964CA51432E5D86CF4EE07BA26DA81EFB4A20CD95533D46E6EB5C022741759AC567A9A037625FAFB71C94E60BA7CB0F6A4C73C2E46DB10B7965F33F289A875FC3E85B88925BC6A1139451D565DB1FE56DD19D4EE05D6569DDE02735AED86D4A01C6F42AA8356F041B842E2A900BD2AE0E2C8C54297BE0DAA3BDF2DCE0758F74A8B84C92C8F5F3E191A74B649AB9FA4089ECFC3CF46665724B59AB3BEAC1813CC926AFC17C968746A0544A70B93999FF8E19AE6E8FF563904C8F741F47E498601F5761B124CF96F9C9395CFF9DC4753CD6448614F5C82F70BB04D0FB96BE83AEC6A2E718FD3065F7567EE8FA1B273019090544738B8690ACBBA34BCEC00684687765C2431D3CB0E80C169DBA578A962AD21D1F60B2AA106149A27AB104CBB2DBF30418ABDFAB4C69A2C893F8BC3E59513DC5DAC9B006F58610610D0A694930066727C498CD43AC232492A4C47C41CED3B80F2ECBE26CC89AF3AD072116926E602916D2C6548C21A0AD49B2F865679178683C4DDD8806EB6E25C5E370B160B71A3A7D71C450D5972551548E7F003154D2450787E67DFEAD481EFE428488FFDCE722C8A387819422EF710A0A93F212792F42C721C40062C619B44EAF95277A8B6285052ACA39CA8B59940B986CE7237C29440193AB063B080A8BC160D2C21254A76BEA0C637B9283878F4AB9CC8D24ED2839BCD0D361258783C15092C321A84ED75490DBF62487899D95B25A1C46DB51868471B7C30A92088DA1A449445F9DFE79D1875B94ABE2312339D3A9978DB6672251EF285198943EECFE4C24921083091B31E8719848D8BB5272D9BAE6BD50B53D01BBE6BC8745A173CD26EDE84FE238E4194AEC38A41887EC150F8F49D94CBD42B63D7923DF3CA31029DE7EE94FB8082A0C2556C488C72150F503725256B2AFC9B53089443039123280F6A18734948CD0C3DE793161124E88B82ACE3ED130566FDA4B600E6E938B3018405E44041D8B5B80490622E5B2C22DD04A72B6EA1610613094E48CD82DC0CFD12265B58E5BA0950C6DDF2D2045632869DA0BB700934E47CA79C5FE8D274D3DD9D3C24C3E143A43EDDF44E4194A185BEEDFAAB709B7227B9C972044EC963D0BD130BC7AB1475F9F49DE92184C998971184078C4841D8B4DC579AB43C16D855DD55A8AB66A5B8971184E8A466C5F512FAA28382D89786D2D3DE631ADD68567F860543E3D753ADE76F4A9E8951B0597758CF2D622B47DC35C81C870123542E3BC0CE38BC214B6C06EF7E12F049EDDA372F0C2BB6B0C512DAF3924E5E301B4B820F8D00CAE2067700A7D8A50AA8CE63267F5884059C6913912087939930389A8505CF652802C67360F58AD08552088185A0E1C22CA540B181D602E024AC7611B600ABFAA905D715EEBA2419291FD3C88F4750C05C04FB0E7CCE10F7AB9415A2417C0AA9A36BC5B28C79A306F739157C025EEF570E0B2CF4D18005C65F775F2731570BCAE5647740C6671A8C576C2AB670C5C07B01228EE3260C17176DD0A78A2116B8D1029695EE362ADD3685C2517E34228633135C054B9A2B860CA78050D30225A34A7840A2092A9AFCB0FF6B10F1E34D1D3E15AC0C500B5A854BEC1272254FDC29F2EDFCAD7AFA4ECAB5FD9D200AAA21D5D478B72A891CE7CE6D56380637608B3FA0A2E06CEB036B22B7EFC8D1461B3EADD25AC09C059D7189BCCF4DA2006BC313A68272449251D0ACAEEA5F108A87D8F8D1CA2CE4D367C84A44D24239ECE053406323352AB84646F462928A9B84A251CB0F83295809685D5A6494EF11D285D4EB5A0A3F85E0E87869A97788811AAAFF160A3E3A82F09F1D4B7764C40B7205E11895EDA072CB9F062F128B05A3C9294F68B840C3800CEC0711BC6D288F1E79945C31639EE39A8731CF72D08C071D3ABA0B42500F1F6B38000429F338B3ACFE76C4E009E87B92F02B0EF370BA8207781B18310BAC0CCE9217478F54694D2C2179182135FCDC19A8CB06E316C32309A0250E16867C4C4464F306CE1F9318B3AEF04D99C00BC835F0C0A81B31D32947B3201013841A82CD26418AAF9A0C9E851AA7D899F9DC13626B660BCFC18491665264AD27CD44C50240642B41568316E26A68F337479DC1F81BA30F20FC39ECB3239941ED51B139A262280DEA2270C603327C0408B1E3FC24A440583454F1E8C654E8F21173D263C48440FBD25401844644E854197005ECE129610AA7816DE919D4247D49E32093924312C3D48042F358A90147ABA421296D18E1403690C3A0B8B900C6A679820AEA0DDF087717309D3BC08C960A03355A7E5ED08D387E6AC5EC2ADCF6DEBB2E38395FB04D64EF9E1F8005671C126CD9C00220182A42AF8EC6C36C88C695A965F66AB8DE342F44F7FBF9ACF5ED641989CCC9FD274F3F1E020C941278BB5EFC651123DA40B375A1F385E74F0E6F0F0A783A3A3837501E3C02514327DCA5CF7045587F308A852945ACC03177E9CA42893E3BD831ED73BF5D64C35D129B5C09B5DF54A1F44B31CACFCDA550BF4BB3E189764D22B5A5EC4F0F7B728FEDA1C68B30100256858F7718DE208F217AA31891037858D57AE133831E741ECD328C8D6A138A441DCBA79E21A87D17CD58754052FE07044010D62282B103FFB6E995313074514E8C3FB0CD2A7C863C1E1DFF5A15D3B88C7693E697168F8777D683720CDE2B0CC4C8C83230AF4E19DBF0037434AA3788D1B874815B5807956A6D216C06D8AF56133593970C84CA1295C96E7F8777D6844860D1C1C51604251A4973994AC3FEBC3BA5CC37F4914E271B1842EE094B783CED713FC1A069CCAC38A8A04C104A7B0EF2CB4E3034A8BD29AFC8051E5D4024BAF0D5A2B07157DD4DFF2C1463199AF231A30FA59506077C50BD33888FAA3119C65FC9830708A8F060B5C0C4D87FC6C9E58E0EAAFFA90BE401B03B663952B51A00F0F19885C784481C1744D96F74EE84521A0198817182C76750A0562A9ABBF1A4C73226B0431D1891243887C9DA7B826B035F5414714F4A73FF8EF209BEB1015807E1408166B4DAC8FE210EC1C16DC041435AAB7AA05AF41E330CF7C1439B7F6F3F5AB0F5151B0F53241BFAF1E7E63C65F7248BF1D0D67EDED3558DBCED4AAE358DDC6F6F67EA935AB2AA860EAEE6B20466B70111F5669B45C5F6A6F5BEF0B4B0B460A5BF6A369BAEB07C8E54DE0BCB280880213E3ACCEC9439A66F56703DCC82B6C0476F2DB6D0A985C5D46969899B76C3A5DDACE656BB4E9814F0C9DAB3562E8FBA5DDDB2A154550A335CD82F5D346BD489BF7A363CACC61AC7460DF8DA1313B67FCBB810D4D468132B6345B6C0A9B0FB20D2434B68B2C085855CB2BEFD3DADCEA1C53C762DB9D6BD4D5B1B6734E05A6A73D2226C032E136B41AC037CEB6A0F9AA0FE92AF61FA1811870C0514526EE98E22F3B4FC8127388E219C8AFB1B773108BB11F66A95B71AF299BAC765C08FD4C3ADB0721E338FEB16F06A2BC78210A1662CF3DA8A25D3AAAE9F7A8E90638097D22567DDBFDC3EC2D29ADE6AA748FA10C9C2BD72DA21A74A0ECBFD3D1BA53C1A5E74CF1C5C82DE127286537EB97A8BF4F4E0E31C4C9C9B1074E0EF289884175E92D13B796F7D9429FF221EDBA4EADB06755225962104056066D12B163E5377D287F05D4B177FE61D8E3A549B7EC816E211F66E84FB7308F3B982B1535889E0E6BB07E393616536AB0DE331B2CD37D15AA5FB18485D494B4717AB230E9B23650974902D6F7C1EBDF322740139713FBAAACBC0D67F00A3C0336DAA8F96ABA774B789B37233FC2F98B1B641EF0B8F09842F3D533E12F9F66BE8E49C7CA5ECE1A46DF322F7075D3BD6A70BB6ED5D9B90AD0DFBA30E9E0499B08B509FF79BCFE3409F7993D730DA20766D73547F5443CE107163C1B2F8642D38286C82BDF8E976B9A711C760C39DB2CCCB4F1CDB226813A75890D185FE0893C5A6E2336B9860CC2146837F9A0271D483C2161A2FD5A5E21B8A6DFCC6D738B8001323E4DC8D95718EB9B5F62D82DAB6FEACFDFEB4CB0BA6EF3D32B8D48668D2D5BE66A8220C3D42E5D6832E32912BD51F3D4D8CFC1F0944F8251DC37E97B5FDC721F3CE4BEF70CD48E3ADA94C30A4C3C5EF1DA09FC7FF21C4674D938574BFBD6FE0A252471E9C5B7FA6AB66F7870B22065F70DE5E7690F228638ED4176C9F26AA9D18BD7A8FA5DEF5B68747EB3BECEA22B2D8B7A9569E1A6BC0DF4F3B5E307DCC067511DFD5E9659FA04E9589D2671E261F835CCEC1E96366D28626F6D1253B42D1DBBAF76AB2C0E1920F547137F5D92C019C4F8EBAAAF86548256E8830FA50C319F75E009AA98637B031290B2F039C506AB40E47E8DB2F43CF4CE9C14FC9A520B3FA7D860DEB82E94900B387AE0719E8CE1149B5804356ADC685BBAD480DA4F5108BE64EB7BF41A224167BCC00453AC6129062CBEFC3A26D11E6E86E23AA09DB6DED0211F449109E6B7DFA20BC785CB8780CA6CB909747C62B0B0E95213C82837F533A021565F27BB530C71B23BF7C4EE146635B1697C16C9D5DA59A082B6BBEEE0B6138A930F9E7339BDF96C088B131F8D7F9F2690F104126603B139818AB482ED2690A0EDF73181F2C1C36FCFBE47DB69549181E557B661EE2A10053B25A47DFB8CAB3E5A8AE83863A6EC48A89DC8AB491D032C534C7F82DEFEB06CB447F596828A3B3B75A6AB5DD334C78478A80B5E82ECC7E60A4017D0AEEB83E9DAD87465C1E6B5B149A7D513B17F3DD65A6FEDF82BD4629DE772821E8882216D98D3280C2183D0E15F1A3311476CE9E4CC9E9CD91A523569D0624BB2745D7440D8B7A7A3ECA6A5B343D87AD70D3F3B1BC1DC25E9875F7990AAEFDB8888B01FC73029D249918E5491E6BEF1659A82F5A6776D8AF7D5E588430862D7F5AA6D33D59E9E46BFAE62B16614D53139941CC35BA4B65F60BD010913F05C7D1B425B6D51B30CE5B6A3FB6AE9B4D303B3EB1AC68E46E03830B9B8D1350C9C4AA993D2519BC5A73D9F1543DEC4E7F5D772668CFF46BE9D9931BD7BB183162E93B39BAE52F75E7EA9FFD739BBCB7CD94422EF9C0E282D773EFEA4CCDD4D27D02EAACC675548085464AF09B44F17A8C262F58FA030449A0A9FA1803C8024BD8DBE82F064FEE6F0E8CD7CB60C7C2729D2AB97A9C13FBA798656270CA3B44CBEAE912BFCE82DCA150EBCF501DDDC3CE3388292245EC0C9378ED854DF8528D369CFE81E3F9EBD860E047FE10770D77A5755BCFBECBCFED97906C524AECE241AAD45B44AC8BF67E0C10F3979AE8EFF0A5E6989AAA4F7063CCC44AAE7F8806E78CC515F68B427F37B945502F231578FBF00286670BDF2AE1DB81989435411E40399CFBE644180829F4FE60F4E9030538CEEA15166453F79270C2D2F430FBC9CCCFF6B76999C06B010C4C0FB38BB401DFC00BF415DF38F0C941F66FF8D2391C6ECC9398D433571C9919AC158E1E9C30B40E1B313BB4F4E3C9F7D765E3E81F0317D8202FFFE8329683C95B85DC8785A7109E4A3C337EF4C411329C649D8BF593B2FBF35854725182F207A5006D3FCBFA1D471D28A63E267088CD9BE4948F9C19890F84E4EC6A3373F9A4226367512D0EF918A36E5569D6C5C26B1878787A690796920BACC5B7EDA0AAE3068710B4B2CDE69E4B849205D811489B8C7BC36D459BDF58553176E91E55BA197F416B03AD377012D593B41D0468D1059BE69FD265E1151E38FB3CB7FBFC3B270DF61B07E985DC5D0EEFA387B432E8C5A381199C2C53A576BA2E149C22BB991AEF5DA233B6A31B226CD78814BEA87AFAD943FB19DE8B82C511B097DBDA6AD2DE8C4B30AAB95AC6EC9765575CA4DAC3D50DFBCF4BC93C9BE7B26BBA93DA43530AEB52A5DB747A42238465A136BA4C5C85A1FD70D6B0D7C68CE41EAD9A14EACD4567F559A684D1574B78A1ED2C2FB349E69DFCB9C57CEB7B7E66618F1248FF69E490B34E633D432358C7594DE00C988852E73958C54E86689F163136CC1B433DEDDD099FA7AA5F0C016396A95CA05AB3CD91614ABB0E4D65DB98E65B6EE66E3E30C2BD3599354D0593369189D762F4D243BAD37B551410DAB94BB77153C72B388E9E077C6DE25B697DE903DA2903DFAC9D86135BC4D6BA85B2A7C8D740CD968D235E269DD794E779CD04D1270BB8E582A1BB85DE0D55FA505F793F9C944F957AE3FF67CCE3719B84D4C0A587F9AE9839D748CF5F0476E606B28BF6AF6DCE1903A399BA9E4E4160E0D2D1FEED83E7BAA1290B7308B6AEA173084765B8B43E13ED4A206E647B6CEED4DA8574010496D0705CE4B48AE0C1161DB0CE4F5E6F53CB9BE46E5EE36774BF7E97E731527FF2D162C3C633CE6D39B1C83936370871D83A244EA2D34326A3719F6BBA79BC944F2767574F574B6E583CEFCE136FD50C2F687A7ED426A263D645D0FC9EFF60CA102B27C96F9F94C474C307791312FEE687B9CF416655BBB4EF2091ECB8195D4533CD2496C1C5CA97C81A78FC1F04E313AF90E9BC779BA1DFBD4A9D7AD842F53E9DC2DC0C412BA5B80366285C62434575957B2C66335B13AEBD75DB0A55A7B74E8C5E18E5494F59921EDF179D7E6AC46B910F588307DD669AE1E554B488FC8B3DEC9F12E513D92E96D671E8F4C997373CBAB9438AFD15895F73EEF8FAB479EB9C72E5AA3E05D2B164961072FE028C37A5BCF31E3F935D05904D3ED180F22F6793E5F3B3108DB05C1554DBBC48D1719BD641BC6F7BD1D85B4F1B54D270E93A76F483D7FCD667B56685CA6C5409A9E9B6F7CA0BEB979B127EB71F7569B9E74F22F311CD93ED87F5AF6B6C6D25CB4EAB230B7F6DD50BBDFB1DC25D3DAA45ADC946A75354663B917DD75066AAFAE15F778933659A9915A5C851B85A6DDB52B7EE8C93CDFED1A0DF4E0E4CF51EE754891861226DA77D2C5A3DF1E68508B05D2694B3B9825A13134A2BDFEA8B4974D0458CB3C1F702730CA65B32FABBF59E99AE7E52DC70A355D90EF295BEE6699A54F8808E541AF3A96CAFC82466F24DA058BA057E6F46113ACB238EC01ECB593245015C8E354DAEC43F19CEE394395CECDB7E681D315F6372001691F1D7C8ADCAF51969E87DE19D440BFA66ED7257AE9BA50E22E206D8047BCADD5EEACA7C6AF73F4F8F55314822FD9FA1EC877996F8DCF992F130C762911DD705D0137435150D04A5E6FEC07E3DF7E8B2E1C172E3D16C87A99E013A12BAC2A13D464D14F16FD64D10F64D19F068EBFD6B2B5F39A93A77DF7ACBD9EFCB79A4FE842A1401D9B98997A17A821607BAF10EF86CFDF6866E63983B466665E739A99D3CC248D7BD8DB75F978BFF50D5005B8FB8524A339A1757453559C66C43423ECC6338E6C15D18D2399A228BEB7F962E558D1DA65D3CEB905A66834EBBA8393294DE78216BFD95835CB5E5CCD9AAEDF82E9FAED90D76F47A9E93435DB280F9CFB798473AB8FD0139987ED1E1A2A61B6D92F9F466108DCFC343B8D739B5CD6418BB45DD3F1C9747C321D9F0C7E7CB274DDE29C5BC32755D61DE51232E81EDBC616D9108FDC8DEE875FBBEEF2DA8415F519D1A3F940DFAEABFDEF4D71EFAAD6B57BB8B584DA63BDD1539E7883B1BA13C6E4A8645C89F5DBBBFA8FEE1A9AEDBAEFFF16EDEF2A557B15E3CAF1EE062459900A9F5D691729DAC105CBD2ADE583C9EC58072221FBF8CB7B630D35D2C7D67B7C7FBE2032E36BE985836FDB4476B45F548C5602631733AFD1585784BD7030775590E83A18E06723689391857304618FDE39AEA61E2FF538DB645DE89C08428D965A6F184D75E3976C788D06BC5D34BD68334ACD633890811EA91A7A3FBDDB9BC2659244AE9F23489E2750199CABBCAF2476E7A13743D13C585ED802A515081E16F5B7CFD006F2D173EC108193F9E1627134A767DB5558F06AB6CC9DF370A44EE23A1E4B10380E4F84049D9B1BC3852E2251FA1DD30D9CF5003DB5E43BE8564592C60E2431AB22FCD0F5374E401181AAA7A94CD0E06A8874C919D88010A908FE50757AC40E8AD88E6BF814B55574383EC024482158588AADBB0ABDE26F22962BAC11295C4401C9CE9EC48B9F4790C189AED08FA8E1C31F40DEB843D3923A2A47E0D6450F6577C3FFEBC95E9E434E207E79D9801268381B7A903834E2C184AEA5B0957966B7226F8CC17AFAE4071E042E9435D624C7B8CB167256549AC962D808A6117C4B12C47433800871C7AED36FF348E35624287F5421BF7B23D64FC54310181F8B0F836822ECCA1A8540F9B51709CA073880D434E3D0E9ACB2C6B72828CDB6A09BB42834096AC2680F1E9C11F25B5B33507BB0ED711D3BA99DB8DE37D7A963F1ED719D3EB49E58DF37EB7961025BE43F3A80DF5DA3A0BC2D4B21507E1DBDCC14E3188751705DBFCEDB515AFA73D85DB34F2D63B8704A472D40EC78C6214808FBDD5538C55564AAFFE2E3A8A5A51EC63884A414691BAA466C8EF0B4C47EE886D16884FC42FF50FB4D666EEFC1BCD69ED3BBB0CFCCB93DD43EF3BBE6F62EEC2F736E0FBABFFCAE59BE33FBCA9CEF3ADB052D76EDFB76419BBF5BD92E548FAB6C4590CABBB9439907D58D610C4AF569D41AA41CC4588C8492EB43990913D777C25828B96E3B306C77F83E60349701EBB71DC555B27D502B719AF1DBB215CB809A284C610B10D78F2878E0C28F9314BD1473EF2480E13E6A05AD96B2FE328342FB2982065913845AF2B1295AB94F60ED9CCCBD7B74C5A788635DDE6FAA0A09473EC85E7E76DCAF8F719485DE5FA2FBE2060BD31DA78EA05FA2A6BA733ABE94E999AE20E8B6ACA6EEB0D6A14C4F7589A08BB25CA30B22A88CED872816754644DAE9F54807500A7AA6AB4931A0E34D4DC69EC7F749879FD7D0A000ACA7EE7AB941FA2C9F8A9F60A3CCE1D2805B4B804255A155DFB7E085377C614D050EA8921A0FF6321A83005B45D0335ED1ACE755765FE740D3C082ADAE8111DE488D1D3FCF3B8315BF9A001B5E65734C34B0D0C640DD3B67AFCF74CFA923E81F777DA87A16505C4A613D8A16861103B9F82C808C0AF5209761795CF06599A48F321251A7A3F2A89FDB515926E9A88C6ED0E948C089A648D28D1E47C4B2A592A8FA344CD585E87947A647514501026C755D5C847D2BFAD2635AFD4E0F976F75A98475651D0361AC9FB710CB645D45259A6545BDDE35D8CAAF26C1C28CA5FCDB9E5C2CB4B535AF328B09B6A1608C56C1DDB219D686B465752EA3F1BD0E3541B06FCCBE497C830C6B4E17D17E6B72C03AC490DD87E2D142FBFE14490A8E155FD0832890104566956390E80A5609C4DEDA51504871CD474822CCD867A8949729096548EA1684115F2FE11045F32E0A311091CAC807C3164A48C2BF7B6200AD0579F0BB131C8208AF5670FC5618A2C507C950192BAB6E567EB53430EC7045383AD1018C8521321CE4B56A3B38FC0C413438E139C3AE0F8EF1998A462877AEEEFC304B135E34384EFCB2852111DB8EBA59F9D5CEC0886DA26074C253F48E43146E78F3E69C523B432EF74982C17202432D7012DFD7D5AD8A8F7606D56CCE04E3E2C732761C1A8F6FF6B8C584E571C6260FDDEB383C866B9638C644A08906D6D7B2D0EBC07496048DA8AC5D1EA2426BCA638FCCD1DCB2D6E444C07006AD8A93E9C84FD29193B7A93ED91AA06246AA4242767F8012A7842CF2C18A176280E1E9281EADA3FE1DE064F5B6517D4C5D971D1F143EACF203FC0BA79BF308E0704090E45F8F0F6EB210BDC554FC3B0389FFD880386EF2053440AB3AC85757393D288CAA2AD4F34D9F41EA784EEA2CE3D47F70DC1416A344DDB9EAC93332A107A6EF8177195E65E9264BAB2C263831D029BFACFFE30306E7E3ABE278C9C610209A3E7ABEEA2AFC39F303AFC6FB82F3269D00040A1F281F40F3F33C0C10DCE36B0DE94B146A022AC957473DDC82F52680C092AB70E5A0140CE6B84181FD041E1D1779B3CA8C8D22206A4690643F3EF39DC7D85927258CA63DFC0B65D85BBFFCF1FF016F16F0DEAE2E0200, N'6.2.0-61023')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201907021413234_Upgraded_To_Abp_v4_7_0', N'DoAn', 0x1F8B0800000000000400ED3DD972E33892EF1BB1FFA0D0D3CC448F64BB8EAEAEB06742EDA3DB3355658FE59EDDD817074DC136B72852C3C365CFC67ED93EEC27ED2F2CC013F7418294A8E29B44008944662291482490FFF73FFF7BFCE797B53F790651EC85C1C9F47076309D80C00D575EF078324D93873F7E98FEF94FFFFA2FC7E7ABF5CBE4EF65BD37A81E6C19C427D3A724D97C9CCF63F709AC9D78B6F6DC288CC38764E686EBB9B30AE74707073FCD0F0FE7008298425893C9F14D1A24DE1A647FE0DFD33070C126491DFF73B8027E5C7C8725CB0CEAE48BB306F1C671C1C97471BF390DD71B2778451F67F0EF7514FE277093ECEF39849BBC5E44F0F7B730FA3A9D2C7CCF81482E81FF309D384110264E0287F0F1B7182C93280C1E971BF8C1F16F5F3700D67B70FC181443FB5857D71DE5C1111AE5BC6E588272D33809D786000FDF14649BD3CD1B117F5A9115123627141A75465C48D774E5259FC2C7E984EEECE3A91FA18A19ED67593D281DB3B2C10F13F4F93F4014CE2063D661F04325276F673FCE0E66073F4C4E533F492370128034891CFF87C9757AEF7BEE5FC1EB6DF815042741EAFB387A104158467C809F20A337204A5E6FC04381F4E56A3A9993EDE674C3AA19D6261FCE6590BC7F3B9D7C819D3BF73EA8B88F0D7D998411F80504207212B0BA7692044401820132FA31BD537DDD82C00912A2C73747AA465034230649799325889E3D17A03F653B28DD904BD3C967E7E513081E93A793E9D1BBF7D3C985F70256E59762C0BF051E9CF2B05112A540D5D767903C85AB5EBABA76D04486248F255D1D1E1CBDB5D0D70D80121AFCDDF153D9B8E04F0B7D9DBF003745F275EBD5543C831296FF67045213DA591A15DA8190364370A7BE0785FB72B358AD2210CB28FFDE06DDF3EE14E27478F4C142573F47E13734B7828750D2D7BBC3232B2C462B1AC60CDE24393838B0D0D5E51AFE8BC3C081BAAA81EEC09B37D257A7D97A01C5D7B13DD6E379BD4C4917AF9F1DF7EB6314A6C1EA2FE17DCE5FF92A463488674CFB6C511B17B2AA2F4816D495856963A88D60C78BE851AEFFDF7E78F7A3DE7263D8F96DF47A0A8522C1E87CF8DE18CA17F09240485674FD272716C352CCF37871EF04AB300095DCFC1C863E7002632CAE232F8C32A929B802AD6B720ED5354C579F0838D656C60C988652D4D633E7C8F60D830B08166A812548924C1A1516F36603554456302B5AC6332E246BA6F4E4672706186F2884E52B578E19B308A868FFC579F61EB351F2014E2737C0CFCAE3276F5320C625C35DD5E2220AD737A12FA27C59F16E19A6918BE425D4A97DEB448F20692702264C2F9A544C1FF48E892B0AF6161A8521F8A69345E6CC8B37BEF3AAE85BD3DC35ECFB323E033EDCE3B456CA3998261660D652A873D50BD2E770E53D14C2DE0E4623F4777CC9C83E9C3E39C12350298DBCEEAF1EAC13BDCEF096A33D4AB129A38A1D8EE7A070EB365B9930EAE785A6DB720C005C81D4D4D1015743E128A8B73636C9B5005F400455FBF29F6CEC95F5769D42FBA2FC9B933AE6DB191833EE9806989921A9C75A19B2CAED8C8CEC0309B289F220218C4A443C43DB4ECF2FE09BCA7768C7B17415798F5EE0F8FDF456FE55E8819FAC787B8BBFBBA67B1A2DF54B34F79BAEF6B0F13857B7E7BBDD5F0FB85553F9FC250101924E85EBD7CE99496B37754B37F90D7062B937DFCA915767278662F70CA678D4C613544D77540BBEF5C454949A4F6CED56F69305075D579EB9C57D0C4BDDA410873D54D58D44D892FA3354612A234AFBD46AAFBCDC3903CDE6D06728FC5ED6D07D9DF100F4E5DB2687CC86B9D473FD135434A9A3DE587D0A5DC7F7FE99EB074EFBD19DDBB32EE8644A6ED507EC4A2D0B3BB6DF650C8788906AED691E5DD6FBEDB2E6E8B85BF0A2DCCFAAF4248231685DB98B765349DCADE8CCCAA2EFD96C835CB3B011B36C2BBEFFF1F0E0C3876E168851652954D69730A988A313FF85D78F6774EB6139DF7E49BD95B9BF1A1BB21DE7AEE9DA2F771A994475A93B42DD28466929ECB3124C6580B48DD0CFBABB451C83F5BDFFFAB714AEC1708AAB02B46D0E577A2869E56860099E011370868B705DC1500C7315248D2F7C7378F0A3A590603F5D81558F5D9626452F9D0D678558A6F7B11B799BF6AB050DE93B5839EC79A8B7BE648DBA7C0BBA7CB7D5C455F4E804C526160E2B4147152AF580B789673C08E3B6D7B23E4144358E506622294846B5D54FD6DC62C39A21ED66C738332CCF8C6B2702012BCB0A2181DA5BA6F7DF6DCFE3DE910B69F4610FD221240B64387DF2FC15147E6E0C03AD77EEEADA75FC82B01213BB20AEC98B5B90619DCFD72E702E3151E35C8EAED17A700DA2B517C7D9265C2FDC224D9EC2A83C28609A8FA1167B196A7119FF12415CF7DD3A4253ADE58C4020E21917506741142CCA96CD6F6D022256B424200211CFB880768580E6FE10230954D04BF2808E481433C249DA9D423D56D3F2105172A74DF78EE35ECE40E51694396EEC3C00F1258CD6E8E45DE928EAE6F664178BD03EDEF35C22D1726D04DF3C38705A8D513CE30E480C83BBA1408AFC8EA854EF23E83266CBC35430DDE9607222C68EA844618795F1B1C32B986247CB821845B62685275D818F2C53CB78E758991CFCB0FDAC17A212852756C64711AFD02A1E3F27931D9BA4B6EEF6CD26E978B3589B098878CA33AD4EA23E6A1CCED78EE7AB6F58758407122944B5E2145715C766E59ED7F6A8DEC842DB2E83B662A32DD328D846BFD74E1C7F0B23D9D16B475E998CC9A761F0E0C17989A682E224E08D9550F472BC372006492F3D7E0ADDAF619A9C072B64A0FD96B8A6A6E2C275E13CB880D4022BFA4DB006678F977185919590FCEBA730005FD2F53D5A67DBEEAA54A8639D15A2D37E004BE0A628800B6E92D69B1EEE42DC7E0B2F1C172EA896187019E353C906BC859B78CF60DCE58DBB3C1A86EF786BBEC99FED23CAF2DADAC73E33863E5E66BA0351ED3773D8FCFD265D2640ACC3FD660654B0DFA4CBF8D875BEDFCC20CBF69BDC0A7C645BEF373F858F9E60AB99775094D3D8659F0538E565B677BE196CC1CE972EE323A6DAF9CAB0CB9CE662BC8A620AA3EC2B1F97BCC8148BE2184282485D83C2A52CE0A35395B6F608645AA7E9D14ED6788C1E12F7B5B538DD8C330880855DA3464FFD3CD9BEDBA7CE0852A64B9BCEA6ACF1389B767036659C81DF9EBD95746FD79183A0ECB9872B9746D2AE13972D12F631227B4765DD4654F76E2B6ACD7896CC8DF058A4F398D98E5D19455622B2ADDCD25BBA7A6E2991C8F7EA6C317C18A9DD5D733E8CF1DEA060BE8DD7D4C76BEA83B9DAD8DD35F521E8C5E6011E9CC7E3F62DB6A3E3785351D2160D95EC6E271E52D16947DB596858075084D0542CFA94A8762B7905C783BCEFDAB66C737C966B42D1011A5BCAF8EB39556C1FA2155D088ED1D852118E6D8ED26409A60AF09C8C526489082F59CEA8D6C77B451FB2033E411511BA5A877C468EB685EBE6E12ECD7C6D45F3D17721EE6B6BEEB6CCF1EF055F0DF5A8C538C65E2310C7F5750FD757F323B2059C9EEB4D638586C318B59AB8AF465ACDEA86C4BAF3B7547C5791B666D27B384375CABDAFE948FA4CEA720362ECD25C667EC1C99BCDE6BC288F58E8CF2F63A4B9DAF99C7910468FB3815E68D43141F176234157470121BB344B8B1A3B2ABEA66F468916DFF1F5A8016C2BC677D5F4E649BAC66689207BFA657CE13B8F7185937CDA1040627E46F6567A1F2EB92B10F9AF70892E58F19AD00FEB7C06E8624815BDF46D3AC98EAFE13ACE9094A8FA33F0C36FF9FDC0AA097AB65ED686AEAEE862711F3E03AACD91A28B5FBDC7A7BAF23B96B9391B25AC6533C99A71F5FC194E78C8CD34CE3371792066B2D3F6CBD54CF6D17C2CC8A220E16F9B1551FD505EBD9AED25D11BD09C7FE8664677C9ABBF05C47EA99EDB7D7A245FA6D97D355D92FF9B1305227AD375CFA3288CAACA6FE4952F9C049B6B1CD5A8E424CF4837E323694CB0F0ECBD0964CA51432E5D06CF8EEFAD44DB503DF61540EA2BA77A8CCCD6B9184E82F2348BCF52416FC4BE5E6F3928CC174E97EFD5986684C9DA6217F28AE63F2A9A075F83F05B80925B4681E31751D545DB0FF2B6E84E27585DA549D5E02735AED86D4A01C6F42AA8356F041B84362A900BD2AE0ECC8D54297BE0DAA3BDF2DCE0750F75A8B888E3D0F5B2E191A74B649AB9EA4089ECFC3C584D8AE496B25677D4830359924D5E83E9240B8D40A994E0727332FD03335CDD1EABC720991EE93E0EC931C13EAE827C499E2CB29373B8FE3BB1EBAC5813195274457E81DB2580DEB7F41C7435163DC7E80509BBB7F202D7DB38BEC94828209A5B348464D51D5D7206362040BB2B131EEAE0814567B0E854BD52B45491EE788EC9AA42842589EAC5122CCB6ECF1360AC7EA732A589224FE2B3FA6445F5146B26C31AD4EB43843528A425C1189C9D1063360FB18E90489212F305394BE3DEBB2C8BB3216BCEB70E845848BA9EA558481B53318680B626C9E2979D45E2A1F134752D1AACBB95148F83D98CDD6AE8F4C51143555F96445139FE1EC45049171D1CEAF7F9B72279F80B1122FE739F8B208F1E7A528ABCC729284C8A4BE49D081D87103D881967D03ABD969EE82D8A1516A828E7282F66512E60B29D8FF0A510054CAE1A6C21282C06BD490B4B509DAEA9338CED490E1E3E2AE5323792B4A5E4F0424FFB951C0E067D490E87A03A5D53416EDB931C267656CA6A71186D4B1912C6DDF62B482234FA9226117D75FAE7451F6E51AEF2C78CE44CA75E36DA9E8944BDA3446152F8B0BB33914842F4266CC4A087612261EF4AC965EB9AF742D5F604EC9AF31E1685CE359BB4A33B89E390A72FB1E3906218B2973F3C266533F50AD9F6E48D7CF38C42247FFBA53BE122A8D0975811231E8640550FC84959C9BE26D7C02412C1E448480FDA871E525F32420F7BE7C584493821E2AA38FB44CD58BD692F81D9BB4D2EC2A00779111174286E0126198894CB0AB74023C9D9AA5B4084415F923360B7003F478B94D53A6E814632B47DB780148DBEA4692FDC024C3A1D29E715FB379E3475644F0B33F950E8F4B57F1391A72F616CB87F2BDF26DC8AEC715E8210B15BF62C44CDF0F2C51E7D7D26794BA2376526C6A107E1111376283615E7AD0E05B71576556329DAAA6D25C6A13F291AB07D45BDA8A2E0B424E2B5B1F498C7B45A179EFE8351F9F4D4E978DBD1A7A2576E145CD631CA1B8BD0F60D730522FD49D4008DF3228C2F0C12D802BBDD87BF1078768FCAC10BEFAE3144B5B8E610178F07D0E282E04333B8849CC229F42944A932EACB9CE52302451947E64820E4E54C0E24A2427ED94B01B298D93C609522548120626839708828532D607480B908281D876D8029FCAA4276C979AD8B064946F6F320D2D73114003FC19E53873FE8C50669914C00CB6ADAF06EA11C6BC2BCCD445E0197B8D7C381CB3E3761007099DE57C9CF55C0F1BA5A1DD13198F9A116DB09AF9E31701DC04AA0B8CB8005C7D9752BE08946AC3542A4A4798DF3B54EA371995C8C0BA188C5D40053E68AE28229E21534C08868519F122A8048A6BE2E3FD8C73E78D0444F876B011703D4A252F1069F8850D50B7FBA7C2B5EBF92B2AF7A654B03A88A76741D2DCAA1463AF399578F018ED921CCEA2BB81838C1DAC8AEF8F1375284CDAA7797B02200675D636C32D36B8318F0DAE8A09D902495742828BB97C623A0F63D3672883A37D9F0119236918C783A17D018C8CC48AD1292BD19A5A0A4E22A9570C0E2CB54025AE6569B2639C577A07439D5808EE27B391C1A6A5EE22146A8BEC6838D8EA3BE24C453DFDA3101DD807879247A611FB0E4C28BC5A3C06AF14852D82F1232E0003803C76D184B23C69F67160D5BE4B8E7A0CE71DC372000C74DAF82D29400C4DBCF0202087DCE2CEA3C9FB33901781EE6AE08C0BEDF2CA082DC05C60E42E80233A787D0E1D519510A0B5F440A4E7C35076B32C2BAC1B0C9C0680A4089A39D11131B3DC1B085E7C72CEABC13647302F00E7E312804CE76C850ECC90404E004A1B2489361A8E68326A347A9F6057E76065B9BD882F1F263245994992849F3513341911808D156A0C1B899983ECED0E5717F04EAC2C83F0C7B2ECBE4503A546F4C689A88007A8B9E3080CD9C003D2D7AFC082B11150C163D793096393DFA5CF498F020113DF4960061109139157A5D0278394B5842A8E2597847760A1D5179CA24E490C4B0742011BCD4284252E8E90A4958463352F4A431E82C2C4232A89D6182B88266C3EFC7CD254CF322248381CE549D9637234C179AB37C09B73AB7ADCA8EE74BF709AC9DE2C3F11C5671C126491D1F2201FCB82CF8EC6C36C88CA95B165F26CB8DE342F44FFFB89C4E5ED67E109F4C9F9264F3713E8F33D0F16CEDB95118870FC9CC0DD7736715CE8F0E0E7E9A1F1ECED7398CB94B2864FA94B9EA09AA0EE71150A528B5D80A5C78519CA04C8EF70E7A5CEF74B566AA894EA905DEECB257FA209AE560E9D72E5BA0DFD5C1B824935EDEF22282BFBF85D1D7FA409B0D002840C3BA8F6B144790BD508D4984B8296CBC741DDF89380F629F867EBA0EC4210DE2D6F513D7388CFAAB3EA432780187230A6810435982E8D9738B9C9A3828A2401FDE67903C852B161CFE5D1FDAB583789C64931687867FD787760392340A8ACCC43838A2401FDEF90B7053A434F2D7B871885451039867452A6D01DCBA581F3693950387CC149AC265798E7FD7874664D8C0C111052614457A9943C9EAB33EACCB35FC1787011E174BE8024E7933E87C3DC1AF61C0A92CAC284F104C700AFBCE423B9E535A94D6E4734695530B2CBD3668AD1C54F45177CB071BC564BE8E68C0E8664181DDE52F4CE320AA8F467016D163CCC0C93F1A2C7011341DB2B3796281ABBEEA43FA026D0CD88E55AE44813E3C642072E1110506D3355EDC3BC12A0C00CD40BCC060B1AB5228104B5DF5D5609A13592388894E941842E4EB3CC53581ADA90F3AA2A03BFDC17F07D95C87A80074A340B0586B627D14876067B0E02620AF51BE552D780D1A8779E6A1C8B9B597AD5F5D888A82AD9731FA7DF5F03B33FE9243FAFD60386B6FAFC1DA76A6561DC7EA36B6B7F74BAD5955413953775F03315A838B78BF4AA3E1FA5279DB3A5F581A3052D8B21B4DD35E3F402E6F7CE795054414981867554E1ED234AB3E1BE0465E6123B093DF6E53C0E4EA32B2C4CCBC65D3E9D2762E5BA3490F7C62E85CAD1143DF2FEDDE54A928821AAD6916AC9F26EA45DABC1B1D53640E63A503FB6E0C8DD939E3DF0D6C68320A94B1A5D96253D87C904D20A1B15DA4BECFAA5A5E7997D6E656E7983A16DBEE5CA3AE8E359D732A301DED1131019609B7A1D500BE71B605F5577D485791F7080D449F038E2A3271C7E47FD9794296984314CF407E8DBD9D83588C7D3F4BDD927B4DD964B5E342E866D2D93E0819C6F18F7D3310E5C50B50B0107BEE4115EDD2514DB7474D37C089E913B1F2DBEE1F666F4969D557A53B0C65E05CB96E10D5A00365FF9D8ED69D0A2E3D67F22F466E092F4629BB59BF44F57D747288218E4E8E3D7072904F44F4AA4B6F99B8B5ACCF06FA940F69D7756A893DAB12C9128300B2226893881D2BBEE943F92BA08EBDB30FFD1E2F8DBA650F740BF9304377BA8579DCC15CA9A84174745883F5CBB1B1985283F59ED96099EEAB50FD92252CA4BAA489D3938549973581BA8863B0BEF75FFF963A3E9AB89CD85765E56D388397E019B0D146F557D3BD5BCCDBBC19F911CE5F5C3F5D8115171E5368BE7AC6FCE5D3CCD731EA58D9CB59FDE85BE605AE76BA570D6ED7AD3A3B5701BA5B17461D3C6A13A136E13F8FD79D26E13EB367AE41F4C0ECBAE6289F8827FCC08267E3C550685AD01079E5DBF1728D338EC38E3E679B859936BC59562750A72EB101E30B3CE18A96DB904DAE21833006DA8D3EE85107124F489868BF865708AEE937739BDC2260800C4F1372F615C6FAE6970876CBEA9BEAF3F73A13ACAEDBFCF44A03925963CB96B99A20C830B54B179ACC788A446FD03C35F673303CE5936010F74DBADE1737DC07F7B9EF3D0395A38E36E5B002138F57B4767CEF9F3C87115D36CCD5D2BEB5BF4409495C7AF12DBF9AED1B1E9CD44FD87D43F179DC8388218E7B905DB2BC1A6AF4FC35AA6ED7FB061A9DDFACABB3E852CBA25E655AB82E6F02FD7CED783E37F0595447BF97459A3C413A96A7499C78187E0D33BB87A54D138AD85B9BC4146D4AC7F6ABDD328D020648F5D1C45F17C7700631FEBAF2AB2195A015FAE0412943CC671D78822AE6D8DE8018242C7C4EB1C12A10BA5FC334390F56674E027E4BA8859F536C306F5C174AC8051C3D58719E8CE1149B5804156ADC685BBAD480DA4F6100BEA4EB7BF41A224167BCC00453AC6121062CBEFC3A26D11E6E8AE23AA09DB6DED0211F449109E6B7DFC20BC785CB8780CA6CB909747C62B0B0E95213C82837F533A021965F47BB530C71B43BF7C4EE146635B1697CE6C9D59A59A082B6BBEEE0B6138A930D9E7339BDFE6C088B131F8D7F1F2790F104126603B13981F2B482CD2690A0EDF73181B2C1C36FCFDE8AB6D3A82203CBAF68C3DC55200A764A48BBF619977D3414D161C64CD991503B9157A33A0658A698EE04BDF961D9608FEA2D0515B776EA8C57BBC6698E09715F17BC04D98FCD15802EA05DD707E3B5B1F1CA82CD6B63A34EAB2662F77AACB1DEDAF157A8C53ACFE5043D10057DDA30A761104006A1C3BF2462228ED8D2D1993D3AB335A46AD4A0F99664E1BAE880B06B4F47D14D436787B0F5AE1B7E763682994BD20BBEF22095DFB71111613F8E6154A4A3221DA822CD7CE38B2401EB4DE7DA14EFABCD118710C4AEEB55DB66AA3D3D8D7E5D4562CD28AA6372283984B7486DBFC07A036226E0B9FCD687B6DAA266E9CB6D47F7D5D069A70766D7358C1D8DC071607271A36B1838951227A1A336F34F7B3E2BFABC89CFEBAFE1CC18FE8D7C3B33637CF762072D5C2667375DA5EABDF852FDAF727617F9B28944DE191D505AEE6CFC7191BB9B4EA09D57994ECA9010A8C85E63689FCE5085D9F21F7E6E88D4153E4301790071721B7E05C1C9F4E8E0F0683A59F89E13E7E9D58BD4E01FDD2C43AB13046152245FD7C8157EF806E50A07ABF59C6E6E9E711C4189E395CFC9378ED854DD8528D2694FE81E3F9EBD060E047FE1F970D77A5756BCFBECBCFEEA3C837C12976712B5D6225AC5E4DF33F0E0059C3C57C77F05AFB44495D27B031E2622D5733CA71B1E73D4171AEDC9F41E6595807CCCD4E32F008A195CAF56D70EDC8C4401AA08B2814C275F52DF47C1CF27D307C78F992946F7502BB3BC9FAC13869697C10ABC9C4CFF6B72199FFAB0104460F57172813AF8017E83BAE61F29283E4CFE1B472289D893731A8772E292233583B1C4D387E780826727729F9C683AF9ECBC7C02C163F20405FEDD7B53D0782A71BB90F1B4E212C88707476F4D411329C649D8BF5B3B2FBF3785472518CF21AEA00C26D97F43A9E3A415C7C4CF1018B37D9390F2BD3121F19D9C8C47471F4C21139B3A09E87748459B72AB4A362E93D883830353C8BC34106DE62D3F6D055718B4B88525166F3572DC2490AE408A44DC435E1BAAACDEFAC2A90B37CFF2ADD04B7A0B5895E93B8716AF1DDF6FA246882CDFB47E13AF88A8F1C7C9E5BFDF6159B8EF30583F4CAE2268777D9C1C910BA3164E44A670B1CED59A687892F0526EA46BBDF6C80E1B8CAC4E339EE39278C16B23E54F6C275A2E4BD446425FAF696B0B3AF1ACC26A25AB5BB25D559D72136BF7D4372F3DEF68B2EF9EC96E6A0F690D8C6BAD4AD7ED01A9088E9156C71A6931B2D2C755C34A031F9873907A76A8152BB5D55F99265A5305DD2DC38724F73E0D67DA7732E795F3ED8DB919463CC9A3BD67D2028DF90CB54C0D631DA537403262A1CD5C252315DA5962FCD8045B30ED8C773774A6BE5EC93DB0798E5AA572C12A8FB605C52A2CB9755BAE6399ADDBD9F838C38A74D6241574D64C1A46ABDD4B1DC94EEB4D6D5450C332E5EE5D098FDC2C623AF8ADB17789EDA533640F29640F7F327658F56FD31AEA96125F231D43361A758D785AB79ED32D27749D04DCAE2396CA066E1778F95769C1FD647E3251FC95EB8F3D9FF375066E139302D61F677A6F271D433DFC911BD81ACAAF9C3D7738A456CE662A39B9854343CB873BB6CF9ECA04E40DCCA28AFA390CA1DDD6E050B80BB5A881F9A1AD737B13EAE5104452DB4281F312922B4344D8363D79BD793D8FAEAF41B9BBCDDDD25DBADF5CC5C97F83050BCF188FF9F446C7E0E818DC61C7A028917A038D8CDA8D86FDEEE9663291BC5D1D5D3E9D6DF9A0337BB84D3F94B0F9E169B3909A510F59D743F2BB3D7DA880349B655E36D31113CC5D64CC8B3BDA1E27BD45D9D6AE937C82C7726025F5148F74121B07572A5FE0E96230BC538C56BEC3FA719E76C73E55EA752BE1CB543A770B30B184EE16A00D58A13109CD55D695ACF1504DACD6FA75176CA9C61E1D7A71B82315657566487B7CDE3639AB512E441D224C9F759AAB47D512D221F2AC7772B84B5487647AD39AC70353E6DCDCF22A25CE6B3454E5BDCFFBE3F29167EEB18BD62878D78A4552D8C20B38C8B0DEC673CC787EF57416C1743BC483887D9ECFD74E048266417065D33671E379462FD986F15D6747214D7C6DE389C3E8E9EB53CF5FB3D99E151A9769D193A6E7E61BEFA96F6E5EECD17ADCBDD5A6239DFC4B0447B60FF69F96BDADB134E7ADDA2CCC8D7D37D4EE772877C9B436A91637A55A5D0DD158EE44779D81CAAB6BC53D5EA74D566AA40657E106A16977ED8A1F7A32CF73DB46033D38D973947B1D52A4A18489F6AD74F1E0B7071AD46281B4DAD2F66649680C8D68AF3F2AED651301D632CF7BDC090C72D9ECCAEAAF57BAFA7979CBB1427517E47BCA96BB59A4C913224271D0AB8EA532BFA0D1198976C122E894395DD804CB340A3A007BEDC4315405F2389526FB503CA77BC650A573F38D79E07489FD0D8841D245079F42F76B9826E7C1EA0C6AA0DF12B7ED12BD705D28711790366045BCADD5ECACA7C2AF75F4F8F55318802FE9FA1EC877996F8CCF992F630C762111ED705D0237455150D04A5E6FEC07E3DF7E0B2F1C172E3D16C87A19E313A12DAC3213D468D18F16FD68D1F764D19FFA8EB7D6B2B5B39AA3A77DF7ACBD8EFCB79A4FE842A1401D9B98997A17A821607BAF10EF86CFDF6866663983B4666656739C99E3CC248D7BD8DB75F178BFF50D5009B8FD8524A339A1757453561C67C43823ECC6330E6C15D18D2319A3286CCC974A54AB472AD0174670F149740B79BB8DD73378881DB5478CEF196C8BD8210FB12EEEBCB64E713006C55957619C846D3AF7C4F8CD86AAE0F6E286D8780B188CB780FBBC053C484DA7A9D90679EEDDCD5BA05B7D0B9F48806CF7EC5209B3C9B6FD340C02E06687EA49946D0D641D34C81E369EE28CA738E3294EEFA7380BD7CD8FDB355C6345DD412E21BD6EF56DECCA0DF1C8BCF95EF0B5ED2EAF4974539781459AEF04EEBADAFFDE14F7AE6A5DBB676C0BA83DD61B3DE5893718AA3B6147FCA5A6EF0FE7A250F90AF5DFFE3534DB75FD9579FBBB52D55E45B872BCBB0171EA27C2D75F9A05ACB6383961E9D6F0DD6676AC3D91907D83E69DB1861AE89BEF1D3E839F1399F1B574C2C1374D024C9A2F2A462B81B18B99D768A82BC25E3898DB2A48742B0DF0932234490CC33982B047EF0C57538F977A9C4D923FB4CE47A1464BAD378CA6BAF1833ABC463D5E721A1FD619A4E6311C484F6F65F5BD9FDEED4DE1228E43D7CB1024CF13A844D265FA5912BBF36035414145587ADA1CA525F01F66D5B7CFD006F2D0ABF0108193E9C16C7638A567DB5590F36AB2C89CF370A44EEC3A2B9620701C2B1112748A700C17BA8844E90F4C3770D603F4E293E7A0CB1D71123990C4AC8AF002D7DB383E4504AA9EA6324183AB20D22567600302A422F843D5E9113B28623BAEE053D456D1E1788E499042B0B04C5F77257AF9DF582C57582352B88802929D1D89173F9D2183135DA11B51C387DF83BC7187A6257554AAC2AD8B1E4A3287FFD793BD2C959D40FCB2B21E25D0703674207168C4BD095D43612BD2DD6E45DE1883F5F4C9F35710B850D658931CE32E5BC8595169268B61239846F02D4910D34D0F22C41DBB4EBFF55B915B91A0EC6D87EC0A90583FE5EF51607CCC3FF4A289B09B731402C5D74E24281B600F52538F43A7B3D21ADFA2A0D4DB8276D2A2D024A809A33D787006C86F6DCD40EDC1B6C775ECA476E47AD75CA78EC5B7C775FAD07A647DD7ACE785096C91FFE8007E778D82E2D22E8540F175F032938F631846C175F548704B69E9CE6177CDBEF88CE1C2291DB400B1E319862021EC7757E1E437A2A9FEF38F8396966A18C3109242A46DA81AB139C2D312FBA11B06A311B27705FADA6F32737B0FE6B5F69CDE857D66C6EDBEF699DF35B777617F9971BBD7FDE577CDF29DD957667CD7D92E68B16BDFB70BDAFCDDCA76A17CE3652B8254DCCDEDCB3C286F0C6350CA4F83D620C520866224145CEFCB4C18B9BE13C642C175DB8161BBC3F71EA3B90C58BFED28AE82EDBD5A89E38CDF96AD5804D48441025B80A87A4461052EBC284ED04B31F74E0C18EEA356D06A29EA2F5228B49F426890D541A8051FEBA2A5FB04D6CEC974758FAEF8E471AC8BFB4D5921E6C807D9CBCF8EFBF5310AD360F597F03EBFC1C274C7A923E897A8A9EE9C8E2F657AA62B08BA2DAAA93BAC7428D3535522E8A228D7E882082A63FB218A459D1191767A3DD20194829EE96A520CE8785393B167F17DD2E16735342800EBA9BB5E6C903ECBA6E227D82875B834E0D612A0505668D4F72D78E10D5F58538103AAA4C683BD8CC620C05611F48C5734EB7999DE57A9D834B060AB6B6084375263C74F37CF60C5AF26C08657D91C130D2CB43150F7CED9EB33DD73EA08FAC75D1FAA9E05149752588FA2B961C440CE3F0B20A3423DC845581E177C5126E9A38844D4E9A838EAE7765494493A2AA21B743A1270A22E9274A3C711B16CA924AA3A0D5375217ADE91E951545180005B5D171761DF8ABEF49856BDD3C3E55B552A615D51C74018ABE72DC43259555189665151AF770DB6F2AB49B0306329FFB627170B6D6DCDABCC62826D2818A35570B76C82B5216D599DCB687CAF434510EC1BB36F12DF20C39AD345B4DF9A1CB00E3164F7A178B4D0BE3F45928263C5E7F4200A24449159E51824BA825502B1B7761414525CF311920833F6192A65654A421992BA0161C4D74B3844D1BC8B420C44A432B2C1B0851292F0EF9E18406B401EFCEE048720C2AB151CBF158668FE413254C6CAAA9A155F2D0D0C3B5C118E4E74006361880C0779AD9A0E0E3F43100D4E78CEB0EB83637CA6A211CA9DAB3B3FCCC284170D8E13BF6C6148C4B6A36A567CB53330629B28189DF014BDE510851BDEAC39A7D4CE908B7D9260B09CC0500B9CC4F77555ABFCA39D41D59B33C1B8F8B18C2D87C6E39B3D6E3161799CB1C943F75A0E8FE19A258E311168A28175B52C743A309D2541232A6B9787A8D09AF2D8237334B7AC353911309C41ABE2645AF29374E4646DCA4FB606A89891AA9090DD1FA0C429218B7CB0E285E861783A8A47EBA87F073859BE6D541D535765C7F3DC87557C807FE174731E011C0EF0E3ECEBF1FC260DD05B4CF9BF33107B8F3588E33A5F400DB4AC837C75A5D383C2A8AC423DDFF41924CECA499C4594780F8E9BC062942F3C533D594626F4C0F43D585D065769B24993328B094E0C74CA2FEBFF78CEE07C7C951F2FD9180244D343CF575D053FA79EBFAAF0BEE0BC49270081C2078A07D0BC2C0F0304F7F85A41FA12069A800AF255510FB760BDF121B0F82A583A280583396E50603F8147C745DEAC2271A408889A1124D98FCF3CE73172D67101A36E0FFF42195EAD5FFEF4FF08221B74352F0200, N'6.2.0-61023')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201907220636309_Upgrated_To_ABP_4_8_0', N'DoAn', 0x1F8B0800000000000400ED3DD972E33892EF1BB1FFA0D0D3CC448F64BB8EAEAEB06742EDA3DB3355658FE59EDDD817074DC136B72852C3C365CFC67ED93EEC27ED2F2CC013F7418294A8E29B44008944662291482490FFF73FFF7BFCE797B53F790651EC85C1C9F47076309D80C00D575EF078324D93873F7E98FEF94FFFFA2FC7E7ABF5CBE4EF65BD37A81E6C19C427D3A724D97C9CCF63F709AC9D78B6F6DC288CC38764E686EBB9B30AE74707073FCD0F0FE7008298425893C9F14D1A24DE1A647FE0DFD33070C126491DFF73B8027E5C7C8725CB0CEAE48BB306F1C671C1C97471BF390DD71B2778451F67F0EF7514FE277093ECEF39849BBC5E44F0F7B730FA3A9D2C7CCF81482E81FF309D384110264E0287F0F1B7182C93280C1E971BF8C1F16F5F3700D67B70FC181443FB5857D71DE5C1111AE5BC6E588272D33809D786000FDF14649BD3CD1B117F5A9115123627141A75465C48D774E5259FC2C7E984EEECE3A91FA18A19ED67593D281DB3B2C10F13F4F93F4014CE2063D661F04325276F671F6607B3831F26A7A99FA4113809409A448EFFC3E43ABDF73DF7AFE0F536FC0A829320F57D1C3D88202C233EC04F90D11B1025AF37E0A140FA72359DCCC97673BA61D50C6B930FE73248DEBF9D4EBEC0CE9D7B1F54DCC786BE4CC208FC0202103909585D3B4902A200C10019FD98DEA9BE6E41E00409D1E39B235523289A1183A4BCC91244CF9E0BD09FB21D946EC8A5E9E4B3F3F209048FC9D3C9F4E8DDFBE9E4C27B01ABF24B31E0DF020F4E79D8288952A0EAEB33489EC2552F5D5D3B68224392C792AE0E0F8EDE5AE8EB0640090DFEEEF8A96C5CF0A785BECE5F809B22F9BAF56A2A9E4109CBFF3302A909ED2C8D0AED40489B21B853DF83C27DB959AC56118865947F6F83EE79770A713A3CFA60A1AB9FA3F01B9A5BC14328E9EBDDE1911516A3150D63066F921C1C1C58E8EA720DFFC561E0405DD54077E0CD1BE9ABD36CBD80E2EBD81EEBF1BC5EA6A48BD7CF8EFBF5310AD360F597F03EE7AF7C15231AC433A67DB6A88D0B59D517240BEACAC2B431D446B0E345F428D7FF6F3FBCFB516FB931ECFC367A3D85429160743E7C6F0CE50B784920242BBAFE93138B6129E679BCB877825518804A6E7E0E431F38813116D791174699D4145C81D6353987EA1AA6AB4F041C6B2B63064C43296AEB997364FB86C105040BB5C0122449268D0A8B79B3812A222B98152DE319179235537AF2B313038C3714C2F2952BC78C590454B4FFE23C7B8FD928F900A7931BE067E5F193B72910E392E1AE6A711185EB9BD01751BEAC78B70CD3C845F212EAD4BE75A24790B4130113A6174D2AA60F7AC7C415057B0B8DC2107CD3C92273E6C51BDF7955F4AD69EE1AF67D199F011FEE715A2BE51C4C130B306B29D4B9EA05E973B8F21E0A616F07A311FA3BBE64641F4E9F9CE011A894465EF7570FD6895E6778CBD11EA5D89451C50EC77350B8759BAD4C18F5F342D36D390600AE406AEAE880ABA17014D45B1B9BE45A802F2082AA7DF94F36F6CA7ABB4EA17D51FECD491DF3ED0C8C19774C03CCCC90D463AD0C59E5764646F68104D9447990104625229EA16DA7E717F04DE53BB4E358BA8ABC472F70FC7E7A2BFF2AF4C04F56BCBDC5DF5DD33D8D96FA259AFB4D577BD8789CABDBF3DDEEAF07DCAAA97CFE92800049A7C2F56BE7CCA4B59BBAA59BFC0638B1DC9B6FE5C8ABB31343B17B06533C6AE309AAA63BAA05DF7A622A4ACD27B6762BFBC98283AE2BCFDCE23E86A56E5288C31EAAEA46226C49FD19AA309511A57D6AB5575EEE9C816673E833147E2F6BE8BECE7800FAF26D934366C35CEAB9FE092A9AD4516FAC3E85AEE37BFFCCF503A7FDE8CEDD0B5DB05527B02B352DEC187F97311C2242AAB5AB79F459EFB7CF9AA3E46EC18B7243AB529408C6A095E52E1A4E2571B7A3342B9BBEE77E21DB2C6CC52C5B8BEF7F3C3CF8F0A19B1562D4590A9DF5254C2AE2E84480E1F5E319DD7A58EEB75F526F65EEB1C6866CC7BD6BBAF8CBDD4626715DEA8E50378A515A0AFCAC045319226D23F8B3EE6E11C7607DEFBFFE2D858B309CE2AA106D9BC3951E4B5A391C588267C0849CE1225C573014C35C0549230CDF1C1EFC682928D84F5760D56397A54DD14B67C3592196E97DEC46DEA6FD6A4143FA0E560E7B3EEAAD2F59A32EDF822EDF6D3571153D3A41B18B85C34AD061854A3DE06DE2190FC2B8EFB5AC4F10518D639499580A92516DF59335BFD8B06648BBD931CE0CCB33E3DA8940C0CAB24248A0F696E9FD77DB73B977E4421A9DD8837408C942194E9F3C7F05859F1BC540EB9DBBBA761DC120ACC4442F886BF222176458E7F3B50B9C4B4CD43897A36BB41E5C8368EDC571B609D70BB84893A7302A4F0A98E663B0C55E1EB05EC6BF4410D77DB78ED0546B3923108878C605D45918058BB265F35B9B8088152D098840C4332EA05D21A0B93FC4480215F4923CA12312C58C709276A7508FD5B43C4494DC69D3BDE3C8973350B905658E1B3B4F407C09A3353A7A573A8ABAB93FD9C522B48F373D9748B45C1BD1370F0E9C566318CFB80312C3E06E289022BF232AD5FB08BA8CD9F230154C773A989C88B1232A51D861657CECF00AA6D8D1B2204691AD49E14957E023CBD432DE395626073F703FEB85A844E18995F151C42BB48AC8CFC964C726A9ADBB7DB3493ADE2CD66602229EF24CAB93A88F1A87F3B5E3F9EA3B561DE181440A51AD38C555C5B159B9E9B53DAA37B2D0B6CBA0ADD868CB340AB6D1EFB513C7DFC24876F4DA91572663F269183C78705EA2A9A0380978632516BD1CEF0D8841D24B8F9F42F76B9826E7C10A1968BF25AEA9A9B8705D380F2E20B5C08A7E15ACC1D9E3655C61642526FFFA290CC097747D8FD6D9B6BB2A15EA586785E8B41FC012B8290AE0829BA4F5A687CB10B7DFC20BC7850BAA25065CC6F854B2016FE126DE33187779E32E8F86E13BDE9A6FF267FB88B2BCB6F6B1CF8CA18F9799EE4054FBCD1C367FBF49970910EB70BF990115EC37E9323E769DEF3733C8B2FD26B7021FD9D6FBCD4FE1A327D86AE61D14E53476D967014E7999ED9D6F065BB0F3A5CBF888A976BE32EC32A7B918AFA298C228FBCAC7252F32C5A23886902052D7A070290BF8E854A5AD3D0299D6697AB493351EA387C47D6D2D4E37E30C026061D7A8D1533F8FB6EFF6A9338294E9D2A6B3296B3CCEA61D9C4D1967E0B7676F25DDDB75E420287BEEE1CAA591B4EBC4658B847D8CC8DE5159B711D5BDDB8A5A339E2573233C16093D66B66357469195886C2BB7F496AE9E5B4A25F2BD3A5B0C9F466A77D79C0F63BC3728986FE335F5F19AFA60AE3676774D7D087AB1798007E7F9B87D8BEDE838DE5494B6454325BBDB89875474DAD176161AD601142134158B3E25AADD4A66C1F120EFBBB62DDB1C9FE59A507480C69632FE7A4E15DB87684517826334B65484639BA334598AA9023C27A7145922C24B9635AAF5F15ED187EC804F504584AED6219F91A36DE1BA79B84B335F5BD17CF45D88FBDA9ABB2D73FC7BC157433D6A318EB1D708C4717DDDC3F5D5FC886C01A7E77AD358A1E13046AD26EEAB9156B3BA21B1EEFC2D15DF55A4AD99F41ECE509D72EF6B42923ED3BADC8018BB3497995F70F266B3392FCA2316FAF3CB1869AE763E671E84D1E36CA0171A754C50BCDD48D0D55140C82ECDD2A2C68E8AAFE99B51A2C5777C3D6A00DB8AF15D35BD7992AEB15922C89F7E195FF8CE635CE1249F360490989F93BD95DE874BEE0A44FE2B5CA20B56BC26F4C33A9F01BA1852452F7D9B4EB2E36BB88E332425AAFE0CFCF05B7E3FB06A7278206F43575774B1B80F9F01D5E648D1C5AFDEE3535DF91DCBDC9C8D12D6B2B964CDB87AFE0C273CE4661AE7B9B83C1033F969FBE56A26FB683E16645190F0B7CD8AA87E28AF5ECDF692E80D68CE3F7433A3BBE4D5DF0262BF54CFED3E3D922FD3ECBE9A2EC9FFCD890211BDE9BAE751144655E537F2CA174E82CD358E6A54729267A49BF19134265878F6DE0432E5A821972E8367C7F756A26DA81EFB0A20F595533D4666EB5C0C2741799AC567A9A037625FAFB71C14E60BA7CBF76A4C33C2646DB10B7945F31F15CD83AF41F82D40E92DA3C0F18BA8EAA2ED07795B74A713ACAED2A46AF0931A57EC36A500637A15D49A37820D421B15C805695707E646AA943D70EDD15E796EF0BA873A545CC471E87AD9F0C8D32532D15C75A044767E1EAC26457A4B59AB3BEAC1812CCD26AFC174928546A05C4A70B93999FE8119AE6E8FD563904C8F741F87E498601F5741BE244F16D9C9395CFF9DD87556AC890C29BA22BFC0ED1240EF5B7A0EBA1A8B9E63F48284DD5B7981EB6D1CDF64241410CD2D1A42B2EA8E2E39031B10A0DD95090F75F0C0A2335874AA5E295AAA48773CC7645521C29254F5620996E5B7E7093056BF5399D2449127F1597DB2A27A8A3593610DEAF521C21A14D292600CCE4E88319B89584748246989F9829C2572EF5D96C5F99035E75B07422C245DCF522CA48DA91843405B9364F1CBCE22F1D0789ABA160DD6DD4A8AC7C16CC66E3574FAE288A1AA2F4BA2A81C7F0F62A8A48B0E0EF5FBFC5B913CFC850811FFB9CF4590470F3D2945DEE3141426C525F24E848E43881EC48C33689D5E4B4FF416C50A0B5494739417B3281730D9CE47F852880226570DB610141683DEA48525A84ED7D419C6F624070F1F9572991B49DA527278A1A7FD4A0E0783BE248743509DAEA920B7ED490E133B2B65B5388CB6A50C09E36EFB1524111A7D499388BE3AFDF3A20FB72857F9634672A6532F1B6DCF44A2DE51A230297CD8DD994824217A133662D0C33091B077A5E4B275CD7BA16A7B0276CD790F8B42E79A4DDAD19DC471C8D397D87148310CD9CB1F1E93B2997A856C7BF246BE79462192BFFDD29D701154E84BAC88110F43A0AA07E4A4AC645F936B601289607224A407ED430FA92F19A187BDF362C2249C1071559C7DA266ACDEB497C0ECDD261761D083BC88083A14B700930C44CA65855BA091E46CD52D20C2A02FC919B05B809FA345CA6A1DB7402319DABE5B408A465FD2B4176E01269D8E94F38AFD1B4F9A3AB2A785997C2874FADABF89C8D3973036DCBF956F136E45F6382F4188D82D7B16A26678F9628FBE3E93BC25D19B3213E3D083F088093B149B8AF3568782DB0ABBAAB1146DD5B612E3D09F140DD8BEA25E5451705A12F1DA587ACC635AAD0B4FFFC1A87C7AEA74BCEDE853D12B370A2EEB18E58D4568FB86B90291FE246A80C67911C61706096C81DDEEC35F083CBB47E5E08577D718A25A5C73888BC703687141F0A1195C424EE114FA14A25419F565CEF21181A28C23732410F2722607125121BFECA50059CC6C1EB04A11AA401031B41C384494A916303AC05C04948EC336C0147E5521BBE4BCD645832423FB7910E9EB180A809F60CFA9C31FF46283B448268065356D78B7508E3561DE6622AF804BDCEBE1C0659F9B3000B84CEFABE4E72AE0785DAD8EE818CCFC508BED8457CF18B80E602550DC65C082E3ECBA15F04423D61A2152D2BCC6F95AA7D1B84C2EC68550C4626A8029734571C114F10A1A6044B4A84F09154024535F971FEC631F3C68A2A7C3B5808B016A51A978834F44A8EA853F5DBE15AF5F49D957BDB2A50154453BBA8E16E550239DF9CCABC700C7EC1066F5155C0C9C606D6457FCF81B29C266D5BB4B581180B3AE313699E9B5410C786D74D04E48924A3A1494DD4BE31150FB1E1B39449D9B6CF808499B48463C9D0B680C6466A45609C9DE8C52505271954A3860F1652A012D73AB4D939CE23B50BA9C6A4047F1BD1C0E0D352FF11023545FE3C146C7515F12E2A96FED98806E40BC3C12BDB00F5872E1C5E25160B5782429EC17091970009C81E3368CA511E3CF338B862D72DC7350E738EE1B1080E3A65741694A00E2ED670101843E6716759ECFD99C003C0F73570460DF6F165041EE02630721748199D343E8F0EA8C2885852F220527BE9A83351961DD60D864603405A0C4D1CE88898D9E60D8C2F3631675DE09B239017807BF181402673B6428F664020270825059A4C93054F34193D1A354FB023F3B83AD4D6CC178F931922CCA4C94A4F9A899A0480C84682BD060DC4C4C1F67E8F2B83F027561E41F863D976572281DAA3726344D4400BD454F18C0664E809E163D7E8495880A068B9E3C18CB9C1E7D2E7A4C7890881E7A4B803088C89C0ABD2E01BC9C252C2154F12CBC233B858EA83C6512724862583A90085E6A142129F47485242CA319297AD2187416162119D4CE30415C41B3E1F7E3E612A6791192C14067AA4ECB9B11A60BCD59BE845B9DDB5665C7F3A5FB04D64EF1E1780EABB86093A48E0F91007E5C167C76361B64C6D42D8B2F93E5C67121FAA77F5C4E272F6B3F884FA64F49B2F9389FC719E878B6F6DC288CC38764E686EBB9B30AE74707073FCD0F0FE7EB1CC6DC2514327DCA5CF5045587F308A852945A6C052EBC284E5026C77B073DAE77BA5A33D544A7D4026F76D92B7D10CD72B0F46B972DD0EFEA605C92492F6F7911C1DFDFC2E86B7DA0CD060014A061DDC7358A23C85EA8C62442DC14365EBA8EEF449C07B14F433F5D07E2900671EBFA896B1C46FD551F5219BC80C311053488A12C41F4ECB9454E4D1C1451A00FEF33489EC2150B0EFFAE0FEDDA413C4EB2498B43C3BFEB43BB01491A054566621C1C51A00FEFFC05B829521AF96BDC3844AAA801CCB32295B6006E5DAC0F9BC9CA8143660A4DE1B23CC7BFEB4323326CE0E08802138A22BDCCA164F5591FD6E51AFE8BC3008F8B257401A7BC1974BE9EE0D730E05416569427082638857D67A11DCF292D4A6BF239A3CAA905965E1BB4560E2AFAA8BBE5838D62325F47346074B3A0C0EEF217A67110D54723388BE83166E0E41F0D16B8089A0ED9D93CB1C0555FF5217D8136066CC72A57A2401F1E3210B9F0880283E91A2FEE9D6015068066205E60B0D855291488A5AEFA6A30CD89AC11C444274A0C21F2759EE29AC0D6D4071D51D09DFEE0BF836CAE435400BA512058AC35B13E8A43B03358701390D728DFAA16BC068DC33CF350E4DCDACBD6AF2E4445C1D6CB18FDBE7AF89D197FC921FD7E309CB5B7D7606D3B53AB8E63751BDBDBFBA5D6ACAAA09CA9BBAF8118ADC145BC5FA5D1707DA9BC6D9D2F2C0D18296CD98DA669AF1F209737BEF3CA02220A4C8CB32A270F699A559F0D7023AFB011D8C96FB72960727519596266DEB2E974693B97ADD1A4073E3174AED688A1EF97766FAA5414418DD6340BD64F13F5226DDE8D8E293287B1D2817D3786C6EC9CF1EF0636341905CAD8D26CB1296C3EC82690D0D82E52DF67552DAFBC4B6B73AB734C1D8B6D77AE5157C79ACE3915988EF6889800CB84DBD06A00DF38DB82FAAB3EA4ABC87B8406A2CF01471599B863F2BFEC3C214BCC218A6720BFC6DECE412CC6BE9FA56EC9BDA66CB2DA71217433E96C1F840CE3F8C7BE1988F2E2052858883DF7A08A76E9A8A6DBA3A61BE0C4F48958F96DF70FB3B7A4B4EAABD21D863270AE5C37886AD081B2FF4E47EB4E05979E33F91723B78417A394DDAC5FA2FA3E3A39C4104727C71E3839C827227AD5A5B74CDC5AD667037DCA87B4EB3AB5C49E5589648941005911B449C48E15DFF4A1FC1550C7DED9877E8F9746DDB207BA857C98A13BDDC23CEE60AE54D4203A3AACC1FAE5D8584CA9C17ACF6CB04CF755A87EC91216525DD2C4E9C9C2A4CB9A405DC43158DFFBAF7F4B1D1F4D5C4EECABB2F2369CC14BF00CD868A3FAABE9DE2DE66DDE8CFC08E72FAE9FAEC08A0B8F29345F3D63FEF269E6EB1875ACECE5AC7EF42DF302573BDDAB06B7EB569D9DAB00DDAD0BA30E1EB589509BF09FC7EB4E93709FD933D7207A60765D73944FC4137E60C1B3F16228342D6888BCF2ED78B9C619C761479FB3CDC24C1BDE2CAB13A85397D880F1059E7045CB6DC826D790411803ED461FF4A8038927244CB45FC32B04D7F49BB94D6E11304086A70939FB0A637DF34B04BB65F54DF5F97B9D0956D76D7E7AA501C9ACB165CB5C4D106498DAA50B4D663C45A237689E1AFB39189EF2493088FB265DEF8B1BEE83FBDCF79E81CA51479B72588189C72B5A3BBEF74F9EC3882E1BE66A69DFDA5FA284242EBDF8965FCDF60D0F4EEA27ECBEA1F83CEE41C410C73DC82E595E0D357AFE1A55B7EB7D038DCE6FD6D55974A96551AF322D5C9737817EBE763C9F1BF82CAAA3DFCB224D9E201DCBD3244E3C0CBF8699DDC3D2A60945ECAD4D628A36A563FBD56E99460103A4FA68E2AF8B633883187F5DF9D5904AD00A7DF0A09421E6B30E3C4115736C6F400C12163EA7D8601508DDAF619A9C07AB332701BF25D4C2CF29369837AE0B25E4028E1EAC384FC6708A4D2C820A356EB42D5D6A40EDA730005FD2F53D7A0D91A0335E608229D6B01003165F7E1D93680F3745711DD04E5B6FE8900FA2C804F3DB6FE185E3C2E5434065B6DC043A3E3158D874A90964949BFA19D010CBAFA3DD298638DA9D7B62770AB39AD8343EF3E46ACD2C5041DB5D7770DB09C5C906CFB99C5E7F3684C5898FC6BF8F13C8780209B381D89C40795AC1661348D0F6FB9840D9E0E1B7676F45DB69549181E557B461EE2A10053B25A45DFB8CCB3E1A8AE83063A6EC48A89DC8AB511D032C534C7782DEFCB06CB047F596828A5B3B75C6AB5DE334C784B8AF0B5E82ECC7E60A4017D0AEEB83F1DAD87865C1E6B5B151A75513B17B3DD6586FEDF82BD4629DE772821E88823E6D98D330082083D0E15F123111476CE9E8CC1E9DD91A52356AD07C4BB2705D7440D8B5A7A3E8A6A1B343D87AD70D3F3B1BC1CC25E9055F7990CAEFDB8888B01FC7302AD251910E549166BEF1459280F5A6736D8AF7D5E688430862D7F5AA6D33D59E9E46BFAE22B16614D53139941CC25BA4B65F60BD013113F05C7EEB435B6D51B3F4E5B6A3FB6AE8B4D303B3EB1AC68E46E03830B9B8D1350C9C4A8993D0519BF9A73D9F157DDEC4E7F5D770660CFF46BE9D9931BE7BB183162E93B39BAE52F55E7CA9FE5739BB8B7CD94422EF8C0E282D7736FEB8C8DD4D27D0CEAB4C276548085464AF31B44F67A8C26CF90F3F3744EA0A9FA1803C8038B90DBF82E0647A747078349D2C7CCF89F3F4EA456AF08F6E96A1D50982302992AF6BE40A3F7C83728583D57A4E3737CF388EA0C4F1CAE7E41B476CAAEE4214E9B427748F1FCF5E030782BFF07CB86BBD2B2BDE7D765E7F759E413E89CB33895A6B11AD62F2EF1978F0024E9EABE3BF82575AA24AE9BD010F1391EA399ED30D8F39EA0B8DF6647A8FB24A403E66EAF11700C50CAE57AB6B076E46A2005504D940A6932FA9EFA3E0E793E983E3C7CC14A37BA89559DE4FD60943CBCB60055E4EA6FF35B98C4F7D580822B0FA38B9401DFC00BF415DF38F14141F26FF8D239144ECC9398D433971C9919AC158E2E9C37340C1B313B94F4E349D7C765E3E81E031798202FFEEBD29683C95B85DC8785A7109E4C383A3B7A6A08914E324ECDFAD9D97DF9BC2A3128CE71057500693ECBFA1D471D28A63E267088CD9BE4948F9DE9890F84E4EC6A3A30FA690894D9D04F43BA4A24DB955251B9749ECC1C18129645E1A8836F3969FB6822B0C5ADCC2128BB71A396E124857204522EE21AF0D55566F7DE1D4859B67F956E825BD05ACCAF49D438BD78EEF37512344966F5ABF895744D4F8E3E4F2DFEFB02CDC7718AC1F265711B4BB3E4E8EC885510B272253B858E76A4D343C49782937D2B55E7B64870D4656A719CF7149BCE0B591F227B6132D97256A23A1AFD7B4B5059D785661B592D52DD9AEAA4EB989B57BEA9B979E7734D977CF6437B587B406C6B556A5EBF6805404C748AB638DB41859E9E3AA61A5810FCC39483D3BD48A95DAEAAF4C13ADA982EE96E143927B9F8633ED3B99F3CAF9F6C6DC0C239EE4D1DE336981C67C865AA686B18ED21B2019B1D066AE92910AED2C317E6C822D9876C6BB1B3A535FAFE41ED83C47AD52B9609547DB82621596DCBA2DD7B1CCD6ED6C7C9C61453A6B920A3A6B260DA3D5EEA58E64A7F5A6362AA8619972F7AE84476E16311DFCD6D8BBC4F6D219B28714B2873F193BACFAB7690D754B89AF918E211B8DBA463CAD5BCFE99613BA4E026ED7114B6503B70BBCFCABB4E07E323F9928FECAF5C79ECFF93A03B7894901EB8F33BDB7938EA11EFEC80D6C0DE557CE9E3B1C522B6733959CDCC2A1A1E5C31DDB674F6502F206665145FD1C86D06E6B7028DC855AD4C0FCD0D6B9BD09F5720822A96DA1C07909C99521226C9B9EBCDEBC9E47D7D7BEBBBBBBF4BFB98AA3FF062B169E321E73EA8D9EC1D133B8C39E415126F5062A19B51B2DFBDD53CE642679CB4ABA7C3CDB32D8ECE936FD60C2E6C7A7CD826A4645645D11C96FF7F4A103D26C9A79D954474C307792316FEE68FB9CF456655BFB4EF2111ECBA195D4633CD2496C1C5EA97C83A78BC1F0CE315A790FEBE779DA1DFC54C9D7AD04305309DD2DC0C452BA5B80366085C6A434579957B2C643B5B15AEBD75D30A61AFB74E8C5E18E5494D5A921EDF379DBE4B446B9107588307DDA69AE1E554B4887C8B3FEC9E12E511D92E94D6B1E0F4C9973B3CBAB9438AF514F1E536ED7437499EEF3C6BC7C5E9A7BE0A3350ADE856691F40FC8FD3870E5603C3BB7A4144685B0630AE1DA8940D02C7EAF6CDA26E43D4F4626DBE9BEEBEC10A78993703794D57856D278BC03D3F3D76CA26A85C6655AF4A4E9B9A9D27BEA9B9BD27BA83E8B7D5E6D3AD2C9BF447064ED0EC177432F6819EC1A4B73DEAACDC2DCD8E9446DDB87720D4E6B77DDE36E7AB0BBE74E74D719A8DCD156FCFA75C667A5466A708B6F109A76D76E27A2D7FE3CB76D1CD38393BDA4B9D7C1501A4A9868DF4A170F7E7BA0412D1648AB2D6D6F9684C6D088F6FAA3D25E3611602DF3BCC79DC02097CDAEACFE7AA5AB5FC6B71CE45477413E056DB99B459A3C21221427D4EA2030F3BB259D9168172C824E99D3854DB04CA3A003B0D74E1C4355200FB069B20FC5D3D1670C553A37DF98877C97D8DF8018245D74F02974BF8669721EACCEA006FA2D71DB2ED10BD785127701690356C4B360CD0E8B2AFC5AC7BD5F3F8501F892AEEF817C97F9C6F880FC32C6601712D10ED725705314BE05ADE4F5C6FE3582DB6FE185E3C2A5C702592F637C22B4855526B11A2DFAD1A21F2DFA9E2CFA53DFF1D65AB6765673F4B4EF9EB5D791FF56F3F55F2814A863133353EFEE37046CEF01E5DDF0F91BCDCC2CDD91D6CCCC6A8E33739C99A4710F7BBB2EF20E58DF009580DBDFA4329A135A473765C571468C33C26E40E4C05611DD3892318AC2C67CA944B57A5F037D6104179F44B790B7DB78F88387D8517BC4F89EC1B6881DF210EBE2B26EEBEC0C63509C7515C6C935A773C18DDF6CA80A6E2FAEB68DD797C1787DB9CFEBCB83D4749A9A6D90E7DEDD3C63BAD567FC89DCCD76CF2E95309B6CDB4FC320006E76A89E44D9D640D64183C467E329CE788A339EE2F47E8AB370DDFCB85DC33556D41DE412D2EB56DFC6AEDC108FCC9BEF055FDBEEF29A4437751958A4F9C2E1AEABFDEF4D71EFAAD6B57BC6B680DA63BDD1539E7883A1BA1376C45F6AFA74722E0A95AF50FFD96243B35DD75F99B7BF2B55ED55842BC7BB1B10A77E227CB6A659C06A8B9313966E0D9F9C66C7DA1309D9C773DE196BA8813E57DFE10BFE3991195F4B271C7CD3EF631D462B81B18B99D768A82BC25E3898DB2A48742B0DF0F33934C969C33982B047EF0C57538F977A9C4DF256B44EA5A1464BAD378CA6BAF1833ABC463D5E721A1FD619A4E6311CC8F8D8D61636858B380E5D2F43903C4FA0726097997349ECCE83D5040515619975739496C07F9855DF3E431BC843EFD943044EA607B3D9E1949E6D5741CEABC92273CEC3913AB1EBAC5882C071AC4448D0D9CD315CE82212A53F30DDC0590FD08B4F9E832E77C449E44012B32AC20B5C6FE3F81411A87A9ACA040DAE8248979C810D08908AE00F55A747ECA088EDB8824F515B4587E33926410AC1C29294DD95E8E57F63B15C618D48E1220A487676245EFC4C8C0C4E74856E440D1F7E0FF2C61D9A96D4515916B72E7A283F1EFE5F4FF6B22C7C02F1CBCA7A9440C3D9D081C4A111F726740D85ADC8D4BB1579630CD6D327CF5F41E04259634D728CBB6C216745A5992C868D601AC1B724414C373D881077EC3AFDD66F456E4582B2B71DB22B4062FD94BF4781F131FFD08B26C26ECE5108145F3B91A06C803D484D3D0E9DCE4A6B7C8B82526F0BDA498B4293A0268CF6E0C11920BFB53503B507DB1ED7B193DA91EB5D739D3A16DF1ED7E943EB91F55DB39E1726B045FEA303F8DD350A8A4BBB1402C5D7C1CB4C3E8E611805D7D523C12DA5A53B87DD35FBE233860BA774D002C48E67188284B0DF5D8593DF88A6FACF3F0E5A5AAA610C43480A91B6A16AC4E6084F4BEC876E188C46C8DE15E86BBFC9CCED3D98D7DA737A17F69919B7FBDA677ED7DCDE85FD65C6ED5EF797DF35CB77665F99F15D67BBA0C5AE7DDF2E68F3772BDB85F28D97AD08527137B72FF3A0BC318C41293F0D5A831483188A915070BD2F3361E4FA4E180B05D76D0786ED0EDF7B8CE63260FDB6A3B80AB6F76A258E337E5BB66211501306096C01A2EA118515B8F0A238412FC5DC3B3160B88F5A41ABA5A8BF48A1D07E0AA1415607A1167CAC8B96EE13583B27D3D53DBAE293C7B12EEE37658598231F642F3F3BEED7C7284C83D55FC2FBFC060BD31DA78EA05FA2A6BA733ABE94E999AE20E8B6A8A6EEB0D2A14C4F5589A08BA25CA30B22A88CED872816754644DAE9F54807500A7AA6AB4931A0E34D4DC69EC5F749879FD5D0A000ACA7EE7AB141FA2C9B8A9F60A3D4E1D2805B4B804259A151DFB7E085377C614D050EA8921A0FF6321A83005B45D0335ED1ACE7657A5FA562D3C082ADAE8111DE488D1D2FEF3C072B7E350136BCCAE6986860A18D81BA77CE5E9FE99E5347D03FEEFA50F52CA0B894C27A14CD0D230672FE59001915EA412EC2F2B8E08B32491F4524A24E47C5513FB7A3A24CD25111DDA0D39180137591A41B3D8E88654B2551D56998AA0BD1F38E4C8FA28A0204D8EABAB808FB56F4A5C7B4EA9D1E2EDFAA5209EB8A3A06C2583D6F2196C9AA8A4A348B8A7ABD6BB0955F4D8285194BF9B73DB958686B6B5E6516136C43C118AD82BB6513AC0D69CBEA5C46E37B1D2A8260DF987D93F80619D69C2EA2FDD6E480758821BB0FC5A385F6FD2992141C2B3EA7075120218ACC2AC720D115AC1288BDB5A3A090E29A8F904498B1CF50292B5312CA90D40D0823BE5EC2218AE65D1462202295910D862D9490847FF7C4005A03F2E077273804115EADE0F8AD3044F30F92A1325656D5ACF86A6960D8E18A7074A203180B436438C86BD57470F819826870C273865D1F1CE333158D50EE5CDDF9611626BC68709CF8650B4322B61D55B3E2AB9D8111DB44C1E884A7E82D8728DCF066CD39A576865CEC930483E504865AE024BEAFAB5AE51FED0CAADE9C09C6C58F656C39341EDFEC718B09CBE38C4D1EBAD772780CD72C718C8940130DACAB65A1D381E92C091A5159BB3C4485D694C71E99A3B965ADC98980E10C5A1527D3929FA423276B537EB23540C58C548584ECFE00254E0959E483152F440FC3D3513C5A47FD3BC0C9F26DA3EA98BA2A3B9EE73EACE203FC0BA79BF308E070801F675F8FE7376980DE62CAFF9D81D87BAC411CD7F9026AA0651DE4AB2B9D1E14466515EAF9A6CF2071564EE22CA2C47B70DC0416A37CE199EAC93232A107A6EFC1EA32B84A934D9A94594C7062A0537E59FFC77306E7E3ABFC78C9C610209A1E7ABEEA2AF839F5FC5585F705E74D3A0108143E503C80E665791820B8C7D70AD29730D0045490AF8A7AB805EB8D0F81C557C1D2412918CC718302FB093C3A2EF2661589234540D48C20C97E7CE6398F91B38E0B18757BF817CAF06AFDF2A7FF07AE69478DF22F0200, N'6.2.0-61023')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201910240752449_Upgraded_To_ABP_5_0_0', N'DoAn', 0x1F8B0800000000000400ED3DD972E4B891EF1BB1FF50514FB663ACABA77BA63B243BAA75CCC8EE6EC92A8D77635F14140949DC6691651E6AC91BFB65FBB09FB4BFB0004FDC0709B28AD50CBDA8082091C84C24128904F2FFFEE77F8FFFFCB20A66CF204EFC283C991FEE1DCC67207423CF0F1F4FE659FAF0C79FE77FFED3BFFECBF1B9B77A99FDBDAAF706D5832DC3E464FE94A6EB0FFBFB89FB04564EB2B7F2DD384AA28774CF8D56FB8E17ED1F1D1CBCDF3F3CDC0710C41CC29ACD8E6FB230F55720FF017F9E46A10BD669E6049F230F0449F91D962C73A8B32FCE0A246BC70527F3C5FDFA345AAD9DF0157DDC833FAFE3E83F819BE63FCF21DCF4F52286FF7F8BE2AFF3D922F01D88E412040FF399138651EAA470081F7E4BC0328DA3F071B9861F9CE0F6750D60BD0727484039B40F4D75DD511E1CA151EE370D2B506E96A4D1CA10E0E19B926CFB74F356C49FD76485842D0885469D1317D235F3FCF453F4389FD19D7D380D625431A7FD5E5E0F4AC75ED5E08719FAFC1F208EF620635651F8432D276FF70ED0DF0FB3D32C48B3189C84204B6327F861769DDD07BEFB57F07A1B7D05E1499805018E1E441096111FE027C8E83588D3D71BF050227DE9CD67FB64BB7DBA61DD0C6B530CE7324CDFFD389F7D819D3BF701A8B98F0D7D994631F80584207652E05D3B690AE210C10039FD98DEA9BE6E41E88429D1E39B235523289A3183A4BCC912C4CFBE0BD08FAA1D946EC8A5F9ECB3F3F209848FE9D3C9FCE8EDBBF9ECC27F015EF5A51CF06FA10FA73C6C94C61950F5F519A44F91374857D70E9AC890E489A4ABC383A31F2DF47503A084867F77824C362EF8AF85BECE5F809B21F9BAF51B2A9E41092B7E3302A909ED2C8B4BED40489B21B8D3C087C27DB95E785E0C1219E5DFD9A07BD19D429C0E8F7EB6D0D5C738FA86E656F81049FA7A7B786485C56845C398C19B2407070716BABA5CC15F49143A5057B5D01D78F356FAEA345F2FA0F83AB6C77ABCDF2C53D2C5EBA3E37E7D8CA32CF4FE12DD17FC95AF624483648F699F2F6AD34256F705C982BAB2306D0CB511EC78113FCAF5FF8F3FBFFD496FB931ECFC367E3D85429162743E7C670CE50B784921242BBAFE9393886129E679B2B877422F0A412D371FA328004E688CC575EC47712E352557A0754DCEA1A686E9EA1303C7DACA9803D3508ADA7AE61CD9BE517801C1422DB004699A4BA3C2625EAFA18AC80BF6CA96C91E179235537AF6D14900C61B0A61F9CA5560C62C022ADA7F719EFDC77C947C80F3D90D08F2F2E4C95F978871C97057B7B888A3D54D1488285F55BC5B4659EC227989746ADF3AF12348BB898009D3CB2635D347BD63E28A82BD85466108BEE9659139F39375E0BC2AFAD634770DFBBE4CCE4000F7389D957201A68D0598B714EA5CF582F439F2FC8752D8BBC16885FE962F19F987D327277C042AA551D4FDD58775E2D73DBCE5648F526CCAA96287E30528DCBACD57268CFA45A1E9B61C03005720357574C03550380AEA471B9BE446802F2082AA7DF97B1B7B65BD5DA7D0BEA87E16A44EF87606C68C3BA601666648EAB15686AC72372323FF40826CA33C4808931211CFD0AED3F30BF8A6F21DDA712C5DC5FEA31F3AC130BD553F157AE0BD156F6FF973DB744FABA57E89E67EDBD51E369EE6EAE67CB7BBEB01B76A2A9FBFA42044D2A970FDDA3933E9ECA6EEE826BF014E22F7E65B39F2EAEDC450EC9EC1148FDA7882AAE98E6AC1B79E988A52F389ADDDC97EB2E0A0EBCB33B7B84F60A99B96E2B083AABA95085B527F862A4C6544699F5AED9497BB60A0D91CFA0C85DFCF1BBAAF7B3C0043F9B6C921B3612ECD5CFF04154DE6A837569F22D709FC7F16FA81D37E72E7EE842ED8A813D8959A16768CBFCB040E1121D5D9D53CF9AC77DB67CD5172B7E045B9A155294A0463D4CA721B0DA78AB89B519AB54D3F70BF906D16B66296ADC5773F1D1EFCFC733F2BC4A4B3143AEB4B94D6C4D18900C3EB277B74EB71B9DF7EC97CCFDC638D0DD98E7BD774F197BB8D4CE2BAD41DA16E14A3B414F8590BA63244DA46F067D3DD2249C0EA3E78FD5B06176138C55521DA36872B3D96B47238B004CF800939C345B8A9602886850A924618BE393CF8C95250709079C01BB0CBCAA618A4B3F1AC10CBEC3E71637FDD7DB5A0217D072B873D1FF5C697AC49976F40976FB79AB88A1F9DB0DCC5C261A5E8B042A51EF036C91E0FC2B4EFB5AC4F10518D639499580A92515DF59335BFD8B86648B7D931CD0CCB33E3DA8941C8CAB24248A0F696E9FDB79B73B9F7E4429A9CD8A37408C942194E9FFCC083C2CF8D62A0F5CE5D53BB8960105662A217C43579910B32AC8BF9DA07CE15266A9CABD1B55A0FAE41BCF29324DF84EB055C64E953145727054CF329D862270F582F935F6288EBAE5B4768AA759C110844B2C705D45B18058BB265F35B9B8088151D098840247B5C40DB4240737F8891042AE825794247248A39E124ED4EA11E6B6879B8F5A67BCF912F67A0760BCA1C37769E80F812C52B74F4AE7414F5737FB28F4568176F7A2E9168B936A26F1E1C38ADA6309E69072486C1DD5020457E47546AF6117419B3E5612A98EE74303911634754A2B0C3CAF8D8E1154CB1A365418C225B93C293AEC04796A965BC73AC4D0E7EE07EDE0B5189C2132BE3A38857E814915F90C98E4DD25877BB6693F4BC596CCC04443CE599562F511F0D0EE72BC70FD477AC7AC2038914A25A798AAB8A63B372D36B73546F65A16D96411BB1D196591C6EA2DF6B2749BE45B1ECE8B527AF4CCEE4D3287CF0E1BC4453417112F0C64A2C7A35DE1B908074901E3F45EED7284BCF430F1968BFA5AEA9A9B8705D380F2E20B58047BF0AD6E2ECF132A931B212937FFD1485E04BB6BA47EB6CD75D950A75ACB35274BA0F6009DC0C0570C14DD26A3DC06588DB6FD185E3C205D512032E137C2AD980B77053FF194CBBBC699747C3081C7FC537F9F37D4455DE58FBD867C6D0C7CB4C7720AAFD66019BBFDFA4CB0488F5B8DFCC810AF69B74191FBBDEF79B3964D97E935B818F6CE7FDE6A7E8D1176C358B0ECA721ABBFCB300A7A2CCF6CE37872DD8F9D2657CC4543B5F1976B9D35C8C57594C61947FE5E352149962511E434810696A50B854057C74EAD2CE1E815CEBB43DDAC91B4FD143E2BE3616A79B730601B0B06BD4E8699847DBB7FBD41941CA7569DBD994379E66D316CEA69C33F0DBB3EF49F7763D3908AA9E07B8726924ED3A71D922619F22B2B754D66D44756FB7A2D68C67C9DD088F65428F3DDBB12B93C84A44B6935B7A4357CF2DA512F95E9D2D864F2375BB6BCE8731DD1B14CCB7E99AFA744D7D34571BFBBBA63E06BDD83EC083F37CDCAEC576F41C6F2A4ADBA2A192DDCDC4432A3AED693B0B0DEB108A109A8A659F12D56E25B3E07490F75DDB965D8ECF0A4D283A40634B197F3DA78AED43B4B20BC1311A5B2AC2B1CB519A2CC554099E93538A2C11E125CB1AD5F978AFEC4376C027A8224257EB90CFC8D1B670DD22DCA59DAFAD6C3EF92EC47D6DCCDD963BFEFDF0ABA11EB518C7386804E2B4BEEEE0FA6A7E44B680D373B56EADD07018935613F7D54AAB59DD905877FE568AEF2AD6D64C7A0F67A84EB9773521C990695D6E40825D9ACBCD2F3879F3D95C1415110BC3F9658C3457379F330FC2E47136D00BAD3A2628DE6D24E8EA28206497666959634BC5D7F4CD28D1E23BBD1E35826DC5F4AE9ADE3CC956D82C11E44FBF4C2E02E731A971924F1B0248C2CFC9DE49EFC325D70371F00A97E89215AF29FDB0CE67802E86D4D14BDFE6B3FCF81AAEE30C4989AA1F41107D2BEE07D64D0E0FE46DE8EA8A2E16F7D133A0DA1C29BAF8D57F7C6A2ABF65995BB051C25A3697AC1957CF9FE18487DCCC922217970F12263FEDB05CCD651FCDC7922C0A12FEB6F688EA87F2EAF56CAF88DE82E6FC433733BA4B5EFD2D210E4BF5C2EED323F932CBEFABE992FCDF9C3814D19BAE7B1EC7515C577E23AF7CE1A4D85CE3A84625277946BA191F4963828567EF4D20538E1A72E9327C7602DF136D43F5D8570269AE9CEA31325FE7123809AAD32C3E4B05BD11FB7ABDE5A0345F385DBE53639A13266F8B5DC82B9BFFA4681E7E0DA36F214A6F19874E504655976D7F96B745773A817795A57583F76A5CB1DB94028CE955506BDE0836085D542017A45D1D5818A952F6C0B5477BE5B9C1EB1EEA5071912491EBE7C3234F97C84473F58112D9F979E8CDCAF496B25677D48303799A4D5E83F92C0F8D40B994E0727332FF03335CDD1EEBC720991EE93E0EC931C13EAEC262499E2DF29373B8FE3B89EB78AC890C29EA915FE07609A0F72D7D075D8D45CF31FA61CAEEADFCD0F5D74E6032120A88E6160D21597747979C813508D1EECA84873A7860D1192C3A75AF142D55A43BDEC7645521C29254F5620996E5B7E7093056BF5799D2449127F1797DB2A27A8AB593610DEA0D21C21A14D292600CCE5688319B89584748246989F9829C27721F5C96C5F99035E75B0F422C24DDC0522CA48DA91843401B9364F1CBCE22F1D0789ABA110DD6DD4A8AC7C1DE1EBBD5D0E98B2386AABE2C89A272FC0388A1922E3A3834EFF36F44F2F0172244FCE73E17411E3D0CA414798F5350989497C87B113A0E21061033CEA0757AAD3CD11B142B2C5051CE515ECCA25CC0643B1FE14B210A985C35D84150580C06931696A03A5D5367189B931C3C7C54CA656E246947C9E1859E0E2B391C0C86921C0E4175BAA682DC3627394CECAC94D5E230DA8E32248CBB1D569044680C254D22FAEAF4CF8B3EDCA05C158F19C9994EBD6CB43913897A4789C2A4F461F767229184184CD888418FC344C2DE9592CBD635EF85AACD09D835E73D2C0A9D6B3669477F12C721CF5062C721C53864AF78784CCA66EA15B2CDC91BF9E6198548F1F64B7FC245506128B122463C0E81AA1F9093B2927D4DAE85492482C9919001B40F3DA4A164841EF6D68B09937042C45571F68986B17AD35E0273709B5C84C100F22222E858DC024C32102997156E815692B351B7800883A12467C46E017E8E1629AB75DC02AD6468F36E01291A4349D34EB80598743A52CE2BF66F3C69EAC99E1666F2A1D0196AFF2622CF50C2D872FF56BD4DB811D9E3BC042162B7EC598886E1D58B3DFAFA4CF296C460CA4C8CC300C22326EC586C2ACE5B1D0A6E2BECAAD652B451DB4A8CC370523462FB8A7A5145C16949C46B6BE9318F69B52E3CC307A3F2E9A9D3F1A6A34F45AFDC28B8AC6394B716A1CD1BE60A448693A8111AE765185F14A6B00576BB0F7F21F0EC1E958317DE5D63886A79CD21291F0FA0C505C187667005398353E853845265349739AB4704CA328ECC9140C8CB991C484485E2B297026439B379C06A45A80241C4D072E01051A65AC0E8007311503A0EDB0053F85585EC92F35A170D928CECE741A4AF6328007E823D670E7FD08B35D222B90056D5B4E1DD4239D684799B8BBC022E71AF8703977D6EC200E032BBAF939FAB80E375B53AA263308B432DB6135E3D63E03A8095407197010B8EB3EB56C0138D586B844849F31A176B9D46E32AB9181742198BA901A6CA15C50553C62B688011D1A239255400914C7D5D7EB08F7DF0A0899E0ED7022E06A845A5F20D3E11A1EA17FE74F956BE7E25655FFDCA96065015EDE83A5A94438D74E633AF1E031CB34398D55770317086B5915DF1E36FA4089B55EF2E614D00CEBAC6D864A6D70631E08DD1413B21492AE95050762F8D4740ED7B6CE410756EB2E123246D2219F1742EA0319099915A25247B334A4149C5552AE180C597A904B42CAC364D728AEF40E972AA051DC5F7723834D4BCC4438C507D8D071B1D477D4988A7BEB56302BA05F18A48F4D23E60C985178B4781D5E291A4B45F2464C00170068EDB3096468C3FCF2C1AB6C871CF419DE3B86F41008E9B5E05A52D0188B79F050410FA9C59D4793E677302F03CCC7D11807DBF594005B90B8C1D84D005664E0FA1C3AB37A29416BE88149CF86A0ED66484758B619381D114800A473B2326367A82610BCF8F59D47927C8E604E01DFC6250089CED90A1DC930908C00942659126C350CD074D468F52ED4BFCEC0CB631B105E3E5C748B228335192E6A36682223110A2AD408B7133317D9CA1CBE3FE08D485917F18F65C96C9A1F4A8DE98D0341101F4163D61009B3901065AF4F81156222A182C7AF2602C737A0CB9E831E141227AE82D01C22022732A0CBA04F07296B08450C5B3F08EEC143AA2F69449C8218961E9412278A95184A4D0D31592B08C76A4184863D059588464503BC3047105ED863F8C9B4B98E6454806039DA93A2D6F47983E3467F5126E7D6E5B971DEF2FDD27B072CA0FC7FBB08A0BD669E6041009102455C16767BD46664CD3B2FC325BAE1D17A27FFAC7E57CF6B20AC2E464FE94A6EB0FFBFB490E3AD95BF96E1C25D143BAE746AB7DC78BF68F0E0EDEEF1F1EEEAF0A18FB2EA190E953E6BA27A83A9C474095A2D4621EB8F0E32445991CEF1DF4B8DEA9B762AA894EA905DEECAA57FA209AE560E5D7AE5AA0FFEB83714926BDA2E5450CFFFF16C55F9B036D3600A0040DEB3EAE501C41FE42352611E2A6B0F1D2750227E63C887D1A05D92A148734885B374F5CE3309AAFFA90AAE0051C8E28A0410C6509E267DF2D736AE2A088027D789F41FA14792C38FCBB3EB46B07F138CD272D0E0DFFAE0FED06A4591C969989717044813EBCF317E066486914AF71E310A9A21630CFCA54DA02B84DB13E6C262B070E99293485CBF21CFFAE0F8DC8B08183230A4C288AF4328792F5677D58972BF82B89423C2E96D0059CF276D0F97A825FC38053795851912098E014F69D8576BC4F69515A93EF33AA9C5A60E9B5416BE5A0A28FFA5B3ED82826F3754403463F0B0AECAE78611A07517F3482B3881F13064EF1D160818BA1E9909FCD130B5CFD551FD2176863C076AC72250AF4E12103910B8F283098AEC9E2DE09BD28043403F10283C5AE4EA1402C75F55783694E648D20263A51620891AFF314D70436A63EE88882FEF407FF1D64731DA202D08F02C162AD89F5511C829DC3829B80A246F556B5E035681CE6998F22E7567EBE7EF5212A0AB65E26E8FFAB87DF99F1971CD2EF47C3597B7B0DD6B633B5EA3856B7B1BDBD5B6ACDAA0A2A98BAFD1A88D11A5CC487551A2DD797DADBD6FBC2D28291C296FD689AEEFA0172791D38AF2C20A2C0C438AB73F290A659FDD90037F20A1B819DFC769B02265797912566E62D9B4E97B673D91A6D7AE01343E76A8D18FA6E69F7B64A4511D4684DB360FDB4512FD2E6FDE8983273182B1DD8776368CCCE19FF6E60439351A08C2DCD169BC2E6836C03098DED220B0256D5F2CAFBB436373AC7D4B1D876E71A7575ACED9C5381E9698F8809B04CB80DAD06F08DB32D68BEEA43BA8AFD476820061C705491893BA6F8C9CE13B2C41CA27806F26BECEC1CC462EC8759EA96DC6BCA26AB1D17423F93CEF641C8388E7FEC9B81282F5E888285D8730FAA689B8E6AFA3D6ABA014E429F8855DFB6FF307B434AABB92ADD632803E7CA758BA8061D28BBEF74B4EE5470E939537C31724BF8094AD9CDFA25EAEF9393430C717272EC8093837C2262505D7ACBC4ADE57DB6D0A77C48DBAE532BEC5995489618049095419B44EC58F94D1FCA5F0175EC9D7F18F67869D22D3BA05BC88719FAD32DCCE30EE64A450DA2A7C31AAC5F8E8DC5941AACF7CC06CB745F85EA572C612135256D9C9E2C4CBAAC0DD4459280D57DF0FAB7CC09D0C4E5C4BE2A2B6FC219BC04CF808D366ABE9AEEDD12DEE6CDC88F70FEE20699073C2E3CA6D07CF54CF8CBA799AF63D2B1B297B386D1B7CC0B5CDD74AF1ADCB65B7576AE02F4B72E4C3A78D226426DC27F1EAF3F4DC27D66CF5C83E881D976CD513D114FF88105CFC68BA1D0B4A021F2CA37E3E59A661C871D43CE360B336D7CB3AC49A04E5D6203C61778228F96DB884DAE21833005DA4D3EE84907124F489868BF965708AEE93773DBDC2260808C4F1372F615C6FAE6971876CBEA9BFAF3F73A13ACAEDBFCF44A23925963CB96B99A20C830B54D179ACC788A446FD43C35F673303CE5936014F74DFADE17B7DC070FB9EF3D03B5A38E36E5B002138F57BC7202FF9F3C87115D36CED5D2BEB5BF4409495C7AF1ADBE9AED1B1E9C2C48D97D43F979DA8388214E7B906DB2BC5A6AF4E235AA7ED7FB161A9DDFACAFB3E84ACBA25E655AB8296F03FD7CE5F80137F0595447BF9745963E413A56A7499C78187E0D33BB87A54D1B8AD85B9BC4146D4BC7EEABDD328B430648FDD1C45F9724700631FEBAEAAB2195A015FAE0432943CC671D78822AE6D8DE8004A42C7C4EB1C12A10B95FA32C3D0FBD332705BFA5D4C2CF29369837AE0B25E4028E1E789C276338C52616418D1A37DA962E35A0F65314822FD9EA1EBD8648D0192F30C1146B588A018B2FBF8E49B4879BA1B80E68A7ADD674C807516482F9EDB7E8C271E1F221A0325B6E021D9F182C6CBAD40432CA4DFD0C6888D5D7C9EE14439CECCE1DB13B85594D6C1A9F4572B57616A8A0EDB63BB8ED84E2E483E75C4E6F3E1BC2E2C447E3DFA709643C8184D9406C4EA022AD60BB092468FB7D4CA07CF0F0DBB3EFD1761A556460F9956D98BB0A44C1560969DF3EE3AA8F96223ACE98293B126A27F26A52C700CB14D39FA0B73F2C1BED51BDA5A0E2CE4E9DE96AD734CD31211EEA829720FBB1B902D005B4EDFA60BA36365D59B0796D6CD269F544EC5F8FB5D65B5BFE0AB558E7B99CA007A260481BE6340A43C82074F897C64CC4115B3A39B32767B686544D1AB4D8922C5C171D10F6EDE928BB69E9EC10B6DE76C3CFCE46307749FAE1571EA4EAFB262222ECC7314C8A7452A42355A4B96F7C91A660B5EE5D9BE27D7539E21082D876BD6ADB4CB5A7A7D17F57B158338AEA981C4A8EE12D52DB2FB0DE80840978AEBE0DA1AD36A8598672DBD17DB574DAE981D9760D634723701C985CDCE81A064EA5D449E9A8CDE2D38ECF8A216FE2F3FA6B3933C67F23DFCECC98DEBDD8420B97C9D94D57A97B2FBFD4BFEB9CDD65BE6C2291774E0794963B1F7F52E6EEA613681755E6B32A24042AB2D704DAA77BA8C2DEF21F41618834153E43017900497A1B7D05E1C9FCE8E0F0683E5B04BE9314E9D5CBD4E01FDC3C43AB1386515A265FD7C8157EF806E50A07DE6A9F6E6E9E711C4149122FE0E41B476CAAEF4294E9B467748F1FCE5E430782BFF003B86BBDAB2ADE7D765E7F759E413189AB3389466B11AD12F2E71978F0434E9EABE3BF82575AA22AE9BD010F3391EA39DEA71B1E73D4171AEDC9FC1E6595807CCCD5E32F008A195CAFBC6B076E46E2105504F940E6B32F5910A0E0E793F9831324CC14A37B689459D14FDE0943CBCBD0032F27F3FF9A5D26A7012C0431F03ECC2E50073FC06F50D7FC2303E587D97FE348A4317B724EE3504D5C72A466309678FAF00250F8ECC4EE9313CF679F9D974F207C4C9FA0C0BF7D670A1A4F256E17329E565C02F9F0E0E84753D0448A7112F6EF56CECBEF4DE15109C60B881E94C134FF6D28759CB4E298F8190263B66F1252BE332624BE9393F1E8E86753C8C4A64E02FA2D52D1A6DCAA938DCB24F6E0E0C014322F0D449779CB4F5BC115062D6E6189C53B8D1C3709A42B902211F798D7863AABB7BE70EAC22DB27C2BF492DE025667FA2EA0252B2708DAA81122CB37ADDFC42B226AFC6176F9EF775816EE3B0CD60FB3AB18DA5D1F6647E4C2A8851391295CAC73B5261A9E24BC921BE95AAF3DB2C316236BD28C17B8A47EF8DA4AF913DB898ECB12B591D0D76BDADA824E3CABB05AC9EA966C5755A7DCC4DA03F5CD4BCF3B99ECDB67B29BDA435A03E35AABD2757B442A8263A435B1465A8CACF571DDB0D6C007E61CA49E1DEAC44A6DF557A589D6544177CBE8212DBC4FE399F6BDCC79E57C7B636E86114FF268EF99B440633E432D53C35847E90D908C58E83257C948856E96183F36C1164C3BE3DD0E9DA9AF570A0F6C91A356A95CB0CA936D41B10A4B6EDD95EB5866EB6E363ECEB0329D3549059D359386D169F7D244B2D37A531B15D4B04AB97B57C123378B980EFED1D8BBC4F6D21BB28714B287EF8D1D56C3DBB486BAA5C2D748C7908D265D239ED69DE774C709DD2401B7EB88A5B281DB055EFD545A70EFCD4F26CA9F72FDB1E373BEC9C06D6252C0FAD34C1FECA463AC873F72035B43F955B3E70E87D4C9D94C2527B7706868F970C7F6D9539580BC85595453BF8021B4DB5A1C0AF7A11635303FB4756E6F42BD0282486A3B28705E4272658808DB6620AF37AFE7C9F5B5EBEEEE3EFD6FAEE2E8BFC58A85A78CC79C7A936770F20C6EB167509449BD854A46ED26CB7EFB94339949DEB292AE1ECFB60C367FBA4D3F98B0FDF169BBA09A4911595744F2DB3D43E8802C9F667E3ED51113CC9D64CC9B3BDA3E27BD55D9D6BE937C84C7726825F5188F74121B87572ADFE0E96330BC738C4EDEC3E6799E6E073F75F2752B01CC5442770B30B194EE16A08D58A13129CD55E695ACF1586DACCEFA751B8CA9D63E1D7A71B82315657D6A48FB7C7E6C735AA35C887A44983EED34578FAA25A447E459FFE47897A81EC9F4A6338F47A6CCB9D9E5554A9CD768208F29B7EB31BA4C7779635E3D2FCD3DF0D11A05EF42B348FA47E47E1CB972309E9D1B520A9342D8328570EDC4206C17BF5735ED12F25E242393ED74DFF67688D3C649B81DCA6A3A2B693DDE91E9F96B3651B542E3322D06D2F4DC54E903F5CD4DE93D569FC52EAF363DE9E45F6238B26E87E0DBA117B40C768DA5B968D565616EED74A2B6ED63B906A7B5BB1E70373DDADD732FBAEB0CD4EE682B7EFD26E3B35223B5B8C5370A4DBB6DB713D16B7FBEDB358EE9C1C95FD2DCE960280D254CB4EFA48B47BF3DD0A0160BA4D39676304B426368447BFD51692F9B08B096793EE04E6094CB665F567FB3D2352FE35B0E726ABA209F82B6DCCD224B9F1011CA136A751098F9DD92DE48B40D1641AFCCE9C326586671D803D86B2749A02A9007D8B4D987E2E9E873862A9D9B6FCC43BE2BEC6F4002D23E3AF814B95FA32C3D0FBD33A8817E4BDDAE4BF4C275A1C45D40DA008F7816ACDD61518D5FE7B8F7EBA728045FB2D53D90EF32DF181F905F2618EC5222BAE1BA046E86C2B7A095BC5ADBBF4670FB2DBA705CB8F45820EB65824F84AEB0AA245693453F59F493453F90457F1A38FE4ACBD6CE6B4E9EF6EDB3F67AF2DF6ABEFE0B8502756C6266EADDFD8680ED3DA0BC1D3E7FA39999A73BD29A9979CD69664E339334EE616FD765DE01EB1BA00A70F79B54467342EBE8A6AA38CD886946D80D881CD92AA21B473245510C365F78CF70A02F8C7CE36D6FA1086CE27D101E6247DD11E33B10BB2276C843AC8F3BBD9D93384CB173D6351D27259DCE3D387EB3B1EAC19DB80137DD7206D32DE7216F398F52D3696AB6511E8FF7F3DAE9465FFB27523CDB3DE254C26CB3BB3F8DC210B8F9D97B1AE73B0859072DF2A34D873DD361CF74D833F861CFC2758B53790D0F5A5977944BC8A01E011BBB72433C72A7BF1F7EEDBACB6B1304D567FC91E64388DBAEF6BF37C5BDAD5AD7EE51DC026A8FD55A4F79E20DC6EA4E18A95BB51085DA57A8FFBAB1A1D9AEEBAF2CDADF55AAF62AC695E3DD0D48B22015BE6ED32EAEB5C3010B4BB7962F53B3631D8884EC1B3B6F8D35D4485FB5EFF1A1FF82C88CAFA5170EBE19F64D0FA395C0D8C5CC6B34D61561271CCC5D1524BABC06F8691FDAA4BEE11C41D8A3778EABA9C74B3DCE36E92D3A67DC50A3A5D61B4653DDF8DD1D5EA301EF424DEFEF8C52F3180E647A936B039BC2459244AE9F23489E2750A9B2AB04BB2476E7A13743B1475802DE02A525081EF6EA6F9FA10DE4A367EF210227F383BDBDC3393DDBAEC28257B345EE9C87237512D7F15882C071782224E824E8182E741189D21F986EE0AC07E86128DF41774092347620895915E187AEBF76028A08543D4D6582065743A44BCEC01A844845F087AAD3237650C4765CC3A7A8ADA2C3F13E26410AC1C27299DD55E8153F13B15C618D48E1220A4876F6245EFC848D0C4E74857E440D1FFE00F2C61D9A96D451C918372E7A288D1EFE5B4FF6F2647D02F1CBCB069440C3D9D083C4A1110F26742D85AD4CE8BB1179630CD6D3273FF02070A1ACB12639C65DB690B3A2D24C16C346308DE05B9220A69B0144883B769D7E9B2725372241F91310F94D21B17E2A9EADC0F8587C1844136117EC2804CAAFBD48503EC001A4A619874E679535BE414169B605DDA445A1495013467BF0E08C90DFDA9A81DA836D8EEBD849EDC4F5BEB94E1D8B6F8EEBF4A1F5C4FABE59CF0B13D820FFD101FCF61A05E5DD5E0A81F2EBE865A618C7388C82EBFA2DE18ED2D29FC3EE9A7D181AC385533A6A0162C7330E4142D86FAFC2292E4E53FD171F472D2DF530C62124A548DB5035627384A7257643378C4623E4CF0F0CB5DF64E6F60ECC6BED39BD0DFBCC9CDB43ED33BF6B6E6FC3FE32E7F6A0FBCBEF9AE55BB3AFCCF9AEB35DD062D7AE6F17B4F9BB91ED42F514CC4604A9BC9B3B947950DD18C6A0549F46AD41CA418CC54828B93E949930717D2B8C8592EBB603C3B687EF03467319B07ED3515C25DB07B512A719BF295BB10CA889C214B60071FD8882072EFC3849D14B31F74E0218EEA356D06A29EB2F3228B49F2268903541A8251F9BA2A5FB0456CEC9DCBB47577C8A38D6C5FDBAAA9070E483ECE5A3E37E7D8CA32CF4FE12DD17375898EE387504FD1235D59DD3F1A54CCF740541B765357587B50E657AAA4B045D94E51A5D1041656C3F44B1A83322D24EAF473A8052D0335D4D8A011D6F6A32F63CBE4F3AFCBC860605603D75D78B35D267F954FC041B650E9706DC5A0214AA0AADFABE052FBCE10B6B2A704095D478B097D11804D82A829EF18A663D2FB3FB3A639B06166C750D8CF0466AEC78E9E93958F1AB09B0E15536C744030B6D0CD4BD73F6FA4CF79C3A82FE71D787AA6701C5A514D6A368611831908BCF02C8A8500F721996C7055F9649FA282311753A2A8FFAB91D9565928ECAE8069D8E049C688A24DDE871442C5B2A89AA4FC3545D889E77647A14551420C056D7C545D8B7A22F3DA6D5EFF470F956974A5857D63110C6FA790BB14CD65554A25956D4EB5D83ADFC6A122CCC58CABFEDC9C5425B5BF32AB398601B0AC66815DC2D9B616D485B56E7321ADFEB501304FBC6EC9BC437C8B0E67411EDB72607AC430CD97D281E2DB4EF4F91A4E058F1053D880209516456390689AE609540ECAD1D058514D77C8424C28C7D864A7999925086A46E4118F1F5120E5134EFA2100311A98C7C306CA18424FCBB2706D05A9007BF3BC12188F06A05C76F85215A7C900C95B1B2EA66E5574B03C30E5784A3131DC0581822C3415EABB683C3CF104483139E336CFBE0189FA9688472E7EAD60FB334E14583E3C42F5B1812B1EDA89B955FED0C8CD8260A46273C45EF3844E186376FCE29B533E4729F24182C2730D40227F17D5DDDAAF8686750CDE64C302E7E2C63C7A1F1F8668F5B4C581E676CF2D0BD8EC363B86689634C049A68607D2D0BBD0E4C6749D088CADAE6212AB4A63CF6C81CCD0D6B4D4E040C67D0AA38998EFC241D39799BEA93AD012A66A42A2464FB0728714AC8221FAC782106189E8EE2D13AEADF024E566F1BD5C7D475D9F17EE1C32A3FC09F70BA398F000E070449FEF578FF260BD15B4CC5AF3390F88F0D88E3265F4003B4AA837C7595D383C2A8AA423DDFF419A48EE7A4CE224EFD07C74D61314A2B9EAB9E3C23137A60FA1E7897E15596AEB3B4CA628213039DF2CBFA3FDE67703EBE2A8E976C0C01A2E9A3E7ABAEC28F991F7835DE179C37E9042050F840F9009A9FE76180E01E5F6B485FA250135049BE3AEAE116ACD60104965C854B07A56030C70D0AEC27F0E8B8C89B55E697140151338224FBF199EF3CC6CE2A296134EDE14F28C3DEEAE54FFF0F5DC0940D19300200, N'6.4.0-preview1-19506-01')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201912171340379_Upgraded_To_ABP_5_1_0', N'DoAn', 0x1F8B0800000000000400ED3DD972E4B891EF1BB1FF50514FB663ACABA77BA63B243BAA75CCC8EE6EC92A8D77635F14140949DC6691651E6AC91BFB65FBB09FB4BFB0004FDC0709B28AD57CAB228044223391482412C8FFFB9FFF3DFEF3CB2A983D8338F1A3F0647EB877309F81D08D3C3F7C3C9967E9C31F7F9EFFF94FFFFA2FC7E7DEEA65F6F7AADE1B540FB60C9393F9539AAE3FECEF27EE135839C9DECA77E328891ED23D375AED3B5EB47F7470F07EFFF0701F401073086B363BBEC9C2D45F81FC0FFC7B1A852E58A799137C8E3C1024E57758B2CCA1CEBE382B90AC1D179CCC17F7EBD368B576C257F4710FFEBD8EA3FF046E9AFF3D8770D3D78B18FEFE16C55FE7B345E03B10C925081EE633270CA3D449E1103EFC9680651A47E1E3720D3F38C1EDEB1AC07A0F4E908072681F9AEABAA33C3842A3DC6F1A56A0DC2C49A39521C0C33725D9F6E9E6AD883FAFC90A095B100A8D3A272EA46BE6F9E9A7E8713EA33BFB701AC4A8624EFBBDBC1E948EBDAAC10F33F4F93F401CED41C6ACA2F0875A4EDEEE4181DA3BF861769A0569168393106469EC043FCCAEB3FBC077FF0A5E6FA3AF203C09B320C0D18308C232E203FC0419BD0671FA7A031E4AA42FBDF96C9F6CB74F37AC9B616D8AE15C86E9BB1FE7B32FB073E73E0035F7B1A12FD32806BF8010C44E0ABC6B274D411C221820A71FD33BD5D72D089D30257A7C73A46A044533669094375982F8D97701FA53B583D20DB9349F7D765E3E81F0317D3A991FBD7D379F5DF82FC0ABBE9403FE2DF4E194878DD23803AABE3E83F429F206E9EADA411319923C9174757870F4A385BE6E0094D0F0EF4E90C9C6057F5AE8EBFC05B81992AF5BBFA1E21994B0E23F23909AD0CEB2B8D40E84B419823B0D7C28DC97EB85E7C5209151FE9D0DBA17DD29C4E9F0E8670B5D7D8CA36F686E850F91A4AFB7874756588C56348C19BC4972707060A1ABCB15FC9744A10375550BDD81376FA5AF4EF3F5028AAF637BACC7FBCD32255DBC3E3AEED7C738CA42EF2FD17DC15FF92A463448F698F6F9A2362D64755F902CA82B0BD3C6501BC18E17F1A35CFFFFF8F3DB9FF4961BC3CE6FE3D75328142946E7C377C650BE80971442B2A2EB3F39891896629E278B7B27F4A210D472F3318A02E084C6585CC77E14E7525372055AD7E41C6A6A98AE3E3170ACAD8C39300DA5A8AD67CE91ED1B8517102CD4024B90A6B9342A2CE6F51AAA88BC60AF6C99EC71215933A5671F9D0460BCA11096AF5C0566CC22A0A2FD17E7D97FCC47C907389FDD80202F4F9EFC758918970C77758B8B385ADD448188F255C5BB6594C52E929748A7F6AD133F82B49B089830BD6C52337DD43B26AE28D85B681486E09B5E1699333F5907CEABA26F4D73D7B0EFCBE40C04708FD359291760DA5880794BA1CE552F489F23CF7F2885BD1B8C56E86FF992917F387D72C247A0521A45DD5F7D58277EDDC35B4EF628C5A69C2A76385E80C2ADDB7C65C2A85F149A6ECB31007005525347075C0385A3A07EB4B1496E04F80222A8DA97BFB7B157D6DB750AED8BEA6F41EA846F6760CCB8631A606686A41E6B65C82A773332F20F24C836CA8384302911F10CED3A3DBF806F2ADFA11DC7D255EC3FFAA1130CD35BF557A107DE5BF1F6967FB74DF7B45AEA9768EEB75DED61E369AE6ECE77BBBB1E70ABA6F2F94B0A42249D0AD7AF9D3393CE6EEA8E6EF21BE024726FBE9523AFDE4E0CC5EE194CF1A88D27A89AEEA8167CEB89A928359FD8DA9DEC270B0EBABE3C738BFB0496BA69290E3BA8AA5B89B025F567A8C2544694F6A9D54E79B90B069ACDA1CF50F8FDBCA1FBBAC70330946F9B1C321BE6D2CCF54F50D1648E7A63F529729DC0FF67A11F38ED2777EE4EE8828D3A815DA96961C7F8BB4CE01011529D5DCD93CF7AB77DD61C25770B5E941B5A95A2443046AD2CB7D170AA88BB19A559DBF403F70BD966612B66D95A7CF7D3E1C1CF3FF7B3424C3A4BA1B3BE44694D1C9D0830BC7EB247B71E97FBED97CCF7CC3DD6D890EDB8774D177FB9DBC824AE4BDD11EA46314A4B819FB5602A43A46D047F36DD2D9204ACEE83D7BF65701186535C15A26D73B8D263492B87034BF00C9890335C849B0A866258A8206984E19BC3839F2C0505079907BC01BBAC6C8A413A1BCF0AB1CCEE1337F6D7DD570B1AD277B072D8F3516F7CC99A74F90674F976AB89ABF8D109CB5D2C1C568A0E2B54EA016F93ECF1204CFB5ECBFA0411D538469989A52019D5553F59F38B8D6B86749B1DD3CCB03C33AE9D1884AC2C2B84046A6F99DE7FBB39977B4F2EA4C9893D4A87902C94E1F4C90F3C28FCDC28065AEFDC35B59B08066125267A415C9317B920C3BA98AF7DE05C61A2C6B91A5DABF5E01AC42B3F49F24DB85EC045963E45717552C0349F822D76F280F532F92586B8EEBA7584A65AC7198140247B5C40BD8551B0285B36BFB5098858D191800844B2C705B42D0434F7871849A0825E92277444A298134ED2EE14EAB186963925B7DA74EF39F2E50CD46E4199E3C6CE13105FA278858EDE958EA27EEE4FF6B108EDE24DCF25122DD746F4CD8303A7D514C633ED80C430B81B0AA4C8EF884ACD3E822E63B63C4C05D39D0E262762EC884A147658191F3BBC822976B42C8851646B5278D215F8C832B58C778EB5C9C10FDCCF7B212A517862657C14F10A9D22F20B32D9B1491AEB6ED76C929E378B8D998088A73CD3EA25EAA3C1E17CE5F881FA8E554F78209142542B4F7155716C566E7A6D8EEAAD2CB4CD32682336DA328BC34DF47BED24C9B728961DBDF6E495C9997C1A850F3E9C97682A284E02DE588945AFC67B0312900ED2E3A7C8FD1A65E979E82103EDB7D435351517AE0BE7C105A416F0E857C15A9C3D5E2635465662F2AF9FA2107CC956F7689DEDBAAB52A18E75568A4EF7012C819BA1002EB8495AAD07B80C71FB2DBA705CB8A05A62C065824F251BF0166EEA3F83699737EDF2681881E3AFF8267FBE8FA8CA1B6B1FFBCC18FA7899E90E44B5DF2C60F3F79B749900B11EF79B3950C17E932EE363D7FB7E33872CDB6F722BF091EDBCDFFC143DFA82AD66D141594E63977F16E05494D9DEF9E6B0053B5FBA8C8F986AE72BC32E779A8BF12A8B298CF2AF7C5C8A22532CCA630809224D0D0A97AA808F4E5DDAD923906B9DB6473B79E3297A48DCD7C6E27473CE200016768D1A3D0DF368FB769F3A2348B92E6D3B9BF2C6D36CDAC2D99473067E7BF63DE9DEAE270741D5F300572E8DA45D272E5B24EC5344F696CABA8DA8EEED56D49AF12CB91BE1B14CE8B1673B7665125989C876724B6FE8EAB91D13E77BF5B518BE8CD4EDAA391FC6746D5030DDA65BEAD32DF5D1DC6CECEF96FA18F462FBF80ECEEB71BB16DAD173B8A9286B8B864A7637130EA9E8B4A7DD2CB4AB432842682A967D4A54BB95C482D339DE776D5B76393D2B34A1E8FC8C2D65DCF59C2AB6CFD0CA2E04A7686CA908C72E2769B20C5325784E4A29B24484972C6954E7D3BDB20FD9F99EA08A085DAD333E233FDBC2758B689776AEB6B2F9E4BA10F7B5316F5BEEF7F7C3AF867AD46218E3A00188D3FABA83EBABF909D9024ECFD5BAB542C3614C5A4DDC572BAD66754362DDF75B29BEAB7850CDB4BBF94886CCEA720312ECCE5C6E7EC1C99BCFE6A2A8085818CE2F63A4B9BAF99C7910268FB3815E68D53141F16E234137470121BB344BCB1A5B2ABEA64F468916DFE9F1A8116C2BA667D5F4E649B6C26689207DFA657211388F498D937CDA1040127E4AF64E7A1F2EB91E888357B84497AC784DE977753E03742FA40E5EFA369FE5A7D7701D67484A54FD0882E85B713DB06E7278206F43575774B1B88F9E01D5E648D1C5AFFEE35353F92DCBDC828D12D6B2A964CDB87AFE0C273CE4669614A9B87C9030E96987E56A2EFB683E96645190F0B7B547543F9457AF677B45F41634E71FBA99D15DF2E86F097158AA17769F1EC997597E5D4D97E4FFE6C4A188DE74DDF3388EE2BAF21B79E50B27C5E61A47352A39C933D2CDF8481A132C3C7B4F029972D4904B97E1B313F89E681BAAC7BE124873E3548F91F93A97C049509D66F1592AE88DD8D7EB2D07A5F9C2E9F29D1AD39C30795BEC3E5ED9FC2745F3F06B187D0B5176CB38748232A8BA6CFBB3BC2DBAD209BCAB2CAD1BBC57E38A5DA614604CAF825AF346B041E8A202B920EDEAC0C24895B207AE3DDA2BCF0D5EF750878A8B24895C3F1F1E79BA44E699AB0F94C8CECF436F5666B794B5BAA3DE1BC8B36CF21ACC677968044AA504979B93F91F98E1EAF658BF05C9F448F771488E09F67115164BF26C919F9CC3F5DF495CC7634D6448518FFC02B74B003D6FE93BE8662C7A8DD10F53766FE587AEBF76029391504034B76808C9BA3BBAE40CAC41887657263CD4C1038BCE60D1A97BA568A922DDF13E26AB0A119664AA174BB02CBD3D4F80B1FABDCA94268A3C89CFEB9315D553AC9D0C6B506F0811D6A09096046370B6428CD944C43A4222C94ACC17E43C8FFBE0B22C4E87AC39DF7A106221E9069662216D4CC51802DA98248B1F76168987C6CBD48D68B0EE56523C0EF6F6D8AD864E5F1C3154F565491495E31F400C9574D1C1A1799E7F2392873F1021E23FF7B508F2E86120A5C87B9B82C2A4BC43DE8BD071083180987106ADD36BE589DEA05861818A728EF26216E50226DBF9081F0A51C0E4AAC10E82C2623098B4B004D5E99A3AC3D89CE4E0E1A3522E7323493B4A0E2FF47458C9E1603094E47008AAD33515E4B639C9616267A5AC1687D176942161DCEDB082244263286912D157A77F5EF4E106E5AA78CB48CE74EA61A3CD9948D4334A1426A50FBB3F138924C460C2460C7A1C2612F6AC945CB6AE790F546D4EC0AE39CF6151E85CB3393BFA93380E7986123B0E29C6217BC5BB635236538F906D4EDEC827CF28448AA75FFA132E820A43891531E2710854FD7E9C9495EC63722D4C22114C8E840CA07DE8210D2523F4B0B75E4C987C1322AE8A934F348CD59BF6129883DBE4220C0690171141C7E21660728148B9AC700BB4929C8DBA0544180C253923760BF053B44859ADE3166825439B770B48D1184A9A76C22DC064D391725EB17FE349534FF6B430910F85CE50FB3711798612C696FBB7EA69C28DC81EE7250811BB65CF42340CAF5EECD1D76792B724065366621C06101E3161C7625371DEEA50705B6157B596A28DDA56621C8693A211DB57D48B2A0A4E4B225E5B4B8F794CAB75E1193E18954F4F9D8E371D7D2A7AE546C1651DA3BCB5086DDE305720329C448DD0382FC3F8A230852DB0DB7DF80B8167F7A81CBCF0EE1A4354CB6B0E49F978002D2E083E34832BC8199C429F229429A3B9CC593D22509671648E04425ECEE440222A1497BD1420CB99CD03562B42150822869603878832D5024607988B80D271D80698C2AF2A64979CD7BA689064643F0F227D1D4301F013EC3973F8835EAC9116C905B0AAA60DEF16CAB126CCDB5CE41570897B3D1CB8EC7313060097D97D9DFB5C051CAFABD5111D83591C6AB19DF0EA1903D701AC048ABB0C58709C5DB7029E68C45A23444A9AD7B858EB341A57B9C5B810CA584C0D3055AA282E98325E41038C8816CD29A1028864EAEBF2837DEC83074DF474B8167031402D2A956FF0890855BFF0A7CBB7F2F52B29FBEA57B63480AA6847D7D1A21C6AA4339F79F518E0981DC2ACBE828B8133AC8DEC8A1F7F2345D8AC7A77096B0270D635C62633BD3688016F8C0EDA094952498782B27B693C026ADF632387A873930D1F216913C988A773018D81CC8CD42A21D99B510A4A2AAE5209072CBE4C25A06561B56992537C074A97532DE828BE97C3A1A1E6251E6284EA6B3CD8E838EA4B423CF5AD1D13D02D885744A297F6014B2EBC583C0AAC168F24A5FD2221030E803370DC86B13462FC7966D1B0458E7B0EEA1CC77D0B0270DCF42A286D0940BCFD2C2080D0E7CCA2CEF3399B1380E761EE8B00ECFBCD022AC85D60EC20842E30737A081D5EBD11A5B4F045A4E0C45773B02623AC5B0C9B0C8CA6005438DA1931B1D1130C5B787ECCA2CE3B41362700EFE0178342E06C870CE59E4C40004E102A8B3419866A3E68327A946A5FE26767B08D892D182F3F469245998992341F3513148981106D055A8C9B89E9E30C5D1EF747A02E8CFCC3B0E7B24C0EA547F5C684A68908A0B7E80903D8CC0930D0A2C78FB01251C160D193076399D363C8458F090F12D1436F09100611995361D0258097B38425842A9E857764A7D011B5A74C420E490C4B0F12C14B8D2224859EAE908465B423C5401A83CEC2222483DA1926882B6837FC61DC5CC2342F423218E84CD569793BC2F4A139AB9770EB73DBBAEC787FE93E8195537E38DE87555CB04E332780488020A90A3E3BEB3532639A96E597D972EDB810FDD33F2EE7B39755102627F3A7345D7FD8DF4F72D0C9DECA77E328891ED23D375AED3B5EB47F7470F07EFFF0707F55C0D87709854C9F32D73D41D5E13C02AA14A516F3C0851F2729CAE478EFA0C7F54EBD15534D744A2DF06657BDD207D12C072BBF76D502FDAE0FC62599F48A961731FCFD2D8ABF3607DA6C0040091AD67D5CA13882FC856A4C22C44D61E3A5EB044ECC7910FB340AB255280E6910B76E9EB8C661345FF52155C10B381C51408318CA12C4CFBE5BE6D4C4411105FAF03E83F429F25870F8777D68D70EE2719A4F5A1C1AFE5D1FDA0D48B3382C1313E3E088027D78E72FC0CD90D2285EE3C62152452D609E9599B405709B627DD84C560E1C3253680A97E539FE5D1F1A916103074714985014E9650E25EBCFFAB02E57F05F1285785C2CA10B38E5EDA0F3F504BF8601A7F2B0A2224130C129EC3B0BED789FD2A2B426DF675439B5C0D26B83D6CA41451FF5B77CB0514CE6EB88068C7E1614D85DF1C2340EA2FE680467113F260C9CE2A3C1021743D3213F9B2716B8FAAB3EA42FD0C680ED58E54A14E8C3430622171E5160305D93C5BD137A51086806E205068B5D9D428158EAEAAF06D39CC81A414C74A2C410225FE729AE096C4C7DD01105FDE90FFE3BC8E63A4405A01F0582C55A13EBA338043B87053701458DEAAD6AC16BD038CC331F45CEADFC7CFDEA4354146CBD4CD0EFAB87DF99F1971CD2EF47C3597B7B0DD6B633B5EA3856B7B1BDBD5B6ACDAA0A2A98BAFD1A88D11A5CC487551A2DD797DADBD6FBC2D28291C296FD689AEEFA0172791D38AF2C20A2C0C438AB73F290A659FDD90037F20A1B819DFC769B02265797912566E62D9B4E97B673D91A6D7AE01343E76A8D18FA6E69F7B64A4511D4684DB360FDB4512FD2E6FDE8983273182B1DD8776368CCCE19FF6E60439351A08C2DCD169BC2E6836C03098DED220B0256D5F2CAFBB436373AC7D4B1D876E71A7575ACED9C5381E9698F8809B04CB80DAD06F08DB32D68BEEA43BA8AFD476820061C705491893BA6F8CBCE13B2C41CA27806F26BECEC1CC462EC8759EA96DC6BCA26AB1D17423F93CEF641C8388E7FEC9B81282F5E888285D8730FAA689B8E6AFA3D6ABA014E429F8855DFB6FF307B434AABB92ADD632803E7CA758BA8061D28BBEF74B4EE5470E939537C31724BF8094AD9CDFA25EAEF9393430C717272EC8093837C2262505D7ACBC4ADE57DB6D0A77C48DBAE532BEC5995489618049095419B44EC58F94D1FCA5F0175EC9D7F18F67869D22D3BA05BC88719FAD32DCCE30EE64A450DA2A7C31AAC5F8E8DC5941AACF7CC06CB745F85EA572C612135256D9C9E2C4CBAAC0DD4459280D57DF0FAB7CC09D0C4E5C4BE2A2B6FC219BC04CF808D366ABE9AEEDD12DEE6CDC88F70FEE20699073C2E3CA6D07CF54CF8CBA799AF63D2B1B297B386D1B7CC0B5CDD74AF1ADCB65B7576AE02F4B72E4C3A78D226426DC27F1EAF3F4DC27D66CF5C83E881D976CD513D114FF88105CFC68BA1D0B4A021F2CA37E3E59A661C871D43CE360B336D7CB3AC49A04E5D6203C61778228F96DB884DAE21833005DA4D3EE84907124F489868BF965708AEE93773DBDC2260808C4F1372F615C6FAE6971876CBEA9BFAF3F73A13ACAEDBFCF44A23925963CB96B99A20C830B54D179ACC788A446FD43C35F673303CE5936014F74DFADE17B7DC070FB9EF3D03B5A38E36E5B002138F57BC7202FF9F3C87115D36CED5D2BEB5BF4409495C7AF1ADBE9AED1B1E9C2C48D97D43F979DA8388214E7B906DB2BC5A6AF4E235AA7ED7FB161A9DDFACAFB3E84ACBA25E655AB8296F03FD7CE5F80137F0595447BF9745963E413A56A7499C78187E0D33BB87A54D1B8AD85B9BC4146D4BC7EEABDD328B430648FDD1C45F9724700631FEBAEAAB2195A015FAE0432943CC671D78822AE6D8DE8004A42C7C4EB1C12A10B95FA32C3D0FBD332705BFA5D4C2CF29369837AE0B25E4028E1E789C276338C52616418D1A37DA962E35A0F65314822FD9EA1EBD8648D0192F30C1146B588A018B2FBF8E49B4879BA1B80E68A7ADD674C807516482F9EDB7E8C271E1F221A0325B6E021D9F182C6CBAD40432CA4DFD0C6888D5D7C9EE14439CECCE1DB13B85594D6C1A9F4572B57616A8A0EDB63BB8ED84E2E483E75C4E6F3E1BC2E2C447E3DFA709643C8184D9406C4EA022AD60BB092468FB7D4CA07CF0F0DBB3EFD1761A556460F9956D98BB0A44C1560969DF3EE3AA8F96223ACE98293B126A27F26A52C700CB14D39FA0B73F2C1BED51BDA5A0E2CE4E9DE96AD734CD31211EEA829720FBB1B902D005B4EDFA60BA36365D59B0796D6CD269F544EC5F8FB5D65B5BFE0AB558E7B99CA007A260481BE6340A43C82074F897C64CC4115B3A39B32767B686544D1AB4D8922C5C171D10F6EDE928BB69E9EC10B6DE76C3CFCE46307749FAE1571EA4EAFB262222ECC7314C8A7452A42355A4B96F7C91A660B5EE5D9BE27D7539E21082D876BD6ADB4CB5A7A7D1AFAB58AC1945754C0E25C7F016A9ED17586F40C2043C57DF86D0561BD42C43B9EDE8BE5A3AEDF4C06CBB86B1A311380E4C2E6E740D03A752EAA474D466F169C767C59037F179FDB59C19E3BF916F67664CEF5E6CA185CBE4ECA6ABD4BD975FEAFF75CEEE325F3691C83BA7034ACB9D8F3F297377D309B48B2AF35915120215D96B02EDD33D54616FF98FA030449A0A9FA1803C8024BD8DBE82F0647E747078349F2D02DF498AF4EA656AF00F6E9EA1D509C3282D93AF6BE40A3F7C837285036FB54F3737CF388EA024891770F28D2336D57721CA74DA33BAC70F67AFA103C15FF801DCB5DE5515EF3E3BAFBF3ACFA098C4D59944A3B5885609F9F70C3CF82127CFD5F15FC12B2D5195F4DE80879948F51CEFD30D8F39EA0B8DF6647E8FB24A403EE6EAF11700C50CAE57DEB503372371882A827C20F3D9972C0850F0F3C9FCC10912668AD13D34CAACE827EF84A1E565E8819793F97FCD2E93D300168218781F6617A8831FE037A86BFE9181F2C3ECBF7124D2983D39A771A8262E395233184B3C7D7801287C7662F7C989E7B3CFCECB27103EA64F50E0DFBE33058DA712B70B194F2B2E817C7870F4A3296822C53809FB772BE7E5F7A6F0A804E305440FCA609AFF37943A4E5A714CFC0C8131DB370929DF191312DFC9C97874F4B3296462532701FD16A968536ED5C9C665127B7070600A999706A2CBBCE5A7ADE00A8316B7B0C4E29D468E9B04D2154891887BCC6B439DD55B5F3875E11659BE157A496F01AB337D17D0929513048A550CB5FC30BBFCF7BB2AD9F55D05E50ECBF5FDC3EC2A8616D387D911B9A469A145E40CA7B5A535CCDEB4C08CC83E2ED6E35A93174F3C5EC9A21EE5B1A6DC911DB6185993BABCC025F5C357BB92D0062B72C3D371E1A4B63AFA9A575B9FD1A97115763559DD9275ADEA949BFA7BA0BE790984A74DC5F66D2A4C2D36AD8171ED69A965312215C131239B68282D46D6DAB46E586BCE03730E520F237562A5B6FAAB12596BAAA0BB65F49016FEB1F14CFB5EE6BC72BEBD313714894783B477755AA031AFA696E162ACA3F40648C6547499AB642C4537BB8E1F3D610BA69DF16E87CED4D72B858FB8C8A2AB542E58E5C9B6A05885A5DFEECA752CF736B56330F567610C2B136E9354D0593369189D761D4DAC3DAD37B551410DABA4C077153C72538CE9E01F8DFD5F6C2FBD217B48217BF8DED8A536BC4D6BA85B2A7C8D740CD968D235E269DD794E779CD04D9A72BBAE622A5FB95DE0D55FA505F7DEFCECA4FC2BD71F3B3EE79B1CE1262605AC3FCDF4C1CE62C67A3C2537B035945F357BEE70489D9CEA54FA740BC79A968F9F6C9F8E5529D25B984535F50B1842BBADC5B1751F6A5103F3435B910526D42B2088A4B68302E7A54C5706B1B06D06F27AF37A9E5C5FBBEEEEEED3FFE62A82135AAC5878527BCCA937790627CFE0167B0645B9DE5BA864D46EB2ECB74F3993B9EE2D2BE9EA796FCB60F3C7E5F4C31DDB1F9FB60BFB991491754524BF7F34840EC8F269E6E7531D31C1DC49C6BC0AA4ED73D25B956DED3BC967822C077F52CF054927B17100A8F295A03E06C33BC7E8E43D6C1E10EA76F053A787B712624DA59CB700134B3A6F01DA88151A93745D655EC91A8FD5C6EAAC5FB7C1986AEDD3A117873B5251D6A786B4CFE7C736A735CA85A84784E9D34E73F5A85A427A449EF54F8E7789EA914C6F3AF37864CA9CBEDB9ABFE5AC52E2BC4603794CB95D8FD165BACB1BF3EA016CEE818FD6287857AE45D23F22F7E3C89583F1ECDC90529814C29629846B270661BBF8BDAA699790F7225D9A6CA7FBB6B7439C364EC2ED5056D35949EBF18E4CCF5FB3A9B4151A97693190A6E726731FA86F6ED2F1B1FA2C7679B5E94927FF12C391753B04DF0EBDA065B06B2CCD45AB2E0B736BA713B56D1FCB3538ADDDF580BBE9D1EE9E7BD15D67A076475BF1EB3739A9951AA9C52DBE5168DA6DBB9D88DE23F4DDAE714C0F4EFED6E74E0743692861A27D275D3CFAED8106B558209DB6B48359121A4323DAEB8F4A7BD94480B5CCF3017702A35C36FBB2FA9B95AE79BBDF729053D305F958B5E56E1659FA8488509E50AB83C0CCEF96F446A26DB0087A654E1F36C1328BC31EC05E3B490255813CC0A6CD3E3427F069143EF8703E20862A9D9B6FCC43BE2BEC6F4002D23E3AF814B95FA32C3D0FBD33A8817E4BDDAE4BF4C275A1C45D40DA008F78B8ACDD61518D5FE7B8F7EBA728045FB2D53D90EF32DF181F905F2618EC5222BAE1BA046E86C2B7A095BC5ADBBF4670FB2DBA705CB8F45820EB65824F84AEB0AA345B93453F59F493453F90457F1A38FE4ACBD6CE6B4E9EF6EDB3F67AF2DF6ABE4F0C8502756C6266EADDFD8680ED3DF1BC1D3E7FA399992764D29A9979CD69664E339334EE616FD7656604EB1BA00A70F79B54467342EBE8A6AA38CD886946D80D881CD92AA21B473245510C365F78CF70A02F8C7CE36D6FA1086CE27D101E6247DD11E33B10BB2276C8436C903BBDDBBB7DDE691B9993284FE7EE1BBFD95875DF4EDC7A9B6E3683E966F390379B47A9E93435DB288FC4FB79E174A32FFC1389A7ED1E6B2A61B6D9D19F466108DCFCBC3D8DF35D83AC831659DBA6039EE980673AE019FC8067E1BAC549BC86D7ACAC3BCA2564502F808D9DB8211EB9A3DF0FBF76DDE5B5097CEA33E648F3F1C36D57FBDF9BE2DE56AD6BF7F86D01B5C76AADA73CF1066375278CD4955A8842ED1FD47FD1D8D06CD7F55116EDEF2A557B15E3CAF1EE062459900A5FB46917CBDAE15085A55BCBD7A8D9B10E44420BEF7E8FF525FB1E1FF72F88CCF85A7AE1609B64AF1D1615A395C0D8C5CC6B34D61561271CCC5D1524BAB006F8A91EDAA4BBE11C41D8A3778EABA9C74B3DCE36292D3A67D950A3A5D61B4653DDF8AD1D5EA301EF3F4D6FEE8C52F3180E647A876B039BC2459244AE9F23489E2750E9B1ABA4BA2476E7A13743F14658D2DD02A525081EF6EA6F9FA10DE4A3A7EE210227F383BDBDC3393DDBAEC28257B345EE9C87237512D7F15882C071782224E8C4E7182E741189D21F986EE0AC07E83128DF41F73E92347620895915E187AEBF76028A08543D4D6582065743A44BCEC01A844845F087AAD3237650C4765CC3A7A8ADA2C3F13E26410AC1C2F297DD55E8157F13B15C618D48E1220A4876F6245EFC248D0C4E74857E440D1FFE00F2C61D9A96D4510918372E7A28751EFE5F4FF6F2047D02F1CBCB069440C3D9D083C4A1110F26742D85AD4CE2BB1179630CD6D3273FF02070A1ACB12639C65DB690B3A2D24C16C346308DE05B9220A69B0144883B769D7E9B6724372241F9B30FF9ED20B17E2A9EAAC0F8587C1844136197EA2804CAAFBD48503EC001A4A619874E679535BE414169B605DDA445A1495013467BF0E08C90DFDA9A81DA836D8EEBD849EDC4F5BEB94E1D8B6F8EEBF4A1F5C4FABE59CF0B13D820FFD101FCF61A05E57D5E0A81F2EBE865A618C7388C82EBFAFDE08ED2D29FC3EE9A7D0C1AC385533A6A0162C7330E4142D86FAFC2292E4B53FD171F472D2DF530C62124A548DB5035627384A7257643378C4623E44F0E0CB5DF64E6F60ECC6BED39BD0DFBCC9CDB43ED33BF6B6E6FC3FE32E7F6A0FBCBEF9AE55BB3AFCCF9AEB35DD062D7AE6F17B4F9BB91ED42F5FCCB4604A9BC9B3B947950DD18C6A0549F46AD41CA418CC54828B93E949930717D2B8C8592EBB603C3B687EF03467319B07ED3515C25DB07B512A719BF295BB10CA889C214B60071FD8882072EFC3849D14B31F74E0218EEA356D06A29EB2F3228B49F2268903541A8251F9BA2A5FB0456CEC9DCBB47577C8A38D6C5FDBAAA9070E483ECE5A3E37E7D8CA32CF4FE12DD17375898EE387504FD1235D59DD3F1A54CCF740541B765357587B50E657AAA4B045D94E51A5D1041656C3F44B1A83322D24EAF473A8052D0335D4D8A011D6F6A32F63CBE4F3AFCBC860605603D75D78B35D267F954FC041B650E9706DC5A0214AA0AADFABE052FBCE10B6B2A704095D478B097D11804D82A829EF18A663D2FB3FB3A4B9B06166C750D8CF0466AEC7829E93958F1AB09B0E15536C744030B6D0CD4BD73F6FA4CF79C3A82FE71D787AA6701C5A514D6A368611831908BCF02C8A8500F721996C7055F9649FA282311753A2A8FFAB91D9565928ECAE8069D8E049C688A24DDE871442C5B2A89AA4FC3545D889E77647A14551420C056D7C545D8B7A22F3DA6D5EFF470F956974A5857D63110C6FA790BB14CD65554A25956D4EB5D83ADFC6A122CCC58CABFEDC9C5425B5BF32AB398601B0AC66815DC2D9B616D485B56E7321ADFEB501304FBC6EC9BC437C8B0E67411EDB72607AC430CD97D281E2DB4EF4F91A4E058F1053D880209516456390689AE609540ECAD1D058514D77C8424C28C7D864A7999925086A46E4118F1F5120E5134EFA2100311A98C7C306CA18424FCBB2706D05A9007BF3BC12188F06A05C76F85215A7C900C95B1B2EA66E5574B03C30E5784A3131DC0581822C3415EABB683C3CF104483139E336CFBE0189FA9688472E7EAD60FB334E14583E3C42F5B1812B1EDA89B955FED0C8CD8260A46273C45EF3844E186376FCE29B533E4729F24182C2730D40227F17D5DDDAAF8686750CDE64C302E7E2C63C7A1F1F8668F5B4C581E676CF2D0BD8EC363B86689634C049A68607D2D0BBD0E4C6749D088CADAE6212AB4A63CF6C81CCD0D6B4D4E040C67D0AA38998EFC241D39799BEA93AD012A66A42A2464FB0728714AC8221FAC782106189E8EE2D13AEADF024E566F1BD5C7D475D9F17EE1C32A3FC0BF70BA398F000E070449FEF578FF260BD15B4CC5BF3390F88F0D88E3265F4003B4AA837C7595D383C2A8AA423DDFF419A48EE7A4CE224EFD07C74D61314A259EAB9E3C0B137A60FA1E7897E15596AEB3B4CA628213039DF2CBFA3FDE67703EBE2A8E976C0C01A2E9A3E7ABAEC28F991F7835DE179C37E9042050F840F9009A9FE76180E01E5F6B485FA250135049BE3AEAE116ACD60104965C854B07A56030C70D0AEC27F0E8B8C89B55E694140151338224FBF199EF3CC6CE2A296134EDE15F28C3DEEAE54FFF0F744706C7AE300200, N'6.4.0')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202002201201162_Ugraded_To_ABP_5_2_0', N'DoAn', 0x1F8B0800000000000400ED7DD972E43892E0FB98ED3F84C5D3CC5875E8C8A32AD3943316A9A34A5D999246A19C5EDB1719444212271964340FA5D463FB65FBB09FB4BFB0004F9C0440828CA0926F1104E0EE7077381C0E07F0FFFECFFF3DFAF7E7B53F7B8251EC85C1A7F9C1627F3E838113BA5EF0F0699E26F77FF96DFEEFFFF63FFEE9E8D45D3FCFFEB3ACF706D7432D83F8D3FC3149361FF7F662E711AE41BC587B4E14C6E17DB270C2F51E70C3BDC3FDFD0F7B07077B1081982358B3D9D1751A24DE1A667FD0DFE33070E0264981FF3574A11F17DF51C92A833ABB006B186F80033FCD97779BE370BD01C10BFEB8407FAFA2F0BFA093647F4F11DCE4E52C42BF7F84D1F7F96CE97B0011B982FEFD7C0682204C4082BAF0F15B0C574914060FAB0DFA00FC9B970D44F5EE811FC3A26B1FEBEABABDDC3FC4BDDCAB1B96A09C344EC2B521C0833705DBF6D8E6AD983FAFD88A189B330AF73A632EE26BEA7AC997F0613E63917D3CF6235C31E3FD22AB87B4635136F865863FFF2F18850B24987518FC52E9C9BBC5E1627FB1FFCBEC38F59334829F02982611F07F995DA577BEE7FC095F6EC2EF30F814A4BE4F9287084465D407F409097A03A3E4E51ADE17449FBBF3D91EDD6E8F6D583523DAE4DD390F92F76FE7B30B841CDCF9B0923ED1F5551246F07718C00824D0BD024902A300C38019FF38EC0CAE1B188020A130BE39543542AA197144363759C1E8C97320FE53B643DA8DA4349F7D05CF5F60F0903C7E9A1FBE7B3F9F9D79CFD02DBF141DFE167868C8A34649944215AEAF30790CDD41505D013C9011CBE3065407FB876F2DE0BA86484383FF047EDAD42FF4D302AED367E8A458BF6EBC9A8B2748C3F2FF9C426A423B49A3C23A50DA6608EED8F790729F6F96AE1BC1B889F3EF6DF03D47A750A783C3DF2CA0FA1C853FF0D80AEEC3065CEF0E0EAD8818CF6884304483647F7FDF02AAF335FA17870140B6AA85ED209BB7B257C7D97C81D417D8EEEBD15E3D4D354E5E9F81F3FD210AD3C0FD6B7897CBB77916A31AC40BAE7D36A94D1359850BB105A3B2306C0CAD1142BC8C1E9AEDFFDBDFDEFDAA37DD1822BF895E8E915224049F0FDE1B43B980CF098264C5D67F01B11C96629CC7CB3B10B861002BBDF91C863E048131155791174699D6145241DE353D86EA1AA6B34F0481B5993103A66114B5EDCC29F67DC3E00C81455660059324D34685C7BCD9201391152C8A96F14208C99A2B3DFB0C6248C88621B879E6CA29E3260115EF2FC093F790F5520C703EBB867E561E3F7A9B8230211B6EAB166751B8BE0E7D19E7CB8AB7AB308D1CAC2FA14EED1B103DC0A49B0A9808BD6852097DD42B26A12AD89B68148EE09B5E2699132FDEF8E045815BD3DD35C47D1E9F401FAD713A1BE51C4C1B0F306B29B5B9EA09E96BE87AF785B27783D18AFC1D9F32B20FC78F2078802AA391D7FDC34375A29705D972F2471931655CB123F11C14E9DD663313C1FDBCD074594E004033909A3B3AE06A280203F5D6C622B956E03344A06A5DFEC1C65A596FD529F52FCABF39AB63B19F4108E3966B40B8190DF5782FA3A972372723FB40836C633C68089311918FD0AEC3F302FE50C50EED04962E23EFC10B803F0CB6F2AFC20E7CB012ED2DFEEE9AED6935D5AFF0D86F3BDBA3C6D358DD5EECF6F546C0ADBACAA7CF090CB0762A42BF76F64C3A87A93B86C9AF21889BA3F956B6BC7ADB3194876708C3A3769E9069BA655A88BD27AE62A3FBC4D7EEE43F5908D0F515995BDEC5A8D4490A757885A6BA950A5B327F86264CE54469EF5ABDAA28772E40B331F41529BF9735745E16220043C5B6E92EF3692EF558FF820C4D0AD40BAB2FA1037CEF1FB97D10B49FC2B9AFC2166C3508EC34BA16769CBFF318751113D539D43CC5AC5F77CC5A60E46EE0B37241AB329418C6A88DE52E3A4E2573B763342B9F7E60BC486C16966296BDC5F7BF1EECFFF65B3F33C464B31436EB224C2AE6E8648091F5E305DB7A5CE1B7DF53CF358F58135DB613DE359DFC9BC34626795D6A44188DA29796123F2BC554A648DB48FEACD12DE318AEEFFC97FF48D1248C86B82A45DB66771BB725AD6C0EACE013E452CE4815AE2B18AA616E821A330CDF1CECFF6A2929D84F5DE80E88B2F4290641369E196295DEC54EE46DBACF162CA49F60E6B017A3DEFA9435D9F22DD8F2DD361397D103088A552CEA5682372B54E6816C132F4410A675AF657B82996A9CA3CCE552D082EA6A9FACC5C5C63542BA8D8E6964581E1957208201AFCB0A2541D6BBC9EEBFDB5EC8BDA710D214C41E6540A82995E1F8D1F35DA4FCC22C06D6EEDCD6B5EB0C0669252E7B415E5394B9D044753E5EFBA0B9A4444D73D9BB56F3C1158CD65E1C678B70BD848B34790CA372A7806B3E255BBCCA0DD6F3F8F708D1FADABD233CD43A8E080C225E0801F59646C1936CD9FDD66620164547066210F14208685718681E0F31D24005BF1AAED091A962C6B88676C7C88ED5BC3CC09CDC69D7BDE7CC97135885059B023776AE80B808A335DE7A57068AFA393FD9C724F41A4F7AAEB06A3936B26FEE011A56531ACFB40292C3102E28B021BFA52AD5EB08B68C5BF270154C573A849EC8A9A32A31D4116562EAC80AA6D4B1BA202791AFC9D0C9561013CBD5325E39562E8738713FC3425562E824CAC42492153A65E4E76CB2E393D4DEDD6BF3497A5E2CD66E02669E724FAB97AC8F9A86D335F07CF519AB9EE8C02A85B956ECE2AAF2D8AC9CF4DA1ED75B7968DB15D0567CB4551A05DBC07B05E2F84718356DBDF61495C9847C1C06F71E1A977828287602DE58C9452FFB7B0D63980C82F14BE87C0FD3E43470B183F62D714C5DC5A5E3A0717086B8055DF656B0167B8FE7714591959CFCABC7308017E9FA0ECFB35D57552AD2096485EA74EFC00A3A294EE0428BA4F56680C310373FC233E0A009D59200CE637228D980B77412EF094EABBC6995C7C2F081B716BBFCD93AA22CAFBD7DE233E7E89365A62B10D57A33872D5E6FB26512C27A5C6F664025EB4DB64C4C5DEFEBCD0C72D37A5358414C6CE7F5E697F0C1932C35730445394B5DF65942535E667BE59BC196AC7CD9323161AA956F137559D05C4E5751CC50947D15D392179952516C43341052D76068290BC4E454A59D230299D569BBB593359EB287E4B8B696A79B490603B0B06AD4C034CCA5EDBBBDEB8C2165B6B4ED68CA1A4FA3690747532619F4EDC9731BD7763D05084ACC031CB934D2769DBC6C99B24F19D93BAAEB36B2BA77DB506BE6B364618487E2418F85EDDC9549651B54B653587A4B47CFEDB8383F6BACC5F066A46E47CDC530A6638392E1369D529F4EA98FE664637FA7D4C76017DBE777086E8F7B6DA91D3DA79BCA5E6DD130C9CE76D22115487B5ACD22BF3A402A84876281B3C1B45B795870DAC7FBA97DCB2EBB67B92594ED9FF1A55CB85E50C5F61E5A8142B28BC697CA68ECB293D6F4C254015EF0A4145D22A3ABE9D1A8CEBB7B058EA6FD3D491519B95A7B7C4671B6A5E3E4D92EED426D45F3297421C7B5B5685B16F7F782EF8676D4621AE3A00988D3FCFA0AE757F31DB2251A9EEB4D6B8346C298AC9A1C572BAB667541623DF65B1ABECB6850CBF47ADF2319F255976B181367E632F70B0DDE6C34E74579C2C270711923CBD52DE62C8230459C0DEC422BC414C7BBF5049F1C8594EEB2222D6AECA8FA9A5E19259B7CA7CBA346B0AC98AE556B354EFE06EF1EC3F0FBE91354AFB68BBAF1826CF41358F4A2BB0AE7447737DCEE56E00EA619B67B28CDEA42586B296A3A46563070359771EC48219AFE3CE325330F764051F71D778388DCEE0DF24EFBCF6B2911611F298DA9E386D895FA23493664D18003D446D4A6E3F3C9F4B4230852F303E7966E5307AB1555B9A0B5AA7EA7E0B5486135564E9CC1982EF8D69A360A767D8BBCE167E6157422980C8FD7D6DE6EA973BD5BC23F207091E28ECB8BE9EE69A76BC22E7C06CEF787284C03F7AFE1DD55E4857942CE797CE68387B8A2A9D94A5040E2851066274B81F88D24E5BF20F914BAF592B037587E85F804763995843FE6B32C4FF4D3FC1DC752AAEA67E8873FF28B38AA2607FBCD6DD8EA0A14CBBBF009326D0E1528FEF01E1EEBCAEF78E1E6626C102DF9846C1ECE33936A36EB2069A671FEE8AD07E3050B7358A966BA8F5DF1822D0A167EDBB854F583E6EA95A35F32BD05CFC5E96D667C6F785EA380382CD7733F418FE5AB34BB184297E57F035120E3375BF7348AC2A8AAFCA6B9F2195A9DD6634D601A95921485C3CDE44887ED7878F62EDF3495A8A194CE8327E07BAE6CC3474F7C0590FA6E173D4166F35C8C0641E95B88452AC146EDA0E94D0785BB2740F95E4D69C698AC2D71F345D1FC5745F3E07B10FE08F03BF25100FCE2F862D1F6B7E6B6F8F214E85EA649D5E0839A56E2DA1209C5EC2CA8356E24A1F82E265008D2AE0DCC9DFA46F1A0B9477BE6B926EB1EB4E022BB0AD767DFEA25466BC7C5054C98A5FC2FB3BCA8E6D95BDD3CE1BB5F7F05EF9C77EF0F3EBC790BF77FFBD0827F48BB122F4821A15CAAA9E48797388F0803728093D0097DC25EED2B2CD6E59F849FA5C0C33A15872AE0F8EEA30DDD4261FB2EC2A0980CB0B49E209E518B0BA608200A4B7811621E663186AA89C20A16174AB1AD1416F00A4489077CBE9DC2006679EB1B1F1E3F869E036B69BD514960B9BEF31ED2303568F21539D4EE15444C0C108DFE0BD15221BDACA57EF533BC8C21AA2B247D0D5D2F824EA2DF6205E165F20809CF46A508258EAF10A994ABDF0E99D0229F896CA45021647BD1F87B2619AC509F6F411A5318146A7303D79B3002D18B80778A39B36CF127841B64D4EEF45B7E06EE35FC7B0AE31ADB5B95CE7D0B40E1D111DD7BAB52A02BF0B2462A8AB1215AC9860AC5380BA33BCF75614034514B98D6D7B72AF1E63A847D1D1FAD8229F21462CEFC236C0871EC8268A69076A64CF4759302D628E59E890EC74FC29494A0C24FC22E0E9AD7C8160A47E977E423D5B55561813C48C4F7E740A5234889C320CFADCEEFD423DA2A2D4EC68B22D813865F70949868AE342659F36F9187DB8638FE5535559986204E3768E8A2A9F02B1A88205F2355AD15FA532086EE358E25206D5A216588EF3D5A9D0E14EA74FABC41E31F0819A772B8370F1170212FAD43054EE4EB642EFA0A4668394E2F4BDFA98C08EAE8F91A4D92D8261048DFA9CC083258BF2337E5077821DA28A796E809CDC4C86E3D21DE508C7DA7322505327688BD531914EC7316FE259669A9200400AD50D6328E43C7CBE45A4ABA181EC85943AE6A710740759281A6E8347067F99E4A63AB5BE6A25BBCBF236C309F15BE8DE7A041F669FEAF1C0F7431568F107118591C07749F108ECB208F50CD96D9912D64CE40EC00C11E1DE2A84B7FB986F710BFAB94BB75F819202F48F8DD162F70BC0DF04D7AC200D1DCB4C14456E8D89213B881014EEB3191A10E1DC4B1409E9C0A2BC34B15EB8EF6085D55A830113CBD2DC9CBFFC6720D6E68245460A27EAF3AA549A248E3B3FA7445F5106BA7C31ADC1B42853538A4A5C1049C9D5063341A6FC9FF7A7ACCB55229F20A6BD0E0BACC932955E6C19458CABA81B558CA1B53354680B6A6C9F2170565EAA1F12462AD1A7C9E2FAD1EFB8B05EFF5E9E012A8A10A97255554F67F003554F2458786FA5DD8AD681E7933B14CFEC26B8AE99CF7818CA2E852648692E2F2D25E944EC08801D44CD0691DAC6562C616D58A3821DF2C51D161F966056B5AF9486FA856C0149AC10E8AC2533098B6F00CD541CDA4F46C4F73C87B0B1AA52CBCC2A0A3E688EE3C18567304140CA5390286EAA0664E576F4F73B84B1B1A452DBFBFA1A30E492F7C18569164640CA54D32FEEAE0171D7BDFA25EE597E8370B9DB9517F7B2E12737F3F434991D2D19F8B4433623065A33A3D0E17E98A780CA151A257A29711B6A760578277181872AEF8C7A2FBD338017B86523B012BC6A17BF983178D62665EBFD89EBED16F6D3084E4778EF7A75C141786522BAAC7E350A8EAE1924651F2AF98B470896430051A3280F561BB34948EB0DDDE7935E11E3A964955FEEA712D58BD61DF0073709F5C46C100FA2263E858C202DC23D48D525684055A69CE56C302320A86D29C118705C46F83378A5A272CD04A87B61F16682463286D7A156101EE19F746C92BD66F226DEAC99F96BE20CF9033D4FA4DC69EA194B1E5FAAD7C13672BBA27B8825826EEA6FB886B819757C5EBDBB3864B8C073366721A06501E3963C7E253092E8956485BE157B5D6A2ADFA56721A86D3A211FB57CC55DE0A493764BCB6D61EF39C56EBCA337C32AA989F3A88B79D7D2ABB5E5D21651DA7BCB50A6DDF315710329C46BD0AE75C753B924C1DB4AF4AAAD54274F999BEFEE9DEB5C4232CAE79DAB5647DCD0E0DA0CF9AB2D4A184BDB06D009D2E5253C320412D880B5CC8E7964EEEB2B3B1CFA2EBF6D0F02B8E62C7C5E540AC0A62F8686957424ED1B4F025C4CF8ED7F7F59437321765023DA681D0F7EF08205115F2FB3C14208BD94A04AC9ADC5520A8BC70011C2A735A0B187B684206943D5B604029FAAA22762578FA8405499F561141648F1829007E41985320EEF472832D51A68065356D7837488F3561DE642AAF804B5DDD2080CBDFDD6D0090BC7E4E059CBFEA4E8188CD2BCE376A7924A27AC6C075002B819261301E9C2092A48027EBB1560FB1E3216A9CFB6F1A8D8B7468318422BF58034C9132240653E4E0688091F1A2DEF956006918FABAF2E06F4E174193BDC3AA055C0E508B4BC58346324655CF25E9CAADF0181AC557B97B1A4055BC63EB68710E37D219CFA27A4AE0A4CF23024ABBA17AC0085FAC0124E54A6B0256D863E9ADA30C78C219E35C10C989DF19D1A6E9ECAE3842422D06F40E09572C104CEE9C636A7A1E98005E7B5EEC4A81E6920E079B0E9C8A18D854BFA18B1A872CA91ED28E6113F334CE4DF290B99E5A65247FE451C149C519496987E5A72425BCCC5D574D76CA0F37EA4AAA051FE507EE043CD43C9D47F5507D3E8FE89DC08637304F7D1CCF04740BE6E5474C0A27896717592CEF05514BC492C2896B60030940D071D291B3D463F2C14F59B7653B7202D2053B722D1820D87F534169CB00EA35510903A49B493CE9A2CD24730688B68EFA6200FF22A8840BCDB16DBE13D2D8B6393FA491ECDE98522C7364AC101C9C10504D1F9D68D16DFAC40303A0A4D14E8FA9D5AEA4DBD2C4109E74516A88390344191D04148A663B6C2816A6120608B2CB79A2E9FC72F34ED369E14CFB823E3B9DAD5D6C497FC5C9CF3CC95CFAB379AFB96C6702846C29D0A2DF5CB2AEA0EBCD09BD14E9D2945E827AA1C89AA1F468DEB89C531903F4263D6966AA3903069AF4C4A993322E184C7ACD5996E6FC1872D2E3F2FE64FCD09B02A4D981E65C18740A10A4A00918A14A5413EDC52B6C44152E6C604743725A0F1A21C8A392B342CF5634E45BB563C5401683490692B3411D0C93240CB5EBFE30612E59668B9C0D0636539506D38E31435A4EE593553C9B8CF2385A657210FD1406A91B58A89BBBC1A32883EADA2C2D1FD1A9F201AAB2A3BD95F308D7A0F870B487AAE0DB7053E023B9423F2E0BBE82CD067B8675CBE2CB6CB5010EEACEF15F56F3D9F3DA0FE24FF3C724D97CDCDB8B33D0F162ED39511887F7C9C209D77BC00DF70EF7F73FEC1D1CECAD73187B0E35C7B1D90B1526648DC103644AF17DB82E3CF3A238C18F39DE017CB1FCB1BBE6AAC9B21F245B04255636C1819768B95B50B6C0BFAB848BE370BD0141F676C382A6A088AE9E45E8F78F30FA5E274AF04925056854F7015FB99AB102129A216F8A1AAF1CE08348F09CD871E8A7EB409E2E236F5DBF2646C2A8BFEA432A13BD4838B2E42F3994557E472CFE4383A20AF4E115174A73E0C8EFFAD0AE00967192D941121AF95D1FDA354CD228C82EA2A5C15105FAF04E9FA19362A3913FE44542648A5AC03C4923904FE642B875B13EECFC2DFBF34DF5720B09992B3485CBCB9CFCAE0FED7314FEC06A9CED1392E0A802138E62BB2CE064F5591FD6F91AFD8BC3803C4340D90241793BE8623B21AE6120A92C5D2D7FBA979214F19D8776B4C75851D692EF71A69C9960D9B9416BE660B2DAFA9B3EF8EC38F3794403463F130A42975FBC4E82A83E1AC159460F310727FF6830C145C875C8723EA809AEFAAA0FE902F918A81D6F5CA9027D78D8E716C2A30A0C866BBCBC03811B06901520596030D955AF2F52535DF5D56098530F4E52039D2A318428B6798A23555B331F6C92467FF6437C67BCB90D5101E8C78010E752A8F9517E5C2583755C3E5851DEEC2FB9399F8479E2E134A0B597CD5F7DA88A42ACE731FE7D79FFCF66F2A5BBF42FA391ACBDB506EFDB997A7502AFDBD8DF7E5D66CDAA09CA85BAFB1688B31A42C287351A2DE7972A80D9FBC4D24290D296FD589AEEF6014979E383171E105560E29C55CFF9D2AE59F5D98036FAB82F455DF34960054CA12DA34BCCDCDB3CA4EC48ACA4B8461B0C6266E81C4394437F5DD6BDAD5151E4895AB32C049E36E6A5B1793F36A678749CD70EE2BB31346EE54C7E37F0A1E9C45ACE97E68B4D618B41B68184FB7696FA3E6F6A45E57D7A9B5B1D63EAF476BB638D3992D876CCA9C0F4B4462414B849B90DBD06F843B02CA8BFEA43BA8CBC07E420FA02704C91493826FFCB8F13BAC41CA27C048A6BBCDA31481C5B1866AA5B098FC09BCC764208FD0C3ADB1B21E3D8FEB1EF069E3E2730C0F957FCBE0753B44B5B35FD6E355D4310B33B62E5B7DDDFCCDE92D1AA8FE0F798CA2038CADF22AB4107CAEB0F3A5A0F2A38EC98C9BF188525BC18BFC4CBC725AAEF5390430E710A72BC8220077DF5C8A0B6F486CB5BCB70B6B0A76248BB6E534BEA7993489718249015099D54EE58F14D1FCA9F90D9F6CE3E0CBBBD34D99657605BE80B3FFAB32DDCA521E646450DA2A7CD1A02AFC0C7E24A0DE67B6E8165BAAEC2F54B91F090EA9236414F1E265BD606EA328EE1FACE7FF98F14F878E00A725F9595B7110C5EC127C8671BD55F4DD76EB168F1661447387D76FCD485AE101E57683E7BC6E2E9D32CD631D9D8A61BD986B1B7DC7542DD6CAF1ADCAE7B75768E02F4372F4C3678B226526B22BE76B13F4B22BCBED1DC82E881D975CB513EA741C581254F6CC8A1B0BC60218ACAB713E59A469C401C438E360B236D7CA3EC0AE0BBA85948F557036D0B5D566F43FE52F1260853A2DD14839E6C20752B8789F56B7984E08ABD8BB9CD29020EC8F82CA1605D616C6F7E8F105ADEDE549F7FD6916075DE163F4537229D35F66CB9A30992D7F876E94093994CB1EA8D5AA6C6710E4EA662168CE2BC49DFEBE296EBE021D7BD27B00AD4B1AE1C516012F18AD6C0F7FE210A18B165E39C2DED7BFB2BFCD08DC34EBEE557B375C33D48FD845F37149FA735881CE2B406D925CFABA545CF2FF8EA77BE6F61D1C5CDFADA8B2EAD2CC6DA6485EBF236D04FD7C0F38589CFB23AFA589669F288F858EE2609F261C435CCFC1E9E376D38626F6E9273B42D1FBBCF76AB340A3820D54793785D1CA311C4C5EBCAAF865C425EE8BD87B40C0B9F0FE049AA98537B0D6398F0F005C506B340E87C0FD3E434704F4002BF25CCC42F283618378E8334E40CF51EBA822B6304C5261E41459A30DB962D35E0F66318C08B747D872F98A4F84C1698504A342CD480A7575CC724DBC349715E07F2D3D61B36E5832A32A1FCE64778061C347D48B8CC979B402707060F9B2D35818CDFE47C822CC4F2EBE477CA214E7EE72BF13BA50FC5D8743EF347FBDA79A092B6BB1EE0B6938A93755E7038BDFE6C084B901F4D7E9F0690F100923EB0627300E5CF55B61B4092B63FC700CA3A8FBE3D792EEBA73145069E5FD1863BAB4015EC9492F61D332E71B454D171E64CD9D1503B9957933986C4E33BFD297AFBCDB2D16ED55B4A2AEE1CD4998E764DC39C50E2A10E78495ED5363700BA8076DD1E4CC7C6A6230B368F8D4D36AD1A88FDDBB1D6766BC76FA196DB3C4790F440150CE9C31C874180048437FF9288CB38E24BA760F614CCD6D0AAC982E64B92A5E3E00DC2BE231D059A96C10E69EB5D77FCEC2C04B390A4177C17412ABF6F2323C27E1EC3644827433A52439AC5C6AB471807D8DB287075D9E29082D875BB6ADB4DB567A7F1AFCB486E1965754C3625C77017A9ED1B58AF61CC253C97DF86B0565BB42C4385ED585C2D83767A6076DDC2D8B1088200A69036B68641502901099BB5997F7AE5A362C893F8227C2D47C6F84FE4DB1919D3BD17A3F270E957C0FB1B694D4FA56B8CB0E6E6FD8CAC0227EF385105436EE9D8D7587BD6C3FA0ABFD56A7CBBA3680503778095228FADFD886A04D2EBB8CAC6320B892D33864A5D5C2706CE56315AAB6C90AB0EB9D54AF1D51C1276E9D2983FA0222ADFA69DE83F9A359A675A045A34C460EF7EBFA336A45D77548B8E7C8B3CE1F8CEBE1B1D038A20138028BF6D63CFB1E8452CEC9B51E0E70F085C7C9A9602547D9C1C65C1B02F0B8FC320015E0023B64A85BDF852FD8FCB0F78D88107886C21F4E3BADDCA79846B90F53FDE0007E6B7949D79519C6037F00E20639F5599CFCADC69A4872F319A9A17B8C262F5773F8FD8D515BEA295D43D8C939BF03B0C3ECD0FF70F0EE7B3A5EF8118ABB07F3F9F3DAFFD20FEE8A47112AE4110844926AE4FF3C724D97CDCDB8B338CF162ED39511887F7C9C209D77BC00DF710AC377B07077BD05DEFB1CD0BB05A50F63F9450E2D8F5495B43D8C8422B96A9EB255FC287F98CC5F8F1E4250008FC99E72730BA2D2BDE7E052F7F8027981B913279A7B69D54AB98FE7B02EFBD40F020ECD19FF085D5A8527BAFE1FD4C66FA8EF6D8864702F3897BFB697E879F5F4372CC2CF4EF10A919401EF215407E5814E08A30EBC87C7691FA3E3E25F8697E0F7CDEC36031D4C634C79321E178791EB8F0F9D3FCBF67E7F1B18F0A6104DD8FB3338CE017F40D2DCAFF9EC2E2C3EC7F934424119F62CAD2500E5CBAA7663056307AF29C22932C07143C81C87904D17CF6153C7F81C143F28814FEDD7B53D05F61F218BA7D40BE0258EF92CCB636403ED83F7C6B0AFA1A2669141419BE34EC7F5E83E77F318577FA0C9DB4B6DB394417E96092FD37D4BA0ADA491A15F681503F4360DC3E47032BDF1B3392DCF26892D1E16FA690A9DD8F06D0EFB0893695960337245FC51ABBBFBF6F0A59F45E5A97712B7EDF4DA80C5AD2CA2C571E24E9D473D225689C813E03E7FB4314A681FBD7F08E778EC73C37A00EE5A724F5955317EE327AE0062A6797F426B0E8A5B8D6208716AF81EF2B6631DCF2E3ECFC7FDE5E455E88136E6F4B28B717F039417FB095FB657619218FE9E3EC909ED2B4C822E0F0D6D21A656F5A508657DD52CA0C076FBCBC03811B0690D0453DCE134D853D3B68D1B39267252D8917BCD8D5843654D10B9E8E1327B3D4D1B7BCDAF6EC0C21482358DDE9A7F0ABE9EA96BC6B15D2229D792BB873F0BDA07E3513C72E2C2A4C3D36AD8E09FDE946CF62442642E046D6C706B4045959D3AA616539F7CD25C8DC20DA4994DAE6AFA05CD704DDAEC2FB24DFAE1ACFB0EF65CC2BC7DB1B734791BA5D537B55A7059AD864D4725C8C6D945E07E9E4E32E6395DEE6ECE6D78937666CC1B4D3DFDDB099FA76258F113F82E041B400608C0B5179F22D1851655CB123F51C14B1C4AD560CA6F12C4260C827E4B9A03367B2303AAD3AEA43A9ACDDD42605373C4358F1E7DB121EBD28266CF05BE3F8178FA537620F18620F3E1887D486F7690D6D4B49AF918DA11B4DB6463EAC3B8FE98E03FA02FE50AF3E5A848A2F23DC1DE0F702BCFCABF4E03E98EF9D147F9BEDC72B1FF3D56C61E452A0FAD3481F6C2F66ACDB53CD0EB686F12B47CF2D09A95350FDF43981017E7144B4C1D36A5BD3F2F693EDDDB16B0862D1269E09F7731852BFADC5B6751F665183F2035B990526DCCB21C8B4B683015F6E367EB1BCFE828C720A347C36419B81A2DE22CC53E8EBB587BBFB8CBF398AE4841633D6798C082E6E4827827A5364708A0CEE706450605A6FE0B3DAA397B49B3CFBDD33CEA57C7A31D2E53B3896C166B730EBA73BB6DF3E6D97F6331922EB86A8F9A0FE103620CD8699970D752C04F32019777DA676CC496F56B6B5EEA4EFD3B49CFCC9DCABD938888D13406BE892EB34FBE88C681FA353F4B0BE69B3DBC64F3E1CD5A98C9A49BB7EEAE64FB4D98259CE7E76A08DD8A07147D854EE5553E3B1FA589DEDEB2E3853AD633AECE4704B1BCA6AD7908DF9BC6DB35BA39C887A2498DDED34378FAA29A447E2F9F8E478A7A81ED9F4A6B38C4766CCD94B60B2474F54465CD468A088A910F51843A6AF79615EBE1423DCF0D1EA85E86E2299F68F28FC3872E3603C3AB764142683B06306E10A44306897BF5736ED92F29EDFDAD2B4D27DD7DB264E9B20E16E18AB69AFA4757F4766E7AF60B4F6629C01A27B3E8D6B3190A5C79EC5B6706301F4857B9A6D767DD3FE3CFE3D423DEBB609BE1B7641CB61D7989AF3565D26E6D6412766D93E9663705AABEB0157D3A35D3DF762BB4E60158EB612D7BF08A335F0BD7F68C4C75A9CE21B85A5DDB5D389F81647CFE99AC7740FB24BF15F7532948611A6DA77B2C5A35F1E68708B07D269493B9827A1D135AABD7EAFB4A74D0C58CB3D1F702530CA69B32FAFBF9EE9EA47AE2C2739D528E8575D2CA359A6C9236642B143AD4E02333F5BD21B8B76C123E855387DF804AB340A7A007B05E2189982E6049B36EBD08CC1C76170EFA1F18005AA0C6EBE314FF92EA9BF86314CFA40F02574BE8769721AB827C8027D4B9CAE53F4D27190C69D21DE4097BAB8ACDD6651455FE7BCF7ABC7308017E9FA0E36AF32DF186F909FC704EC4223BAD1BA824E8AD3B79097BCDED83F4670F3233C030E9A7A2CB0F53C2607425758E5DDD093473F79F493473F90477FEC036FADE56B6735A748FBEE797B3DC56F35EF27464A81119BB8997A67BF11607B573CEF46CCDF6864662F976A8DCCACE63432A791493BF708DB55F13282F5055009B8FB492AA331A1B57553569C46C43422EC26448E6C16D1CD2399B228061B2FA26B38F0174EBFC9B6374805B6713F8888B0C3EE848903885D093B101136C899DEDD5D3EBF6A1F59F0A2B4CED93771B3B1DABE5771EA6D3AD90CA793CD439E6C1EA5A5D3B46CA3DC12EFE786D3ADDEF09F49C3E925834A09B3CD8AFE380C02E864FBED4994AD1A9A10B478B56DDAE0993678A60D9EC13778968E93EFC46B44CD8ABAA39C42068D02D858891BD29105FABDE07BD7555E9BC4A73E738E342F3FDC75B3FFB319EE5DB5BA76B7DF96C87AAC377AC6936C30D670C24843A9B92A54F141FD1B8D0DDD76DD1865DEFEB634B59711691C6FAF619CFA89F4469B76B9AC1D365578BEB5BC8D9AEFEB402CB470EFF7586FB2EFF172FF9CC95CACA51709B679ECB5C3A4623413188798458DC63A23BC8A00735703890FAC41F1530F6D9EBB116C41D8E37746AB69C44BDDCF364F5A747E65434D96DA6E180D75E3BB76448D063CFF34DDB9334ACB63D891E91EAE5D5814FE0DDE3D86E1F7D327A8114D232B0F640F289463B4039DA7BE82032237BBDD45ECD6368EADAAFA2ED8B5DDB020EDC368A6A37E0503573718C437F9699D7FD2263581D5F00569509D12414B0191375FDBEB335AD96EC220B693375602C32E701A938740B71D85ED23ECBCC36F528A74669CEF4858D8D02A98F12DF2ECCCB32BE84430B103CB469A41D13F3B0F0BFC0101B2543FC32305CB380E1D2F23904EC1394388D2089679E6C55766EC9C06EE0CA7E857AD4A9256D0BF5F54DFBEA67EE2E1D7A110019FE6FB8BC5C19C1D729741EE9CCC96593E0BEA29881DE0F20C41FD706544D03453B4B0453449FFCAA141431FE2FB533D808F4AC74904108B793BE1058EB7013EC304A69EA645C19DAB20B2252770837C134490B8AB3A1889DC2A1E71059FE1B68A0F477B840629148B78F2F7B6242FFF1BCBF58A68442B1755408BB327F5CA51D2940B68622BF4A36A64F707D03761D7B4B48E207427540FBF364DFED7D3BD553DD771EA97950DA88186A3A1078DC33D1E4CE95A2A1BA2716BFAC6C5788F1F3DDF45C0A5BAC647B109E9F28582199515B21C36866904DF9206716806502161DF75F0D637AF6F4583B29BD2B203F572FB94DFEE46C831FF30882522EEA1600828BEF6A241590707D09ABA1F3AC84A6F7C8B8A522F0BBA698BC292E0269CF510C119A1BCB52D03B306DB9ED489E4C649EA7D4B9DC924DD9ED4D93CCF49F47D8B5E9459BB45F9E39CD5DD750A8A2B7018028AAFA3D799BC1FE3700AAEAA27373A6A4B7F01BB2BFEFD14821641E9A81588EFCF38140953BFBB0627BF5F88C19F7F1CB5B654DD188792142A6DC3D4C8DD119195781DB661341621BBA56BA8F52637B65FC1B8D61ED3BBB0CECCA43DD43AF3A796F62EAC2F33690FBABEFCA945BE33EBCA4CEE3ACB052D71BDF6E582B67CB7B25C286F4CDC8A2215D7D90CE51E9497EC1050CA4FA3B6204527C6E22414521FCA4D98A4BE13CE422175DB8961BB23F701B3B90C44BFED2CAE42EC837A89D388DF1D5F517052823A652593217D148B90245D3048D850744084A7882AEE45CFE48CEB47DF041DD3C1CA9E081940EF8A44AE3048500B1895CE4EE8C2332F8A137CC8EB0EC490D336DC0A79CB45FD658A8CE597102D04EAE4E742C675D1CA79846BF069EEDEE1DB18F2FCE9E5DDA6AC100BEC128DE53370BE3F44611AB87F0DEFF2CB063874823A12BC544D357236AF99C3CC5690A02DAAA91156733787A92A91A028CA355050C98C3C1EAA58868CCAF0D4C3C826EE4A30B3D51A2960F39C4DFA9EE59536763FABA1C101544F8D7AB9C1F62D1B8A5F50A314087920AC2521A1ACD00AF70D7C16755F5A534103AEA4A683BF37842380AF22C14C5634C3CC9D586AA682AFAE4111D9484D1D9B4699C77D38AAC4D524D4882A9B53A2418536056AEC821813875E5047829F0CB9A9304B38DEC8613D8EE60E390739FF2C818C0BF52017E9A042F04559038E220356075191622244549435202AB26A74104924511735A0D193885CB7541A55EDC2AA50C86EE2E730CA2A4A08E0ABEBD222C5ADC0A527B4EA4A55A1DCAAD206D115750C94B15A3CC875B2AAA252CDA2A21E760DB18AAB3550612652F1C53C422AB4ADB5A8B29A127A79C95140174B309395B43152CB47195EAA523376A2AA3E0D6A47425A53414DA3FB40ACEAB89583E460E98C68432F28744EA28A438E1557886FDCE2557E7C9468CE16B1C106BAC33ACC683A0C29E285F6E1499A1582A554CE0FAAA081294D4B2302125BC12A83F8237B0A0E29CEF8495944ACB8382E65654A4619B2BA0563E467CB044CD13C8846754466B7B3CEF0850D2C111F3C3380D6823DE4C1290143A4E7AA04416B82D0FC4343573957B76A567CB5D431626755DA3BD9EEAB852E721214B56ADB39720351D639E926E3AE778EDB3091F5B0796765E7BB59ACA3649D131C5EB0D0256AED57352BBEDAE918B55697F44E9A42D3B18BD2A843D65C506AA7CBC56255D2594156B80549928BEBAA55FED14EA7EA15B2A45FE244E68E5D13C9CD9EB4B89C5C41DF9AF3763B768F939A258971E9A7B28EF5352DF4DA319D294123257397BBA8B09ACD8987E6646ED96A0AD2DF049D5625C97594271D4DCBDA949F6C7550312255F960BBDFC186A04453DA939528C400DDD3313C5A793E3B2C49559E8AA0CB46A92D0DC92D4477E8820656C88386241CAA589B45E5DD6F553A455576B49747F98A0FE82FB248E0012289433FCEBE1EED5DA701BEAB2EFF770263EFA10671543F4158032DEBE03862191762282AAB30D7DB7D85097041029651E2DD032741C50E44461A5BE7EC6167FC66D51D74CF83CB34D9A449F9302AC90C9C8DD284FF688FA3F9E8328F63DAE80222D3C3D7FB5D069F53CF772BBACF04D7DC4B40E03497E24E752F7BDA11817B78A9205D848126A0827D5576CE0D521C1F018B2F8315C0D72D9AD386C6F417F8001C1CF07BF25C3CC06540D482A0D97E74E2818708ACE30246DD1EFD453AECAE9FFFEDFF039C64EE68CF670200, N'6.4.0')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202003201250482_Ugraded_To_ABP_5_4_0', N'DoAn', 0x1F8B0800000000000400ED7DDB72DCB892E0FB46EC3F54D4D3CC444F49F2A5BBEDB067A2AC4BB7CEB1658D4A9EB3B12F0A8A8424AE59641D5E64E94CEC97EDC37ED2FEC20224C8C2FD4282ACA2CCB72A02C84C241289CC4402F87FFFE7FF7EF8F7A775347B04691626F1C7F9D1E2703E03B19F04617CFF715EE477FFFAFBFCDFFFEDBFFFB70FA7C1FA69F69F75BDD7A81E6C19671FE70F79BE797F7090F90F60ED658B75E8A74996DCE50B3F591F784172F0EAF0F0DDC1D1D1018020E610D66CF6E1AA88F3700DCA3FF0EF7112FB6093175EF425094094E1EFB06455429D5D786B906D3C1F7C9C2F6F37C7C97AE3C5CFE8E302FEBD4C93FF05FCBCFC7B0AE1E6CF6729FCFD2349BFCF67CB28F420912B10DDCD675E1C27B997C32EBCFF9681559E26F1FD6A033F78D1F5F306C07A775E9401DCB5F7DBEAA6BD3C7C857A79B06D5883F28B2C4FD696008F5E63B61DB0CD5B317FDEB01532B66214EA75C95CC8D72208F3CFC9FD7CC6227B7F1CA5A862C9FB45590F4AC7A26EF0CB0C7DFE9F204D167060D649FC4B23276F176F16878BC35F66C745941729F81883224FBDE897D965711B85FE5FC1F375F21DC41FE3228A48F22081B08CFA003FC181DE80347FBE027798E8F3603E3BA0DB1DB00D9B66449BAA3BE771FEEB9BF9EC0222F76E23D08C3ED1F5559EA4E00F1083D4CB4170E9E5394863040394FCE3B033B8AE41ECC53985F1F52B5D23289A2947A4BAC90AA48FA10FD09FBA1D946E384AF3D917EFE93388EFF3878FF3576F7F9DCFCEC22710D45F7087BFC5219CF2B0519E164087EB0BC81F92601054971E9AC890E59902D5D1E1AB370E705D0128A1F17F7A51A1EA17FCE900D7E913F00B245FD7E1968B2750C2AAFF9C401A423B2952AC1D2869B304771C8550B8CF37CB204841A6E2FCAF2EF85EA1D388D3D1ABDF1DA0FA94263FD0DC8AEF1205AEB747AF9C0C315AD188C1104D92C3C34307A8CED7F05F96C41ED4552D7407D9BC95BE3A2ED70B28BE9EEBBE7E38D82E53CAC5EB93E77FBF4F93220EFE92DC56E3AB5EC5A806D9826B5F2E6AD342D6E0826C41A81C4C1B4B6D04112FD37BB5FE7FF3FBDBDFCC961B4BE4D7E9F331148A9CE0F3D1AFD6502EC0530E2139D1F59FBD4C0E4B33CFB3E5AD1707490C1AB9F9942411F0626B2A2ED330494BA9C1A302AD6B7A0E6D6BD8AE3E29F09CAD8C253003A568AC674E9E630FDAD88D5DA25333B87E05676BCD2C5838A3533742BBC29DBA6918A335339D2CA0F1A6C835EACD8DE17709D27598656AB3C00D2AB3A5FCC27B0CEFCB21639AB3125A1AC6500D5F81A8AC9E3D841B3CF185556FF8A9729626EBAB249201E75ADC5C7BE93D40CA37B16AB64A8AD46F6B490871B89AE625B069AED3B85CB95CB66B7B1B53971D503D9FDACEB761675A3D652C675A3D415BCDB45314474AE233B84443B15F813C2F475E137DDA6CE09C280B16B865B610427216969A7DF23240D8390CC16A2FB0A2CC9D98608042E910B2E1A669B1150A65454E16D4B55D8880CDA0E326CDA08F3AFAD8B366D5184FAF7B71D84EC26C1379CF1ADC86A1234BDCE7D90988A066EAECE05460DA4453CA9652FF45EFDC7D4982F00E0B7B3718ADC8DF6FF7ABFA70FCE0C5F75A9BACAAFB6708EBA4CF0BB2E5E80CB09E633B1557DC8C78058A74A5CA9589E07E55681BE22600C01548CF1D13705B280205F5C645C0792BC06790405D8CFB9D8BB87347B7AFFE5BB15AECEF918371C33520CC0C453DDECA5055EE6664545E1905B28DF2A0214C4A443E43BB4ECF0BF043E714BAD9A4F99A86F761EC45C360ABFF6AF4C03B273BA7F8EFBEE99E564BFD0ACDFDB6AB3D6C3CCDD5DDED83BEDCDD64A7A6F2E9530E62249D9A6D5437B1E1CE5BBE1DB79CAF8097A977C69DA48FF4967D230FCF108A476F3C41D574C3B4105B4F5C45A5F9C4D776603FB9DAF912431B9D86EE397283D318F50BB79B0DB0CE61ED7EF79E1413890B49AB82E1864D24934BDFAE8769D669FB4901729A707BB1096510887094712814851DCF73D9CA623CDBAB6D291918DDC457B536D4014A109DD481836DB1BEF6C396B7192CF5732C792FD0416A65383A723A2CA7A04E7119E75DBEA83CAD6A00EDE6D01728FC61D9D07F5E88000CB5A34C77993FA8B19DEB9FA1795F78FA70E6E7C4F7A2F01F957E10B49F36515F842ED8E9D6ABAF74E8DD845CCE33D8454454E70DDE69A7F865EF140B94DC3578D28691758A12C118B5B2DC47C3A966EE6E946663E80F8C170E9B8300A8636BF1D7DF8E0E7FFFBD9F1562D2591A9D7591E40D734CCE3091F5B305DB7A5C119E3F8A30B0DF2726BAEC6653D576F1576FD6D89C4CD223426834BD747474B111CC4182CF5B74CB2C03EBDBE8F93F0AB808C329AE3B64ECB2BBCA189C932DF9157804DCA1295284B7152CC5B05241CA3372AF8F0E7F7374AC352A02100C88B2B6290641369E156255DC667E1A6EBAAF162CA49F60E570B733BCF3256BD2E53BD0E5FBAD26BEA6F75E8CBD58D8AD1CED60E8D403D9265B88204C7EAF637D8298DA75078E1DA8AEFAC9595C6C5C33A4DBEC986686E39971E9A520E665592324507BABF4FEDBDD85DC7B0A214D41EC510684542911C70F611440E1172641B07AE7665B7B9BEB20ADC4A534C86B8A3217545457F3B50F9AD92B00F4BD6BB51E5C36F73298265C14F94392D63B055CF329D9E2456EB09E677FA490D6976E1DA1A9D671462010D94208A8B7340A9E64C7E6B73103D15074642002912D8480F68581F6F1102B09D4F04B7109AC4C144BC629DA1D433DB6E5E511E2E45E9BEE3D67BE9C80262CA80ADCB8B9C4F02249D768EB5D1B28EAE7D6823E16A19778BFC20A8996EF22FBE6CE83D36A4AE3993C20390CA1438114F90D5569EB47B0659CCBC355B0F57408399153475562A823CAC4D491156CA96365414E225F93A193AD202696AB65ED39362687F8B85C8985AAC4D049948949242B74CAC8AFD8E4C626D95A772FCD26E9D959DC9A098879DA3DAD5EB23EB6349CAEBD30D29F6CEE890E2452886B78175797C7E6E47CF5EEB8DECA42DBED00EDC4465B1569BC0BBC975E96FD4852D5D66B4F519972908F93F82E84F3124D05CD4EC06B27B9E8757FAF4006F241307E4EFCEF49919FC60132D0BEE5BEADA9B8F47D380FCE20B740C0DE6BDD62EFF13C6B287292937FF990C4E0A258DFA275B6AB57A5239D408645A77B0756C02F5002177492D69B010E435CFF48CE3C1F2EA88E06E03C23A7920B784B3F0F1FC1E4E54D5E1E0B23F2C2B5D8E42FFD88BA7C6BED139F39439F2CB3F54074FE66055BEC6FB26512C27AF4374BA0127F932D1353D7BBBF594256F99BC20A62623BFB9B9F93FB50E26A560870394B5DF959425355E6DAF32D614B3C5FB64C4C98CEF355515706CDE574E16286A2F2AB9896AAC8960ABC0DA120645B83A1A52E1093D394768E08945AA7EDD64ED978CA1E92E3DA599E6E3932088003AFD100D330CF8EEDF7AE338254EAD2B6B3A96C3CCDA63D9C4DE5C8C06F8F61A0F4ED7A0A10D4980738726925ED2679D932619F32B2F754D65D6475EFB7A236CC6729C308F7F849CA85EBDC9549641522DB292CBDA3A3E76E4C9C9F35D662793352B7A3E66218D3B141C9749B4EA94FA7D44773B2B1BF53EA63D08BEDF33B04B7C7BDB4D48EBEEF3C96BC9566A092FDDDA4436A90F6E4CD42BB3A862284A622C6A950EDAF5C247D4CFB783FB56DD965F7ACD284B2FD33BE940BD70BAAB8DE43C32824BB687CA98CC62E3B69AA771D3178C1438E74898C2ED5538D9D77F7300ED5FE9EA48A8C5CA33D3EAB38DBD2F7AB6C9776A136DC7C0A5DC871ED2CDA56C6FDC3F8BBA51E7598C6386802E2B4BEBEC0F5D57E876C09A7E77AD35AA1913026AD26C7D54AAB3975489CC77E6BC5F7351D5433BDDC57C0867C4BED0A64C499B9D2FC8293B79CCD555195B0305C5CC64A73758B398B204C11670BBDD00A31C5F16E3D4127470125BBEC90E21A7B2ABEB65746C916DFE9F2A811B815D3B56AADE6C9DFC0ED43927C3F7D047A6F1BD7CD1664A39F40A3E3EE6A8C939EDE1B1BE47551A732DAEE7952A78EB0912B6A3B4756200E0CDD3876A6104D7F9EF952AA0737A0A8FB8EBB418466F7065AA7FDE7B5D488908D5464D47143644AFD99E71BB268C009EA226AD3F11D417AD91104A9F9897343B7D906AB3555B9A0B5AE7EA7E0B548600D3C274E614C177C1B2D1B985DDFD270F8957905FC14E4C3E375B5B75BCB5CEF9AF04FE0055070C765C574B7B48B35A1173E79FEF7FB3429E2E02FC9ED651A265542CE79761679F75943935A4B5040B2851066274D01F90D472A7A86E38365EB39676FB0FC02D009EC7A29497ECC67659EE8C7F95B8EA554D54F204A7E541771344D8E0ED56DD8EA1A14CBDBE411306D5E6950FC19DE3F6C2BBFE507B71A46C5D0920FB757E13CBB512D571D389A057EFE3904D9828539ECA896B28F4C71CC160D0BBF6D02AAFA91BA7A63E8D74C6FC173717A9B1DDF15CF6B6088C372BDB213CC58BE2ACA8B214C59FE372F8D65FC66EB9EA6699236955FAB2B9F41EF743BD704AA513B92A270B8DD38D2613B1E9EBBCB376D47D47294CEE3472F0A03D9868FD9F06120DBBB5DCC06B25CE73238096ADB423CA4126CD40E9AD97280CD3D01CA5FF594968C29DB12375FE0E6BF699AC7DFE3E4477CFA84E29A5E848F2FE2B6BFABDBA2CB5340F0B5C89B06EFF4B412D7964828665741A3792309C577518142906E756065D42B8707AE3DC62BCF1559F7A80517592FDC9C7DABE70CFA8E8B0B9033AEFC2FB3AA68CBB337A679C2B7BFFDE6BDF5DFFE7AF4EEF51B70F8FBBB16FC83D29587710108E1D22D253FC2DC7F8018A0019C277E1211FAEA50A3B1BEFE95B0B3347858A3E2950E38BAFB6843B7D0E8BE8B24C68B011AAD478056547CC1140144A3092F12C4C332C6D034D168417CA114DB4AA3012FBD340FBD886FA7518065DEFA2602C70F49E883ED68BDD68DC0727D1BDE174961D1E40B34A8834B009918431AA367A2A566F4CA96E6D5CF901B4354D78CF41508C214F8B9798B15005FF3074058363A41A8717C0150A402F3765085E27C26B2914684A0EE85F3EF8964B0467CBEC5454661D088CD35586F92D44B9F05BCD3AC99758BBF02B0814AEDD6BCE5272FB8027F2F40B6C5F6462773DF620F5B7444F7DEE804E8D27B5E431145D820AD64438D609C25E96D180420269AE8479896D737BAE1AD6408D93A11F48229F234C35CDA474811A2D805D14C33DAA530D1D74D0A58A31DF772E850FC2429C811D4D849C8C481EB1AD9426328FD016DA46D6D5D58A00A12F1FD39D2C90814E224AE72ABAB3BF588B65A8D53F202077B92E4338A1213CDB5CAA46CFE2D0D51DB04C5BF9AA63AD51067C5064E5DB8147E8113D1AB7CA4A6B5467E3062105CA1580294A6151486EC2EA4C5E948234EA74F1B38FF3D21E37406F7E63EF502C08FD62B0D4E68EB9426FA0AA4D01DA7DDD2B73A25023B7ABE868B24D20904D2B73A350215D61FD04CF9E13D136DB44B4BFA085762A8B71E216F28C6BED5A9128C8C9D626F750A05D99CD8BE44635A0B0801C02894B5CCB2C40FCB71ADA333CFB1B70E7D689CC0BF70004A7837EC57C6043D8D8359B5B962D6FC86B9FA16EDF8085BCE67D8DA097D38ED3ECEFF85E38A35EAE67D22396A16EB11DD5D88F56B5C45B166CBF2581754795EE67B827D3CC8F580FE7205EE007A7BA932FDD05341619CF33B3261EC871B2F6AD537069AE10E0FA2B6C1CB969C800D88510E50AB713621886D2B26B0A18361B38EAB1F0E085157CF007CF8E60CBA2BD059C3B76034677964D2A76C25927761031B795763148879731C69DFA4DBA8270308B5D1189AD0411C8CDD8D0813DB07373579D5DF4C2EC18A46420126EAF72A5386248A24BEAC4F57D44FB176326CC0BD2144D8804346124CC0D90B3186B3F186FC6F26C75C2B9D20AF90040D2ECB3C9952611E4C88A5AC1B588AA5BCB115630868C792CC9947C666B5617BB974EB4C5CA5A161887C9496B565E706137EE3B11E976D2DEC5BE53C4804D54E2A55A0CC6787B5EFD98218A9861FEB9C31E9EDCEA68F895C982F287B339FE46F35CB24D5E0B1E9AD40F227A868513C5C2CF8789A092E81F0EB70393271B4FD1F4044B57C31A1A17AC17B679247BEF9201B7FE10310F469C2818C6DD173130C25F85AF85E844EC08801C44CD06913AC75CAEB0EC58AB87B483DA2A26B88D402A65AC5A56F7F68600AD5600741E129184C5A78869AA06692A5772739E48D50CA51165E0ED5517244B7490D2B39020A86921C01438D3C13FADE9ADD490E771D9672A8E53763759421E9555AC30A928C8CA1A449C65F13FCA20B85762857D5F344EA4167DE2ADA9D89C4BC8CC450829365FB339168460C266C54A7C761225D12CF4C2947F452F4E6D4EE04EC52F0C21543CEB68AF1A6687B8913B06728B113B0621CB2573D25A61C66E65DB1DDC91BFD8A194348F59A4B7FC245716128B1A27A3C0E816A9E84530E25FF3E5C0B93480653202103681FB64B43C908DBEDBD171344BB515880AD281216B369AF8039B84D2EA36000799131742C6181927E93B0005BD199E4EC342C20A36028C9197158A0A4DF382C20ACED4C86761F165092319434BD88B040D91313FF8DAD682A4D3DD9D31C390219447586F2DF64EC194A185BFA6FF56B833B913DC1E30EB2E156BDF4B01DF0FA111E737DA6781E62306526A76100E19133762C3695E0F90DCD686BECAAD652B453DB4A4EC370523462FB8A79244533D28A9314ADA5C7FEAC8473E119FE9083989F2688777DAA41F6708D66944D8CF2D622B47BC35C43C87012F5228C73DDBD93327130BE84722B16A26B65CDE5CFF4164B1E21BE4073DF924A0D3B34803C1B8EA50925EC55B803C8343EF290C4396C415C8D473E6479725BDE3AF224BAC8184E3F7CC94D86AF5D644510C187AE5D0DB980CBC2E7E43E9BCF4E9B9B10EBB72E7099408E6920F4CD8602485485EAA6340D4836475704954FB5B6045AA6159B40C619E51AF0788515016C0C121D08EA8C94000E758AC808187B805006943D67674129FCAA23762578084F0CD264E465A9F6AD1048A54079BA40838A3E852A82CE1E1DD600FC0CB95878E2015C6ED04A502A80BA9A31BC6BA8470C615E972A470397BA944C00977F95C6022079B1B20E387F89B306119BD75D6D94F34844F5AC819B00D60225C3903C3841244F034FD663A31E22C34FD4B8B29F0D1AE3747431049CDF6D0006A76C89C1E01C280330325E6C330F34401453DF743CF8378144D0042F0799887BD54C0ED0884BF8A94E19A39A87404DC70D5B6CCAE16BCC6D03A03ADEB1758C38871A99CC67513D2D70D2E61401A5DD003360842DAC0049B932868035FA587A9F3E039E308635D61A7FE876463456996F9AE3BA947B66790F4EC31DB989C9B90EAD6FBE5120E3F0506E066C62C075F5FD2902665B5CB84275DBECCA15A2B79C49A5E0A9D9ED2A04F0ADEDDE9D8384D9CB5DDF2162A0AABEA28B8A6622F631AE858A792AC822DE89FD0CA78CE42F90D0705273E384B4C3F23B2724BCAC9C1F4376CAAF8A301DA9D67CD45F5F20E5A8E5CD0782DE9BDF7DC0F141ABE45AA11B4A9BCA5D48D98979E351303F776FC021A393F7DAB13158ED5AA0974E913E464C7E265B30308607B82906E88F7013FD1498990ADEEA4F6CDB806EC1BCEA1422F6E3787691C5F25E10B5442CC17EA6820D240041C7495FD3518F89840C69B765491B02D205491B2D182048D1D04169CB00329740C60069BE014FBA28DFC09E01A2EC82BE18C0ED6ACAB8A0DEFEE43B21DDFEB4E78774B3B337A6E0488C8C1582B37502AAE9D3752DBA4D1F8A6300D434BAE931159093745B9A3BC8932ECA1EB4678028E98F8042D1EC860D3876266180E000124F347D04C9BED3F4C921A63DA6CF4D67B7FEA8A4BFE2F3313CC9DC0919FB5E730762081032BFB945BFB9F31C82AEABCF7C50A44B4F7D10D40B874C0DA547F5C61D4B9031C06CD1931E5EB067C0408B9E38BB5EC6058B454F9D886FCF8F21173D2E355CC60FB325409A406ECF854197004196B28011BA5C66AA138A6C66A21BCD8E86821D8AFCE51E2442906A2B678599AE50A4E4B663C5401A83C91795B3411F3996E494B6EBFE30316159F2A39C0D163A539729D98E31436A4EED7BD13C9BAC52FDA8FE9926FB11FD14EEA32958689ADEC7A3A8F7FD8C595ABF60DBA48C35651F0E56FE03587BF8C3870358053D455378111C57106575C1176FB34196E1B625FE325B6D3C1F76E7F85F57F3D9D33A8AB38FF3873CDFBC3F38C84AD0D9621DFA69922577F9C24FD6075E901CBC3A3C7C77707474B0AE601CF8D41AC726B83598A036F6EE01538A1EA309C0599866F989977BB71E7AD5ED385873D5640972925DCC1A2B9B03C78F68BDA159B740BF9B9CBCE364BDF1E2F2E1C4054D010ED99EA1C0E48F24FDBECDA563506C990DEBDEA3F74E4A56004232E44D61E395EF455E2A78CBFB38898A752CCFA894B7DE3EE54DC2D87E358754E702937064F9C17228ABEA8116F48706451598C3C3AF3971E0C8EFE6D0C8E033094DB55F21877605F2228D718A19098E2A308777FA04FC02298DEA156D122253D402E649917AD5622E84BB2D36877D1C85700A9C6F9A675349C85CA12D5C7ECCC9EFE6D03EA5C90F24C6652A03098E2AB0E128D2CB024E369FCD619DAFE1BF2C89C96366942E1094B7832ED613E21A1623556634236DCF8C14F19D87F6E180D1A2AC263FE05439B3C0B26B83D1CAC1243EF7B77CF009D4F6EB88018C7E161488AE7AF58C04D17CB482B34CEF330E4EF5D162814BA1E950A6A5510B5CF3D51CD205B431603B5EB95205E6F090CD2D844715584CD76C79EBC54112037600C9028BC52E0D93EAB1766AA96BBE5A4C73E4800BD725BAC412A258E7694EDDEE4C7DF0FBD7FD69105D86808102D183E8477F3408F9F59B29B29819F1A6C879AD447CB6A0AF099F31C411DFFB34BFF7447A71F2C770225C59C3DDE55802A71F6116D8F6D656BD3B0F4DF4140209D3E4A9849D09209B10DA9FE4895FFBB3973C1D807E448E38F94DB917F203E125ACE3FAB1DDFA5552C99B8794BC8428D17B1D96E67F1FA2A219D6F30CFDFE7AF74F76E34B77E99F4733B2EE1401BFB4DAAEA82E14DBCBB20A9DAAA06A50F75F03715A4348F8B04AA3E5FAD2ECFFF4BEB0B4184869CB7E344D77FD0047791379CF3C20AAC0C6B7AD762E39CFB6F96C411B7DA10E459DFAAE1D0D4CA12EA34BECA203D58E9C2FD192E21A6D3088996172D1871CFACBD2EE6D958AE64C8A33CD42E069A35E94CDFBD1311536817410DFADA1712E3EF9DDC286A60FF170B6345F6C0B5B0CB20D24D4B7B3228A78552B2A7F819189EAB3FE289DDBB9C65CA0D176CEE9C0F4E4231202AC126E4BAB01FC10B805DBAFE690BEA6E13D3410230138A6C8269A5DFD158415A9127B88F21928AEF162E72071447298A56E25BC64CA66B51342E867D2B9DE471EC7EEB97B33F0F42907318AB3F3DBC64CD13EED74F7BB537F05BC8CDD90A8BFED7F2ED04E95D690DB72628CAD55D8AEB6E870B71446679BC5CECDEEC40B594A07DF6E53A075269FA3DB7A73EDABE9445C5EEB050AFAF68EBBFEA45A74579EBD341B4179F97B3ECE63BA3E6BB2545FACA2C261E6DD4682B070F37D8A31CB214E31E6171063A6EFF61C54975E73A72E4A9C2DF4A918D2BEEBD49A7A5E25D22516C71FF07124EAE403FE660EE5AF8049DA2C3F0C6B3B4DBAE505E816FA46CDFE740B772BA7BD52D183E869AF9CC02BB0B1B8528BF59E8B6FD986B550FD7A487848DB92367B4E32D7BF1BD4659681F56DF4FC1F8517A1892B38B9A5ADBC0BFF6E051E019F2BBFFD6A1B3A63C2B9CD47AB634651118040088F2BB45F3D33F1F269176A9E74ACEACAF361F42D775F6F37DDAB07B7EF569D9B83ACFDAD0B930E9EB489549B88DF35E84F9308DF47B0D7206660F65D73D4EF8552DB70923744E550585EB01045E5BB89724D334E301C43CE3607336D7CB3ECD2438F6DB190B65F2DA42D0958B94DF857D35410A63CE729063DE940EA4E391BEDD7F204D725FBD8519B435C1C90F16942815F61AD6FFE48215A5EDF349F7FD699E074DD4646A081BCEDAFCC5A5BB6DCC930310BF6EA3CA9DD9822D11BF5985AC739B83115B36014C7FDFAF68B5BFAC143FABD27A009D4B1A61C516013F14AD75E14FE43143062CBC6B95ABAB7F657E8255F9F5D7CEBAF767EC39D574439EF37E0CF930F228738F920FB6479B5D4E8D5F5B4FDAEF72D34BAB8595F7BD1B5964558555A785BDE06FAE9DA0B23E1B913591D732CCB227F807CAC779304F930E21A76760FCF9B361C71B736C939DA968FDD57BB5591C61C90E6A34DBC2ECBE00CE2E275F5574B2E412BF42E845286069F0FE049AAD8537B053290F3F005C516AB40E27F4F8AFC340E4EBC1C7CCB99855F506C316F7C1F4AC819EC3D0804171E0A8A6D2C82863461B62D5B6AC1ED87240617C5FA165D8F4EF1992CB0A1946888C580A7575CC726DBC32F505E07B4D3D61B36E5832AB2A1FCFA4772E6F970F99070992FB7814E4E0C1E365B6A0379E9E7E1237BB55EF375B23BE51027BBF385D89DD2670E5D1A9F25929616A8A4EDBE07B8DDA4E2949D17DC0DB2FD6C094B901F4D7E9F2690F504923E0FE8720295485A4E2049DB9F6302959D87DF1EC380B5D398220BCB0FB7E1CE2A50057B25A47DC78C6B1C2D45749C39536E24D44DE6D5A48E01F174647F82DE7EB36CB45BF58E928A3B0775A6A35DD334278478A8035E3CB696470D4C01EDBB3E988E8D4D47165C1E1B9B745A3311FBD763ADF5D69E3F0220D779BE20E9812A18D286394EE2180E10DAFCCB532EE3882F9D82D95330DB40AA260D5AB9244BDF471B847D473A309A96C10E69EB7D37FCDC38826548328CBF8B20D5DF779111E13E8F6152A493221DA9222D63E3CD13E203EC6D605C5DB638A420F65DAFBA3653DDE969F4EB6B2AD78CB23A369B9263B80ADAF505D85720E3129EEB6F4368AB1D6A96A1C2762CAE96413B3330FBAE61DC6804410053481B5BC322A8947B399BB5597D7AE1B362C893F8227C2D67C6F84FE4BB9919D3BD17A3B270FF066E1F92E4FBE923E8375640E26931C3D4CDFB995918276F385105436EE9B8975877DAC3B987DFCA1BDFED2C5A813818C053E4B1B59F514A20BDCEAB722EB390D8326BA8D4C57562E06C152B5F65034D75C0792BF8AB3D2464D215197F404554BE4B3DD17F346B342F1E08A46888C9DEFD7E476348FB6EA8E28E7C4B43E1FC2EBF5B1D034A011380A8BFED62CF11F72213F6CD2AF0F327F002749A9602D47C9C0C65C1B4AF0B8F9338F7C218A46C95063BFED2FCCFEA0F68DA79F700EA421065DB762BFF01ACBDB2FFD9C6F341754BD95998663932036F3DA8ECCB2AF3599D3B0DE5F039834BF3025558ACFE1E5511BB6D852FD093BA03597E9D7C07F1C7F9ABC3A357F3D9320ABD0C897074379F3DADA3387BEF17599EACBD384EF272B83ECE1FF27CF3FEE0202B31668B75E8A74996DCE50B3F591F7841720061BD3E383A3A00C1FA806D8EC11A41397C5743C9B22022750DA123B1542C8B20CC3F27F7F3198BF13D7E4DE72C8C7290DED4156FBE78CF7F7A8FA05222CDB3558DEEA45A65F4DF137017C682F7B83FFC153CB312554BEF15B89BC954DF8703B6E10781FA44BDFD38BF45AF5FC2712C35F41F008A99072DE44B0FDA61698C2A82B223F3D9451145E894E0C7F99D17F116068B61AB4C2B3C25128E97E771009E3ECEFF6B769E1D47B010A420783F3B43087E81DFA053FEF702E00FB3FF4D1291A77C8A294B433D71E99EDAC15881F431F471265905287EF452FFC14BE7B32FDED36710DFE70F50E0DFFE6A0BFA0BC81F92A00FC8C4DB732AC84787AFDED882BE027991C638C39786FD4F6BEFE99F6DE19D3E01BFD8EAED0A620065302FFF5B4A5D03EDA448B17E20C4CF1218B7CFA160E5AFD68C24B73C5463F4EA775BC8D4EE8702F45BA4A26D47CB071B92AF62893D3C3CB4852C7AAEB2CBBC153FAF291406A3D12A35571524E9D473D22450AE409F3CFFFB7D9A1471F097E496378EC7BC36C00E55A724CD85D314EE32BDE7262AA797CC16B0F4195F6B5041CBD65E14695631D4F2FDECFC7FDC5CA66182126E6F6A283717E029877F9096FB65F6358516D3FBD92B7A4933228B80C36B4B6794BD6E4119F2BAA594594EDE6C79EBC54112034216CD384F3415F6ECA845CF6A9ED5B4E461FCEC5612DA50453B3C1D174EC6D531D7BCC6FA8C7B5B566759B30DC66A61F7A2421BAE880D0813C12421DCD44B64239187A4FD7D0D871D49286595DA2FF1F1A6C8458ABF95E178D95C13E9045C1FFE8A39B78F44DCEE65DA61CBDD72EE95ADA609C81F7B746269EC81AB2C7A22D8889A46C279085B5DA25DDD8CC5F90C2E53450A9A9B6135724C577724C03AA4F850CC4E7057E07B41FD62DC8F7D986FB67E7F7B9DA4F44F4764680A8211DBC36776AAAA6928D350461A93BE87BAD3501AAB3F4CB9A90ABA5925777995F4309E69DFCB9CD7CEB7D7F6E106EA8E66E3D8A011682255C5C8FDB5D651661DA48FB07499AB74B24CB7E880787BDF154C37FDDD0F9D69AE57AA9DC6072FBED73B0764E5C9B66086AAE48A9B51AF4011FE721377B2DD1521060CDA843C174CD64C1646A7D8D5F66A8316918BADF49E41ACA5435DC3A343AB840E7E63BD8BC263E98DD82386D8A377D61B33C3DBB496BAA5A6D74AC7D08D265D239FD69DE774C7097D017EE8BD8F161B8E5F53D41D2FEA0578FD576BC1BDB3DF81C77FD5FAE385CFF966B5B0322960FD69A60FB6A33FD62407B5816DA0FCEAD9734342EAB4357BFA9483186D4888D2045A6D4A384E62709D637105BC4C940A62C3FD0A86D46E6B91FCD4F34E8E8CF22357F96936DCAB20C8A4B6B302B7DEB315371BAB3AEFD16A73E05334FE04BFF332C8766EF72DA316FDD06C94EE2CFEDFAD57AF7ADBFE154F48B34D6045DB6946F7B3152C8B8BB44BAD158E5FDB69DA697F7754CECB72B3897068F93374480ACF205E216833D08EAF08F3B4EDF3D2B77AFBDC7BF235E9DD2DBCB5F30C128CDF982236B4A65DB169576C8F77C504AAF51A3CE9A359927663359A5E721E4E3D3EBD28E9FA2551C760CB776C54493E74CC64681B765244CE1591FAAAB3217440514EB3B09CEA6810EC3788B807088CF75BCC5665573157FA4502B7C1F6EDC06AA1B708C86CA14B1E24E8A333A23DFC4E3B67DBB70ABA253D54D3517F18CCF0D8635404D523D7AE60D6AB9F1B68235668DC25203AF34AD578AC365667FDBA0FC654EBFD0C7671B8A115659331C3EE77BC6993A9A05D887A2498CDF4B1578FBA25A447E2F9BDB9F12E513DB2E975E7311E993267AFD12C9F8DD4297151A38122A642D4630C99BE64C7BC7E6B5398EC60D40BD1EDAE32E91F51F871E4CAC17A76EE48294C0A61CF14C2A59782B85DEE7ADDB4CB71AFEADE4B95A7FBB6B74D9C3641C2FD5056D35E49EBFE8E4CCF5F36D731989ECDE65A0CA4E99165B12BDC6800FAC23DAD36FBBE697F9EFD91C29E75DB04DF0FBD6064B01B2CCD55AB2E0B73EBA013E3B68FE508B891773DA0373D5AEFB917DD75029A70B493B8FE4592AEBD28FC87417CACC509F65168DA7D3B998FEEC10FFDAE794C775EF9ACD88B4E8632B935886CDF49178FDE3D30E0160FA4934B3B982561D035AABD79AF8C974D04D8C83C1FD01318E5B2D997D5BF5DE9B6CF043B4E72DAA2A0DFC5748C6659E40F880978875A9F04667FAEB23716ED8345D0EBE0F46113AC8A34EE01ECA597655015A8136CDAF8A125838F93F82E84F3010DA836B8F9DA3EE5BBA6FE0A6420EF03C1E7C4FF9E14F9691C9C400DF42DF7BB2ED14BDF87127706790302EAEAE7769B450D7D9DF3DE2F1F92185C14EB5BA0F6325F5B6F909F67046C2C11DD685D01BF40E95BD04A5E6FDC1F23B8FE919C793E5C7A1CB0F53C2327425758F5EB3A93453F59F493453F90457F1C79E1DAC8D62E6B4E91F6FDB3F67A8ADF9A8938120A84D8C6CC34BBF7040276F748CE7EC4FCAD66E6E70402349A9965CD69664E339336EE21B64BFCB69C7307A806DCFD2495D59C30DABAA92B4E33629A116E132247B68A98E6914C591483CD17D11554E80B27DFB6F7D9389C6A4AC2AC2FDA310D2076254C78AFD120677AF7D77D7ED13672250DDCC15EB3F73DD86663D57D2FE2D4DB74B2194C279B873CD93C4A4D67A8D946B925DECF3D913B7DDDA61C0DBF970C2A2DCC361EFD7112C7C02FF7DBF3B4F41A54085ABC7B3D6DF04C1B3CD306CFE01B3C4BDFAF76E20DA266B8EE28979041A3002E3C714B3ACA407F187FEFEAE5B5497CEA33E7C8F0F2C37D57FB3F9BE2DE57ADEB76FB6D09B5C77A63A63CC906630D278C34945A8982E05670C766BB698CB26A7F53ABDAAF29A91C6FAE405644B9F4469B76B9AC1D36550477C4B78B36F37D1D88850EDEBC18EB2B2E3D3E6C5331998BB5F43282AF87BDC7C36A25B00E318B1A8D7545781101E6AE0A121D5803E2678EDA3CF526D88270C7EF9256DB8897BE9F6D9E73EAFCC2949E2CBDDEB09AEAD677ED881A0D78FE69BA7367949AC7B223D33D5CFBE014FE0DDC3E24C9F7D34760104D232B0FA40F289463D4039D973ECC019199DDEE2276671BC74E457D1FF4DA7E6890F66134DB59BF0271601A0CE29BFCB4C63FA99354600D6C411A54A744D07A80C89BAFDDF5197AB69B24CEDCE48DD5C090095C64E421D05D4761FB083BEFF19366229919E73B120E36B43033BEA5A19B757605FC14E46E60B94833C0FD73F3B0C09FC0839AEA6778A4609965891F9604D60BB4F0E94BEE515C9ACCD33898A15C7DBE794DE40A44770BBEF04B11E5217A380AD2F6717E3467A7E2D7B8325A66CB32CF0572C0CB7C2FE01905FB1798D244E5080B09C33568EAFE85430A150440B7AC861E3A509DE5A9070782D72661EC871B2F9271886960A880509F1BD06CC909D840530652A6E4800962D14B9A3C210D3E6650740CFA704008A05A2E7186D7199C00450AEAF30FF8AB541CEB7272B09B6FF4F01E2E163DC91F4D33450B5BD48BC40999D48FA031FD31C148E4FCED46B04AC578FCE0C5F7E0A626AFFA9BC9E58A68440B175530887AAB50D2940B68622BF4236A64F707903761D78CA48E20742F440F4E991BF2BF99ECADB63618277E65D9801268391B7A9038D4E3C184AEA5B0411A772C6FEC923E6EE34EDC278114EAE81BB17927E9E0B8EC3B611F2AEFC3A47F7D88C4A022CB7B25CA7A3D2AD3FD1161733F45DC7E67D2CCEDF21E3F845100814B8596DFC72624812F14F82EAC04C861239856F01D8917876600C112F6DD04EFF6ED959D485079576A79A58EDC12ACEE7725C6B1FA308812236EA26208C05F7B91A0B2830348CDB61F26C8EA78DC0E05651B18EC262D1A4D829A70DA43046784E36DAC199828ECEE469D38DE308D7ADFA3CE9C25D9DDA8B3273DA6A1EF7BE845676B7638FEE8D4CAFE1A05F8123C8600FC75F43253F5631C46C165F3E8564769E96F6BE4927F418DA045503A6A01E2FB330E4142D4EFAFC2A96E1864F0571F472D2D4D37C6212458A45DA81AB93922D2122F43378C462394F7740EE56F7273FB05CC6BE339BD0F7E6639DA43F9993FF568EF837F598EF6A0FEE54F3DE47BE35796E36EE22E180DD74B77178CC77727EE427D67F24E04095F68379479505FB34740A93F8D5A83E04E8CC548C0A33E9499308DFA5E180B78D45DA7E0EECFB80F98376B31F4BBCE97C5C33EA89538CDF8FDB115056725A973D6B231A40F63132349170C1236141D11E529A28A7B913339E3FA913741C74CB0B2674207903B9C329BC4396C01D2DAD849027016A6598E8E79DF7A19E0A40DB582D632AEBF2CA0B2FC9C4047E0B439FE84C7785BB4F21FC0DAFB380F6ED17D4CD509AAE5EDA6AE9009F4128DE593E77FBF4F93220EFE92DC56D70D71E804752478A99A7AE47C0E23879BAF2241CD56B4C78E9313B524E07A867494B5F5C4B08769382AD80A12F4B89A1E6163C670989A12090A5C6E8082CAA0E7F150C53264D4B102338CEC69110966B69A9202F6708D4DDFCBC30CCAEE97350C3800EB99A236985BB28A4A42ECE7993215D89028F59C53B4D193B7DCA095B154E29F218F0B4F2832C25A1272EA0AAD705F832791B4486B6A684095F474F077CE7104F0552498C98A7698B9D3EE6A2AF8EA0614918DF4D4B109B855C490A34A5C4D428DA8B23D2506541853A0C72E884E72E8057524F8C960AD0EB384E34A0E9B71B472E538C8D56709645468061927120BC1E332050E9C3B6D820827270911E13205229C8F6582483212DB22051AB31191CB964EA29AFD7B1D0AD92B4E1C46594509017C75535AA4B835B8CC06ADB98E5F386E4DA962E8701D0B616CDC4EB94C365574A2892B9A613718567135051576432ABED4514885B1B61655D653420726380AE8620966B29231462AF020C34B55526327AA9AD3A03724A43535D428CD07221EA07133F973AB33A2B1CAF1D49C78A54245321F0012272AE44223DA6B4814E0700D36B045B3C8807DEABB33045CB3B86C431CEB273AD57C53B046ECB997CDD9A2EECC207C41EEBE07112F54F515AC1038EE153FA8020553548E380189ADE09441FCAD041A0E69AE3190B288F0EF392E95655A4659B2BA3563F4C7E7A52CB23C79DF931E52C73608C6E9A03A63A1F294B73137CDCF8AF7C30E03A8BCCA57D6EBCC6EF9316401570DCF2C53DD94196A65DFF84205C3C467942DA0B5600F79C656C010E9115CC1FE264168F541D155CEB76D9AE1AF8E3A4624E1487B274BD471D0456E0445ADDA768ECC3591754E9A8FB2EF9DE3F6D6653D546FC2EF7D3771E044D639C13937075DA2823D4D33FCD54DC7A8E09CA477D26CCB8E5D948619CBE68252375DC6D12949670507881C8C24194D6B5A551FDD746A1B1293F44B7CE6A563D744E3E66EB4B8E31B82BEA98F7874EC1E376A8E468C3BA920EB585FCB42AF1D3359120CB2F7F7B98B1AADA9CE51B72773C75A5390292DE8B42E9FBAE378D2E1F3B24DFDC95507353352973ABCFF1D5484D15419B24EE2660374CF44F118A584EEF148EA521A055DB6CA82A43A22DA5528BB4317285821DF2520E150C5C62CAA2F0A6F32EF9AB20F0755581F7F807FA146F2EE011C711065E5D70F0757458C2E36AFFE9D802CBCDF82F8B07DAF7E0BB4AE83360EEA482643515D85B90BFD0BC8BDC0CBBD659A87779E9FC3621F40258DB473193F410F1CDF82E03CFE5AE49B22875D06EBDBE89964064A5C54E1FF70C0D1FCE16BB571E1A20B90CC10DD05FF35FE548451D0D07D2678134D02026544E207B8D058E6E821AEFBE706D245121B02C2EC6B1239AFA1E0441058F6355E79E86E7E7BDAE09CFE0CEE3D1F85A81FC3004D701910FD40D06CFF70127AF7A9B7CE308C6D7BF817CA70B07EFAB7FF0FF0B4937F3BAC0200, N'6.4.0')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202009281416152_Upgraded_To_ABP_5_13_0', N'DoAn', 0x1F8B0800000000000400ED7DD972DCBA92E0FB44CC3F54D45377C7692D5ECE3976D8DD51D6728EEEB565B54AEE3B312F0A8A84248E59645D2EB2743BE6CBE6613E697E6100AED81712649165BE55114066229199482412C0FFFB3FFFF7C3BF3F6F82C51388133F0A3F2E8F0F8E960B10BA91E7870F1F97597AFFAFBF2FFFFDDFFEFB7FFB70E66D9E17FF59D57B8DEAC19661F271F998A6DBF7878789FB08364E72B0F1DD384AA2FBF4C08D36878E171DBE3A3A7A77787C7C0820882584B5587CB8CEC2D4DF80FC0FFC7B12852ED8A699137C893C1024E57758B2CEA12E2E9D0D48B68E0B3E2E5777DB9368B375C217F4F100FEBD8AA3FF05DC34FF7B06E1A62FE731FCFD238ABF2F17ABC07720916B10DC2F174E1846A993C22EBCFF9680751A47E1C37A0B3F38C1CDCB16C07AF74E9080B26BEF9BEABABD3C7A857A79D834AC40B95992461B4380C7AF4BB61DD2CD5B317F59B31532B66014EA75CE5CC8D7CCF3D3CFD1C37241237B7F12C4A862CEFB83BC1E948E83AAC12F0BF4F97F82383A8003B389C25F6A39797B700C25E5E0E897C54916A4590C3E86204B6327F8657195DD05BEFB57F072137D07E1C7300B029C3E48212C233EC04F70A4B7204E5FAEC17D49F585B75C1C92ED0EE9867533AC4DD19F8B30FDF5CD727109913B7701A8871FEBFB3A8D62F0070841ECA4C0BB72D214C4218201720632D8295C372074C294C0F8FA95AA1194CD982152DE640DE227DF05E84FD50E8A371CA6E5E28BF3FC19840FE9E3C7E5ABB7BF2E17E7FE33F0AA2F6587BF853ED479D8288D33A0C2F505A48F913708AA2B07693264792241757CF4EA8D055CD7004A68F89F4E90C9FA057F5AC075F60CDC0CC9D78DDF70F1144A58F19F11484D68A7595C9A0742DA0CC19D043E14EE8BEDCAF36290C838FFAB0DBE17E814E274FCEA770BA83EC5D10FA45BE17D24C1F5F6F895952146531A36183C25393A3AB280EA6203FF2551E8405BD5C276E0CD5BD9AB937CC280E2EBD8EEEB87C3669E92CE5E9F1CF7FB431C65A1F797E8AE185FF9344634480E98F6F9AC36CF640D2EC81784CA82DE189A238878153FC8278037BFBFFD4D6FBE31447E13BF9C40A948313E1FFF6A0CE5123CA710921563FFD949C4B0148A9EACEE9CD08B4250CBCDA7280A80131A537115FB519C4B4D392AD0BF2695A8A9613AFDC4C0B13635E6C034ACA2B6A1397D091DE86517DF2B642A63C36BE48384FBFD657A9687EB63D8B33CE59A0E2250FA9C3666D37250AAAFEA9EDA58015C3A4FFE43CE2D3935CBC53508F27AC9A3BF2DF58E2B46B74CCBF338DA5C47814888E906B7EB288B5DC4EFC8A4D58D133F80B49B7659D2AB59A304B8AABF83E8D345B8CD5285EB6067557505E28D9F24729FDB0E2ABB5A9D2F3A13996E133535545B5ABFD6514AB3E58D2A736043B1CB55B615EDCE61CD2A4EE1B215C7E865B6B33CE3DA983CED2A9860EAD4D34A7B7EA90D35E3409C956D1CCA560C4DD3D1DE663BAE288CC331A61762BAEE31A182341085A72C69ABE734CB0074B20267686F260ACFE1A217EAE11AA4692E108A1D9DED162A695E7050B64C0EB890EC6DF52C3E3909C0420714C572B12F48B3374D9400B9C2C3E5C36DDDA291146945462CE4B56DC880C9A8974DEA519FF6965ECFC65EB1687ADD4B10F4D44FB681A35AB069EEC718E2BE484E4100D2EE41C3024C9B2D8ABCA53026A80E987E893CFFBE94F66E305A913FEE9066F1E1E4D1091F94CE6251F74F1FD6895F0EF096D3730A7BDE3029D86267C80B50780C259F9B30F61785AD1CC802009C83D4DCE9EC8FBEB1B18DDB48B04650F8F89D8DDDDC8ECE6AF5B760353FD2830FC62DD300733424F5583F4356B99B9B41B8ADEDAD070961B6221215EDAA9F97E0876AA56A27F7E16BEC3FF8A1130C834D339AFDCE4A4252F9776CC6A7D564BF46CADF76BE878D6765DD617ED1FE666959F596CF9E531022F154A427D90994754EA5EA98CA750D9C449E7166252DB3B7AC56718806B33C6AF709DAA65BAA05DF7F622A4A1D28B676270FCA4294AEB7F0DCEA2E81A56E5ACAC31EDAEA56326CC9FE19DA30951BA59D5AB9579958C5009A29D11728FC7EDED07D39E001182CC24DF6993D8DD168FB67686A3247BDB8FA1CB94EE0FFA3B0109CF67350773FACC14E43C1AED4BBB0E3FF5D24B08B88A8CE01E73972BDDF916B8E95BB01CFCA45ADCA522218D3B69663F49D2AEEEEC66AD67EFDC078E1B059588E5976187FFDEDF8E8F7DFFB992266A3A5305A97515A3347E7A4125E3F39A05B4F2C06F747E67BE6716BACCF7682BCA6D3BF3C766472FE488D08A151F4D2D209C55A3215E8ECE48137E85649023677C1CB7F64701A863AAE3A4B6CB3BBD2DD492B5B046BF00498A351B80837150CC5B0B041D29370AF8F8F7EB3747A35C83CE00D88B2722A0641369D29629DDD256EEC6FBB4F1734A49F61EAB017A9DEF99C351BF31D18F371DB89AFF18313960B59D8AD146D59A8EC03DE2639E0419897BEB60D0AE26AD774797AA4BA1A286BB1B169A94837F59855C3B66A5C3931085961564809B4DF32CBFF767771F79EC24873247B924121594AC3C9A31F7850F8B9D90CB4E1B96D6A37990CC24A4C1683B8262F83414675A1AF7DD04C1F4A56F7AED58470551F12D74DBCC8D2C728AEB60B98E673D2C57E6EB35E247FC490D67DF78F90AE755409042239E002EA2F9D82A5D9B207AECD4134161D39884024075C40A3E1A07950C44806150C935CF92A12C69C73927627D09235CC3C469C1CB5F7DE7306CC29A88383B2E88D9D1B0B2FA37883B6E095D1A27E4E53F6310DEDE3B9CF35122DD74616CEBD03D56A4EE79917416218DC350532E4B744A56629419731AB1EA682E962079313317544258A3AAC8C4F1D5EC1943A5A16C424B235293AE90A7C62995AC68BC7DAE5E0E7F0E758884A149D58199F44BC42A7E4FC824D767C92C6BDDB379FA4E7E562E32620E62937B67AC9FD686838DB387EA03E6ED5131D48A410D7CABD5C553A9B95435FBBE37A2B0F6DB703B4131F6D9DC5E12EF05E3949F2238A65FBAF3DC565F2413E89C27B1FEA255205C566C06B2B39E9557FAF4102D241307E8EDCEF51969E851E72D0BEA5AEA9ABB8725DA807E7905BC0A3EFB06EB1FF7891D41459C9CDBF7A8C4270996DEED03CDB7555A5221D43568A4EF70EAC819BA1342EB848DA6C07381471F3233A775C38A15A1A808B0457251BF0566EEA3F81799537AFF2681881E36FF82E7FBE8EA8CA1B6F1FFBCC38FA7899E90A44B5DE2C60F3D79B749980B01ED79B3950C17A932EE353D7FB7A33872C5B6F722BF089EDBCDEFC1C3DF882A56681A02CA7A9CB3F0B682ACA6CAF7C73D882952F5DC6274CB5F295519707CDC57495C51445F9573E2D45912915E536848490A606454B55C027A72EED1C11C8AD4EDBBD9DBCF19C4134C66CDD7C6810000BCB460D4CC33C3236EE8D67042937A66DD5296F3CABD318D5291F1AF8EDC9F7A4ABBB9E420415E601CE5E1A89BB4E7AB648DAE7C4ECB10ABB8DE4EE719B6ACD9C963C92F0503E4179603D7F65965989CC760A4DEFE814BA1D2FE7678DB718DE93D4EDD4391FC67C8050A46FF381F5F9C0FA64CE38F677607D0A86B17D9207E732B97DCBEFE8FB654FC14B2E1A26D9DD4D4EA402694F0B5AE859875084902A963825A6FD958DCC8F7933EFA7762EBB6CA1159650B489C69632317B4E15DB1B69250AC1561A5B2AA2B1CB769AECD5A9123CE79929B2444497EC21A9CE5B7C250ED9269FA08A885CAD8D3EA350DBCA758B949776D1B6B2F91CBC1863C02D0FFEFBE17743436A319971D034C47982DDC309D67C9B6C05D573B36D6DD17018B359B36DD6AC2E49AC877F2BCBF7351ED434EDEF0B2543BEF3720D12ECE85CEE8041EDCDD5B9282AD216868BCC1899AE6E61671E8439E86C62185A212658DEAD27E804292084971ED3B2C648E5D7F4FA28D1F43B5F24358595C57CC75A2B45F91BB87B8CA2EF674F40BDE22EEB260778A39FC1A697FD55F827BA7BE276F70347986FD8EEF534AB8B61ADE5A8A992AC41E8692EE56855C19AFE440A931B083BA0880B90BB4184AEF7167AA8FDA7B75488909B9425C4C943E44DFD99A65BBC68400DB511BAE9F8AC3239F17042D5ACE6DC926D9A90B5A22A13BA56D5EF14C2E609ACC6EA89B118F38DDF7A1347C9AF6FB13FFCDCBC066E0CD2E1F1DADAE2AD84AE7753F827703C28B9D3F263BA3BDBD906330C9F1CF7FB431C65A1F797E8EE2AF6A3222FE722390F9C87A4A6496E260820C9011766375301190E872A788103540AD74B4A5F68F905A0E3D8D56412FD582EF284D18FCBB70C4F89AA9F4010FD286EE5A89B1C1FC9DBD0D515285677D113A0DABC52A0F8D37F786C2ABF6547B71847C9D8E24FCB16413DB361CDE71D389C59523C86EB83E4808639F0B0E6D28FDCF1922F0A1E7EDB7A44F56379F5DAD9AFB8DE82E9FC3C3733C64B9EDC28210ECCF6C257D0E3F93ACBEF89D0E5F9DF9C3814319CAE7B16C7515C577E2DAF7C0E97A88DB671ACA37228796171B38124A3772C3C8B97719A0EA9E1305D844F4EE07BA29D1FBDF12B813477BDE88D643ED725500D2AFF823FA6026CC4569ADE8C50BA7C1C94BFAA29CD1993B7C56EC2289BFFA6681E7E0FA31F217A623E0E9DA03CCD58B6FD5DDE165DA602BCAF595A3778A7A615BBC64440313D116A298E2024DFC50872415AB68285672F1D1F38FD684F3ED778DDE3166CA4D7E2FAFC5BBF247005797009526A41FFCBA2286A98F6463767F8EEB7DF9CB7EEDB5F8FDFBD7E038E7E7FD7827F50BC523FCC00265DAAC9E4879FBA8F1003F482D3C88D02CC601D294CD6D7BF62BE96020FED57BC52014797216DC9160AE3771985E5748046EB09A039B5BC710A03A230859711E2611E69A89B28CC6079C314DD4A6102AF9C38F59D806DA7B080790EFB3600278F91EF8266B45EAB4660B5B9F31FB2283368F2053AD5DE15804C0C218DC10BD652317A794BFDEAE7682D8355578CF435F0FC18B8A97E8B35005FD34780F9362A41A8707C0150A43CFD76D08696A94D7823850841E30BF5EF1967B0427CBE855942605088CD0DD86CA3D8895F38BC534C9A558BBF02B08546ED4EBFE527C7BB067FCF40D2607BA392B96FA153FA7458F7DEA804E8CA79D9401145D820AD784385609C47F19DEF7920C49AA8479894D737AAE12D6408393B015C0913E42986397790902144010CAC9962B4736122EF9FE4B04639EEF9D0A1204A94E123A87094908F03E735BC85C253FA033A494D6D5568A08814B1FD3956C90814E2282CF2AC8B4BF6B0B64A8B93F3A28CF844D167142BC69A2B8D49DEFC5BECA3B6110A82D54D55A6214CB22D545D38157E818AE814ABA4BAB5427E4AC4C0BB46F104284D6B280CC9BD4F8AD3B1429CCE9EB750FF1D2EE3541EF7F621763CC08ED62B054EE8EBE43EFA1AC470454E2E4CDFAA8C08ECE8C5064E92C8266048DFAACC0834587F4037E587F382B5514E2DF1139C89A1DD7A82BC2118FB56654A4A64B48ABD551914E47396FE251AD34A4030005AE1AC559244AE9F8F6B15A079099D8DEF5621D11CDC2DF5917240CF426F516CB0E834BEA5EEC1457B3EBC76CB45E9E8F82ED4B88FCB7F61186288B77EAC48889746794C7614A2FC1A1601ACC52A3FDA054D9D93B80E67170F72DB23BF5C837B80DE612A5C3EF46A901FA6EC768C1FBAFED6095A748C82A5B9B98368ADB1D225A7600B429401D4627C75C8A19AF2A9AB89A038AC62E887434CBAB584BE30EE75470CA55EDE5A22F664C31672AFC03C61C1D7EBD97092AF37C693177D42B129F134924509206D85683B1BE853225610B96A8E544D34BABA2B8DD1900703E52101EC4C85CA939BE7C041D1BDF212A5FA20A8484AA5AD78CAC16D60A217728C1C25A8CFB28E4DECB57A32808C6B8DA10E1DD8AD0ABB11616CCFF9B622AFF89B882558D2882BC058FD5E654A93449EC41316854F2AAB62ED6458837B4388B00687B4241883330A3186DA788BFFD79363A6954A90D74882069765964CA1300F26C442D60D2CC542DE988A3104B43349163FCC2C120F8D97A51BD160CF4891E2717470C006CA747071C45085CB92282AFB3F80182AF9A24343F15CF7CE240F7FDD4134FEDCA71EC8F382031945DEC3121425E505F0BD081D8711038819A7D33A58AB84D61D8A1576C1907C4479770DC9054CB6F211BEF2A180C935831D0485A56030696119AA839A4A85DE9DE4E0D73E4947997B035447C9E15D1935ACE47028184A72380CD50AD19077D3EC4E72983BAFA4432DBEFEAAA30C09EFCB1A569044640C254D22FEEAE0E75D1AB443B92A1E22920F3AF52AD1EE5C24EA0D248A92320DB63F178964C460C246747A1A2ED215F6A0947444AF78AF4BED4EC0AE386F5951E43455B483D7ED258EC39EA1C48EC38A69C85EF168987498A917C476276FE47B651421C5AB2DFD0917C185A1C48AE8F13404AA7EFC4D3A94EC4B702D5C22114C8E840C607DE82E0D252374B7472F268876ADB0005D91272C7A6A2F8139B84F2EA26000791131742A61819C7E9DB0005DD19AE4EC342C20A26028C999705820A75F3B2CC0AD6D4D86761F169092319434ED455820EF89CEFA8DAEA82B4D3DF9D30C391C194475865ABF89D8339430B65CBF558F0AEE44F6382F3888865BF69C4333E0D54B3BFAF64CF206C460C64C4CC300C22366EC547C2ACE1B1B8AD156F855ADA568A7BE959886E1A468C2FE15F5128A62A42519AFADA5C73CA7D5BAF00C9F8CCAE7A70EE25D679F8A5EA7518CB28E53DE5A8476EF982B08194EA2F6C239575D2B291207ED3B261BB1E05D1BAB2F7FBA9754B208CBFB31C796ACAFD9A101E459732C7528A16FBA1D40A6CBD4D4284C610BECDE3BFCB5CAD3BBFC3A9167DE45C550FDCADB6B92F252455A04117CB8B4AB2067705AF81C3D24CBC5597DCF61F59C4559C691631208796F21071251A1B8044D019277F8C7073CD882435C7AF07520B784591C83D2805B1E7D6BC110250A4E6D25A2D24FE041ADDD2A150822239F0387C859D702461F571101A54F7518500ABFAA885D73DEECA34192E7847810E9C35D0A809F21E6CCE1777AB5457340AEFA55356D7837D08268C2BCC98D8D022E71D118072EFBE48C0140FCC6641570F6766605223AA3BBD8226791F0EA1903D701AC048A072059709C189E029EA8C75A3D442E1FAF71E1396B342E13D1F910CACC6E0D3065B2161F4C99FDA40146C48B26E7400144A2FABAE3C1BEF7C383C679154847DC8B6662805A5C2A5FE21431AA7EE75377DC4A5F4D3A7CB5A3AD0154C53BBA8E16E750231D7DE6D55302C7BD4D1E507201A0070CF382252089458C2660853D165E944F81C7DC60B923C55CD4B1C09A4A1C2BF9051FC4A2CCE8629B9A2F42BF8F592DB4BCCA4688C967B110EB0AD8449FD9A4FB64C06D45432513E4ED25FC66D7066A8E2B90ED92E5B2EB3874B9AF7DA5879A373A977A28C6C44013F4718B8748250F2D064A7EE90367540C6E8920D8A0774F04D667669521E1B1DE951018F06609D89D83D8EA89B97380C740597D491725CD78ECA356A832E6C920F378C75FAE5A65247BEA5DC149C531796187C507E505BC2CD6D09AEC149F6FD71DA9167C149FB9E6F050F38036D143F5116DAC771C6752C23CF5896C13D02D98579C322C576B2CBBF062712FB05A3C9694AB49091B70009C8EE32B4A4B3DC6122E84DD1625657048E72465B4600027054305A52D03F05C01110384F9042CE9BC7C027306F0B207FA6200B36B29E2827C7B93ED84707BD39C1FC2CDCCDE9852C65B44ACE09C9DE3504D9E9E6BD16DF2D01B05A0A2D14E8F89B09BA0DBC2DC4096745E76A0390378497D181482663B6C2823640206700E18B14493478CCC3B4D9E0CA2DA97F4D9E96CE3620BFACB3FFFC292CC9C8031EF3573E00503215A0AB4E837735E83D375F9990E8274E1A90E8C7AEE90C9A1F468DE9863072206E84D7AC2C309E60C1868D2E367CF8BB86030E9C913EDCDF931E4A4C7A47E8BF8A137050813C4CDB930E814C0C942E6304295AB4C744292AD8C75A3DEB790B043929FDC8344705269C5ACD0B3159294DB76AC18C86250F9A06236A88361829CD176DD1F26CC254A6E14B3C1C066AA3221DB316648CBA97CEE996593512A1FD13FDD643EAC9FDCDD32090B75D3F75814D5EE9E364BABF767EB94B0BAECC3E1DA7D041BA7FCF0E11056416FC8644E00C715044955F0C5D96E9167D8B42CBF2CD65BC785DD39F9D7F572F1BC09C2E4E3F2314DB7EF0F0F931C7472B0F1DD384AA2FBF4C08D36878E171DBE3A3A7A77787C7CB829601CBAC41C4727B0D598A035761E00558A5E91F1C0B91F27E9A9933A770E7A8EEDC4DB30D544097082BDCA0A2B9DE3C68E68B56D59B540BFEB9CBB9368B375C2FCC9C303928232BA7A1EC3DF3FA2F87B932B47A168980DEB3EA0874A7256004C32C44D61E3B5EB044E5C8593B10CC99328C836A1386352DCBA79881B87D17CD58754E5FAE27044F9BF6228EBE26515F487044514E8C32B9F6162C0E1DFF5A15D39688CD3DC0EE2D0F0EFFAD0AE419AC56199888783230AF4E19D3D03374346A378031B874815B580799AC54E319973E136C5FAB04F021FAAC0C5B67EF01487CC149AC265C71CFFAE0FED531CFD40629C272CE0E08802138E22BBCCE164FD591FD6C506FE4BA2103F4646D8024E793BE87C3BC1AF61305279C632B2F6D44861DF59681F0E292B4A5BF243C69453132C3D3768CD1C5462737FD3079B206D3E8F68C0E8674281E88AE7CA7010F5472338ABF82161E0141F0D26B818BA0E79F21931C1D55FF5215D421F03B6638D2B51A00F0FF9DC5C78448181BA26AB3B27F4A210D0038817184C76B11F150FAD13535DFDD540CDD1029C3B2F91258610F9364F71AA7667E6439498D29F1DD14AFDD1B0259A70FAB12765A7B220602774BA4C1F2AE72D261CB0C6534D62D8E62EF56E25724859EC2E8543CB5FF597953EB2C4C04E87DB2C65E748ECB30175753097A20DFBBEF7925BA5160E26BDC5CAACB3080BC0F423C79C65A6F102D35EB0C086FD1DD13C3E980472B0DA9AD027278D05F9341DCD57636924F9219049B6D21EDA573AA1B83FB9E63F71672ED22A003D39A7CD351A840C8A6FD7C8619D544F92576F370B1EFA23C4CF476767367E1E6BE9435414C37A91A0DF5FEFFFC96C7CC92EFDF36446D6DE54C73A8EA60EA30D63B95F4B70AB26A818D4F15B20C66A70091FD668B49C5FEACDF6DE27961603296CD98FA5E96E1FE0286F0387B342250A4C0289459A081346AC3F1BD046DE4E465027BFB84C01936BCBC812B3506C91FEE00AAC24BF461B0C7C66E8DC9A2486BE5FD6BDAD51519C69B26659303C6DCC8BB4793F36A6C0C6910EECBB31342682857F375DC611EF6FB2EB39E9F39C2AD83696888DF8C842D164F91E2E0CC9D5EF50BA46E26BAD732A307D6E6034CF248B84DBD06B003F38CB82E6AB3EA4AFB1FF001DC480038E2ADA65D0BCFA2BD6407E8DBDD541EC88ED3053DD9A7B639FC96CC785D08FD2D94EDA9946AA927D37F0EC390521DA46627374A8A231A515F59B16750D9C84DE6FABBE8D3FF1724746ABB9B7AE3F6BC5BBFFCEDC626941D9FFA0A3F5A0824BEB4CF1C5282CE127CE5DC0894BD4DFE7208718E21CE4D8832007795FE7A0B6F486396391E36C614FF990C66E532BEA59934896181C76280F1F11E71CCA6FFA50FE0AA814CDFCC3B0DB4BB36DD903DB42DE92D99F6D616EDA34372A6A103D6DD66078393E16536A30DF330B2CD37515AA5F0D090BA9296913F46461D2656DA0AE92046CEE8297FFC89C00292EE79C96B2F22E82C16BF004D8CCF8E6ABE9DA2DE12DDE8CE20867CF6E9079C0E3C2630ACD67CF843F7D9AC53A661B2BBBC67C187BCBDCC1DBCDF6AAC18DDDABB3736CB5BF7961B6C1B335115A13FE5B05FD5912EE9B07E616440FCCD82D47F5FA27110716BC082A8642F38286C82BDF4D946BD638CE700CA96D16346D7A5A76E5A0A7B36848CD5703698B3C5A6E23F60D34198439D16E8E41CF3690B841CEC4FAB53C4270453F60D4E6140103647A9690B3AE30B6377FC4102D6B6FEACF3FAB26589DB79113A8216FE3955963CF96399AC067C1A80E34998D2912BD498FA9719C8319533E0B2671DEA4EF7571CB75F090EBDE535007EA68570E2B308978C51B27F0FFC10B18D165D39C2DED7BFB6BF42EAF4B4FBED557B375C3BD930529BB6E283FCF6B1031C4790D3226CFABA5452F2EA3ED77BE6F61D1F9CDFADA8BAEAC2CC22AB3C24D791BE8671BC70FB889CFA23AFA585659FA08F958ED2671F261F835CCFC1E96376D38626F6E1273B42D1FBBCF76EB2C0E1920F54793785D92400D62E275D557432E412FF4DE875286069F0DE009AA98537B0D1290B2F039C506B340E47E8FB2F42CF44E9D147C4BA9899F536CA037AE0B25E41CF61E789CEB0D39C5261E414D1A37DB962E35E0F6631482CB6C73872E4327F88C1798508A352CC580A5975FC724DBC3CD505E07F4D3365B3AE5832832A1FCE64774EEB870FA1070992D37818E2B060B9B2E3581BC7253FF89BEBAACFE3AFB9D6288B3DFB9277EA7F051439BCE67F1D27D3B0F54D076EC016E3BA93879E73987D39BCF86B038F9D1F8F759818C1548F818A04D05CA91B4542041DB9F4381F2CEC36F4FBE47FB69549181E757B661CE2A1005A312D2BE63C6158E96223ACD9C293B126A27F36A36C7007B28B23F416FBF5936D9AD7A4B49C59D833AF3D1AE59CD31211EEA80178BADE551035D4063B707F3B1B1F9C882CD6363B34DAB15B17F3BD6DA6E8DFC166AB1CD7339490F44C1903ECC4914867080D0E65F1A3319476CE91CCC9E83D91A52355BD06249B2725DB441D877A4A344D332D8216C3D76C7CFCE42300F49FAE1771EA4EAFB2E3222ECE731CC867436A41335A4796CBC7E307C80BD8D1257972D0E2188B1DB55DB6EAA3D3B8D7E7D8DC5965154C76453720A7791DABE81F51A244CC273F56D086BB543CB3254D88EC6D53268A70766EC16C68E45E00430B9B4D1350C824AA993D2599BC5A73DD78A214FE2F3F0B5D48CE99FC8B7A319F3BD1793F270FF06EE1EA3E8FBD913E8375680E369A161F2E6FD68568993759C888221B774EC4BAC3DEB617D85DF6A35BE5B2D5A83D01B60A5C8626BAF515220BDEA55AECB3424BACC182A71711D1F385DC568ADB285AE3A60562BE5577348C8A5CB12F6800AAF7C9776A2FF68D6649E69E148D110CADEFD7E476D48637754CB8E7C8B7DAE7EE7DF8D8E01C5800A4054DF76B1E758F622E1F6CD28F0F327703C749A9600547F9C1D658EDA57852751983A7E0862BA4A8DBDFC52FF4FAA0F48ED9C07006D210892A6DDDA7D041B27EF7FB2755C50DC5276EEC7498ADCC03B071AFBBCCA7251E54E43397C49E0D47C802A1CACFF1E1411BBA6C217B892BA07497A137D07E1C7E5ABA3E357CBC52AF09D04897070BF5C3C6F823079EF66491A6D9C308CD27CB83E2E1FD374FBFEF030C93126071BDF8DA324BA4F0FDC6873E878D12184F5FAF0F8F810789B43BA7909560BCAD1BB0A4A9278016E6B301B594AC52AF3FCF473F4B05CD018DF978FB49FFB410AE2DBAAE2ED17E7E54FE7091446A44ADE696C27D12A21FF9E827B3FE43C08FBE1AFE08596A84A7AAFC1FD4264FA3E1CD20D3F70CC27EAEDC7E51D7A7E0D8E636EA1FF0050CC1CE8215F39D00F8B435411E41D592E2EB32040A7043F2EEF9D80F530680C8D312DF0E448185E5E841E78FEB8FCAFC5457212C0421003EFFDE21C21F8057E838BF2BF67A0FCB0F8DF381169CCA698D234548A4BF6D40CC61AC44FBE5B66921580C22727761F9D78B9F8E23C7F06E143FA0805FEEDAFA6A0BF80F431F2FA807CE520B94B73DB2A817C7CF4EA8D29E86B9066715866F892B0FF69E33CFFB329BCB367E0668DDD2E207A5006D3FCBFA1D4D5D04EB3B8B40F98F8190263F63924ACFCD59891F896876C8C5EFD6E0A99D8FD90807E8B4CB4E968B9608BF3952FB1474747A69079EFA575D15BFEFB6E5C61D01AADDC721541924E3DC75D02E90CF4C971BF3FC451167A7F89EE58E778CA7303EC50714A525F3875E1AEE207465119BBA43781C52FE5B50605B464E304816216432DDF2F2EFEC7ED55EC4728E1F6B682727B099E53F80759B95F165F63E831BD5FBC22A7342DB23038ACB5B446D9EB1694A155B7903243E54D56774EE84521C064518FF358536ECF8E5BF4ACE259454BEA872F7625A10D55E482A7E3C4492D75F42DAFB63D2B3DDEE27B855DE95E735B4DD5D7EEC598969DAF5F23A66DAA868C92202A9E57782EBCDB6A02ADE5F508F7CE6FA05020F9257C56630780C1AAB972E8D08B635E2F46B0CEE9D4A957F24E75D76053DD9DB59603BEFADB5A67710083E8E745B8CD529EDBD66AD977555FF26A055CCF5A2867B6C28CD8D3B872D56DA67679A359F730F07AC18BC944B93A4F9C0C80C68C2827C46EEE9F9140739ACE62DD8F5837274F2DD866EEF0B596521A8C81AC8E417DB5F5E51CAEC7B218D457A02B7484AC6E492F5448CBD39F3BC15D80EF05F5DEC4D9C6303B9906B8DB9B3A6920764211158E396E4E591B2E89AB86222BA965BFC907173A0DA5B6F92B29D73541B7EBE83E2DB2FBA6A3F6BDE8BC52DF5E9BC7D589C708B437C1B4406339995A715E631BA5D741F2AC66175D25B342BB85C1F9796CB660DAE9EF386CA6BE5D29526A1E9DF041BDF0C02BCFBE0535543957EC8C7A010A0B2DD51B2CADD62D053CE813B25CD00E2363303A6DD288565206A4A0867500B88247EE216236F88D71BA008BA537628F29628FDF1967208C78C9462E4D8D6C0CD968B63562B5EEACD31D15FA12FC50AF3E5A64D67C8D51779CA017E0F2DD060CF63BF354B3F2AFDC7EECB9CED7B385914B01EBCF9A3E58EADA54B3F9E40EB686F1ABB4E71687D42907E9EC390521DABBE3E5C3B58A115BCED6B39D4C780D9C8497F368C2FD0286D06F6B91E5DBF3A6A788F2635B89D826DC2B2088A4B683015F6DB741B9BCFE0C8D72E668F86C9C360345BD7998E7D0D7BE87BBFB8CBFB98A5CEE1633D64502092E1F94C2827A7364708E0C8E3832C831AD37E059EDD10BDACD9EFDF88C73353EBD18E9EAD950CB60F3476B641B9DA4DF3874A6C86C88AC1B22F9BD6643D8802C57333F57753408E64132E6B501ED9893DEAC6C6BDD493E3F6037E0D00CAC127A8B74DC06BAE0F5813E3AC3DBC7E8143D6C1E26E8B6F153A8A3FAE497E619C720F38A17AD6DC1AC663F3BD0266CD0981B3F54EE95ACF1547DACCEF6750CCE54EB980E3D39DC9286B2DE35A4633E6FDAECD62827A21E09A6773BCDCDA36A0AE99178363E39DD29AA4736BDEE3CC61333E6F49D99F91B912A23CE6B3450C4948B7A8A21D37D5E98570F6B72377CB47AC1BBCA5524FD130A3F4EDC38186BE78E8CC26C10466610AE9C1884EDF2F7AAA65D52DE8B4B2E652BDDB7BD6DE2B409128EC358CD7B25ADFB3B313B7F559FDED63D9FC6B418C8D223CF6257B8D100F4857B9E6DC6BE697F91FC11C39E75DB041F875DD072D835A6E6A2559789B975D0895AB64FE5189CD6EA7AC0D5F46457CFBDD8AE535087A3ADC4F52FA378E304FE3F34E2632D4EF14DC2D28EED7422BAF4DE77BBE631DD3BF91B627B9D0CA5738503DEBE932D9EFCF240835B2C904E4BDAC13C098DAE11EDF57BA53D6D22C05AEEF9802B81494E9B7D79FDCD4CD7BC096C39C9A941413E826919CD2A4B1F1113CA1D6A751298F9D992DE5834068FA0D7C1E9C327586771D803D82B2749A0299027D8B45987E60C3E89C27B1FEA031A506570F3B579CA7745FD354840DA0782CF91FB3DCAD2B3D03B8516E85BEA769DA257AE0B25EE1CF20678C43DCFED368B6AFA3AE7BD5F3D4621B8CC367740BECA7C6DBC417E9160B04B89E846EB1AB8194ADF825EF2666BFF18C1CD8FE8DC71E1D46381AD1709AE085D61554FE9CC1EFDECD1CF1EFD401EFD49E0F81B2D5F3BAF3947DAC7E7EDF514BFD51371241408B1899BA977F61B02B6F722CE3862FE469AF9398200B53433AF396BE6AC99A4730FB15D950FC9595F005580BB9FA432D209ADAD9BAAE2AC11B346D84D889CD82CA29B473267510CA62FBC6B38D01746BE4D9F3FB0A86A52C28C5F42D10D2076258CFB60C420677AC7BB7CDE6B1FB99006E660AFDE1DE774B3A9DABEBD38F5369F6C06F3C9E6214F364FD2D2695AB6496E89F773C3E94E6FF8CF47C3ED25834A09B3CD8AFE240A43E0E6FBED699CAF1A64085A3C723D6FF0CC1B3CF306CFE01B3C2BD72D76E235A26665DD494E218346016CACC40DE9C803FD7EF8BDEB2AAF4DE2539F39479A971F8EDDECFF6C867BAC56D7EEF6DB0A5A8FCD56CF78E20DA61A4E986828B51005CEB3CD96DD76DD1865D1FEB632B55F63DC38DE5E83240B52E18D36ED72593B6CAA701EDF6D176D66FB3A100B2DDCFB3DD59BEC7BBCDCBF6032136BE965045F0F7B8F87D14C601C62E6359AEA8CB01701E6AE06121D5803FCA71EDA3C77C3D982B0C7EF9C56D38897BA9F6D9EB4E8FCCA869A2CB5DD305275E3BB76788D063CFF34DFB93349CB63D891F91EAE312C0AFF06EE1EA3E8FBD913D088A6E19507B20704CA29DA81CE535FC9019E9BDDEE22766B1BC756457D0C766D1C16A47D18CD54EBD720F47483416C939FD6F9C76D920CAC862F4882EA94085A0D107EF3B5BD3EC395ED360A133B79631530E40267097E0874D751D83EC2CE237E93922733D37C47C2C28656C98C6FB16F679E5D033706A91D5836D20CCAFED97958E04FE0404BF5333C52B04A92C8F57302AB09BA98C92AC4793EED2DF59152A1B3D05BA04C7DA67145E11A04F7074CD9972C487DF46814A4EBE3F27849ABE1D7B0705816AB3CC705F6DE495CC7639904FBE6695244A407F3C82A2B90B4FD0B83129A0680EE57F51D74943A4963070E016B47FCD0F5B74E20E00E555FD3F2A00ED790E99253B0853E0C244CD67D1DBC54433E1935366A3C54DCF97088C99D963816D25B51337D7924FBC3A38BAEB1671249756FF22249D84959E7ECCBC290922AB49FDC6A7DCA6C0B01EA43728D2D2AD97C67425C26CC9E437F228B41759CACFC2A94D8AA1C1780FA1B39DA4707073D09264933410B5DD48B007299D48FC851FDD1C188A550EF46B072F93E7974C207705B9157FC4DC472853522858B2818C4EE910A2AA489AED08FA8E1DD1F40DEB85DD3923A8CD051881E54995BFCBF9EECAD9B252D237E79D9801268A80D3D481CEAF16042D752D8208D3B9337662BF7E4D10F3C085C286BEC663536BA6C216746A507590C1BC134826F49821834038810B7EF3A789B0756762241F985A8F9BD3962FB545CE28A8D63F161104B845D374511507EED4582F20E0E20354D3F74905541B71D0A4A13FDEB262D0A4B829A30D683076782E3AD6D19A850EBEE461D3BC3308F7ADFA34E1D18D9DDA8D3C739E6A1EF7BE87907687638FEE868CA789D82F2A63B8A80F2EBE465A6E8C7349C82ABFA65AD8ED2D25FC0EE8A7D260DA385533A690162FB330D4142D48FD7E014D70852F88B8F939696BA1BD3109252A46D981AB13BC2B312FB611B266311F2CB38875A6F32BABD077AADADD3635867E6A33DD43AF3A71EED31AC2FF3D11E747DF9530FF968D695F9B8EB2C17B4866BDF970BDAE3BB93E5427531F24E04A9BCB56E28F7A0BA4B0F83527D9AB405293B311527A11CF5A1DC8479D447E12C94A36E3B316C3CE33E603697C1D0EF3A8BAB1CF641BDC459E3C7E32B720E441287A94563489EB8C646922C18246CC83B07CA524414F7226762C6F5236F9C8EE960A50F7E0E207765225714A6B005882B6727F2C0B91F27293ACB7DE724809136D40A7ACB65FD55068DE5E7082E04CEEA334EE51837456BF7116C9C8F4BEF0E5DBA541C935ADD6DAB0A09C72E91583E39EEF78738CA42EF2FD15D71A710838E53478097A8A9462E3807C01020A827208257DB07DAD4A8E9D0A5A03DEEF2A0818A80B29A161545E59663A2A0875BD960747469A3F3E0197AE80A021ACA6A6A84B5AFC760AA4B0428CA720D1444F22B8B87281621233282F530D289DE02CC74352905745EBC49DFF33C6469F7F31A1A1C80F5D4A8575B341FE6A6FB336C94395C1E706B0948A82AB4C27D039E79DD17D654D0802AA9E960AF93630860AB0830E315CD303307D9E554B0D53528C21BA9A9A3D36E8B38214315BF9A801A5E65734A34A8D0A6408D9D139364D073EA08F0E3215A156601C7A51CD6E368B1806320179F059051A11EE4327D980BBE2C93E02833A675109529495C44659904519985A5834830124D91048DDE8888654B2551F5AEBD0A85E8812606A3A8A28000B6BA2E2D42DC0A5C7A8356DFB4CF1DB7BA543274651D0361AC179B6299ACABA844B3ACA8875D6358F9D52454980D29FFBE462E15DAD69A57594D09198E6028208B0598F14ADA18897083082F51498E1DABAA4F83DA9110D6545023751FB028807C41C7DCEFB0C09A4A5678F27B2188E090600D0BE9E29431A110D5FD22626065053A8C45B2469F6DE472C2806F8A8683318E1FD2C0A1D135FA619DECFE065D2E6ADF01D10723D43085B2C9ADD699CDF21B06383C35B89280BFF784F5ACFE2661123F489237A78BBA33035B7633A7E279BC90D597B082132329F841144898228B796090E80A5619C49EDD56704871D85BC8222C94C270292F5332CA90D52D18233E64CC618AE68964A22322872CEF0C5B286109FF04B201B416ECC14FD07218223C60CBD9BDC4082D3E48BACAAC61EB66E5574B1DC3526C84BD13A5E158E8223382BC566D3B876792883A27CC36197BE7989D73510FE55BECA3EF66192011758E738ACD429788A04EDDACFC6AA76344104ED03B612E65C72E0AC38979734EA99D2E975128416739C7832C8C241E35AB5B151FED74AA097D09FAC53FD1D2B16BBC71B3375ACCE10C4EDFE407383A768F19354B23C69C431075ACAF69A1D78EE94C091AB9F963EEA2C26ACA33D0CDC9DCB1D5E4E441733AADCA96EE389E64983C6F537DB2D5418546AA1283C7DF4149504296FF6A250A3140F7740C8F56C2E788475295B0C8E9B2518E23D111DEEE41DE1DB240C20AF16E000E8728D6665175D7779D5757977D382CC2F7E507F8175A24E701C0110741927FFD70789D85E86EF2E2DF2948FC8706C487E6C9F9066855076D105471218AA2AA0A759DF917903A9E933AAB38F5EF1D3785C52E80461A59E73C0C89DE28BE03DE45F8354BB7590ABB0C36770111FB44698932FC1F0E199A3F7C2D36286C740192E9A3EBDCBF869F323FF06ABACF39CF9A0940A07CC7F20D2D3496297A4BEBE1A5867419859A804AF6D5699A37507002082CF91AAE1D74BDBE396D50A73F8307C74501BF27DF430A2E02A21E0892ED1F4E7DE72176364909A3690FFF4219F636CFFFF6FF011B3F58CD91AB0200, N'6.4.4')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202011130726515_Upgraded_To_ABP_6_0', N'DoAn', 0x1F8B0800000000000400ED7DDB72DC3A92E0FB46EC3F54D4D3CCC4195D7C3BC70E7B2664593A56B72D6B54F2F4C6BE28281292B86691D5BCC8524FEC97EDC37ED2FEC20224C8C2FD42822C5266E84545009989CC4422914800FFEFFFFCDFF7FFFEB88E160F20CDC224FEB03CDC3B582E40EC274118DF7D5816F9EDBFFEB1FCF77FFBEFFFEDFD49B07E5CFC675DEF25AA075BC6D987E57D9E6FDEEDEF67FE3D587BD9DE3AF4D3244B6EF33D3F59EF7B41B2FFE2E0E0EDFEE1E13E80209610D662F1FEB288F3700DCA1FF0E77112FB6093175EF435094094E1EFB06455425D9C7B6B906D3C1F7C581EDD6C8E93F5C68B9FD0C73DF8F3224DFE17F0F3F2E709849B3F9DA6F0FF9F49FA63B9388A420F12B902D1ED72E1C571927B39ECC2BBEF1958E56912DFAD36F083175D3D6D00AC77EB4519C05D7BB7AD6EDACB8317A897FBDB863528BFC8F2646D09F0F02566DB3EDBBC15F3970D5B21632B46A15E97CC857C2D8230FF92DC2D172CB277C7518A2A96BCDF2BEB41EDD8AB1BFCB6409FFF2748933D28987512FFD6E8C99BBD03F4F7DBE2B888F222051F6250E4A917FDB6B8286EA2D0FF2B78BA4A7E80F8435C4411491E241096511FE02728E80D48F3A74B708B893E0B968B7DBADD3EDBB06946B4A9BA7316E76F5E2D17E710B977138146FA44D7577992823F410C522F07C18597E7208D110C50F28FC3CEE0BA02B117E714C6972F748DA06AA61C91EA262B903E843E403FEA7650BBA194968BAFDEE31710DFE5F71F962F5EBF592E4EC34710D45F7087BFC7211CF2B0519E164087EB2BC8EF93601054171E1AC890E59902D5E1C18B570E705D02A8A1F17F7A51A1EA17FCD701AE9347E01748BFAEC22D173F410DAB7E730A6908ED539162EB40699B25B8E32884CA7DB6390A8214642ACEBF71C1F70A9D469D0E5FFCE100D5C734F989C6567C9B2870BD3E7CE144C468462384211A240707070E509DADE1AF2C893D68AB5AD80EB2792B7B755CCE17507D3DD77D7DBFBF9DA69493D747CFFF719726451CFC25B9A9E4AB9EC5A806D91ED7BE9CD4E689ACC105D9825039183696D608223E4AEFD4F6FFD51FAF7F379B6E2C915FA54FC750297282CF876FACA19C83C71C427262EBBF78991C96669C6747375E1C243168F4E6639244C08BADA9B848C3242DB5064B057AD7F418DAD6B09D7D52E0399B194B600646D1D8CE7C7A8A3DE86357DF6B643A5B236A14824CF8FD69728647E861B8333C78410711683D4E1773299649FD55DF5317FEFFB9F710DE95DC5253B35C5C82A8AC97DD871B3CEC845A74CDB53C4D93F56512C974986D70BD4A8AD447FC4E6C5A5D79E91DC8BB0D2E47C36A1E50625CF5CF618653986D224F87CBCDA2EA2CDE14B9C6497183E902A4EB30CBD4CEBD1B546E0D48B9BACD546684AA69604594F51B73C0181175A3DAF2B8B0217839EFC49094B0666B42E372152FE9655E753CB7BB98A6DD8E2FC9246D3628DD39C02E469900E23CD64631D62AC96C3BDADB5C27D4847178E0EC82CFD40FA746200B44E3922BDA9A79E72A009D8CC009DA014AE253B8B886E37005F2BC5408CDBED16603076959B0875B667B4248CE3694161FBD0C10110A8660B5D65794B99B243040A1EE08D970DDB4D82A8AB222A715EADA2E54C046E8B84923F449EF1BF66CEA350BA697BD845ACD166B869B3E96B8CFB24F200279F7D06405A6CD3E48D9521A79D48765BF2641788B95BD1B8C56E48F3B705A7D38BEF7E23BADA758D5FD1CC23AE9D31ED972721E61CFBB321557DC48BC0245864FCA9989E07E55D8CA7BAC00C01948CF9DCECEE82B175BC55B0536083D1FBE75B163DCD153AD7F56AC16077948615C730D083743518FF7325495BB391994CFDADE78D0106623221FA15D87E739F8A95BA5BA49AFF896867761EC45C360338C99BF7592F3847F8ED0F64884FDD9CBEE7B0F0E5002EF01632B4F66854C5B5B6706369E4D118D6BC804ADE79BE6E6742570F298831869A726BFCBD11E5ED75CB48EB97097C0CBD4297B4EF25A7B4B0B96479F08C3A3F70DA169BA665A889D43AEA2D23BE46B77720F1DC41FFB0A3C1EDD64B0D4CFB13A3C4353DDCE637063FE2C4D98CE47344E4D7D56A96C9500EDC6D057A8FC61D9D07FDA1301182A744F77993FCBB21DEB5FA0A1293CFDBAF14BE27B51F88FCA3E08DACFD1EA67610B761AE3F695AE851BE7EF2C835D4444758EA4CF21F9E71D921718B92BF0A85DD0EA0C25823169633946C7A966EE6E8C66E3D30F8C178ACDC152CCB1B7F8E6F7C3833FFEE86786986D96C6669D2779C31C93635E64FD6C8F6D3DADF0DB9F4518D807E4892EBB895EDB4EFEEAB091CDE12D3D228446D34B47A73B1BC5D4A0739346BF45779465607D133DFD4701276138C475E7B05D7657B9EBEA64EF63051E0077AE8C54E16D054B35AC4C90F218E1CBC383DF1D9DFC8D8A000403A2AC7D8A41904D6786581537999F869BEEB3050BE9179839DCC5A8773E65CDB67C07B67CDC66E25B7AE7C578150BBB95A3CD0A9D7920DB647B2208F3BAD7B13D414CED7A0280155457FBE42C2E36AD11D26D74CC23C3F1C8B8F05210F3BAAC511268BD5576FFF5EE42EE3D8590E620F6240342AA5486E3FB300AA0F20BB31858BB73BDADBDCD609056E2B217E43545990B2AAAABF1DA07CDEC216B7DEF5ACD0717CDA177D3848B22BF4FD27AA7806B3E275B3CCB0DD6B3ECCF14D2FADCBD2334D43A8E080422DB1302EA2D8D8227D9B1FB6DCC40248A8E0C4420B23D21A0B130D03E1E62A5811A7E29EEC995A962C93845BB6368C7B6BC3C1CBDEBDE73E6CB27D0840555811B37F73C9E27E91A6DBD6B0345FD1C0FED63127A8E07595748B57C17D937B71E1C56731ACFBC0292C3102E289021BFA62A6DD7116C19B7E4E12AD8AE74083D9153475562A823CAC4D491156CA96375414E225F93A193AD202696AB65BD726C5C0E71E27E8985AAC4D049948949242B74CAC8AFD8E4C627D97A77CFCD27E979B1B8751310F3B47B5ABD647D6C6938597B61A43F63D5131D48A510D7F02EAE2E8FCDC949AFDD71BD9587B65B01EDC4475B1569BC0BBC175E96FD4C52D5D66B4F519952C8C7497C1BC2718986826627E0A5935CF4BABF972003F92018BF24FE8FA4C84FE2003968DF73DFD6553CF27D380E4E21B740C05EFDDD62EFF12C6B287292937F719FC4E0BC58DFA079B6EBAA4A473A810CAB4EF70EAC805FA0042EB8485A6F06380C71F53339F57C38A13A12C059460E2517F08EFC3C7C00F32A6F5EE5B130222F5C8B5DFE721D51976FBD7DE233E7E89365B62B10DD7AB3822D5E6FB26512C27A5C6F964025EB4DB64C4C5DEFEBCD12B26ABD29AC2026B6F37AF34B72174A969A15025CCE52577E96D05495B95EF996B0252B5FB64C4C986EE5ABA2AE0C9ACBE9C2C50C45E557312D55912D15781B4241C8B606434B5D2026A729ED1C1128AD4EDBAD9DB2F19C3D24C7B5B33CDD523208808355A301A6615E661BF7AE338254DAD2B6A3A96C3C8FA6118EA65232F0DB431828D7763D05086ACC031CB9B4D27693BC6C99B2CF19D923D5751759DDE336D486F92C6518E10EBFDAB9E73A7765565985CA760A4BEFE8E8B91B17E7578DB558DE8CD4EDA8B918C67C6C5032DCE653EAF329F5C99C6CECEF94FA14EC62FBFC0EC1ED71CF2DB5A3EFC750258FD21898647F37E9901AA43DAD66A15F1D4315424311E35498F6172E923EE67DBC5FDAB7ECB27B565942D9FE195FCA85EB05555CEFA16114925D34BE544663979D34D5035A18BCE0C52CBA444697EA4DACCEBB7B18876A7F4F524546AED11E9F559CEDC8F7AB6C9776A136DC7C0E5DC871ED2CDA56C6FDC3F887A51D7598C6386802E23CBF3EC3F9D57E87EC080ECFF5A6B5412361CC564D8EAB955573BA20711EFBAD0DDFB77450CBF47CDF2319F255974B901167E64AF70B0EDE7234574555C2C27071192BCBD52DE62C8230479C2DEC422BC414C7BBF5049D1C0594EEB222C53546AABEB65746C926DFF9F2A8092C2BE66BD55A8D93BF819BFB24F971F200F4AB6D5C37DB231BFD02161D7757E39C98EE86BBDD0A1C619A61BB87D29C2E848D96A2B6636405E2C07019C78E14A2E9AF335E4AF3E0061475DF713788D0EDDE40EFB4FFBC961A11F2918A8C3A6E885CA9CF79BE218B061CA02EA2361D5F87A6A71D41909A1F38D7749B6DB05A53950B5AEBEA770A5E8B14D660E5C4198CF9826FA36903B3EB7B1A0E3F33AF809F827C78BCAEF6766B9DEBDD127E065E0015775A5E4C774FBB581376E1A3E7FFB84B93220EFE92DC5CA4615225E49C65A79177973534A9AD040524DB13C2EC642920BFA1A4A227281FAC5B4F397B83E557804E60D75349F273B928F3443F2C5F732CA5AA7E0451F2B3BA88A3697278A06EC356D7A038BA491E00D3E68506C5E7F0EE7E5BF9352FDC4A8C0AD1924FC856E13C3BA996B30E946691558FDE8620DB63610E2BD552F7912B8ED9A261E1F74D40553F54576F1CFD9AE92D782E4E6FB3E3BBE2790D0C7158AE577E8219CB574579318429CBFFE6A5B18CDF6CDD93344DD2A6F24B75E553B83ADD8E358169D44A52140EB793231DB6E3E1B9BB7CD356A296523A8B1FBC280C641B3E66E2C340B677BB9809B29CE73238086ADF422C5209366A07CD6C3AC0EE9E00E51B3DA52563CAB6C4CD17B8F9EF9AE6F18F38F919A377E4D3D88BF0F145DCF60F755B74790A08BE1579D3E0AD9E56E2DA1209C5EC2C68346E24A1F82E265008D2AD0DAC9C7AA578E0DC633CF35C92750F5B70915D859BB36FF594C1B5E3DE39C899A5FC6F8BAA68CBB357A63CBBF9FD77EFB5FFFACDE1DB97AFC0C11F6F5BF00F6A571EC60520944B3795FC0C73FF1E62800E709EF84944D8AB038DC5FAF657C2CFD2E0619D8A173AE0E8EEA30DDD4263FBCE93184F06485A0F00CDA8F882290288C6129E278887658CA169A2B182F84229B695C6025E78691E7A11DF4E6300CBBCF54D048EEF93D0075B69BDD449E0687D13DE154961D1E42B74A8830B009918431AA327A2A5467A654BF3EAA768194354D748FA1204610AFCDCBCC50A806FF93D203C1B9D22D438BE02A85281793B6842713E13D948A342D0F6C2F1F7483258A33EDFE322A33068D4E60AAC3749EAA54F02DE69E6CCBAC55F01D840A37663DEF2A3175C82BF1720DB627BA5D3B9EFB1873D3AA27BAF740A74E13DADA18A226C9056B2A146314E93F4260C0210134DF412A6F5F5954EBC950E215F2782AB608A3C8D984BFF08194214BB209A69A45D2A137DDDA480355AB997A243F193A42025A8F193908B03E735B285C651FA13FA48DBDABAB0401524E2FB73A8D311A8C4495CE5565777EA116DB516A7E4050EF624C9171425269A6B8D49D9FC7B1AA2B6098A7F354D75A621CE8A0D1CBA702AFC0A07A257AD919AD61AFDC1884170896209509B565019B2DB9056A7438D3A9D3C6EE0F8F7848CD339DC9BBBD40B002FAD171A9CD0D7295DF41548E1729C5E96BED61911D8D1B3359C24914D2090BED6991168B0FE846ECA4FEF8968A39D5AD207381343BBF500794331F6B5CE946064EC107BAD3328C8E7C4FE259269AD200400A350D65196257E58CAB58ECE3CC5DE3AF4EB686809EE9AF9C838A02771B0A8B6564C1A5F33D7DEA2DD1E51BBE5023B3AA10F47DC87E5BF700CB1C4DB3C4C24C5CBA23CA43B0A517E8BABE8D5E2A83CCE054D9D97F99E60FF0E723BA0BF5C825B80DE5CAA5C3EF4445018E7FC4E4C18FBE1C68B5A748C8165B8AF83686DB0B2259FC006C428F3A7857C4DC8619A8AA96B886038AC63E8FB7D42BB8D94BE32EE4D472CB55EDD5AA1F674C3167AAFC13C61C537EBD9709A6F26E3C9AB3E35B019F5B4D2450520E301D1763630A7443E40D44373A4C3C4A0ABBB1A3106FA60317868003B1B42F8B4E629F050740F5F9BD41CFE9469A9B2956870081BD88C0B3546C12068CEAF8E4DED8D7A32808E1BC9D0840EE22685DDA830B1DF7C5D9357FDCCE41AAC68245460A27EAF3A6548A248E3298B2226951F62ED74D8807B43A8B001878C349880330A3586A3F19AFC6DA6C75C2B9D22AF90060DAECB3C9952651E4C89A5AC1B588BA5BCB155630868679A2C7F8459A61E06AF486F55833F1A45ABC7C1DE1E1F2833C12550431D2E47AAA8EDFF006AA8E58B090DD5D3DC3BD33CF2310799FC852F3BD0C70407328AA27724184AF07DEFBD289D801103A899A0D32658EB5CD61DAA1571A9905AA2A2FB85D40AA65AF9481FF5D0C0149AC10E8AC2533098B6F00C3541CD6441EF4E73C8AB9E945216DEFAD4517344D7440DAB39020A86D21C01438D4234F48534BBD31CEE9E2BA5A8E5575E75D421E91D59C32A928C8CA1B449C65F13FCA29B8276A857D5BB436AA1338F10EDCE45629E3C6228C159B0FDB9483423065336AAD3D370912E88F7A39412BD103D26B53B05BB103C5DC590B3AD621CBC6EAF7102F60CA57602564C43F7AA37C29462661E0CDB9DBED1CF93318454CFB4F4A75C141786522BAAC7D350A8E6AD37A528F987DF5AB8443298020D19C0FAB05D1A4A47D86E8F5E4D10ED466101B6A24859CC86BD02E6E03EB98C8201F445C6D0A984054AFA4DC2026C45679AB3D3B0808C82A13467C26181927EE3B080B0B6331DDA7D584049C650DAF42CC202654F4CD66F6C45536DEAC99FE6C811E820AA33D4FA4DC69EA194B1E5FAAD7E467027BA2778B541266ED5130E5B81D7AFEB98DB33C5BB0F831933390D03288F9CB153F1A904EF6A68A4ADF1AB5A6BD14E7D2B390DC369D184FD2BE6F5138DA41519AFADB5C73EA7D5B9F20C9F8C2AE6A709E25D679FCA5EA4D148D9C4296FAD42BB77CC35840CA751CFC239D75D28295307E3DB25B76A21BA2FD65CFF4CAFA7E411E29B31C796AC6FD8A101F4D950962694B077DC0EA0D33835358973D882B8F38E7CA1F2D34D799DC8A3E8866238FCF0ED3519BE4F915541041F2EED6AC8059C16BE2477D97271D25C71583F6281CB047A4C03A1AF2C1440A22A5457A069408A0EFF8440045B7288CB0CBE09E49630AB63500670F1D1B7160CD1A210D4D622C27E82086AE356E9405019F9023854CEBA1130F6B88A0C287BAAC38252F85547EC4AF04E1F0B923E272482C81EEED200FC0231179EB8D3471B34079443BFAE660CEF0A5A10439857A5B1D1C0A5EE1913C0E51F9AB10048DE95AC03CEDFCBAC41C46674575BE43C12513D6BE02680B540C900240F4E10C3D3C093F5D8A887C8E51335AE3C6783C638115D0C0167761B80C1C95A623038FBC9008C8C17DB9C030D10C5D0379507FFCC8F089AE031201375AF9AC9011A7109BFBE296354F3B6A7A9DCB0AFA6145FE3681B00D5F18EAD63C439D4C8643C8BEA698193DEA60828BD0030034678C10A90D422C610B0C61E4BAFC867C0136EB0DA91E22EEA58104D158E95FA820F6A516675B14DC317A9DFC7AD165A5E6523C514F258A875056C62CE6CDA7DB2E0B6A6A19609EAF60A7EF36B033DC735C876C972D5751CA6DC37BED243CF1B934B3D3432B11809E6B8E522D2E9430B41A92F7D1048C5E296088A0D66F744107DE656190A1E9B5D094100DF2E01BB7390583D71770E8818A8AAAFE8A2A299887DCC0A55C53C156411EFC4CB55A78CE44FBD6B38A939262FEDB0FCA0BC8497D51ADA909DF2F3EDA6926AC147F9996B010F0D0F68533DD41FD1267A27702615CCD39FC8B601DD8279D52943BC5AE3D94516CB7B41D412B104AF26156C2001083A4EAE281DF59848B890765B969421205D9094D1820182140C1D94B60C207305640C90E613F0A48BF209EC1920CA1EE88B01DCAEA58C0BEAED4DBE13D2ED4D7B7E4837337B630A8EB7C85821383B27A09A3E3DD7A2DBF4A13706404DA39B1E53613749B7A5B9813CE9A2EC407B068892FA082814CD6ED88023641206080E18F144D3478CEC3B4D9F0C62DA63FADC7476EB624BFA2B3EFFC293CC9D80B1EF3577E08500215B0AB4E837775E43D075F5990E8A74E9A90E827AA1C8D4507A346FDCB1031903CC263DE9E1047B060C34E989B3E7655CB098F4D489F6F6FC1872D2E352BF65FC309B02A409E2F65C18740A1064210B18A1CB55A63AA1C85626BAD1EC5B28D8A1C84FEE412304A9B4725698D90A45CA6D3B560C6431987C50391BF4C13049CE68BBEE0F13E6922537CAD9606133759990ED1833A4E5D43EF4CCB3C92A958FEA9F69321FD14FE16E998285A6E97B3C8A7A77CF98A5F5D3B34D4A5853F67E7FE5DF83B5873FBCDF8755D01B32851741B98228AB0BBE7A9B0DF20CB72DF197C56AE3F9B03BC7FFBA5A2E1ED7519C7D58DEE7F9E6DDFE7E5682CEF6D6A19F2659729BEFF9C97ADF0B92FD1707076FF70F0FF7D7158C7D9F9AE3D804B60613B4C6DE1D604AD12B3201380DD32CFFE4E5DE8D879E633B0ED65C3559029C64AFB2C6CAE6B8F112ADB72DEB16E8FF26E7EE38596FBCB87CF1708FA60047574F53F8FFCF24FDB1CD9563506C990DEBDEA1874A4A56004233E44D61E395EF455E5A8793890CC9E3242AD6B13C6352DE7AFB06370963FBD51C529DEB4BC291E5FFCAA1ACAA9755D00F1A1455600E0F3FC3C48123BF9B43BBF0908CF3D20E92D0C8EFE6D02E415EA4314EC423C15105E6F04E1E815F20A3513D7F4D42648A5AC0FC54A45E35990BE16E8BCD611F47211C02679BE6BD53123257680B979739F9DD1CDAC734F989D4B84C5820C15105361C457659C0C9E6B339ACB335FC952531798C8CB20582F276D0C576425CC3425265C632B2F68CA488EF3CB4F7FB8C15652DF93E67CA9909969D1B8C660E26B1B9BFE9834F90B69F470C60F433A14074D573652488E6A3159CA3F42EE3E0541F2D26B814BA0E65F21935C1355FCD219D431F03B6E38D2B55600E0FF9DC42785481C570CD8E6EBC384862C00A902CB098ECD230A95E59A7A6BAE6ABC530470B70E1BC4497584214DB3CCDA9DA9D990F59624A7F76C428F5C7C09618C2E9C79EE04E1551C44FE86C993954C15B4C246083A79AE4B0ED5DEADD6AE490BAD85D0B87D6BFFA27AF7D748985EE85D926F20400A9020BBB1F6F8A9C9F7389CF16BD6D82C34C5F89EFCF7E24D4A98A838D866AA5D7794848C0F4332E04CB56EB05ABBBE0830B7B3E22BF60300D146075E5204C4E1B2BF2593AB65FADB591E6874427F94ACFD0BEB209CAFDE9B5F8C93C7B95D601E8C9D9DD5ECB41E9A0FCB68E12D671FDC479FD16B4E4E140C6D9F0D3701D96B19B3E544523D6B30CFDFFEDF69FECE44B77E99F27235977531DEF37DA3A8C2E8CE5F35AD23B35419550C76F8138AB21247C58A3D1727E6936EF7B9F585A0852DAB21F4BD3DD3E385FA06655DA0917966C3E5BD046DF764651A7BE084D035368CBE812BBD06E954EE14BACA4B8461B0C626698DCC22487FEBCAC7B5BA3A23923E5CCB21078DA981765F37E6C4C854DA01DC4776B685C048BFC6EBB8CA3DEF3E4D773CAE73E75B05D2C11B7EAA30A6DD3E5CF706148AF7E871A6B34BED6634E07A6CF0D91EDB3CB32E5B6F41AC04FC1B260FBD51CD2B734BC830E622400C714ED32085FFF948F40718D9DACF8B0143E7BD9BD583E55494B19F16005C523B318C401E36126E695F0BE429BB95908A11F13E13A65691A895AEE9DD693C71CC468D38BCF50628AC69454D56F52D825F0327677B0FE36FEB4D31D19ADEDAD7DFD592BD1ED7FF616CB08CAF30F913A0F81F8EC98A9BE580551C2CCBB89045194E6FB1C9291439C4332CF202443DF563AA82DBDE24E9894385BD85331A4B1DBD49A7ADE24D22516473DF0D12BEA9407FE660EE5AF8049502D3F0CBB1936DB9667605BE83B42FBB32DDC3DA3F646450FA2A7AD2502AFC0C7E24A2DE67B6E8165BBAE42F56B91F090B6256D42B43C4CB6AC0DD4A32C03EB9BE8E93F0A2F420357704A4D5B7917A1EB157800FCB980ED57DBB55B265ABC59C5114E1EFDA808402084C715DACF9E9978FAB48B75CC36567589FB30F696BB81B89BEDD5831BBB57E7E6D06E7FF3C26C83676B22B526E2971AFAB324C2171FEC2D881998B15B8EFAED532A0E2C790F550E85E5050B5154BE9B28D73CE204E21872B4391869D31B65171E7A388C85B4FD6AA16D49C0EA6DC2BF00A78230A705CE31E8D90652F7E7D958BF96071E2ED8E79BDA9C79E0804CCF120AD615D6F6E6CF14A2E5ED4DF3F9571D094EE76DE4041AE8DB7875D6DAB3E50E52885930AAE357763245AA3769995AC73938998A593089D3317DAF8B5BAE83875CF77E024DA08E75E588029B8857BAF6A2F01FA280115B36CDD9D2BDB7BF42AF12FBECE45B7FB55B37DC7A4594F3EB06FC795E83C821CE6B9031795E2D2D7A75156FBFF37D0B8B2E6ED6D75E746D6511569515DE96B7817EB2F6C24898F82CAB638EE5A8C8EF211FEBDD24413E8CB8869DDFC3F3A60D47DCCD4D728EB6E563F7D96E55A43107A4F96813AFCB323882B8785DFDD5924BD00BBD0DA19621E1F3013C49157B6A2F4106721EBEA0D8621648FC1F49919FC4C1272F07DF7366E217145B8C1BDF871A720A7B0F02C1E58E82621B8FA0214D986DCB965A70FB3E89C179B1BE4157C1537C260B6C28251A6235E0E915D7B1C9F6F00B94D701FDB4F5864DF9A08A6C28BFFA999C7A3E9C3E245CE6CB6DA093038387CD96DA403EF2F3F081BD68ADF93AFB9D7288B3DFF94CFC4EE9938E2E9DCF12494B0F54D276EC016E37A93865E70547E9B79F2D6109F2A3C9EFF300B21E40D2A7105D0EA01249CB012469FB6B0CA0B2F3F0DB4318B07E1A5364E1F9E136DC5905AA60544ADA77CCB8C6D15245A79933E54643DD645ECDE61810CF64F6A7E8ED37CB26BB55EF28A9B87350673EDA350F734289873AE0C5636B79D4C014D0D8EDC17C6C6C3EB2E0F2D8D86CD39A81D8BF1D6B6DB7467E67B6DCE6F982A407AA60481FE63889632820B4F997A75CC6115F3A07B3E760B68156CD16B45A921CF93EDA20EC3BD281D1B40C76485B8FDDF173B3102C439261FC4304A9FEBE8B8C08F7790CB3219D0DE9440D69191B6F9E4B1F606F03E3EAB2C521053176BBEADA4D7567A7D17FDF52B96594D5B1D9949CC25DA4AE6F60BD041997F05C7F1BC25AEDD0B20C15B66371B50CDA998119BB8571631104014C216D6C0D8BA052EEE56CD666F5E9998F8A214FE28BF0B51C19D33F91EF6664CCF75E4CCAC3FD1BB8B94F921F270FA0DF580189A7C5085337EF6764619CBCE344150CB9A5E35E63DD590FE72BFC56ABF1DD8EA215888301568A3CB6F6234A09A4D771558E6516125B660D95BAB84E0C9CAD62B556D940571D70AB15FCD51E1272E98A8C3FA0222ADFA59DE83F9A3599879D045A34C460EF7EBFA331A4B13BAAB823DFD35038BECBEF56C78052C00420EA6FBBD873C4BDC8847DB30AFC7C065E804ED352809A8FB3A32C18F675E17112E75E188394ADD260C75F9ADF59FD010D3BEF0E405B08A26CDB6EE5DF83B557F63FDB783EA86E293B0DD32C476EE08D078D7D5965B9A873A7A11E3E65706ADE4315F6567F8FAA88DDB6C257B892BA05597E95FC00F187E58B83C317CBC551147A1952E1E876B9785C4771F6CE2FB23C597B719CE4A5B83E2CEFF37CF36E7F3F2B31667BEBD04F932CB9CDF7FC64BDEF05C93E84F572FFF0701F04EB7DB639066B04E5E06D0D25CB8288B435848DC45A71540461FE25B95B2E588CEFF093F2A7619483F4BAAE78FDD57BFAEC3D80CA88D4C93B5BDB49B5CAE89F9FC06D180B9EAF7DFF57F0C46A54ADBD97E07621337DEFF7D986EF05E613F5F6C3F2063D4206E5585AE83F0154330F7AC8171EF4C3D21855046547968BF3228AD029C10FCB5B2FE23D0C16C3D69856784A241C2FCFE2003C7E58FED7E22C3B8E60214841F06E718A10FC06BFC145F9DF0B803F2CFE3749449EF229A62C0DF5C0A57B6A076305D287D0C7996415A0F8C14BFD7B2F5D2EBE7A8F5F407C97DF43857FFDC616F45790DF27411F902F3CA47779695B15900F0F5EBCB2057D09F2228D71862F0DFB9FD6DEE33FDBC23B79047EB1B5DB15C400EA605EFEB6D4BA06DAA722C5F681503F4B60DC3E8782956FAC19496E79A864F4E20F5BC8D4EE8702F46B64A26DA5E5830DC957B1C61E1C1CD84216BD97D665DC8ADF77132A8391B44ACB5505493AF59C74099433D047CFFF719726451CFC25B9E19DE329CF0DB043D5294973E534857B94DE710395B34B661358FA84AF35A8A0656B2F8A34B3186AF96E71F63FAE2FD2304109B7D73594EB73F098C31FC8CAFDB6F896428FE9DDE2053DA5199145C0E1ADA533CA5EB6A00CADBAA594590EDEECE8C68B832406842E9A719E682AECD9618B9ED53CAB69C9C3F8C9AD26B4A18A5EF0749C3899A58EB9E535B667D8E3ADBED7D8B5EEB5B0D5547DED5E8C29EE7CF376326B530D74940651F3BCC673165CD71368A3AF07A4777E059502E92FE5B35A3B001C56C39543875E1C8A7A3182754EA74EBD5077AAFB08B61DBBF3A81580AF7FB61EB3248061C6277923A58385DF59BC2972911BD80ADA457369AC13703D8F6AB5F03466C9DD08C6AB78BB615C369AC73201DE2C183299A859E7899803B0354BDA09B69B3B69A5D082A6B35AF7A3D6DB93AC0E6CB3507CADB5940563A1AB6318BEC6E3E514AEEF8A143457AA6BC6085DDDD1B8D021C5A7497782BB02DF0BEA6713B71BC3EC641B306F6FEA9481DD09456804E6787B6ADB72895D37945949C38504F9804327511A9B3F4CB9A909BA5E25B779952D389D61DFCB98D78EB797F6717AC55252B1A966049AC8F1348A1B5BDB28B30ED2673FBB8C553ACBB45B585D9C17E70AA69BFE8EC3669ADB952A45E7DE8BEFF40B0FB2F2EC5B30A22AB9E246EA152822B4D46CD8B45AB754F0A04FC873C1382C4DC0E8B4E9235B495990821A3601E51A1EBD2749D8E057D6E9073C96DE883D64883D7C6B9DD130E2251BBD34B5B23174A3D9D6C88775E731DD71409F839FFAD5478B4C9D6F29EA8E17F5025CBD7B41C07E6B9FBA867FAAEDC7D4C6BC5CEE9FBDECDE49588C12784BA8ADDC9E1510714FEEF9C0FAB3411A2C636FAA498CEA7580818DAE07F93509A953EAD5C9630E62B4C5284A036CB707EA3649D1750EE525F03251AAA70DF72B1852F7B2457273CF7BB332CA0F5DE59FDB70AF8220D3DA0E06FC68B3897014E00B34CA8567E05A0ADA0C149C17619E237463F266FA88CAF71926F43529EC2D66ACB30C128CDFD122628F7300730E608E38802930AD57E051EFD14BDACD9EFDF88C732D9F5E8C74FD5AAA63B0E55B3DAAFD58DA6F1C3AA1653644CE0D91FA3AB7216C40510EB3B01CEA4808F6B13CEE9105E3D098D9ACEC6ADD49BFBAE036E0B015AC167A8B2CE42D74C9A30B7D7446B4DDD229C8B97D8FA1DBFE54351CF507DE0C8F764645503DE4ED0A663DFBB981366183C65D74A273AF548DA7EA6375B6AF6370A65AC774D8C9E19A3694CDE6261BF379D56653493B11F54830BB296B6F1E7553488FC4F3F1C9E94E513DB2E96567194FCC98B35785964F63EA8CB8A8D140115321EA29864C9FF3C2BC7E4F54B8E163D40BD10DB632ED9F50F871E2C6C17A74EEC828CC06616406E1C24B41DC2ECDB06EDA2533BFBADB53B5D27DDDDB264E9B20E1388CD5BC57D2BABF13B3F317CD2173D363745C8B812C3DF22C76851B09A02FDCF36C33F64DFBB3ECCF14F6ACDB26F838EC8291C36E303557ADBA4CCCAD834ECCB27D2AA7F58C56D703AEA627BB7AEEC5767D024D38DA495CFF3C49D75E14FEC3203ED6E2B0E1242CEDD80E51A2BBFE43BF6B1ED3AD573E9DF6AC93A14C6E9A20DB77B2C5935F1E18708B07D269493B982761D035AABD79AF8CA74D04D8C83D1F702530C969B32FAF7F3BD36D9F42769CE4B44541BFFDE918CD5191DF2326E01D6A7D1298FDD992DE5834068FA057E1F4E113AC8A34EE01EC859765D014A8136CDAAC434B061F27F16D08C70312A836B8F9D23EE5BBA6FE126420EF03C197C4FF9114F9491C7C8216E87BEE779DA28F7C1F6ADC29E40D08A8EBADDB6D1635F475CE7BBFB84F62705EAC6F807A95F9D27A83FC2C2360638DE846EB0AF8054ADF825EF27AE3FE18C1D5CFE4D4F3E1D4E380AD67193910BAC2AA5F109A3DFAD9A39F3DFA813CFAE3C80BD746BE7659738EB48FCFDBEB297E6BA6E2482910621B37D3ECEC3704ECEE21A071C4FCAD46E6970402341A9965CD7964CE239376EE21B60BFC7E9EF305500DB8FB492AAB3161B47553579C47C43C22DC26444E6C1631CD2399B328061B2FA26B38D0174EBF6D5F697038D49484593F00631A40EC4A98F05D8B41CEF48E77F9FCAC7DE44A1BB883BD6657B1B3CDA66AFB9EC5A9B7F96433984F360F79B2799296CED0B24D724BBC9F8B5877FA1041290DBF970C2A2DCC362BFAE3248E815FEEB7E769B96A502168F1B6F7BCC1336FF0CC1B3C836FF01CF97EB5136F1035C3752739850C1A0570B112B7A4A30CF487F18FAEABBC36894F7DE61C195E7E3876B3FFAB19EEB15A5DB7DB6F47D07AAC3766C6936C30D570C24443A9952A085EAB76ECB69BC628ABF6D7B5A9FD9692C6F1FA126445944B6FB46997CBDA615345F04670BB6833DFD78158E8E0DEEFA9DE64DFE3E5FE1593B9584B2F127C39EC3D1E563381758859D468AA33C2B30830773590E8C01A103FF5D0E6551EC116843B7E97B4DA46BCF4FD6CF3A445E75736F464E9ED86D550B7BE6B47D468C0F34FF39D3B93B43C961D99EFE11AC3A2F06FE0E63E497E9C3C0083681A5979207B40A19CA21DE83CF5610E88DCEC7617B13BDB3876AAEA63B06BE3B020EDC368B6A37E05E2C03418C437F9659D7FD226A9C01AF88234A84E89A0B580C89BAFDDF519AE6C37499CB9C91BAB812117B8C8C843A0BB8EC2F611761EF173B9229D31890548DAFDB216610C931796C9F73474E326AC809F82DC0D2C175912B87F6EDE45F80C3C68687F8537168EB22CF1C392C0DABFA8865D8DB84C07BE663E3263F0240E16E8A001D7B8A67005A2DB3DAEEC6B11E5217AF30AD2F56179B864C7F1B7B8F2B71647658A0EECBD97F95EC03309F62D30A488CA6E1691852BD0B4FD0B8712DA1680AE870D3D74123CCB530F8A80374461EC871B2F927087A96F68BA50871BC86CC927B0812E18244CD57D13BC4C4331190D36461E3AEEBCDF27F4CE481D2BEDADA999BE3ED2FD11D1C5D678661AC9746FF22A49D94955E7DCEBC2909A2AB59FC26A7DEA6C0B05EA4373AD2D2ADD7C674A8CF37D4FA13F51A4A03E0D87BF4A35B62E2715A0F9464BFB606FAF27C5A469A668618B7A51402193FA5139A63F2618890CF0DD2856A9DFC7F75E7C07AE6BF2AA9F995CAF8846B472510583D83D7A804A69622BF4A36A64F707D03761D78CB48E207414AA0787CC35F9DB4CF756DB252DA77E65D9801A68391A7AD038D4E3C194AEA5B2411A77A66FDC4EF4F17D180510B854D7F8BD7642BA7CA1604665852C878D605AC177A4411C9A015448D87713BCDBF76176A241E57DAEE5B53F72FB54DD414BC8B1FA308825226ECB6208C05F7BD1A0B2830368CDB61F26C8EAA0DB0E15651BFDEBA62D1A4B829A70D643046782F236B60C4CA8757752278E60CC52EF5BEACC7997DD499D3D8D328BBE6FD18BCEFFEC50FEE864CD789D027C511F4300FE3A799DA9FA310DA7E0A27918ACA3B6F417B0BBE05F79236811944E5A81F8FE4C439110F5E33538D52D880CFEEAE3A4B5A5E9C6349404ABB40B532377474456E279D886C95884F22ED1A1D69BDCD87E06E3DA784C8F619D594A7BA875E62F2DED31AC2F4B690FBABEFCA5453E9A7565297793E58291B89EFB72C158BE3B592ED4F73AEF4491F0A57B43B907F555800494FAD3A42D08EEC4549C042CF5A1DC8459EAA37016B0D45D27868D47EE03667359887ED7595C58EC837A89F3881F8FAF2838CF499D0597C9903E304E48922E18246C283AC6CA534415F7A26772C6F5A36F828E996065CFAD0EA07738912B8973D802A4B5B39304E0344CB31C1D45BFF132C0691B6A05BD655CFFA880C6F24B02170227CD19272CE36DD1CABF076BEFC332B841774655C7A48E6E3675854C6097682C1F3DFFC75D9A1471F097E4A63A06C9A113D491E0A56AEA914BCE01700448EA498810D50E8131357A3A4C29688F1B1F34D01180AB195151556E29130D3DC2CA16D231A58DCD83E7E8612B4868C0D5F4081B5F8FC3D4944850E072031454F22B8F872A9621A33282CD30B289DE12CC6C3525056C5EBC4DDFCB3C6465F7CB1A061C80F5F4A88F36683E2C4DF717D8A8F0843C10D6929050576885FB0A3C8ABA2FADA9A10155D2D3C1DF86C711C0579160262BDA61E6CFE12BA9E0AB1B504436D253C7A6DD5671428E2A71350935A2CAF6941850614C811EBB2026C9A117D491E02743B43ACC128E2B396CC6D16A01C741AE3E4B20A34233C8387D58081E972970E08C6913443825498808972910E12C2C134412496C8B1468CC2422D72D9D4635BBF63A14B2F7A5388CB28A1202F8EAA6B448716B709909AD79284028B7A654213A5CC742199BC5A65C279B2A3AD5C415CDB01B88555C4D41859D48C5D74D0AA930B6D6A2CA7A4AE8700447015D2CC14C5632C648851B6478A94A6AEC4455731AF48E84B4A6861AA5FB404401D40B3AEE7E8705D154B1C253DF0B410587246B584897A08C0B85E8EE179103C315D83016CD1A73B6D1CB090BBE691A0EC63871488384C6D6E88775AAFB1B4CB9687C07441F8CD0C394EAA6B05A6736AB6F1810F0D4E24A02F1DE13D1B3E69B8249E22049D99C2DEACE0C62D9CD9D8A17F142555FC10A418CA4E20755A0608A2AE64140622B3865107F765BC321CD616F298B88500AC7A5B24CCB284B56B7608CFC90B18029862792A98EC81CB2B2337CA18225E213C816D05AB0873C412B6088F480AD60F79220B4FAA0E82AB7866D9AE1AF8E3A46A4D8487B274BC371D0454E82A2566D3B476692C83A27CD36197BE7B89D73590FD55BECA3EF260E90C83A2738C5E6A04B5450A76986BFBAE918158493F44E9A4BD9B18BD27062D95C50EAA6CB380A25E9ACE0789003499251B3A655F5D14DA7B6A12F49BFC4275A3A764D243777D2E20E6708FAA63EC0D1B17B9CD41C498C3B8720EB585FD342AF1D3399120C72F3C7DC458DD55467A0DB93B963AB29C88316745A972DDD519E7498BC6C537F72D541CD88D425068FBF838AA0842AFFD549146280EE99181EA384CF114B5297B028E8B2558E23D511D1EE41D91DBA40C10AF96E0009872A3666517DD7779357D794BDDFAFC2F7F803FC092D927707A0C44194955FDFEF5F1631BA9BBCFAF50964E1DD16C47B0833063E95C7D7D4411B04755C88A1A8AEC25C67FE15E45EE0E5DE519A87B79E9FC3621F40238DAC731986444F2CDF80E02CFE56E49B22875D06EB9B888A7DA2B44415FEF7FB1CCDEFBF551B142EBA00C90CD175EEDFE28F4518050DDDA78257D9242050BE237E020CC932474F81DD3D3590CE93D81010665F93A67905152782C0B26FF1CA43D7EBDBD306C7F41770E7F928E0F710066880CB80E80541B3FDFDA7D0BB4BBD7586616CDBC39F508783F5E3BFFD7F600AE50169AF0200, N'6.4.4')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202012180651436_Upgraded_To_ABP_6_1_1', N'DoAn', 0x1F8B0800000000000400ED7DDB72DC3A92E0FB46EC3F54D4D3CCC4195D7C3BC70E7B2664593A56B72D6B54F2F4C6BE28281292B86691D5BCC8524FEC97EDC37ED2FEC20224C8C2FD42822C5266E84545009989CC4422914800FFEFFFFCDFF7FFFEB88E160F20CDC224FEB03CDC3B582E40EC274118DF7D5816F9EDBFFEB1FCF77FFBEFFFEDFD49B07E5CFC675DEF25AA075BC6D987E57D9E6FDEEDEF67FE3D587BD9DE3AF4D3244B6EF33D3F59EF7B41B2FFE2E0E0EDFEE1E13E80209610D662F1FEB288F3700DCA1FF0E77112FB6093175EF435094094E1EFB06455425D9C7B6B906D3C1F7C581EDD6C8E93F5C68B9FD0C73DF8F3224DFE17F0F3F2E709849B3F9DA6F0FF9F49FA63B9388A420F12B902D1ED72E1C571927B39ECC2BBEF1958E56912DFAD36F083175D3D6D00AC77EB4519C05D7BB7AD6EDACB8317A897FBDB863528BFC8F2646D09F0F02566DB3EDBBC15F3970D5B21632B46A15E97CC857C2D8230FF92DC2D172CB277C7518A2A96BCDF2BEB41EDD8AB1BFCB6409FFF2748933D28987512FFD6E8C99BBD43F877F0DBE2B888F222051F6250E4A917FDB6B8286EA2D0FF2B78BA4A7E80F8435C4411491E241096511FE02728E80D48F3A74B708B893E0B968B7DBADD3EDBB06946B4A9BA7316E76F5E2D17E710B977138146FA44D7577992823F410C522F07C18597E7208D110C50F28FC3CEE0BA02B117E714C6972F748DA06AA61C91EA262B903E843E403FEA7650BBA194968BAFDEE31710DFE5F71F962F5EBF592E4EC34710D45F7087BFC7211CF2B0519E164087EB2BC8EF93601054171E1AC890E59902D5E1C18B570E705D02A8A1F17F7A51A1EA17FCD701AE9347E01748BFAEC22D173F410DAB7E730A6908ED539162EB40699B25B8E32884CA7DB6390A8214642ACEBF71C1F70A9D469D0E5FFCE100D5C734F989C6567C9B2870BD3E7CE144C468462384211A240707070E509DADE1AF2C893D68AB5AD80EB2792B7B755CCE17507D3DD77D7DBFBF9DA69493D747CFFF719726451CFC25B9A9E4AB9EC5A806D91ED7BE9CD4E689ACC105D9825039183696D608223E4AEFD4F6FFD51FAF7F379B6E2C915FA54FC750297282CF876FACA19C83C71C427262EBBF78991C96669C6747375E1C243168F4E6639244C08BADA9B848C3242DB5064B057AD7F418DAD6B09D7D52E0399B194B600646D1D8CE7C7A8A3DE86357DF6B643A5B236A14824CF8FD69728647E861B8333C78410711683D4E1773299649FD55DF5317FEFFB9F710DE95DC5253B35C5C82A8AC97DD871B3CEC845A74CDB53C4D93F56512C974986D70BD4A8AD447FC4E6C5A5D79E91DC8BB0D2E47C36A1E50625CF5CF618653986D224F87CBCDA2EA2CDE14B9C6497183E902A4EB30CBD4CEBD1B546E0D48B9BACD546684AA69604594F51B73C0181175A3DAF2B8B0217839EFC49094B026674D7A5E17B88A97F432AF3A9EDB5D4CD36EC7976492361B94EE1C6017A34C00711E6BA3186B9564B61DED6DAE136AC2383C7076C167EA8753239005A271C9156DCDBC7315804E46E004ED0025F1295C5CC371B802795E2A8466DF68B38183B42CD8C32DB33D2124671B4A8B8F5E0688080543B05AEB2BCADC4D1218A05077846CB86E5A6C15455991D30A756D172A602374DCA411FAA4F70D7B5EA469164C2F7B09B59A2DD60C377D2C719F659F4004F2EEA1C90A4C9B7D90B2A534F2A80FCB7E4D82F0162B7B3718ADC81F77E0B4FA707CEFC5775A4FB1AAFB398475D2A73DB2E5EC1132622AB9E246E21528327C52CE4C04F7ABC256DE630500CE407AEE7476465FB9D82ADE2AB041E8F9F0AD8B1DE38E9E6AFDB362B538C8430AE39A6B40B8198A7ABC97A1AADCCDC9A07CD6F6C68386301B11F908ED3A3CCFC14FDD2AD54D7AC5B734BC0B632F1A069B61CCFCAD939C27FC7384B64722ECCF5E76DF7B708012780F185B79322B64DADA3A33B0F16C8A685C4326683DDF3437A72B8193C71CC4483B35F95D8EF6F0BAE6A275CC85BB045EA64ED97392D7DA5B5AB03CFA44181EBD6F084DD335D342EC1C721595DE215FBB937BE820FED857E0F1E82683A57E8ED5E1199AEA761E831BF36769C2743EA2716AEAB34A65AB04683786BE42E50FCB86FED39E08C050A17BBACBFC5996ED58FF020D4DE1E9D78D5F12DF8BC27F54F641D07E8E563F0B5BB0D318B7AF742DDC387F6719EC2222AA73247D0EC93FEF90BCC0C85D8147ED82566728118C491BCB313A4E35737763341B9F7E60BC506C0E96628EBDC537BF1F1EFCF1473F33C46CB33436EB3CC91BE6981CF322EB677B6CEB6985DFFE2CC2C03E204F74D94DF4DA76F257878D6C0E6FE91121349A5E3A3ADDD928A6069D9B34FA2DBAA32C03EB9BE8E93F0A3809C321AE3B87EDB2BBCA5D57277B1F2BF000B87365A40A6F2B58AA61658294C7085F1E1EFCEEE8E46F540420181065ED530C826C3A33C4AAB8C9FC34DC749F2D5848BFC0CCE12E46BDF3296BB6E53BB0E5E33613DFD23B2FC6AB58D8AD1C6D56E8CC03D926DB134198D7BD8EED09626AD71300ACA0BADA276771B1698D906EA3631E198E47C685978298D7658D9240EBADB2FBAF771772EF29843407B127191052A5321CDF875100955F98C5C0DA9DEB6DED6D0683B41297BD20AF29CA5C50515D8DD73E68660F59EB7BD76A3EB8680EBD9B265C14F97D92D63B055CF339D9E2596EB09E657FA690D6E7EE1DA1A1D671442010D99E10506F69143CC98EDD6F630622517464200291ED09018D8581F6F1102B0DD4F04B714FAE4C154BC629DA1D433BB6E525E423FA1BB1EBDE73E6CB27D0840555811B37F73C9E27E91A6DBD6B0345FD1C0FED63127A8E07595748B57C17D937B71E1C56731ACFBC0292C3102E289021BFA62A6DD7116C19B7E4E12AD8AE74083D9153475562A823CAC4D491156CA96375414E225F93A193AD202696AB65BD726C5C0E71E27E8985AAC4D049948949242B74CAC8AFD8E4C627D97A77CFCD27E979B1B8751310F3B47B5ABD647D6C6938597B61A43F63D5131D48A510D7F02EAE2E8FCDC949AFDD71BD9587B65B01EDC4475B1569BC0BBC175E96FD4C52D5D66B4F519952C8C7497C1BC2718986826627E0A5935CF4BABF972003F92018BF24FE8FA4C84FE2003968DF73DFD6553CF27D380E4E21B740C05EFDDD62EFF12C6B287292937F719FC4E0BC58DFA079B6EBAA4A473A810CAB4EF70EAC805FA0042EB8485A6F06380C71F53339F57C38A13A12C059460E2517F08EFC3C7C00F32A6F5EE5B130222F5C8B5DFE721D51976FBD7DE233E7E89365B62B10DD7AB3822D5E6FB26512C27A5C6F964025EB4DB64C4C5DEFEBCD12B26ABD29AC2026B6F37AF34B72174A969A15025CCE52577E96D05495B95EF996B0252B5FB64C4C986EE5ABA2AE0C9ACBE9C2C50C45E557312D55912D15781B4241C8B606434B5D2026A729ED1C1128AD4EDBAD9DB2F19C3D24C7B5B33CDD523208808355A301A6615E661BF7AE338254DAD2B6A3A96C3C8FA6118EA65232F0DB431828D7763D05086ACC031CB9B4D27693BC6C99B2CF19D923D5751759DDE336D486F92C6518E10EBFDAB9E73A7765565985CA760A4BEFE8E8B91B17E7578DB558DE8CD4EDA8B918C67C6C5032DCE653EAF329F5C99C6CECEF94FA14EC62FBFC0EC1ED71CF2DB5A3EFC750258FD21898647F37E9901AA43DAD66A15F1D4315424311E35498F6172E923EE67DBC5FDAB7ECB27B565942D9FE195FCA85EB05555CEFA16114925D34BE544663979D34D5035A18BCE0C52CBA444697EA4DACCEBB7B18876A7F4F524546AED11E9F559CEDC8F7AB6C9776A136DC7C0E5DC871ED2CDA56C6FDC3F887A51D7598C6386802E23CBF3EC3F9D57E87EC080ECFF5A6B5412361CC564D8EAB955573BA20711EFBAD0DDFB77450CBF47CDF2319F255974B901167E64AF70B0EDE7234574555C2C27071192BCBD52DE62C8230479C2DEC422BC414C7BBF5049D1C0594EEB222C53546AABEB65746C926DFF9F2A8092C2BE66BD55A8D93BF819BFB24F971F200F4AB6D5C37DB231BFD02161D7757E39C98EE86BBDD0A1C619A61BB87D29C2E848D96A2B6636405E2C07019C78E14A2E9AF335E4AF3E0061475DF713788D0EDDE40EFB4FFBC961A11F2918A8C3A6E885CA9CF79BE218B061CA02EA2361D5F87A6A71D41909A1F38D7749B6DB05A53950B5AEBEA770A5E8B14D660E5C4198CF9826FA36903B3EB7B1A0E3F33AF809F827C78BCAEF6766B9DEBDD127E065E0015775A5E4C774FBB581376E1A3E7FFB84B93220EFE92DC5CA4615225E49C65A79177973534A9AD040524DB13C2EC642920BFA1A4A227281FAC5B4F397B83E557804E60D75349F273B928F3443F2C5F732CA5AA7E0451F2B3BA88A3697278A06EC356D7A038BA491E00D3E68506C5E7F0EE7E5BF9352FDC4A8C0AD1924FC856E13C3BA996B30E946691558FDE8620DB63610E2BD552F7912B8ED9A261E1F74D40553F54576F1CFD9AE92D782E4E6FB3E3BBE2790D0C7158AE577E8219CB574579318429CBFFE6A5B18CDF6CDD93344DD2A6F24B75E553B83ADD8E358169D44A52140EB793231DB6E3E1B9BB7CD356A296523A8B1FBC280C641B3E66E2C340B677BB9809B29CE73238086ADF422C5209366A07CD6C3AC0EE9E00E51B3DA52563CAB6C4CD17B8F9EF9AE6F18F38F919A377E4D3D88BF0F145DCF60F755B74790A08BE1579D3E0AD9E56E2DA1209C5EC2C68346E24A1F82E265008D2AD0DAC9C7AA578E0DC633CF35C92750F5B70915D859BB36FF594C1B5E3DE39C899A5FC6F8BAA68CBB357A679C237BFFFEEBDF65FBF397CFBF21538F8E36D0BFE41EDCAC3B8008472E9A6929F61EEDF430CD001CE133F89087B75A0B158DFFE4AF8591A3CAC53F142071CDD7DB4A15B686CDF7912E3C90049EB01A019155F304500D158C2F304F1B08C31344D3456105F28C5B6D258C00B2FCD432FE2DB690C6099B7BE89C0F17D12FA602BAD973A091CAD6FC2BB22292C9A7C850E7570012013634863F444B4D448AF6C695EFD142D6388EA1A495F82204C819F9BB75801F02DBF078467A353841AC75700552A306F074D28CE67221B695408DA5E38FE1E49066BD4E77B5C6414068DDA5C81F52649BDF449C03BCD9C59B7F82B001B68D46ECC5B7EF4824BF0F702645B6CAF743AF73DF6B0474774EF954E812EBCA7355451840DD24A36D428C66992DE84410062A2895EC2B4BEBED289B7D221E4EB4470154C91A71173E91F214388621744338DB44B65A2AF9B14B0462BF75274287E9214A404357E127271E0BC46B6D0384A7F421F695B5B1716A882447C7F0E753A02953889ABDCEAEA4E3DA2ADD6E294BCC0C19E24F982A2C44473AD31299B7F4F43D43641F1AFA6A9CE34C459B18143174E855FE140F4AA3552D35AA33F1831082E512C016AD30A2A43761BD2EA74A851A793C70D1CFF9E90713A877B73977A01E0A5F5428313FA3AA58BBE02295C8ED3CBD2D73A23023B7AB6869324B20904D2D73A33020DD69FD04DF9E93D116DB4534BFA00676268B71E206F28C6BED699128C8C1D62AF750605F99CD8BF4432AD1584006014CA3ACAB2C40F4BB9D6D199A7D85B877E1D0D2DC15D331F1907F4240E16D5D68A49E36BE6DA5BB4DB236AB75C604727F4E188FBB0FC178E2196789B8789A478599487744721CA6F7115BD5A1C95C7B9A0A9F332DF13ECDF416E07F4974B700BD09B4B95CB879E080AE39CDF8909633FDC78518B8E31B00CF77510AD0D56B6E413D8801865FEB490AF09394C5331750D110C87750C7DBF4F68B791D257C6BDE988A5D6AB5B2BD49E6ED842EF359827ACF8663D1B4EF3CD643C79D5A70636A39E56BAA800643C20DACE06E694C807887A688E74981874755723C6401F2C060F0D606743089FD63C051E8AEEE16B939AC39F322D55B6120D0E61039B71A1C6281804CDF9D5B1A9BD514F06D07123199AD041DCA4B01B1526F69BAF6BF2AA9F995C83158D840A4CD4EF55A70C4914693C6551C4A4F243AC9D0E1B706F081536E0909106137046A1C670345E93BFCDF4986BA553E415D2A0C175992753AACC8329B19475036BB19437B66A0C01ED4C93E58F30CBD4C3E015E9AD6AF047A368F538D8DBE3036526B8046AA8C3E54815B5FD1F400DB57C31A1A17A9A7B679A473EE62093BFF06507FA98E0404651F48E044309BEEFBD17A513306200351374DA046B9DCBBA43B5222E15524B5474BF905AC1542B1FE9A31E1A984233D84151780A06D3169EA126A8992CE8DD690E79D59352CAC25B9F3A6A8EE89AA861354740C1509A2360A8518886BE9066779AC3DD73A514B5FCCAAB8E3A24BD236B58459291319436C9F86B825F7453D00EF5AA7A77482D74E611A2DDB948CC93470C25380BB63F178966C460CA46757A1A2ED205F17E9452A217A2C7A476A7601782A7AB1872B6558C83D7ED354EC09EA1D44EC08A69E85EF5469852CCCC8361BBD337FA79328690EA9996FE948BE2C2506A45F5781A0AD5BCF5A61425FFF05B0B97480653A02103581FB64B43E908DBEDD1AB09A2DD282CC05614298BD9B057C01CDC2797513080BEC8183A95B04049BF495880ADE84C73761A1690513094E64C382C50D26F1C1610D676A643BB0F0B28C9184A9B9E4558A0EC89C9FA8DAD68AA4D3DF9D31C39021D4475865ABFC9D8339432B65CBFD5CF08EE44F704AF36C8C4AD7AC2612BF0FA751D737BA678F761306326A76100E59133762A3E95E05D0D8DB4357E556B2DDAA96F25A761382D9AB07FC5BC7EA291B422E3B5B5F6D8E7B43A579EE19351C5FC3441BCEBEC53D98B341A299B38E5AD5568F78EB98690E134EA5938E7BA0B2565EA607CBBE4562D44F7C59AEB9FE9F5943C427C33E6D892F50D3B34803E1BCAD28412F68EDB01741AA7A626710E5B1077DE912F547EBA29AF137914DD500C871FBEBD26C3F729B22A88E0C3A55D0DB980D3C297E42E5B2E4E9A2B0EEB472C7099408F6920F4958502485485EA0A340D48D1E19F1088604B0E7199C13781DC1266750CCA002E3EFAD682215A1482DA5A44D84F10416DDC2A1D082A235F0087CA593702C61E579101654F7558500ABFEA885D09DEE96341D2E7844410D9C35D1A805F20E6C21377FA6883E68072E8D7D58CE15D410B6208F3AA34361AB8D43D6302B8FC43331600C9BB9275C0F97B993588D88CEE6A8B9C4722AA670DDC04B016281980E4C10962781A78B21E1BF510B97CA2C695E76CD01827A28B21E0CC6E033038594B0C06673F198091F1629B73A001A218FAA6F2E09FF91141133C0664A2EE55333940232EE1D737658C6ADEF634951BF6D594E26B1C6D03A03ADEB1758C38871A998C67513D2D70D2DB1401A5170066C0082F5801925AC41802D6D863E915F90C78C20D563B52DC451D0BA2A9C2B1525FF0412DCAAC2EB669F822F5FBB8D542CBAB6CA498421E0BB5AE804DCC994DBB4F16DCD634D43241DD5EC16F7E6DA0E7B806D92E59AEBA8EC394FBC6577AE8796372A98746261623C11CB75C443A7D682128F5A50F02A958DC1241B1C1EC9E08A2CFDC2A43C163B32B2108E0DB2560770E12AB27EECE01110355F5155D543413B18F59A1AA98A7822CE29D78B9EA9491FCA9770D2735C7E4A51D961F9497F0B25A431BB2537EBEDD54522DF8283F732DE0A1E1016DAA87FA23DA44EF04CEA48279FA13D936A05B30AF3A6588576B3CBBC862792F885A2296E0D5A4820D240041C7C915A5A31E130917D26ECB923204A40B92325A30409082A183D2960164AE808C01D27C029E74513E813D0344D9037D3180DBB5947141BDBDC97742BABD69CF0FE966666F4CC1F116192B0467E70454D3A7E75A749B3EF4C600A86974D3632AEC26E9B6343790275D941D68CF0051521F0185A2D90D1B70844CC200C101239E68FA88917DA7E993414C7B4C9F9BCE6E5D6C497FC5E75F7892B91330F6BDE60EBC1020644B8116FDE6CE6B08BAAE3ED341912E3DD541502F14991A4A8FE68D3B76206380D9A4273D9C60CF8081263D71F6BC8C0B16939E3AD1DE9E1F434E7A5CEAB78C1F6653803441DC9E0B834E01822C64012374B9CA542714D9CA44379A7D0B053B14F9C93D6884209556CE0A335BA148B96DC78A812C06930F2A67833E1826C9196DD7FD61C25CB2E446391B2C6CA62E13B21D6386B49CDA879E793659A5F251FD334DE623FA29DC2D53B0D0347D8F4751EFEE19B3B47E7AB649096BCADEEFAFFC7BB0F6F087F7FBB00A7A43A6F0222857106575C1576FB3419EE1B625FEB2586D3C1F76E7F85F57CBC5E33A8AB30FCBFB3CDFBCDBDFCF4AD0D9DE3AF4D3244B6EF33D3F59EF7B41B2FFE2E0E0EDFEE1E1FEBA82B1EF53731C9BC0D66082D6D8BB034C297A452600A7619AE59FBCDCBBF1D0736CC7C19AAB264B8093EC55D658D91C375EA2F5B665DD02FDDFE4DC1D27EB8D17972F1EEED114E0E8EA690AFFFF99A43FB6B9720C8A2DB361DD3BF45049C90A406886BC296CBCF2BDC84BEB70329121799C44C53A96674CCA5B6FDFE026616CBF9A43AA737D4938B2FC5F399455F5B20AFA4183A20ACCE1E167983870E4777368171E92715EDA41121AF9DD1CDA25C88B34C689782438AAC01CDEC923F00B6434AAE7AF49884C510B989F8AD4AB267321DC6DB139ECE3288443E06CD3BC774A42E60A6DE1F23227BF9B43FB98263F911A97090B2438AAC086A3C82E0B38D97C368775B686BFB224268F9151B64050DE0EBAD84E886B5848AACC5846D69E9114F19D87F67E9FB1A2AC25DFE74C3933C1B27383D1CCC12436F7377DF009D2F6F388018C7E261488AE7AAE8C04D17CB4827394DE651C9CEAA3C5049742D7A14C3EA326B8E6AB39A473E863C076BC71A50ACCE1219F5B088F2AB018AED9D18D1707490C5801920516935D1A26D52BEBD454D77CB518E668012E9C97E8124B88629BA73955BB33F3214B4CE9CF8E18A5FE18D8124338FDD813DCA9228AF8099D2D33872A788B89046CF054931CB6BD4BBD5B8D1C5217BB6BE1D0FA57FFE4B58F2EB1D0BD30DB449E0020556061F7E34D91F3732EF1D9A2B74D7098E92BF1FDD98F843A5571B0D150ADF43A0F0909987EC68560D96ABD6075177C7061CF47E4170CA68102ACAE1C84C96963453E4BC7F6ABB536D2FC90E8245FE919DA573641B93FBD163F9967AFD23A003D39BBDB6B39281D94DFD651C23AAE9F38AFDF82963C1CC8381B7E1AAEC33276D387AA68C47A96A1FFBFDDFE939D7CE92EFDF36424EB6EAAE3FD465B87D185B17C5E4B7AA726A812EAF82D10673584840F6B345ACE2FCDE67DEF134B0B414A5BF66369BADB07E70BD4AC4A3BE1C292CD670BDAE8DBCE28EAD417A169600A6D195D6217DAADD2297C899514D7688341CC0C935B98E4D09F97756F6B543467A49C5916024F1BF3A26CDE8F8DA9B009B483F86E0D8D8B6091DF6D9771D47B9EFC7A4EF9DCA70EB68B25E2567D54A16DBAFC192E0CE9D5EF50638DC6D77ACCE9C0F4B921B27D7659A6DC965E03F82958166CBF9A43FA968677D0418C04E098A25D06E1EB9FF21128AEB193151F96C2672FBB17CBA72A6929231EACA07864168338603CCCC4BC12DE576833370B21F463225CA72C4D2351CBBDD37AF29883186D7AF1194A4CD19892AAFA4D0ABB045EC6EE0ED6DFC69F76BA23A3B5BDB5AF3F6B25BAFDCFDE62194179FE2152E721109F1D33D517AB204A98793791208AD27C9F433272887348E6198464E8DB4A07B5A557DC099312670B7B2A8634769B5A53CF9B44BAC4E2A8073E7A459DF2C0DFCCA1FC153009AAE5876137C366DBF20C6C0B7D47687FB685BB67D4DEA8E841F4B4B544E015F8585CA9C57CCF2DB06CD755A87E2D121ED2B6A44D889687C996B5817A9465607D133DFD47E14568E00A4EA9692BEF2274BD020F803F17B0FD6ABB76CB448B37AB38C2C9A31F15010884F0B842FBD933134F9F76B18ED9C6AA2E711FC6DE72371077B3BD7A7063F7EADC1CDAED6F5E986DF06C4DA4D644FC52437F9644F8E283BD0531033376CB51BF7D4AC58125EFA1CAA1B0BC60218ACA7713E59A479C401C438E3607236D7AA3ECC2430F87B190B65F2DB42D0958BD4DF817E05410E6B4C039063DDB40EAFE3C1BEBD7F2C0C305FB7C539B330F1C90E95942C1BAC2DADEFC9942B4BCBD693EFFAA23C1E9BC8D9C40037D1BAFCE5A7BB6DC410A310B4675FCCA4EA648F5262D53EB38072753310B26713AA6EF7571CB75F090EBDE4FA009D4B1AE1C516013F14AD75E14FE43143062CBA6395BBAF7F657E855629F9D7CEBAF76EB865BAF88727EDD803FCF6B1039C4790D3226CFABA545AFAEE2ED77BE6F61D1C5CDFADA8BAEAD2CC2AAB2C2DBF236D04FD65E1809139F6575CCB11C15F93DE463BD9B24C88711D7B0F37B78DEB4E188BBB949CED1B67CEC3EDBAD8A34E680341F6DE2755906471017AFABBF5A72097AA1B721D432247C3E8027A9624FED25C840CEC317145BCC0289FF2329F29338F8E4E5E07BCE4CFC82628B71E3FB50434E61EF4120B8DC51506CE31134A409B36DD9520B6EDF2731382FD637E82A788ACF64810DA54443AC063CBDE23A36D91E7E81F23AA09FB6DEB0291F54910DE5573F9353CF87D38784CB7CB90D747260F0B0D9521BC8477E1E3EB017AD355F67BF530E71F63B9F89DF297DD2D1A5F3592269E9814ADA8E3DC0ED2615A7ECBCE028FDF6B3252C417E34F97D1E40D60348FA14A2CB015422693980246D7F8D0154761E7E7B0803D64F638A2C3C3FDC863BAB40158C4A49FB8E19D7385AAAE83473A6DC68A89BCCABD91C03E299CCFE14BDFD66D964B7EA1D2515770EEACC47BBE6614E28F15007BC786C2D8F1A98021ABB3D988F8DCD47165C1E1B9B6D5A3310FBB763ADEDD6C8EFCC96DB3C5F90F440150CE9C31C27710C058436FFF294CB38E24BE760F61CCC36D0AAD982564B9223DF471B847D473A309A96C10E69EBB13B7E6E16826548328C7F8820D5DF779111E13E8F6136A4B3219DA8212D63E3CD73E903EC6D605C5DB638A420C66E575DBBA9EEEC34FAEF5B2AB78CB23A369B9253B88BD4F50DAC9720E3129EEB6F4358AB1D5A96A1C2762CAE96413B333063B7306E2C82208029A48DAD611154CABD9CCDDAAC3E3DF35131E4497C11BE962363FA27F2DD8C8CF9DE8B4979B87F0337F749F2E3E401F41B2B20F1B41861EAE6FD8C2C8C93779CA88221B774DC6BAC3BEBE17C85DF6A35BEDB51B4027130C04A91C7D67E442981F43AAECAB1CC4262CBACA15217D78981B355ACD62A1BE8AA036EB582BFDA43422E5D91F1075444E5BBB413FD47B326F3B093408B8618ECDDEF7734863476471577E47B1A0AC777F9DDEA18500A980044FD6D177B8EB81799B06F56819FCFC00BD0695A0A50F371769405C3BE2E3C4EE2DC0B6390B2551AECF84BF33BAB3FA061E7DD01680B41946DDBADFC7BB0F6CAFE671BCF07D52D65A7619AE5C80DBCF1A0B12FAB2C1775EE34D4C3A70C4ECD7BA8C2DEEAEF5115B1DB56F80A5752B720CBAF921F20FEB07C7170F862B9388A422F432A1CDD2E178FEB28CEDEF94596276B2F8E93BC14D787E57D9E6FDEEDEF6725C66C6F1DFA699225B7F99E9FACF7BD20D987B05EEE1F1EEE8360BDCF36C7608DA01CBCADA164591091B686B091582B8E8A20CCBF2477CB058BF11D7E52FE348C72905ED715AFBF7A4F9FBD075019913A79676B3BA95619FDF313B80D63C1F3B5EFFF0A9E588DAAB5F712DC2E64A6EFFD3EDBF0BDC07CA2DE7E58DEA047C8A01C4B0BFD27806AE6410FF9C2837E581AA38AA0ECC872715E44113A25F86179EB45BC87C162D81AD30A4F8984E3E5591C80C70FCBFF5A9C65C7112C042908DE2D4E1182DFE037B828FF7B01F087C5FF2689C8533EC594A5A11EB8744FED60AC40FA10FA3893AC02143F78A97FEFA5CBC557EFF10B88EFF27BA8F0AFDFD882FE0AF2FB24E803F28587F42E2F6DAB02F2E1C18B57B6A02F415EA431CEF0A561FFD3DA7BFC675B78278FC02FB676BB8218401DCCCBDF965AD740FB54A4D83E10EA67098CDBE750B0F28D3523C92D0F958C5EFC610B99DAFD50807E8D4CB4ADB47CB021F92AD6D88383035BC8A2F7D2BA8C5BF1FB6E426530925669B9AA2049A79E932E817206FAE8F93FEED2A48883BF2437BC733CE5B90176A83A2569AE9CA6708FD23B6EA07276C96C024B9FF0B50615B46CED45916616432DDF2DCEFEC7F5451A2628E1F6BA86727D0E1E73F80359B9DF16DF52E831BD5BBCA0A73423B20838BCB57446D9CB1694A155B79432CBC19B1DDD787190C480D04533CE134D853D3B6CD1B39A67352D79183FB9D5843654D10B9E8E1327B3D431B7BCC6F60C7BBCD5F71ABBD6BD16B69AAAAFDD8B31C59D6FDE4E666DAA818ED2206A9ED778CE82EB7A026DF4F580F4CEAFA05220FDA57C566B0780C36AB872E8D08B43512F46B0CEE9D4A917EA4E751FC1B663771EB502F0F5CFD663960430CCF8246FA474B0F03B8B37452E72035B41BB682E8D7502AEE751AD169EC62CB91BC178156F378CCB46531DCB7DAD68CCE22193099C759E8B39005BCBA49D63BB7994563A2D683A6B766F9ABD3DCFEAC0420B25D85A51593016EA3A86116C3C644EE12AAF484173B1BA6698D0D51D0D0D1D527CA67427B82BF0BDA07E3616610C13946DD8BCBDA95386772714A71198E3EDD96DCB8576DD5066250D9713E4330E9D44696CFE30E5A626E87A95DCE655CEE074867D2F635E3BDE5EDA47EB150B4AC5D69A116822D3D3287A6C6DA3CC3A489F00ED3256E95CD36EC17571769C2B986EFA3B0E9B696E57AA449D7B2FBED3AF3DC8CAB36FC188AAE48A1BA957A0880053B36DD36ADD52C1833E21CF05E3E03401A3D3D68F6C2565410A6AD884956B78F4CE2461835F592721F0587A23F69021F6F0AD755EC388976CF4D2D4CAC6D08D665B231FD69DC774C7017D0E7EEA571F2DF275BEA5A83B5ED40B70F51E0601FBAD7D021BFEA9B61F531BF372B97FF6B27B2761314AE02DA1B6727B5640C43DB9E703EBCF0669B0BCBDA9A632AAD7010636BA1EE4D724A44E0958278F3988D146A32819B0DD4EA8DB5445D7999497C0CB44099F36DCAF6048DDCB1629CE3DEFD0CA283F7495856EC3BD0A824C6B3B18F0A3CD26C251802FD028179E816B29683350705E84798ED08DC99BE9232ADF6798D0D724B2B798B1CE3248307E4D8B883DCE01CC398039E200A6C0B45E8147BD472F69377BF6E333CEB57C7A31D2F59BA98EC1962FF6A8F66369BF71E88496D910393744EA4BDD86B0014539CCC272A82321D8C7F2B8A7168C436366B3B2AB7527FDF682DB80C356B05AE82D7291B7D0254F2FF4D119D1764BA720E7F655866EFB53D570D41F7B333CE0191541F59CB72B98F5ECE706DA840D1A77DD89CEBD52359EAA8FD5D9BE8EC1996A1DD36127876BDA50369B9B6CCCE7559B4D25ED44D423C1ECA6ACBD79D44D213D12CFC727A73B45F5C8A6979D653C3163CE5E185A3E90A933E2A24603454C85A8A718327DCE0BF3FA5551E1868F512F44F7D8CAB47F42E1C7891B07EBD1B923A3301B849119840B2F0571BB34C3BA6997CCFCEA864FD54AF7756F9B386D8284E33056F35E49EBFE4ECCCE5F3447CD4D8FD1712D06B2F4C8B3D8156E2480BE70CFB3CDD837EDCFB23F53D8B36E9BE0E3B00B460EBBC1D45CB5EA3231B70E3A31CBF6A99CD6335A5D0FB89A9EECEAB917DBF50934E1682771FDF3245D7B51F80F83F8588BC38693B0B4633B44896EFC0FFDAE794CB75EF980DAB34E8632B969826CDFC9164F7E7960C02D1E48A725ED609E8441D7A8F6E6BD329E36116023F77CC095C024A7CDBEBCFEED4CB77D10D97192D31605FD02A8633447457E8F988077A8F54960F6674B7A63D1183C825E85D3874FB02AD2B807B0175E964153A04EB069B30E2D197C9CC4B7211C0F48A0DAE0E64BFB94EF9AFA4B9081BC0F045F12FF4752E42771F0095AA0EFB9DF758A3EF27DA871A7903720A02EB96EB759D4D0D739EFFDE23E89C179B1BE01EA55E64BEB0DF2B38C808D35A21BAD2BE017287D0B7AC9EB8DFB6304573F9353CF87538F03B69E65E440E80AAB7E4768F6E8678F7EF6E807F2E88F232F5C1BF9DA65CD39D23E3E6FAFA7F8AD998A23A540886DDC4CB3B3DF10B0BBE780C611F3B71A995F1208D068649635E791398F4CDAB987D82EF02B7ACE174035E0EE27A9ACC684D1D64D5D711E11F388709B1039B159C4348F64CEA2186CBC88AEE1405F38FDB67DABC1E150531266FD0C8C6900B12B61C2D72D0639D33BDEE5F3B3F6912B6DE00EF69A5DC5CE369BAAED7B16A7DEE693CD603ED93CE4C9E6495A3A43CB36C92DF17E2E62DDE94304A534FC5E32A8B430DBACE88F9338067EB9DF9EA7E5AA4185A0C50BDFF306CFBCC1336FF00CBEC173E4FBD54EBC41D40CD79DE414326814C0C54ADC928E32D01FC63FBAAEF2DA243EF599736478F9E1D8CDFEAF66B8C76A75DD6EBF1D41EBB1DE98194FB2C154C309130DA556AA2078B3DAB1DB6E1AA3ACDA5FD7A6F65B4A1AC7EB4B9015512EBDD1A65D2E6B874D15C14BC1EDA2CD7C5F0762A1837BBFA77A937D8F97FB574CE6622DBD48F0E5B0F77858CD04D6216651A3A9CE08CF22C0DCD540A2036B40FCD4439B5779045B10EEF85DD26A1BF1D2F7B3CD93169D5FD9D093A5B71B5643DDFAAE1D51A301CF3FCD77EE4CD2F2587664BE876B0C8BC2BF819BFB24F971F2000CA26964E581EC0185728A76A0F3D487392072B3DB5DC4EE6CE3D8A9AA8FC1AE8DC382B40FA3D98EFA158803D36010DFE49775FE499BA4026BE00BD2A03A2582D602226FBE76D767B8B2DD2471E6266FAC06865CE022230F81EE3A0ADB47D879C4CFE58A74C624162069F7CB5A84314C5E5826DFD3D08D9BB0027E0A7237B05C6449E0FEB97917E133F0A0A1FD15DE5838CAB2C40F4B026BFFA21A7635E2321DF89AF9C88CC1933858A083065CE39AC215886EF7B8B2AF459487E8CD2B48D787E5E1921DC7DFE2CADF5A1C95293AB0F75EE67B01CF24D8B7C090222ABB594416AE40D3F62F1C4A685B00BA1E36F4D049F02C4F3D2802DE1085B11F6EBC48C21DA6BEA1E9421D6E20B3259FC006BA60903055F74DF0320DC56434D81879E8B8F37E9FD03B2375ACB4B7A666FAFA48F74744175BE3996924D3BDC9AB246527559D73AF0B436AAAD47E0AABF5A9B32D14A80FCDB5B6A874F39D2931CEF73D85FE449182FA341CFE2AD5D8BA9C5480E61B2DED83BDBD9E1493A699A2852DEA4501854CEA47E598FE98602432C077A358A57E1FDF7BF11DB8AEC9AB7E6672BD221AD1CA45150C62F7E8012AA589ADD08FAA91DD1F40DF845D33D23A82D051A81E1C32D7E46F33DD5B6D97B49CFA9565036AA0E568E841E3508F0753BA96CA0669DC99BE713BD1C7F7611440E0525DE3F7DA09E9F28582199515B21C36826905DF9106716806502161DF4DF06EDF87D9890695F7B996D7FEC8ED5375072D21C7EAC3209688B82D8B21007FED4583CA0E0EA035DB7E9820AB836E3B54946DF4AF9BB6682C096AC2590F119C09CADBD83230A1D6DD499D3882314BBD6FA933E75D762775F634CA2CFABE452F3AFFB343F9A39335E3750AF0457D0C01F8EBE475A6EAC7349C828BE661B08EDAD25FC0EE827FE58DA045503A6905E2FB330D4542D48FD7E054B72032F8AB8F93D696A61BD35012ACD22E4C8DDC1D115989E7611B266311CABB44875A6F7263FB198C6BE3313D86756629EDA1D699BFB4B4C7B0BE2CA53DE8FAF29716F968D695A5DC4D960B46E27AEECB0563F9EE64B950DFEBBC1345C297EE0DE51ED457011250EA4F93B620B813537112B0D487721366A98FC259C052779D18361EB90F98CD6521FA5D677161B10FEA25CE237E3CBEA2E03C2775165C2643FAC0382149BA6090B0A1E8182B4F1155DC8B9EC919D78FBE093A6682953DB73A80DEE144AE24CE610B90D6CE4E1280D330CD727414FDC6CB00A76DA815F49671FDA3021ACB2F095C089C34679CB08CB7452BFF1EACBD0FCBE006DD19551D933ABAD9D41532815DA2B17CF4FC1F776952C4C15F929BEA1824874E50478297AAA9472E3907C01120A9272142543B04C6D4E8E930A5A03D6E7CD0404700AE66444555B9A54C34F4082B5B48C79436360F9EA387AD20A10157D3236C7C3D0E5353224181CB0D5050C9AF3C1EAA58868CCA0836C3C8267A4B30B3D59414B079F1367D2FF39095DD2F6B187000D6D3A33EDAA0F9B034DD5F60A3C213F240584B42425DA115EE2BF028EABEB4A6860654494F077F1B1E47005F458299AC6887993F87AFA482AF6E4011D9484F1D9B765BC50939AAC4D524D4882ADB5362408531057AEC829824875E5047829F0CD1EA304B38AEE4B01947AB051C07B9FA2C818C0ACD20E3F46121785CA6C08133A64D10E1942421225CA64084B3B04C104924B12D52A03193885CB7741AD5ECDAEB50C8DE97E230CA2A4A08E0AB9BD222C5ADC16526B4E6A100A1DC9A5285E8701D0B656C169B729D6CAAE854135734C36E2056713505157622155F3729A4C2D85A8B2AEB29A1C3111C0574B1043359C91823156E90E1A52AA9B11355CD69D03B12D29A1A6A94EE031105502FE8B8FB1D164453C50A4F7D2F04151C92AC61215D82322E14A2BB5F440E0C5760C358346BCCD9462F272CF8A6693818E3C4210D121A5BA31FD6A9EE6F30E5A2F11D107D30420F53AA9BC26A9DD9ACBE6140C0538B2B09C47B4F44CF9A6F0A268983246573B6A83B33886537772A5EC40B557D052B0431928A1F54818229AA98070189ADE09441FCD96D0D873487BDA52C2242291C97CA322DA32C59DD8231F243C602A6189E48A63A2273C8CACEF0850A96884F205B406BC11EF204AD8021D203B682DD4B82D0EA83A2ABDC1AB66986BF3AEA18916223ED9D2C0DC7411739098A5AB5ED1C994922EB9C34DB64EC9DE376CE653D546FB18FBE9B384022EB9CE0149B832E51419DA619FEEAA66354104ED23B692E65C72E4AC389657341A99B2EE32894A4B382E3410E244946CD9A56D547379DDA86BE24FD129F68E9D83591DCDC498B3B9C21E89BFA0047C7EE7152732431EE1C82AC637D4D0BBD76CC644A30C8CD1F73173556539D816E4FE68EADA6200F5AD0695DB6744779D261F2B24DFDC9550735235297183CFE0E2A8212AAFC5727518801BA6762788C123E472C495DC2A2A0CB56398E544744BB076577E802052BE4BB01241CAAD89845F55DDF4D5E5D53F67EBF0ADFE30FF027B448DE1D80120751567E7DBF7F59C4E86EF2EAD7279085775B10EF21CC18F8541E5F53076D10D4712186A2BA0A739DF957907B81977B47691EDE7A7E0E8B7D008D34B2CE6518123DB17C0382B3F85B916F8A1C7619AC6F222AF689D21255F8DFEF7334BFFF566D50B8E802243344D7B97F8B3F16611434749F0A5E65938040F98EF8093024CB1C3D0576F7D4403A4F624340987D4D9AE615549C0802CBBEC52B0F5DAF6F4F1B1CD35FC09DE7A380DF4318A0012E03A21704CDF6F79F42EF2EF5D61986B16D0F7F421D0ED68FFFF6FF01C1D6C2016FAF0200, N'6.4.4')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202103241020465_Upgradd_To_ABP_6_3_0', N'DoAn', 0x1F8B0800000000000400ED7DDB72DC3A92E0FB46EC3F54D4D3CCC4195D7C3BC70E7B2664593A56B7256B54F6F4C6BE2828162471CD22AB7991A59ED82FDB87FDA4FD85054890C4FD42822C52E65B15016426321389442201FCBFFFF37FDFFFFBE3265C3C80240DE2E8C3F270EF60B900911FAF83E8EEC332CF6EFFF58FE5BFFFDB7FFF6FEF4FD69BC7C57F56F55EA27AB065947E58DE67D9F6DDFE7EEADF838D97EE6D023F89D3F836DBF3E3CDBEB78EF75F1C1CBCDD3F3CDC0710C412C25A2CDE5FE551166C40F107FE3D8E231F6CB3DC0BCFE3350853FC1D96AC0AA88B0B6F03D2ADE7830FCBA39BED71BCD97AD113FAB807FF5E26F1FF027E56FC3D8170B3A7D304FEFE19273F968BA330F020912B10DE2E175E14C59997C12EBCFB9E825596C4D1DD6A0B3F78E1B7A72D80F56EBD3005B86BEF9AEAA6BD3C78817AB9DF34AC40F9799AC51B4B80872F31DBF6D9E6AD98BFACD90A195B320AF5BA602EE46BBE0EB22FF1DD72C1227B771C26A862C1FBBDA21ED48EBDAAC16F0BF4F97F8224DE8382D9C4D16FB59EBCD9838AB277F0DBE2380FB33C011F2290678917FEB6B8CC6FC2C0FF2B78FA16FF00D187280F43923C48202CA33EC04F50D05B90644F57E016137DB65E2EF6E976FB6CC3BA19D1A6ECCE5994BD79B55C5C40E4DE4D086AE9135D5F657102FE041148BC0CAC2FBD2C0349846080827F1C7606D73710795146617CF942D708AA66C211A96EB202C943E003F4A76A07B51B4A69B938F71EBF80E82EBBFFB07CF1FACD72711A3C8275F50577F87B14C0210F1B65490E74B8CE41761FAF074175E9A1810C599E2A501D1EBC78E500D715801A1AFDA717E6AA7EC19F0E709D3C023F47FAF52D68B8F8096A58F99F534843689FF2045B074ADB2CC11D870154EEB3EDD17A9D8054C5F9372EF85EA2D3A8D3E18B3F1CA0FA98C43FD1D88A6E6305AED7872F9C8818CD685018E79087DE9DB2736E14B8C6A81A960707070E509D6DE0BF348E3C681D5B582BB2792B0B795CCC5070C078AEFBFA7EBF991895D3E547CFFF7197C479B4FE4B7C536A947ADEA41AA47B5CFB621A9DA7CE1A17640B42E560A05ADA3F88F828B953CF38AFFE78FDBBD9046789FC5BF2740C952223F87CF8C61ACA0578CC202427B3CB172F95C3D28CF3F4E8C68BD671046ABDF918C721F0226B2A2E93204E0AADC15281FE3C3D869A1AB6F35D023C67737101CCC0281ADB994F4F9107BDFAF27B854C676B448D02900ABF3F4DCEF0087D1A7786072F212102AD8FEB622EC532A9BEEA7BEA62C571E13D047705B7D4D42C1757202CEAA5F7C1160F3BA1165D732D4F9378731587321D661B5CAFE23CF111BF639B56DFBCE40E64DD0697A361350F2831AEEAEF30C32948B7A1A7C3E5661977166DF34CE3A4B8C17409924D90A66AE7DE0D2AB706A4584FA72A3342D534B022CAFAB539608C88BA5165795CD8101C407062480A5893B3263DAF0B5C45687A99571DCFED2EA669B7E34B32499B0D4A770EB08B512680388FB5518CB552324D477B9BEB849A300E0F9C5DF099FAE1D4086481685C72455B33EF5C05A0931138417B4E71740A17D7701CAE4096150AA1D9A9DA6EE1202D0AF670CB744F08C9D916D6E2A397022242C110ACD6FA92327793040628D41D211BAEEB168DA2282B725AA1AEED42056C848E9BD4429FF44E65CF8B34CD82E9652FA156B3C59AE1369325EEB3F4130841D63D34598269B30F52B494461EF561D9F3781DDC6265EF06A315F9E30E9C961F8EEFBDE84EEB2996753F07B04EF2B447B69C3D42464C0557DC48BC0445864F8A9989E07E59D8CA7B2C01C01948CF9DCECEE82B179BD38D021B849E0FDFBAD8A3EEE8A9567F4B568B833CA430AEB906849BA1A8C77B19AACADD9C0CCA676D6F3C6808B311918FD0AEC3F302FCD4AD52DD24747C4D82BB20F2C261B019C6CCDF3AC9B2C27F47687B24C2FEECA5F7BD07072881F780B19527B342A6ADAD33031BCFA688C635644AD8F34DAC73BA123879CC4084B45393DFE5680FAF6B2E5AC75CB82BE0A5EA943D2799B4BD2522CBA34F84E1D1FB86D0345D332DC4CE215751E91DF2B53BB9870EE28F7D051E8F6E5258EA67581D9EA1A96EE731B8317F96264CE7231AA7A63EAB54B652807663E81C2A7F5034F49FF64400860ADDD35DE64FCF3463FD0B3434B9A75F377E897D2F0CFE51DA0741FB395AFD2C6CC14E63DCBED2B570E3FC9DA5B08B88A8CE91F43924FFBC43F20223F70D3C6A17B43A4389604CDA588ED171AA98BB1BA359FBF403E3856273B01473EC2DBEF9FDF0E08F3FFA9921669BA5B15917715633C7E49817593FDD635B4F2BFCF6671EACED03F24497DD44AF6D277F75D8C8E6F0961E1142A3E9A5A3F3A4B5626AD0B949A36FD01DA529D8DC844FFF91C349180E71DDC96F97DD55EEBA3AD9FB588107C09D2B2355B8A960A986A509521E237C7978F0BBA3B3C661BE06EB0151563EC520C8A63343ACF29BD44F826DF7D98285F40BCC1CEE62D43B9FB2665BBE035B3E6E33F135B9F322BC8A85DDCAD06685CE3C906DD23D118479DDEBD89E20A6763D01C00AAAAB7D7216179BD608E9363AE691E178645C7A0988785DD62809B4DE2ABBFF7A7721F79E424873107B920121552AC3F17D10AEA1F20BB31858BB73DDD46E3218A495B8EC05794D51E6828AEA72BCF641337BC85ADFBB56F3C1657DE8DD34E122CFEEE3A4DA29E09ACFC916CF7283F52CFD3381B43E77EF080DB58E23028148F784807A4BA3E04976EC7E1B331089A223031188744F08682C0CB48F875869A0865F8A9B7965AA58304ED1EE18DAB18697878893A376DD7BCE7CF904EAB0A02A70E3E69EC78B38D9A0AD776DA0A89FE3A17D4C42CFF120EB0AA996EF22FBE6D683C36A4EE39957407218C2050532E4D754A5661DC196714B1EAE82ED4A87D01339755425863AA24C4C1D59C1963A5617E424F235193AD90A6262B95AD62BC7DAE51027EE1758A84A0C9D44999844B242A78CFC924D6E7C92C6BB7B6E3E49CF8BC5C64D40CCD3EE69F592F5D1D070B2F182507FC6AA273A904A21AEE15D5C5D1E9B93935EBBE37A2B0F6DB702DA898FB6CA936817782FBD34FD1927AAADD79EA23285908FE3E83680E3120D05CD4EC04B27B9E8557FAF400AB241307E89FD1F719E9D446BE4A07DCF7C5B57F1C8F7E1383885DC026BF6EAEF167B8F67694D91939CFCCBFB380217F9E606CDB35D57553AD209645875BA776005FC1C2570C145D2663BC061886F3FE353CF8713AA23019CA5E4507201EFC8CF820730AFF2E6551E0B23F4828DD8E52FD6115579E3ED139F39479F2CB35D81E8D69B256CF17A932D9310D6E37AB3002A596FB26562EA7A5F6F169055EB4D610531B19DD79B5FE2BB40B2D42C11E07296BAE2B384A6B2CCF5CAB7802D59F9B26562C2742B5F157545D05C4E172E66282ABE8A69298B6CA9C0DB100A429A1A0C2D5581989CBAB47344A0B03A6DB7768AC673F6901CD7CEF2740BC920000E568D069886790B6EDCBBCE0852614BDB8EA6A2F13C9A46389A0AC9C06F0FC15AB9B6EB294050611EE0C8A595B69BE465CB947DCEC81EA9AEBBC8EA1EB7A136CC6729C20877F89DD03DD7B92BB3CA2A54B653587A4747CFDDB838BF6AACC5F266A46E47CDC530E6638392E1369F529F4FA94FE664637FA7D4A76017DBE777086E8F7B6EA91D7D3F862A7994C6C024FBBB4987D420ED69350BFDEA08AA101A8A18A7C2B43B79EE7DDEC7FBA57DCB2EBB67A52594ED9FF1A55CB85E50C5F51E1A4621D945E34B653476D949533DA085C10B5ECCA24B6474A9DEC4EABCBB8771A8F6F7245564E41AEDF159C5D98E7CBFCC7669176AC3CDE7D0851CD7CEA26D45DC3F887E58DA5187698C832620CEF3EB339C5FED77C88EE0F0DC6C5B1B3412C66CD5E4B85A5935A70B12E7B1DFCAF07D4D06B54CCFF73D92215F75B902297166AE70BFE0E02D46735954262C0C1797B1B25CDD62CE220873C4D9C22EB4424C71BC5B4FD0C95140E92E2B525C63A4EA6B7B65946CF29D2F8F9AC0B262BE56ADD538F91BB8B98FE31F270F40BFDAC675D33DB2D12F60D1717735CE89E96EB8DBADC011A619B67B28CDE942D868296A3B4656205A1B2EE3D8914234FD75C64B611EDC80A2EE3BEE0611BADD5BE89DF69FD75221423E529E52C70D912BF539CBB664D18003D445D4A6E3EBD0F4B4230852F303E79A6ED304AB3555B9A0B5AE7EA7E0B548610D564E9CC1982FF8369A3630BBBE27C1F033F30AF809C886C7EB6A6FB7D2B9DE2DE167E0ADA1E24ECB8BE9EE69E71BC22E7CF4FC1F77499C47EBBFC43797491097093967E969E8DDA5354D6A2B410149F784303B590AC86F28A9F009CA07EBD653C6DE60790ED009EC6A2A897F2E17459EE887E56B8EA554D58F208C7F961771D44D0E0FD46DD8EA1A144737F10360DABCD0A0F81CDCDD37955FF3C22DC5A8102DF9846C19CEB3936A31EB4069E669F9E86D00D23D16E6B0522D741FB9E2982D1A167EDFAEA9EA87EAEAB5A35F31BD05CFC5E96D767C573CAF81210ECBF5D24F3063F92A2F2E863065F9DFBC2492F19BAD7B92247152577EA9AE7C0A57A7CD58139846AD2445E1703B39D2613B1E9EBBCB376D256A29A5B3E8C10B83B56CC3C74C7C184873B78B99208B792E8583A0F22DC4229560A376D0CCA603ECEE0950BED1535A30A6684BDC7C819BFFAE691EFD88E29F117A473E89BC101F5FC46DFF50B74597A780F5D73CAB1BBCD5D34A5C5B22A1989D058DC68D2414DFC5040A41BAB581A553AF140F9C7B8C679E2BB2EE610B2EB2AB7073F6AD9E52B876DCBB0019B394FF6D5116353C7B659A277CF3FBEFDE6BFFF59BC3B72F5F81833FDEB6E01FD4AE2C88724028976E2AF91964FE3DC4001DE02CF6E390B057071A8BF5F5AF849FA5C1C33A152F74C0D1DD475BBA85C6F65DC4119E0C90B41E009A51F1055304108D25BC88110F8B1843DD446305F185526C2B8D05BCF4922CF042BE9DC6001679EBDB101CDFC7810F1A69BDD449E0687313DCE5716ED1E41C3AD4EB4B009918411AC327A2A5467A454BF3EAA768194354D748FA0AAC8304F899798B15005FB37B4078363A45A8709C03A8526BF376D084E27C26B2914685A0ED85E3EF9164B0467DBE47794A61D0A8CD37B0D9C689973C0978A79933AB167F05600B8DDA8D79CB8FDEFA0AFC3D076983ED954EE7BE471EF6E888EEBDD229D0A5F7B4812A8AB0415AC9861AC5388D939B60BD0611D1442F615A5F5FE9C45BEA10F27542B80AA6C8D388B9F08F902144B10BA29946DA8532D1D74D0A58A3957B213A143F897352821A3F09B938705E235B681CA53FA18FD4D4D68505CA2011DF9F439D8E40258EA332B7BABC538F68ABB538052F70B0278EBFA02831D15C6B4C8AE6DF9300B58D51FCAB6EAA330D519A6FE1D08553E1391C885EB946AA5B6BF4072306EB2B144B80DAB482CA90DE06B43A1D6AD4E9E4710BC7BF27649CCEE1DEDE25DE1AF0D27AA1C1097D9DC2455F81042EC7E965E96B9D11811D3DDBC04912D90402E96B9D198106EB4FE8A6FCF49E8836DAA92579803331B45B0F903714635FEB4C0946C60EB1D73A83827C4EEC5F2299560A4200300A651DA569EC07855CABE8CC53E46D02BF8A8616E0AE998F8C037A12AD17E5D68A49E36BE6DA5BB4DB236AB75C604727F0E188FBB0FC178E219678EB8789A478599487744721CAAF5119BD5A1C15C7B9A0A9F352DF13ECDF416EAFE92F57E016A037974A970F3D11144419BF1313447EB0F5C2161D636019EEEB205A6BAC6CC927B00511CAFC69215F137298A662EA6A22180EEB18FA7E9FD06E23A52F8D7BDD114BAD57B756A83DDDB085DE6B304F58F1CD7A369CE69BC978F2AA4F0D6C463DAD745101C87840B49D0DCC29910F10F5D01CE93031E8EAAE468C813E580C1E1AC0CE86103EAD790A3C14DDC3D726D5873F655AAA6C251A1CC20636E3428D513008EAF3AB63537BA39E0CA0E3463234A183B84961372A4CEC375F57E4957F53B9062B1A091598A8DFAB4E199228D278CAA28849E587583B1D36E0DE102A6CC021230D26E08C428DE168BC26FF9BE931D74AA7C82BA44183EB324FA6549907536229EB06D662296F6CD51802DA9926CB1F6196A987C12BD28D6AF047A368F538D8DBE3036526B8046AA8C3E54815B5FD1F400DB57C31A1A17C9A7B679A473EE62093BFF06507FA98E0404651F48E044309BEEFBD17A513306200351374DA046B95CBBA43B5222E15524B5474BF905AC1542B1FE9A31E1A984233D84151780A06D3169EA126A8992CE8DD690E79D59352CAC25B9F3A6A8EE89AA861354740C1509A2360A8518886BE9066779AC3DD73A514B5FCCAAB8E3A24BD236B58459291319436C9F86B825F7453D00EF5AA7C77482D74E611A2DDB948CC93470C25380BB63F178966C460CA46757A1A2ED225F17E9452A297A2C7A476A7609782A7AB18729A2AC6C1EBF61A2760CF506A2760C53474AF7C234C2966E6C1B0DDE91BFD3C194348F94C4B7FCA45716128B5A27A3C0D85AADF7A538A927FF8AD854B248329D09001AC0FDBA5A17484EDF6E8D504D16E1416602B8A94C56CD82B600EEE93CB2818405F640C9D4A58A0A0DF242CC05674A6393B0D0BC828184A73261C1628E8370E0B086B3BD3A1DD870594640CA54DCF222C50F4C464FDC65634D5A69EFC698E1C810EA23A43ADDF64EC194A195BAEDFAA670477A27B82571B64E2563DE1D008BC7A5DC7DC9E29DE7D18CC98C969184079E48C9D8A4F25785743236D8D5FD55A8B76EA5BC969184E8B26EC5F31AF9F6824ADC8786DAD3DF639ADCE9567F86454313F4D10EF3AFB54F6228D46CA264E796B15DABD63AE2164388D7A16CEB9EE4249993A18DF2ED9A885E8BE5873FD33BD9E9247886FC61C5BB2BE618706D06743599A50C2DE713B804EE3D4D438CA600BE2CE3BF285CA4F37C575228FA21B8AE1F0C3B7D7A4F83E455605117CB8B4AB20E7705AF812DFA5CBC5497DC561F588052E13E8310D84BEB2500089AA505E81A601293AFC1300116CC9212E33F826905BC22C8F4119C0C547DF5A30448B42505B8B08FB0922A8B55BA5034165E40BE05039EB46C0D8E32A32A0ECA90E0B4AE1571DB12BC13B7D2C48FA9C9008227BB84B03F00BC49C7BE24E1F6DD11C500CFDAA9A31BC6FD08218C2FC56181B0D5CEA9E31015CFEA1190B80E45DC93AE0FCBDCC1A446C4677B945CE2311D5B3066E02580B940C40F2E004313C0D3C598F8D7A885C3E51E3D27336688C13D1C5107066B701189CAC250683B39F0CC0C878D1E41C68802886BEA93CF8677E44D0048F0199A87BD94C0ED0884BF8F54D19A3EAB73D4DE5867D35A5F86A47DB00A88E776C1D23CEA14626E359544F0B9CF4364540E905801930C20B5680A41631868035F6587A453E039E7083D58E147751C78268AA70ACD4177C508B32AB8B6D6ABE48FD3E6EB5D0F22A1B29A680C742AD2B60137366D3EE9305B7350DB54C50B757F09B5F1BE839AE41B64B96ABAEE330E5BEF1951E7ADE985CEAA19189C54830C72D17914E1F5A084A7DE983402A16B744506C30BB2782E833B7CA50F0D8EC4A080278B304ECCE4162F5C4DD392062A0AABEA28B8A6622F6312B5415F3549045BC132F579D32923FF5AEE1A4E698BCB4C3F283F2125E966B684376CACFB79B4AAA051FE567AE053C343CA04DF5507F449BE89DC09954304F7F22DB06740BE695A70CF16A8D6717592CEF05514BC412BC9A54B0810420E838B9A274D46322E142DA6D59528680744152460B060852307450DA3280CC159031409A4FC0932ECA27B06780287BA02F0670BB96322EA8B737F94E48B737EDF921DDCCEC8D2938DE226385E0EC9C806AFAF45C8B6ED387DE1800158D6E7A4C85DD24DD96E606F2A48BB203ED19204AEA23A05034BB61038E904918203860C4134D1F31B2EF347D3288698FE973D3D9C6C596F4577CFE8527993B0163DF6BEEC00B0142B61468D16FEEBC86A0EBEA331D14E9D2531D04F54291A9A1F468DEB863073206984D7AD2C309F60C1868D21367CFCBB86031E9A913EDEDF931E4A4C7A57ECBF86136054813C4EDB930E81420C84216304297AB4C754291AD4C74A3DEB750B043919FDC8346085269E5AC30B3158A94DB76AC18C86230F9A07236E88361929CD176DD1F26CC254B6E94B3C1C266EA3221DB316648CBA97DE8996793552A1FD53FD3643EA29FC2DD32050B4DD3F77814D5EE9E314BABA767EB94B0BAECFDFECABF071B0F7F78BF0FABA03764722F847205615A159C7BDB2DF20C9B96F8CB62B5F57CD89DE37F5D2D178F9B304A3F2CEFB36CFB6E7F3F2D40A77B9BC04FE234BECDF6FC78B3EFADE3FD1707076FF70F0FF737258C7D9F9AE3D804B61A13B4C6DE1D604AD12B326B701A2469F6C9CBBC1B0F3DC776BCDE70D564097092BDCA0A2B9BE3C64BB4DAB6AC5AA0DF75CEDD71BCD97A51F1E2E11E4D018EAE9E26F0F7CF38F9D1E4CA31281A66C3BA77E8A192821580D00C7953D878E57BA19754E1642243F2380EF34D24CF9894B76EDEE02661345FCD2155B9BE241C59FEAF1CCAAA7C5905FDA1415105E6F0F0334C1C38F2BB39B44B0FC9382BEC20098DFC6E0EED0A647912E1443C121C55600EEFE411F839321AE5F3D72444A6A805CC4F79E29593B9106E536C0EFB380CE01038DBD6EF9D9290B9425BB8BCCCC9EFE6D03E26F14FA4C645C202098E2AB0E128B2CB9055E7B05B458A1ECD50B6B4056409481B58671BF82F8D23F2801A656504E5EDA08B2D90B886850E14B9D0681E617480F8CE437BBFCFD867768ED8E7260966EA66671DA339894999EE6F62E253AFED67280318FD4C55105DF9101A09A2FE6805E728B94B3938E5478BA933814E4991D6464D9DF557734817D07B81ED78B34D1598C343DEBC101E5560315CD3A31B2F5AC71160054816584CA3491097EFB7539368FDD56298A3A5BD70C6A34B2C218A6D9EE6BCEECECC872CE5A53F3B62945464604B0CE1F4634F70A7F230E45D05B6CC1CAAE0952712B0C1235072D8F6CEFA6E3572485DECAE8543EB5FF597D73EBAC442F782741B7A0280548185DD8FB679C6CFB9C4678BDED66167A6AFC4F7673F12AA24C8C14643B986EC3C242460FA19178205B1F552D85D58C3853D1F915F3098060AB0BA721026A78D25F92C1DCD576B6DA4F921D149BED233B4AF6CEA737F7A2D7E8CCF5EA575007A72769B0B3F281D94DF0352C03AAE1E4FAF5E99963C49C8381B7E126C822276D387AA68C47A96A2DF5F6FFFC94EBE7497FE7932927537D5F17EA3ADC3E8C2583EAF25BD5313540A75FC1688B31A42C287351A2DE7973A2DA0F789A58520A52DFBB134DDED83F3056A5A26B47061C9FAB3056DF43D6A1475EA2BD6343085B68C2EB10BED96891ABEC44A8A6BB4C1206686C9FD4E72E8CFCBBAB7352A9AD357CE2C0B81A78D795136EFC7C694D804DA417CB786C645B0C8EFB6CB38EAA5507E3DA77C485407DBC512B1511F55689B2E7F860B437AF53BD458A3F1B51E733A307D6E88340F3ACB94DBD26B003F05CB82E6AB39A4AF4970071DC450008E29DA6510BEFA2B1F81E21A3B59F161297CF6D27BB17CCA929632E2C10A8A47663188A3CBC34CCC2BE14D883673B310423F26C27532D43452C0DC3BAD278F1988D0A6179FA1C4148D29A9AADFA4B02BE0A5ECEE60F56DFC09AD3B325ACD7D80FD592BD1BD82F616CB08CAF30F913A0F81F8EC9829BF58055182D4BB09055194FAFB1C9291439C4332CF202443DF833AA82DFDC69D5D2970B6B0A7624863B7A915F5BC49A44B2C0E91E0435DD4F911FCCD1CCA5F0193A05A7C1876336CB62DCFC0B6D0B78FF6675BB81B4CED8D8A1E444F5B4B045E818FC5955ACCF7DC02CB765D85EA5722E12135256D42B43C4CB6AC0DD4A334059B9BF0E93F722F44035770FE4D5B7917A1EB157800FCB980E6ABEDDA2D152DDEACE208278F7E98AFC15A088F2BB49F3D53F1F46917EB986DACEA7AF861EC2D77B77137DBAB073776AFCECD71E0FEE685D906CFD6446A4DC46F40F46749846F49D85B10333063B71CD5ABAA541C58F2D2AA1C0ACB0B16A2A87C3751AE79C409C431E4687330D2A637CA2E3DF424190BA9F96AA16DF19AD5DB987F5B4E05614E0B9C63D0B30DA46EE6B3B17E2D0F3C5CB20F43B539F3C001999E2514AC2BACEDCD9F0944CBDB9BFAF3AF3A129CCEDBC80934D0B7F1EAACB567CB1DA410B36054C7AFEC648A546FD232B58E73703215B36012A763FA5E17B75C070FB9EEFD04EA401DEBCA11053611AF64E385C13F440123B66C9AB3A57B6F7F85DE3BF6D9C9B7FA6AB76EB8F5F230E3D70DF8F3BC0691439CD72063F2BC5A5AF4F292DF7EE7FB16165DDCACAFBDE8CACA22AC2A2BDC94B7817EB2F1825098F82CAB638EE528CFEE211FABDD24413E8CB8869DDFC3F3A60D47DCCD4D728EB6E563F7D96E95271107A4FE6813AF4B533882B8785DF5D5924BD00BBD0DA09621E1F3013C49157B6AAF400A321EBEA0D8621688FD1F719E9D44EB4F5E06BE67CCC42F28B61837BE0F35E414F61EAC05973B0A8A6D3C829A3461B62D5B6AC1EDFB380217F9E6065D324FF1992CB0A1946888D580A7575CC726DBC3CF515E07F4D3365B36E5832AB2A1FCDBCFF8D4F3E1F421E1325F6E039D1C183C6CB6D406F2919F050FEC456BF5D7D9EF94439CFDCE67E2774A1F8B74E97C16485A7AA092B6630F70BB49C5293A2F384ADF7CB68425C88F26BFCF03C87A00491F597439800A242D0790A4EDAF31808ACEC36F0FC19AF5D398220BCF0FB7E1CE2A5005A352D2BE63C6158E962A3ACD9C29371AEA26F36A36C7807880B33F456FBF5936D9AD7A4749C59D833AF3D1AE7998134A3CD4012F1E5BCBA306A680C66E0FE66363F3910597C7C6669B560FC4FEED586BBB35F23BB3E536CF17243D500543FA30C771144101A1CDBF2CE1328EF8D239983D07B30DB46AB6A0E592E4C8F7D10661DF910E8CA665B043DA7AEC8E9F9B856011920CA21F2248D5F75D6444B8CF63980DE96C48276A488BD878FD10FB007B1B1857972D0E2988B1DB55D76EAA3B3B8D7E7D4DE4965156C76653720A7791BABE81F50AA45CC273F56D086BB543CB3254D88EC5D53268670666EC16C68D4510043085B4B1352C824A9997B1599BE5A7673E2A863C892FC2D772644CFF44BE9B9131DF7B31290FF76FE0E63E8E7F9C3C807E6305249E16234CDDBC9F918571F28E135530E4968E7B8D75673D9CAFF05BADC6773B8A56205A0FB052E4B1B51F514A20BD8EAB622CB390D8326BA8D4C57562E06C15ABB5CA16BAEA805BADE0AFF690904B97A7FC011551F92EED44FFD1ACC93CEC24D0A221067BF7FB1D8D218DDD51C51DF99E04C2F15D7CB73A0694002600517DDBC59E23EE452AEC9B55E0E733F0D6E8342D05A8FE383BCA82615F151EC751E6051148D82A3576FCA5FE9F561FD0B0F3EE00B485204C9B762BFF1E6CBCA2FFE9D6F341794BD96990A41972036F3C68EC8B2ACB45953B0DF5F0298553F31EAAB0B7FA7B5846EC9A0AE77025750BD2EC5BFC03441F962F0E0E5F2C174761E0A54885C3DBE5E2711346E93B3F4FB378E345519C15E2FAB0BCCFB2EDBBFDFDB4C098EE6D023F89D3F836DBF3E3CDBEB78EF721AC97FB8787FB60BDD9679B63B046500EDE5650D2741D92B686B091582B8EF275907D89EF960B16E33BFCA4FC69106620B9AE2A5E9F7B4F9FBD07501A912A79A7B19D54AB94FEFB09DC0691E0F9DAF77F054FAC4655DA7B056E1732D3F77E9F6DF85E603E516F3F2C6FD02364508E8585FE134035F3A0877CE9413F2C895045507464B9B8C8C3109D12FCB0BCF542DEC3603134C6B4C45320E1787916ADC1E387E57F2DCED2E310168204ACDF2D4E1182DFE037B828FF7B0EF087C5FF2689C8123EC594A5A11AB8744FED60AC40F210F83893AC04143D78897FEF25CBC5B9F7F8054477D93D54F8D76F6C419F83EC3E5EF701F9D2437A9715B65501F9F0E0C52B5BD05720CB930867F8D2B0FF69E33DFEB32DBC9347E0E78DDD2E21AEA10E66C57F4BADABA17DCA136C1F08F5B304C6ED732858F9C69A91E496874A462FFEB0854CED7E2840BF4626DA565A3E28BCB573C810F46A956BF5AA11A887C4C1C1812D64D1836C5D0C83F80139A1B619A943611ACB284CA79E933E87728AFBE8F93FEE92388FD67F896F78EF7BCA930FEC50790CD35CFB4DE11E25779C25E00C9FD90C993CE17B134A68E9C60B43CD34895ABE5B9CFD8FEBCB24885146EF7505E5FA023C66F00F32A3BF2DBE26D0257BB77841CF99466411707873EC8CB2972D2843CB7A29659683373DBAF1A2751C014217CD384F3415F6ECB045CF2A9E55B46441F4E45613DA5045AFA83ACECCCC5ACADCF21ADB33EC5297DF2BEC5AFF5DD86AAACE7C2FC61477BE7E9C99B5A9063A4A83A8785EE1395B5F571368ADAF07A4FBFF0D2A05D25FCA29B6760038AC864B930EBD3814F562040BA94E9D7AA1EE54F7116C3B76E7512B005FFD6D3D664900C38C4FF2CA4B072BCBB3689B672237B015B4CBFA565A27E07A1ED56AE169CC92BB118CC30476C3B86834D5B1DCD78AC62CE03299C85CE7B99803D05826ED1CDBCDA3B4D26941D359B37BD3ECE6C0AC030B2D94606B4565C158A8EB1846B0F1903985ABBC3C01F5CDED9A6142577734347448F1A1D59DE02EC1F782FAD95884314C50B671F9F6A64E19DE9D509C46608E9BC3E1960BEDAAA1CC4A1A2E27C877223A89D2D8FC61CA4D4DD0F52ABECDCAA4C4E90CFB5EC6BC76BCBDB48FD62B16948ABD3B23D0442AA951F4D8DA469975903E62DA65ACD2C9ACDD82EBE2F43B5730DDF4771C36D3DCAE949940F75E74A75F7B909567DF821155C11537522F411101A67ADBA6D5BAA584077D429E0BC6C1690246A7AD1FD94ACA8214D4B00E2B57F0E89D49C206BFB2CE72E0B1F446EC2143ECE15BEBC489112FD9E8A5A9958DA11BCDB6463EAC3B8FE98E03FA02FCD4AF3E5A24047D4D5077BCB017E0EA3D0C02F65BFB0C39FC576D3FA636E6E572FFECA5F74EC26294C05B426DE5F6AC80887B72CF07D69F0DD260898153CD9554AF030C6C7435C8AF49489D12B04E1E3310A18D46513260BB9D50B7A98AAE3329AF80978A123E6DB85FC290BA972D72A87BDEA195517EE82ACDDD867B250499D67630E047DB6D88A3005FA051CE3D03D752D066A0E0BC08F31CA11B9337D34754BECF30A1AF49646F31639DA59060FC5C17117B9C0398730073C4014C8169FD061EF51EBDA4DDECD98FCF3857F2E9C548578FB23A065B3C09A4DA8FA5FDC6A1135A6643E4DC10A96F8D1BC206E4C5300B8AA18E84601FCBE3DE72300E8D99CDCAAED69DF4E30E6E030E8D60B5D05BE42237D0256F3BF4D119D1764BA72067F3EC43B7FDA97238EA8FBD191EF00CF375F95EB82B98D5ECE706DA840D1A779F8ACEBD52359EAA8FD5D9BE8EC1996A1DD36127876BDA50D69B9B6CCCE7559B4D25ED44D423C1ECA6ACBD79D44D213D12CFC727A73B45F5C8A6979D653C3163CEDE485ABCC0A933E2A24603454C85A8A718327DCE0BF3EAD952E1868F512F4417E5CAB47F42E1C7891B07EBD1B923A3301B849119844B2F0151BB34C3AA6997CCFCF20A51D54AF7756F9B386D8284E33056F35E49EBFE4ECCCE5FD647CD4D8FD1712D06B2F4C8B3D8156E2480BE70CFB3CDD837EDCFD23F13D8B36E9BE0E3B00B460EBBC1D45CB6EA3231B70E3A31CBF6A99CD6335A5D0FB89A9EECEAB917DBF509D4E1682771FD8B38D97861F00F83F8588BC38693B0B4633B44899E1408FCAE794CB75EF142DBB34E8632B969826CDFC9164F7E7960C02D1E48A725ED609E8441D7A8F6E6BD329E36116023F77CC095C024A7CDBEBCFE66A66B5E5C769CE4D4A0A09F18758CE628CFEE1113F00EB53E09CCFE6C496F2C1A8347D0AB70FAF009567912F500F6D24B53680AD409366DD6A105838FE3E83680E30109541BDC7C699FF25D517F055290F581E04BECFF88F3EC245A7F8216E87BE6779DA28F7C1F6ADC29E40D5853975CB7DB2CAAE9EB9CF77E791F47E022DFDC00F52AF3A5F506F9594AC0C61AD18DD615F07394BE05BDE4CDD6FD31826F3FE353CF87538F03B69EA5E440E80AAB7AA868F6E8678F7EF6E807F2E88F432FD818F9DA45CD39D23E3E6FAFA7F8AD998A23A540886DDC4CB3B3DF10B0BBF786C611F3B71A995F6208D068641635E791398F4CDAB987D82EF1337DCE174015E0EE27A9ACC684D1D64D55711E11F388709B1039B159C4348F64CEA2186CBC88AEE1405F38FDB67DABC1E150531266FD0C8C6900B12B61C2D72D0639D33BDEE5F3B3F6914B6DE00EF69A5DC5CE369BAAED7B16A7DEE693CD603ED93CE4C9E6495A3A43CB36C92DF17E2E62DDE943048534FC5E32A8B430DBACE88FE328027EB1DF9E25C5AA4185A0C51BCFF306CFBCC1336FF00CBEC173E4FBE54EBC41D40CD79DE414326814C0C54ADC928E22D01F443FBAAEF2DA243EF599736478F9E1D8CDFEAF66B8C76A75DD6EBF1D41EBB1D99A194FB2C154C309130DA596AA2078B3DAB1DB6E1AA32CDB5F57A6F66B421AC7EB2B90E66126BDD1A65D2E6B874D15C14BC1EDA2CD7C5F0762A1837BBFA77A937D8F97FB974CE6622DBD48F0E5B0F77858CD04D6216651A3A9CE08CF22C0DCD540A2036B40FCD4439B5779045B10EEF85DD06A1BF1D2F7B3CD93169D5FD9D093A5B71B5643DDFAAE1D51A301CF3FCD77EE4CD2F2587664BE876B0C8BC2BF819BFB38FE71F2000CA26964E581EC0185728A76A0F3D487392072B3DB5DC4EE6CE3D8A9AA8FC1AE8DC382B40FA3D98EFA1588D6A6C120BEC92FEBFC93364905D6C017A441754A04AD0444DE7CEDAECF7065BB8DA3D44DDE58050CB9C0794A1E02DD7514B68FB0F3889FCB15E9CC34DF9170B0A18599F13D09DCCCB32BE027207303CB459A01EE9F9B87053E030F5AAA5FE19182A3348DFDA020B09AA0CB99AC425CE4D35E331F99217412AD1728539F6B5C51B802E1ED1E57769E8759801E8D82747D581E2ED961F8352A1D96C55191E3027BEFA5BEB7E69904FBB636A4884A0F1691852BD0B4FD0B87129A0680EE570D3C74943ACD120F8A80B72341E4075B2F947087A96F687950876BC86CC927B0853E0C244CD57D13BC4C4331193536461E3AEEBCDF27F4CE481D4BEDADA899BE3ED2FD11D1C5D678661AC9746FF22A49D94955E7DCEBC2909A2AB59FC26A7DEA6C0B05EA4373AD2D2ADD7C674A8C13664FA13F9127A03A4E86BF4A35B62A2715A0FE464BFB606FAF27C5A469A668618B7A51402193FA5139A63F26188914EADD2856A1DFC7F75E7407AE2BF2CABFA95CAF8846B472510583D83D7A804A69622BF4A36A64F707D03761D78CB48E207414AA0787CC35F9DF4CF756CD929653BFA26C400DB41C0D3D681CEAF1604AD752D9208D3BD3376E2BF7F83E08D710B854D7F8CD6A42BA7CA1604665852C878D605AC177A4411C9A015448D87713BCCD032B3BD1A0E242D4E2DE1CB97D2A2F7125E4587E18C41211D74D3104E0AFBD6850D1C101B4A6E98709B22AE8B6434569A27FDDB44563495013CE7A88E04C50DEC6968109B5EE4EEAC4198659EA7D4B9D3930B23BA9B3C73966D1F72D7AD1019A1DCA1F1D4D19AF53806FBA6308C05F27AF33653FA6E1145CD62F6B75D496FE027697FC3369042D82D2492B10DF9F692812A27EBC06A7BC4690C15F7E9CB4B6D4DD988692609576616AE4EE88C84A3C0FDB30198B505CC639D47A931BDBCF605C1B8FE931AC330B690FB5CEFCA5A53D86F56521ED41D797BFB4C847B3AE2CE46EB25C3012D7735F2E18CB7727CB85EA62E49D2812BEB56E28F7A0BA4B8F80527D9AB405C19D988A9380A53E949B304B7D14CE0296BAEBC4B0F1C87DC06C2E0BD1EF3A8B0B8B7D502F711EF1E3F115050722A9C3D43219D227AE0949D20583840D45E740798AA8E25EF44CCEB87EF44DD03113ACECC1CF01F40E2772C551065B80A47276E235380D92344367B96FBC1470DA865A416F19D73FCAA1B1FC12C385C0497DC609CBB8295AF9F760E37D58AE6FD0A54BE531A9A39B6D552115D8251ACB47CFFF7197C479B4FE4B7C53DE29C4A113D491E0A56AEA914BCE01700448EA498810D50E8031357A3A4C29688F1B1F34D01180AB195151566E29130D3DC2CA16D231A58DCD83E7E8612B4868C0D5F4086B5F8FC354974850E072031454F22B8F872A9621A33282CD30B289DE12CC6C3525056C5EBC4DDF8B3C6465F78B1A061C80F5F4A88FB6683E2C4CF717D828F7843C10D6929050556885FB1B7814755F5A534303AAA4A783BF4E8E2380AF22C14C56B4C3CC1D645753C15737A0886CA4A78E4DBB2DE3841C55E26A126A4495ED2931A0C298023D76414C92432FA823C14F86687598251C5772D88CA3E5028E835C7E96404685669071FAB0103C2E53E0C019D32688704A9210112E5320C2595826882492688A1468CC2422D72D9D46D5BBF63A14B2079A388CB28A1202F8EAA6B448716B709909ADBE695F28B7BA54213A5CC74219EBC5A65C27EB2A3AD5C415CDB01B88555C4D41859D48C5F7350AA930B6D6A2CA7A4AE8700447015D2CC14C5632C648851B6478A94A6AEC4455731AF48E84B4A6861AA5FB404401D40B3AEE7E8705D154B1C253DF0B410587246B584897A08C0B85E8EE179103C315D83016CD1A73B6D1CB090BBE691A0EC63871488384C6D6E88775AAFB1B4CB9687C07441F8CD0C394EAA6B05A6736AB6F1810F0D4E24A02F1DE13D1B3FA9B8249E22049D19C2DEACE0C62D9CD9D8A17F142555FC10A418CA4E40755A0608A2AE64140622B3865107F765BC321CD616F298B88500AC7A5A24CCB284B56B7608CFC90B18029862792A98EC81CB2A2337CA18225E213C816D05AB0873C412B6088F480AD60F79220B4FCA0E82AB786AD9BE1AF8E3A46A4D8487B274BC371D0454E82A2566D3B476692C83A27CD36197BE7B89D73590FD55BECA3EF260E90C83A2738C5E6A04B5450A76E86BFBAE918158493F44E9A4BD9B18BD27062D15C50EAA6CB380A25E9ACE0789003499251B3BA55F9D14DA79AD097A45FE2132D1DBB26929B3B69718733047D531FE0E8D83D4E6A8E24C69D439075ACAF69A1D78E994C0906B9F963EEA2C66AAA33D0EDC9DCB1D514E4410B3AADCB96EE284F3A4C5EB4A93EB9EAA06644EA1283C7DF4145504295FFEA240A3140F74C0C8F51C2E78825A94B581474D92AC791EA8868F7A0E80E5DA060857C37808443151BB3A8BAEBBBCEABABCBDEEF97E17BFC01FE8516C9BB0350E2204C8BAFEFF7AFF208DD4D5EFEFB04D2E0AE01F1BE7972BE015AD5411B04555C88A1A8AAC25C677E0E326FED65DE519205B79E9FC1621F40238DAC731186446F14DF80F559F435CFB67906BB0C36372115FB4469892AFCEFF7399ADF7F2D37285C74019219A0EBDCBF461FF3205CD7749F0A9E35938040F98EF80D2D24CB0CBDA575F75443BA88234340987D759AE637A8382104967E8D561EBA5EDF9E3638A6BF803BCF4701BF87608D06B80C885E1034DBDF7F0ABCBBC4DBA41846D31EFE853ABCDE3CFEDBFF07FBB4D68BDDAF0200, N'6.4.4')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202106281034299_Upgrade_To_ABP_6_4_rc1', N'DoAn', 0x1F8B0800000000000400ED7DD972DCBA92E0FB44CC3F54D45377C7692DDECEB1C3EE8EB22C1DEB5E4956ABE4BE13F3A2A04848E29845D6E5224BB763BE6C1EE693E61706E08A7D21411629F3AD8A003213998944229100FEDFFFF9BF1FFFFD69132C1E419CF851F86979B877B05C80D08D3C3FBCFFB4CCD2BB7FFD63F9EFFFF6DFFFDBC7636FF3B4F8CFAADE6B540FB60C934FCB8734DD7ED8DF4FDC07B07192BD8DEFC65112DDA57B6EB4D977BC68FFD5C1C1FBFDC3C37D00412C21ACC5E2E35516A6FE06E47FE0DFA32874C136CD9CE03CF2409094DF61C93A87BAB8703620D93A2EF8B45CDD6E8FA2CDD6099FD1C73DF8F7328EFE1770D3FCEF31849B3E9FC4F0F7CF28FEB15CAC02DF8144AE4170B75C386118A54E0ABBF0E17B02D6691C85F7EB2DFCE004D7CF5B00EBDD394102CAAE7D68AAEBF6F2E015EAE57ED3B002E566491A6D0C011EBE2ED9B64F376FC5FC65CD56C8D88251A8D73973215F33CF4FCFA2FBE58246F6E1288851C59CF77B793DA81D7B5583DF16E8F3FF0471B40705B389C2DF6A3D79B7F766EF60EFE0B7C55116A4590C3E85204B6327F86D7199DD06BEFB57F07C1DFD00E1A7300B029C3C48202C233EC04F50D05B10A7CF57E0AE24FAD45B2EF6C976FB74C3BA19D6A6E8CE6998BE7BB35C5C40E4CE6D006AE9635D5FA7510CFE0421889D1478974E9A8238443040CE3F063B85EB1A844E9812185FBF523582AA193344CA9BAC41FCE8BB00FDA9DA41ED86525A2ECE9DA73310DEA70F9F96AFDEBE5B2E4EFC27E0555FCA0E7F0F7D38E461A334CE800AD739481F226F1054970E1AC890E58904D5E1C1AB3716705D01A8A1E17F3A4126EB17FC6901D7F1137033A45FD77EC3C52F50C38AFF8C426A42FB92C5A57520B4CD10DC51E043E53EDDAE3C2F06898CF3EF6CF0BD40A750A7C3577F5840F5398E7EA2B115DE45125C6F0F5F5911319AD1A030CE210F9D7B69E7EC28708D51362C0F0E0E2CA03ADDC07F49143AD03AB6B05678F35616F2289FA1E080716CF7F5E37E33314AA7CBCF8EFBE33E8EB2D0FB4B745B68947CDE241A247B4CFB7C1A9DA7CE1A17640B426561A01ADA3F887815DFCB679C377FBCFD5D6F8233447E1D3F1F41A548313E1FBE338672019E5208C9CAEC72E62462588A719EAC6E9DD08B4250EBCDE7280A80131A537119FB519C6B4D2915E8CF9363A8A9613ADFC5C0B13617E7C0348CA2B69DF9F21C3AD0AB2FBE57C854B686D7C80709F7FBF3E40C0FD7A7B16778CA252444A0F4716DCCA5A54CAAAFEA9EDA58715C388FFE7DCE2D3935CBC51508F27AC983BF2D871D578B6E98962771B4B98A02910ED30D6ED65116BB88DF9149AB6B27BE0769B7C1656958CD038A8FABFA3BCC70F2936DE0A870D959C69D86DB2C55382976305D8278E32789DCB9B783CAAE01C9D7D389CC8C103535AC88B47E6D0E2823226F54591E1B36A40C2058312439ACC959939ED705B62234BDCCAB96E7761BD3B4DDF12598A4F506A53D07D8C628E3409CC7DA28C65A2199A6A3BDCD755C4D1887074E2FF874FD706204D240142EB9A4AD9E772E03D0C9081CA33DA7283C818B6B380ED7204D738550EC546DB77090E6057B65CB648F0BC9DA16D6E2B393002C4241112CD7FA82327B93440990AB3B5C36DCD42D1A45915664B4425EDB860A9808BD6C520B7DD23B953D2FD2140BA6D7BD845AF5166B9ADB4C86B84F932F200069F7D06401A6CD3E48DE521879548765CF23CFBF2B95BD1B8C56E48F3B705A7C387A70C27BA5A758D4FDEAC33AF1F31EDE72F6082931E55CB123F102141E3EC967268CFB45612BEFB10000672035773A3BA36F6C6C4E370AAC117A3E7C6F638FBAA3A75AFD2D58CD0FF2E0C2B8611A606E86A41EEB65C82A777332089FB5BDF12021CC46443C42BB0ECF0BF053B54AB593D0F12DF6EFFDD00986C1A619337F6F25CBAAFC3B42DB2310F6572779E83D384008BC078CAD3C9935326D6D9D19D878364524AE2153C25E6E629DD595C0F1530A42A49D8AFC2E4B7B785D73D13AE6C25D012791A7EC59C9A4ED2D11591C7DC20C8FDA3784A6E9866AC1770E998A52EF90ADDDC93DB4107FEC2BF0B8BA4D60A99B96EAF0024D753B8FC18EF93334612A1F513B35F545A5B21502341B43E750F9FDBCA1FBBCC7033054E89EEC327B7AA619EB67D0D0648E7ADD7816B94EE0FFA3B00F9CF673B4FA45D8829DC6B85DA96B61C7F93B4D601711519D23E97348FE6587E43946EE1A3C2917B42A4389604CDA588ED171AA98BB1BA359FBF403E38562B3B014B3EC2DBEFBFDF0E08F3FFA9921669BA5B05917515A3347E798175E3FD9A35B4F2BFCF667E67BE60179ACCB76A2D7A693BF3C6C6472784B8D08A151F4D2D279D25A3115E8ECA4D137E856490236B7C1F37F64701286435C75F2DB6677A5BBAE56F63ED6E01130E7CA70156E2A18AA616182A4C7085F1F1EFC6EE9AC719079C01B1065E5530C826C3A33C43ABB4DDCD8DF769F2D6848BFC0CC612F46BDF3296BB6E53BB0E5E33613DFE27B272C57B1B05B29DAAC509907BC4DB2C78330AF7B2DDB13C4D4AE2700684175B54FD6E262D31A21DD46C73C322C8F8C4B270621ABCB0A2581D65B66F7DFEE2EE4DE5308690E624F3220244B65387AF0030F2A3F378B81B63B374DED2683415889C95E10D7E4652EC8A82EC66B1F34D387ACD5BD6B351F5CD687DE75132EB2F4218AAB9D02A6F99C6CF12237584F933F6348EB4BF78ED050EB38221088648F0BA8B7340A9664CBEEB7360391283A32108148F6B880C6C240F3788891062AF825B99957A48A39E324ED8EA01D6B78798838396AD7BDE7CC972FA00E0BCA023776EE79BC88E20DDA7A57068AFA391EDAC724F4120FB2AE916AB936B26FEE1C38ACE6349E79052486C15D5020437E43546AD6117419B3E4612A98AE74303D11534754A2A8C3CAF8D4E1154CA9A375414C225B93A293AEC02796A965BC72AC5D0E7EE27E8E85A844D18995F149C42B74CAC82FD864C72769BCBB97E693F4BC586CDC04C43CE59E562F591F0D0DC71BC70FD467AC7AA203A914E25AB98BABCA63B372D26B775C6FE5A1ED56403BF1D1D6591CEE02EFA593243FA358B6F5DA53542617F25114DEF9705CA2A1A0D809786D2517BDEAEF1548403A08C6B3C8FD1165E971E82107ED7BEA9ABA8A2BD785E3E004720B78F4D5DF2DF61E4F939A222B39F9970F51082EB2CD2D9A67BBAEAA54A463C84AD5E9DE8135703394C00517499BED008721AE7F46278E0B27544B02384DF0A16403DECA4DFD4730AFF2E6551E0D2370FC0DDFE5CFD7115579E3ED639F19471F2F335D81A8D69B056CFE7A932E1310D6E37A33072A586FD2657CEA7A5F6FE69065EB4D6E053EB19DD79B67D1BD2F586A1608CA729ABAFCB380A6A2CCF6CA37872D58F9D2657CC2542B5F197579D05C4C57594C51947FE5D352149952516E434808696A50B454057C72EAD2CE1181DCEAB4DDDAC91BCFD943625C3BCBD3CD2583005858356A601AE62DB871EF3A2348B92D6D3B9AF2C6F3681AE168CA2503BF3DFA9E746DD75380A0C23CC0914B236DD7C9CB1629FB9C913D525DB791D53D6E43AD99CF928711EECB7742F76CE7AECC2A2B51D94E61E91D1D3DB7E3E2FCAAB116C39B91BA1D35E7C3988F0D0A86DB7C4A7D3EA53E99938DFD9D529F825D6C9FDFC1B93DEEA5A576F4FD18AAE0511A0D93ECEE261D5281B4A7D52CF4AB43A8426828963825A6DDCA73EFF33EDE2FED5B76D93D2B2CA168FF8C2D65C2F59C2AB6F7D04A14825D34B6544463979D34D9035A2578CE8B596489882ED99B589D77F74A1CB2FD3D411511B95A7B7C4671B695EB16D92EED426D65F3397421C6B5B3685B1EF7F7C31F8676D4621AE3A00988F3FCFA02E757F31DB2151C9E9B6D6B8386C398AD9A18572BAB667541623DF65B19BE6FF1A096E9E5BE4732E4AB2E5720C1CECCE5EE171CBCF9682E8A8A8485E1E2324696AB5BCC9907618E381BD8855688098E77EB093A390A08DDA5455AD618A9FA9A5E19259A7CE7CBA326B0AC98AF556B354EFE066E1FA2E8C7F12350AFB6CBBAC91EDEE817B0E8657715CE89EE6EB8DDADC011A619B67B28CDEA42586B296A3A46D620F4349771F448C19AFE3AE325370F764011F71D778308DDEE2DF44EFBCF6BA910211F294B88E386C895FA9AA65BBC68C0016A236AD3F1756872DAE104A9D9817343B66982D58AAA4CD05A55BF53F09AA7B01A2B27C660CC177C6B4D1B25BBBEC7FEF033F31AB8314887C76B6B6FB7D2B9DE2DE157E0785071A7E5C574F7B4B30D66173E3BEE8FFB38CA42EF2FD1ED65EC474542CE69721238F7494D93DC4A1040923D2ECC4E9602F21B4A2A7886F22975EB39A56FB03C07E804763595443F978B3C4FF4D3F22DC352A2EA6710443F8B8B38EA268707F2367475058AD56DF408A836AF1428BEFAF70F4DE5B7AC700B314A448B3F215B84F3CCA49ACF3A509A59523C7AEB83648F8639AC5473DD47AE78C916050BBF6F3DA2FAA1BC7AEDE8574C6FC1737E7A9B19DF25CF6B941087E57AE127E8B17C9DE51743E8B2FC6F4E1C8AF84DD73D8EE328AE2BBF96573E81ABD366AC714CA35292BC70B8991CC9B01D0BCFDEE59BA6123594D269F8E804BE27DAF0D1135F09A4B9DB454F90F93C97C04150F9167C910AB0113B687AD341E9EE7150BE53539A33266F8BDD7C5136FF5DD13CFC11463F43F48E7C1C3A41797CB16CFB87BC2DBA3C0578DFB2B46EF05E4D2B766D8980627A16D41A3782507C1713C80569D706164EBD543C70EED19E79AEF0BA872DB848AFC2F5D9B77E4EE0DA71EF02A4D452FEB74551D4F0EC8D6E9EF0EDEFBF3B6FDDB7EF0EDFBF7E030EFE78DF827F50BB523FCC00A65CAAA9E4A79FBA0F10037480D3C88D02CC5E1D282CD6B7BF627E96020FED54BC520147771F6DC9160ADB771185E56480A4F508D08C5A5E3085015158C28B08F1308F31D44D1456B0BC508A6EA5B080974E9CFA4EC0B65318C03C6F7D1B80A387C8774123ADD72A09AC36B7FE7D1665064DCEA143ED5D02C8C410D2183C632D15D2CB5BEA573F41CB18ACBA42D257C0F363E0A6FA2DD6007C4B1F00E6D9A814A1C2710EA04A79FAEDA0092DF399F0460A1582B6178EBF279CC10AF5F91E66098141A136D760B38D62277EE6F04E3167562DFE0AC0161AB55BFD969F1DEF0AFC3D034983ED8D4AE7BE874EE9D161DD7BA352A04BE7790355146183B4E20D158A7112C5B7BEE781106BA29630A9AF6F54E22D7408F93A015C0513E429C49CFB47C810A2D805D64C21ED5C99C8EB2639AC51CA3D171D8A9F44192E41859F845C1C38AFE12D148ED29FD0476A6AABC202459088EDCFA14A47A0124761915B5DDCA987B5555A9C9C1765B0278ACE5094186BAE342679F3EFB18FDA4628FE553755998630C9B670E8C2A9F01C0E44A75823D5AD15FA532206DE158A25406D5A436548EE7C529D0E15EA74FCB485E3DFE1324EE5706FEF63C703ACB45E2970425F2777D1D72086CB717259FA56654460474F37709244360143FA566546A0C1FA13BA293F9D67AC8D726A891FE14C0CEDD623E40DC1D8B72A535222A387D85B9541413E67E95F2299560A8201D00A65AD922472FD5CAE5574E6397436BE5B4543737037D447CA013D0EBD45B1B5A2D3F886BAF616EDF6F0DA2D17A5A3E3BB70C47D5AFE0BC31043BCF5C34442BC34CA43B2A310E5B7B0885E2D56F9712E68EA9CC47538FB7790DB1EF9E50ADC01F4E652E1F2A12782FC30657762FCD0F5B74ED0A263142CCD7D1D446B8D952EF902B62044993F2DE4AB430ED5944F5D4D04C56115433FEE63DAADA5F48571AF3B62A8F5F2D612B5271BB6D07B05E6092BBE5ECF86D37C3D194F5EF589814DA9A7912E4A00690F88B6B3813E25E201221F9A231D261A5DDDD588D1D00783C14302D8D9102A4F6B9E000745F7CA6B93EAC39F222D95B6E20D0E6E03937121C7C81904F5F9D5B1A9BD564F06D0712D19EAD081DDA4B01B15C6F69B6F2AF28ABF895883258DB80A8CD5EF55A73449E4693C6151F8A4B243AC9D0E6B706F0815D6E0909606637046A1C67034DEE0FFF5F49869A552E435D2A0C175992553A8CC8329B19075036BB19037A66A0C01ED4C93C58F308BD443E315E94635D8A351A47A1CECEDB181321D5C1C3554E1B2A48ACAFE0FA0864ABEE8D0503CCDBD33CDC31F7310C99FFBB203794C7020A3C87B4782A2A4BCEFBD17A5E330620035E3745A076B95CBBA43B5C22E15924B9477BF905CC1642B1FE1A31E0A985C33D84151580A06D31696A13AA8A92CE8DD690E7ED59354CADC5B9F3A6A0EEF9AA861358743C1509AC361A8568886BC9066779AC3DC732515B5F8CAAB8E3A24BC236B5845129131943689F8AB839F7753D00EF5AA7877482E74EA11A2DDB948D49347142565166C7F2E12C988C1948DE8F4345CA44BECFD28A9442F798F49ED4EC12E394F5751E43455B483D7ED358EC39EA1D48EC38A69E85EF1469854CCD48361BBD337F279328A90E29996FE948BE0C2506A45F4781A0A55BFF5261525FBF05B0B97480493A32103581FBA4B43E908DDEDD1AB09A25D2B2C4057E4298BDEB097C01CDC2717513080BE88183A95B0404EBF4E5880AE684D73761A1610513094E64C382C90D3AF1D16E0D6B6A643BB0F0B48C9184A9B5E445820EF89CEFA8DAEA8AB4D3DF9D30C391C1D4475865ABF89D8339432B65CBF55CF08EE44F738AF3688C42D7BC2A11178F5BA8EBE3D93BCFB30983113D33080F288193B159F8AF3AE8642DA0ABFAAB516EDD4B712D3309C164DD8BFA25E3F51485A92F1DA5A7BCC735AAD2BCFF0C9A87C7EEA20DE75F6A9E8451A8594759CF2D62AB47BC75C41C8701AF5229C73D585922275D0BE5DB2510BDE7DB1FAFAA77B3D258BB0BC19736CC9FA9A1D1A409F3565A943097DC7ED003A5DA6A646610A5B6077DEE12F547EB9CDAF1379E2DD500C875F797B4D52DEA748AB20820F977615E40C4E0B67D17DB25C1CD7571C568F5894651C3D2681905716722011158A2BD0142079877F7CC0832D38C4A5075F07724B98C531280DB8E5D1B7160C51A2E0D456222AFD041ED4DAAD52812032F23970889C752D60F471151150FA548701A5F0AB8AD835E79D3E1A24794E8807913EDCA500780631670EBFD3AB2D9A03F2A15F55D386770D2D8826CCEBDCD828E012F78C71E0B20FCD1800C4EF4A560167EF655620A233BA8B2D721609AF9E31701DC04AA078009205C789E129E0897AACD543E4F2F11A179EB346E332119D0FA1CCECD60053266BF1C194D94F1A6044BC68720E144024435F571EEC333F3C689CC78074D4BD682606A8C5A5F2F54D11A3EAB73D75E556FA6A52F1D58EB6065015EFE83A5A9C438D74C633AF9E1238EE6DF280920B003D6098172C01492C6234012BECB1F08A7C0A3CE606CB1D29E6A28E05D654E258C92FF82016654617DBD47C11FA7DCC6AA1E55536424C3E8B855857C026FACC26DD27036E2B1A2A99206F2FE137BB3650735C816C972C975DC7A1CB7DED2B3DD4BCD1B9D44321138391A08F5B2C22953EB41094FCD2078E540C6E8920D8A0774F04D667669521E1B1DE951018F06609D89D83D8EA89B97380C740597D491725CD78ECA356A832E6C920F378C75FAE5A65247BEA5DC149C531796187C507E505BC2CD6D09AEC149F6FD795540B3E8ACF5C7378A879409BE8A1FA8836D63B8E3329619EFA44B609E816CC2B4E1996AB35965D78B1B817582D1E4BCAD5A4840D38004EC7F115A5A51E630917C26E8B923238A47392325A30809382A182D2960178AE808801C27C0296745E3E81390378D9037D3180D9B5147141BEBDC97642B8BD69CE0FE166666F4C29E32D225670CECE71A8264FCFB5E83679E88D0250D168A7C744D84DD06D616E204B3A2F3BD09C01BCA43E0C0A41B31D36941132010338078C58A2C92346E69D264F0651ED4BFAEC74B671B105FDE59F7F6149664EC098F79A39F08281102D055AF49B39AFC1E9BAFC4C0741BAF05407463D576472283D9A37E6D88188017A939EF070823903069AF4F8D9F3222E184C7AF2447B737E0C39E931A9DF227EE84D01C20471732E0C3A0570B290398C50E52A139D90642B63DDA8F72D24EC90E427F7A0119C545A312BF46C8524E5B61D2B06B218543EA8980DEA60982067B45DF787097389921BC56C30B099AA4CC8768C19D2722A1F7A66D96494CA47F44F37990FEB2777B74CC242DDF43D1645B5BBA7CDD2EAE9D93A25AC2EFBB8BF761FC0C6293F7CDC8755D01B32991340B98220A90ACE9DED1679864DCBF2CB62BD755CD89DA37F5D2F174F9B204C3E2D1FD274FB617F3FC941277B1BDF8DA324BA4BF7DC68B3EF78D1FEAB8383F7FB8787FB9B02C6BE4BCC7174025B8D095A63E71E50A5E815190F9CF871927E7152E7D641CFB11D791BA69A28014EB0575961A573DC588956DB96550BF4BBCEB93B8A365B27CC5F3CDC232928A3AB2731FCFD338A7F34B972148A86D9B0EE3D7AA8246705C03443DC14365EBB4EE0C4553819CB903C8A826C138A3326C5AD9B37B87118CD577D4855AE2F0E4794FF2B86B22E5E56417F485044813EBCF21926061CFE5D1FDAA583649CE6761087867FD7877605D22C0ECB443C1C1C51A00FEFF809B819321AC5F3D73844AAA805CC2F59EC149339176E53AC0FFB28F0E11038DDD6EF9DE290994253B8ACCCF1EFFAD03EC7D14FA4C679C2020E8E2830E128B2CB9055E7B05B798A1EC950BAB4056401481358A71BF82F8942FC801A616538E5EDA0F32D10BF86810EE4B9D0681EA17400FBCE42FBB84FD9677A8ED86726096AEAA6671DAD39894A99EE6F626253AFCD67280D18FD4C55105DF1101A0EA2FE68046715DF270C9CE2A3C1D41943A7244F6B23A6CEFAAB3EA40BE8BDC076ACD9260AF4E1216F9E0B8F283018AEC9EAD609BD2804B400F102836934F6A3E2FD766212ADBF1A0C73B4B4E7CE7864892144BECD539CD7DD99F910A5BCF46747B4928A346C89269C7EEC49D9A92C085857812ED387CA79E50907ACF1089418B6B9B3BE5B8D1C5217BB6BE1D0FA57FD65B58F2C31D03D3FD9060E0720516060F7C36D96B2732EF6D9A0B775D899EA2BF6FDC58F842A0972B0D150AC213B0F0901987EC60567416CBC14B617D6B061CF47E4170CA6811CACB61C84C96963413E4D47F3D5581B497E087492ADF402ED2B9DFADC9F5EF31FE333576915809E9CDDE6C20F4207C5F780E4B08EAAC7D3AB57A6054F1252CE861BFB1B3F8FDDF4A12A0AB19E26E8F7B7BB7F32932FD9A57F9E8C64ED4D75ACDF68EA30DA30962F6B496FD50415421DBF0562AC0697F0618D46CBF9A54E0BE87D6269214861CB7E2C4D77FB607D819A14092D4C58B2FE6C401B798F1A419DFC8A35054CAE2D234BCC42BB45A2862BB092FC1A6D30F099A173BF9318FACBB2EE6D8D8AE2F49535CB82E169635EA4CDFBB13105368E7660DF8DA131112CFCBBE9328E7829945DCF491F1255C1B6B1446CD44716DA26CB5FE0C2905CFD0E35D6487CADC79C0A4C9F1B22CD83CE22E536F41AC04FCEB2A0F9AA0FE95BECDF430731E080A38A761984AFFE8A4720BFC64E567CA514BE3AC9035F3E45494B19B16039C523B318D8D1E56126E635F7264493B9990BA11F13613B196A1A2960F69DD6E3A7148468D38BCD50A28AC69454D56F52D81570127A77B0FA36FE84D61D19ADE63EC0FEAC15EF5E41738BA505E5E58748AD87405C7ACC145F8C82287EE2DC069C284AFD7D0EC98821CE219917109221EF411DD4965E336757729C2DEC291FD2D86D6A453D6B12C912834324E5A12EE2FC48F94D1FCA5F0195A09A7F1876336CB62D2FC0B690B78FF6675B981B4CCD8D8A1A444F5B4B185E8E8FC5941ACCF7CC02CB745D85EA5722612135256D42B42C4CBAAC0DD4559280CD6DF0FC1F9913A081CB39FFA6ACBC8BD0F51A3C02F65C40F3D574ED96F0166F467184E32737C83CE071E13185E6B367C29F3ECD621DB38D955D0F3F8CBD65EE36EE667BD5E0C6EED5D9390EDCDFBC30DBE0D99A08AD09FF0D88FE2C09F72D09730BA20766EC96A37A559588030B5E5A1543A1794143E495EF26CA358F388E38861C6D1646DAF446D9A5839E24A321355F0DB42DF268BD8DD8B7E56410E6B4C039063DDB40E2663E13EBD7F2C0C325FD30549B330F0C90E95942CEBAC2D8DEFC1943B4ACBDA93FFFAA23C1EABC8D9C400D7D1BAFCE1A7BB6CC410A3E0B4675FCCA4CA648F5262D53E3380723533E0B26713AA6EF7571CB75F090EBDE2FA00ED4D1AE1C566012F18A374EE0FF831730A2CBA6395BDAF7F6D7E8BD63979E7CABAF66EB863B270B5276DD507E9ED7206288F31A644C9E574B8B5E5CF2DBEF7CDFC2A2F39BF5B5175D5959845566859BF236D08F378E1F70139F4575F4B1ACB2F401F2B1DA4DE2E4C3F06B98F93D2C6FDA70C4DEDC24E6685B3E769FEDD6591C3240EA8F26F1BA2481238889D7555F0DB904BDD03B1F6A19123E1BC0135431A7F60A242065E1738A0D6681C8FD1165E971E87D7152F03DA5267E4EB1C1B8715DA82127B0F7C0E35CEEC82936F1086AD2B8D9B674A901B71FA2105C649B5B74C93CC167BCC08452AC61A9062CBDFC3A26D91E6E86F23AA09FB6D9D2291F449109E5D73FA313C785D38780CB6CB909747C60B0B0E95213C82B37F51FE98BD6EAAFB3DF298638FB9D2FC4EF143E1669D3F9CC91B4F440056DC71EE0B6938A93779E7394BEF96C088B931F8D7F9F0790F100123EB2687300E5485A0E2041DB5F6300E59D87DF1E7D8FF6D3A82203CFAF6CC39C55200A46A5A47DC78C2B1C2D55749A39537634D44EE6D56C8E01F600677F8ADE7EB36CB25BF596928A3B0775E6A35DF330C79478A8035E2CB696470D74018DDD1ECCC7C6E6230B368F8DCD36AD1E88FDDBB1D6766BE477668B6D9ECB497A200A86F4618EA2308402429B7F69CC641CB1A573307B0E666B68D56C418B25C9CA75D10661DF918E124DCB6087B0F5D81D3F3B0BC13C24E9873F7890AAEFBBC888B09FC7301BD2D9904ED490E6B1F1FA21F601F6364A5C5DB6388420C66E576DBBA9F6EC34FAF52D165B46511D934DC929DC456AFB06D62B903009CFD5B721ACD50E2DCB50613B1A57CBA09D1E98B15B183B168113C0E4D246D730082AA54E4A676D169F5EF8A818F2243E0F5FCB9131FD13F97646C67CEFC5A43CDCBF81DB8728FA71FC08FA8D15E0785A8C3079F37E46568993759C888221B774EC6BAC3DEB617D85DF6A35BEDB51B406A137C04A91C5D67E444981F43AAEF2B14C43A2CB8CA11217D7F181D3558CD62A5BE8AA0366B5527E3587845CBA2C610FA8F0CA776927FA8F664DE661278E160D31D8BBDFEFA80D69EC8E6AD991EFB1CF1DDFF977A3634031A00210D5B75DEC3996BD48B87D330AFC7C058E874ED31280EA8FB3A3CC19F655E15114A68E1F8298AE52632FBFD4FF93EA031A76CE3D80B6100449D36EED3E808D93F73FD93A2E286E293BF1E324456EE0AD038D7D5E65B9A872A7A11E3E27706ADE4315F6D67F0F8A885D53E11CAEA4EE40925E473F40F869F9EAE0F0D572B10A7C27412A1CDC2D174F9B204C3EB85992461B270CA33417D7A7E5439A6E3FECEF2739C6646FE3BB71944477E99E1B6DF61D2FDA87B05EEF1F1EEE036FB34F372FC16A4139785F4149122FC06D0D66234BAD58659E9F9E45F7CB058DF143F9A4FC891FA420BEA92ADE9C3BCF5F9D475018912A79A7B19D44AB84FCFB05DCF921E7F9DA8F7F05CFB44655DA7B05EE1622D3F7719F6EF891633E516F3F2D6FD12364508EB985FE13403573A0877CE9403F2C0E5145907764B9B8C882009D12FCB4BC7302D6C3A03134C6B4C093236178791A7AE0E9D3F2BF16A7C951000B410CBC0F8B1384E037F80D2ECAFF9E81F2C3E27FE344A4319B624AD3500D5CB2A76630D6207EF4DD3293AC00143E3AB1FBE0C4CBC5B9F37406C2FBF4012AFCDB77A6A0CF41FA10797D40BE7490DEA5B96D95403E3C78F5C614F41548B3382C337C49D8FFB4719EFED914DEF11370B3C66E17103DA88369FEDF50EB6A685FB2B8B40F98FA190263F63924AC7C67CC487CCB4326A3577F984226763F24A0DF22136D2A2D17E4DEDA3964087AB5CAB67AD508E443E2E0E0C01432EF41B62E8681FF801C57DBB4D421378D4514A653CF719F433AC57D76DC1FF7719485DE5FA25BD6FB9EF2E4033B541CC3D4D77E5DB8ABF89EB1048CE1D39B21E3E7F2DE84025AB2718240314DA2961F16A7FFE3E632F62394D17B5341B9B9004F29FC83CCE86F8B6F3174C93E2C5E9173A61659181CD61C5BA3EC750BCAD0B25E4899E1E04D56B74EE84521C074518FF358536ECF0E5BF4ACE259454BEA87CF7635A10D55E48AAAE3CC4CADA5F42DAFB63D2B5DEAE27B855DE9BF735B4DD599EFC598969DAF1F67A66DAA868E92202A9E57784EBD9B6A02ADF5F50077FFAFA15220FD259C62630780C1AAB934E9D08B435E2F46B090EAD4A957F24E751FC1A663771EB51CF0D5DFD663160730CCF8C4AFBCB4B0B23C0DB759CA73035B41BBAC6FA5B502AEE7512D179EC22CD91BC16598C06C18E78DA63A96FB5AD1E8055C261399EB3C1733001ACBA49C63BB7994463ACD693A6B766F9ADD1C98B560A1B9126CADA8341803751DC308D61E3227709597C5A0BEB95D314CC8EA9686860A6979687527B80BF0BDA07E3116610C1394695CBEBDA99386772714A7E198E3E670B8E142BB6A28B2929ACB09FC9D884EA2D4367F25E5BA26E8661DDDA54552E274867D2F635E39DE5E9B47EB250B4AC9DE9D16682C95542B7A6C6CA3F43A481E31ED3256C964D66EC1757EFA9D2D9876FA3B0E9BA96F578A4CA00727BC57AF3DF0CAB36F41892AE78A1DA917A0B00053BD6DD36ADD52C0833E21CB05EDE03406A3D3D68F682565400A6A5887952B78E4CE246683DF186739B0587A23F69022F6F0BD71E2C488976CE4D2D4C8C6908D665B231ED69DC774C7017D017EAA571F2D1282BEC5A83B4ED00B70F91E0606FBBD79865CF9576E3FA636E6C572FFEA240F56C26284C05B426DE5F6AC018F7B62CF07D69F0DD260898153CD9594AF03346C7435C86F70489D12B08E9F5210A28D465E3260BB9D50BBA98AB63329AF8093F0123E4DB85FC010BA972D72A87BDEA115517E682BCDDD847B050491D67630E0ABED3628A30067D028678E866BC9693350709E87798ED08DC99BE9232ADF6798D05524B2B798B14E134870F95C17167B9C0398730073C4014C8E69BD064F6A8F5ED06EF6ECC7679C2BF9F462A4AB47592D83CD9F0492EDC7927EE3D0092DB321B26E88E4B7C60D6103B27C98F9F9504742308FE5316F396887C6F466655BEB4EF27107BB018746B04AE82D72911BE882B71DFAE80C6FBBA55390B379F6A1DBFE54311CD5C7DE340F78069957BC176E0B6635FBD981366183C6DCA7A272AF648DA7EA6375B6AF6370A65AC774E8C9E1863494F5E6261DF379D36653493911F54830BD296B6E1E5553488FC4B3F1C9E94E513DB2E97567194FCC98D33792E62F70AA8C38AFD14011532EEA29864C5FF2C2BC7AB694BBE1A3D50BDE45B922ED9F50F871E2C6C17874EEC828CC06616406E1D28941D82ECDB06ADA2533BFB84254B6D27DDBDB264E9B20E1388CD5BC57D2BABF13B3F397F55173DD63744C8B812C3DF22C76851B09A02FDCF36C33F64DFBD3E4CF18F6ACDB26F838EC8296C3AE313517ADBA4CCCAD834ED4B27D2AA7F5B456D703AEA627BB7AEEC5767D017538DA4A5CFF228A374EE0FF43233ED6E2B0E1242CEDD80E51A227057CB76B1ED39D93BFD0F6A293A1746E9AC0DB77B2C5935F1E68708B05D269493B9827A1D135A2BD7EAFB4A74D0458CB3D1F702530C969B32FAFBF99E99A17972D27393528C827462DA35965E9036242B943AD4E02333F5BD21B8BC6E011F42A9C3E7C827516873D80BD7492049A0279824D9B7568CEE0A328BCF3E17840025506375F9BA77C57D45F8104A47D20388BDC1F51961E87DE176881BEA76ED7297AE5BA50E34E206F80475C72DD6EB3A8A6AF73DEFBE54314828B6C730BE4ABCCD7C61BE4A70906BBD4886EB4AE819BA1F42DE8256FB6F68F115CFF8C4E1C174E3D16D87A9AE003A12BACEAA1A2D9A39F3DFAD9A31FC8A33F0A1C7FA3E56BE735E748FBF8BCBD9EE2B77A2A8E940221367133F5CE7E43C0F6DE1B1A47CCDF68649E4510A0D6C8CC6BCE23B3FF91495EB59D3F80073B6AE1A6ED710DEA5C9FAA0E5A5F3B619C6B95552AE5BCFA827AD582D7688C6A6D255515E7113ACF9D7613342736ABE9E6B5CC591D838D17DEB520E80BA3DF3B9CD1A484193F4BA31BD0EC4A18D70718E48CF17897F32FDA672FB4813968AC77353CDD6CAAB6EF459CC29B4F5A83F9A4F59027AD2769E9342DDB24B7E8FBB91876A70F23E4D2707BC9E852C26C1326388AC210B8F9FE7F1AE7AB061982166F4ECF1B4EF386D3BCE134F886D3CA758BCC008DA85959779253C8A051001B2B71433AF28D073FFCD17595D72611ABCF1C28CDCB18C76EF67F35C33D56AB6B773B7005ADC766AB673CF106530D274C34945AA802E70D6DCB6EBB6E8CB2687F5399DA6F316E1C6FAE409205A9F0869D76B9B51D365538FBA9EDA2CD6C5F0762A1857BC8A77AB37E8F8F0D144C66622DBD48F0F5B0F78A18CD04C621665EA3A9CE082F22C0DCD540A2037480FFF4449B5782385B10F6F89DD36A1AF152F7B3CD131B9D5FFD5093A5B61B4643DDF8EE1F5EA301CF63CD77004DD2F2187664BE176C0C8BC2BF81DB8728FA71FC0834A26978E581EC0181728A76A0F3D4577280E766B7BB18DEDAC6B155551F835D1B8705691F46331DF56B107ABAC120B6C92FEBFCE336490656C3172441754A04AD0484DFC46DAFCF7065BB8DC2C44EDE58050CB9C059821F4ADD7514B68FB0F3889FEFE5E9CC34DFB5B0B0A15532E37BECDB9967D7C08D416A07968D3483B27F761E3AF80A1C68A97E854713564912B97E4E6035411733598538CFA7BDA13E5243E838F41628539F695C51B806C1DD1E53769E05A98F1EB182747D5A1E2EE961F82D2C1C96C52ACF7181BD7712D7F15826C1BE799A1411E9C13CB2CA0A246DFFC2A084A601A0FB5E7D071DED4ED2D8812260ED881FBAFED60904DCA1EA6B5A1ED4E11A325DF2056CA10F030993755F072FD5904F468D8D92878A3B1FF731BDD352C7427B2B6AA6AF8F647F7874D1355E984652DD9BBC4A127652D639FBBA30A4A60AED27B75A9F3ADB4281FAD05C638B4A36DF99129709B327D09FC862501D272BBF0A35B62AC715A0FE464AFB606FAF27C524692668A18B7A51402E93FA5139AA3F3A18B114EADD2856AEDF470F4E780F6E2AF28ABF8958AFB046A472110583D83D72800A69A22BF4A36A78F707D0376ED7B4B40E237414AA0787CC0DFE5F4FF7D6CD929651BFBC6C400D341C0D3D681CEAF1604AD752D9208D3BD337662BF7E8C10F3C085CA86BEC6635265DB69033A3D24216C346308DE05BD22006CD002AC4EDBB0EDEE6C1979D68507E416B7E8F8FD83E1597CA62722C3E0C6289B0EBAF2802CAAFBD6850DEC101B4A6E9870EB22AE8B6434569A27FDDB44561495013C67AF0E04C50DEDA96810AB5EE4EEAD8198659EA7D4B9D3A30B23BA9D3C73966D1F72D7ADE019A1DCA1F1D4D19AF5350DEBC4711507E9DBCCE14FD9886537059BFF4D5515BFA0BD85DB2CFB661B4704A27AD406C7FA6A14888FAF11A9CE21A410A7FF171D2DA5277631A4A52AAB40D532376477856E265D886C95884FC32CEA1D69BCCD87E01E35A7B4C8F619D994B7BA875E62F2DED31AC2F73690FBABEFCA5453E9A75652E779DE58296B85EFA72415BBE3B592E541723EF4491CA5BEB86720FAABBF43028D5A7495B90B2135371124AA90FE526CC521F85B3504ADD7662D878E43E60369781E8779DC5558A7D502F711EF1E3F11539072289C3D422199227AE3149920583840D79E740598A88E25EF44CCCB87EF48DD3311DACF4C1CF01F4AE4CE48AC214B60071E5EC441E38F1E3244567B96F9D0430DA865A416FB9ACBFCAA0B13C8BE042E0B83EE354CAB8295ABB0F60E37C5A7AB7E8D2A5E298D4EA765B5548387689C4F2D9717FDCC751167A7F896E8B3B8518749C3A02BC444D3572C139008600413D0111BCDA3ED0A6464D872E05ED7197070D540494D5B4A8282AB79489821E6E6503E9E8D246E7C133F4D015043494D5D4086B5F8FC15497085094E51A2888E457160F512C42466404EB61A413BD0598E96A520AE8BC7893BEE779C8D2EEE735343800EBA951AFB6683ECC4DF7196C94395C1E706B0948A82AB4C27D0D9E78DD17D654D0802AA9E960AF93630860AB0830E315CD303307D9E554B0D53528C21BA9A9A3D36E8B38214315BF9A801A5E65734A34A8D0A6408D9D139364D073EA08F0E3215A156601C7A51CD6E368B1806320179F059051A11EE4327D980BBE2C93E02833A675109529495C44659904519985A583482089A64882464F2262DD526954BD6BAF42217AA089C128AA282080ADAE4B8B10B702979ED0EA9BF6B972AB4B25A22BEB182863BDD814EB645D45A59A65453DEC1A62E5579350612652FE7D8D5C2AB4AD35AFB29A12321CC15040160B30E395B43112E106115EA2921C3B56559F06B52321ACA9A046EA3E605100F9828EB9DF61813595ACF0E4F74210C121C11A16D2C529634221AAFB45C4C0CA0A74188B648D3EDBC8E58401DF140D07631C3FA48143A36BF4C33AD9FD0DBA5CD4BE03A20F46A8610A75935BAD339BE5370C70786A7025017FEF09EB59FD4DC2247E90246F4E17756706B6EC664EC5F37821AB2F6105274652F0832890304516F3C020D115AC32883DBBADE090E2B0B79045582885E1525EA6649421AB5B30467CC898C314CD13C94447440E59DE19B650C212FE096403682DD8839FA0E5304478C096B37B89115A7C90749559C3D6CDCAAF963A86A5D8087B274AC3B1D0454682BC566D3B876792883A27CC36197BE7989D73510FE55BECA3EF66192011758E738ACD429788A04EDDACFC6AA76344104ED03B612E65C72E0AC38979734EA99D2E975128416739C7832C48128F9AD5AD8A8F763AD584BE04FDE29F68E9D8359EDCEC498B399CC1E99BFC0047C7EE3152B32431E61C82A8637D4D0BBD764C674AD0C8CD1F73171556539E816E4EE68EAD26270F9AD36955B67447799261F2BC4DF5C9560715235295183CFE0E4A8212B2FC572B518801BAA76378B4123E472C4955C222A7CB46398E444778BB077977C802092BC4BB01381CA2589B45D55DDF755E5D5DF671BF08DF971FE05F68919C7B00250E8224FFFA71FF2A0BD1DDE4C5BF2F20F1EF1B101F9B27E71BA0551DB44150C585288AAA2AD475E6E720753C27755671EADF396E0A8B5D008D34B2CE791812BD517C0BBCD3F05B966EB31476196C6E0322F689D21265F83FEE33347FFC566C50D8E80224D347D7B97F0B3F677EE0D5749F709E35138040F98EE51B5A4896297A4BEBFEB9867411859A804AF6D5699AD7507102082CF916AE1D74BDBE396D704C9F817BC74501BF47DF43035C04442D0892ED1FBFF8CE7DEC6C921246D31EFE853AEC6D9EFEEDFF03779390D56DB00200, N'6.4.4')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202206221055273_Upgrade_To_ABP_7.3', N'DoAn', 0x1F8B0800000000000400ED7DD972E4B872E8FB8DF03F54D493ED186BE96566BAA3DB8E6A2DD33AD352CB2AB58FC32F0A8A8424DE669175B8A8A5E3B85F761FEE27DD5F30C015FB42822C52CDB72A02C84C642612894402F8FFFFF7FF7DF8B7A74DB0780471E247E1C7E5E1DEC172014237F2FCF0FEE3324BEFFEE5F7E5BFFDEB3FFCAF0F27DEE669F11F55BDD7A81E6C19261F970F69BA7DBFBF9FB80F60E3247B1BDF8DA324BA4BF7DC68B3EF78D1FEAB838377FB8787FB00825842588BC587AB2C4CFD0DC8FFC0BF4751E8826D9A39C179E4812029BFC392750E7571E16C40B2755CF071B9BADD1E459BAD133EA38F7BF0EF651CFD6FE0A6F9DF1308377D3E8DE1EF1F51FC7DB95805BE03895C83E06EB970C2304A9D1476E1FDB704ACD3380AEFD75BF8C109AE9FB700D6BB738204945D7BDF54D7EDE5C12BD4CBFDA66105CACD9234DA18023C7C5DB26D9F6EDE8AF9CB9AAD90B105A350AF73E642BE669E9F7E89EE970B1AD9FBA320461573DEEFE5F5A076EC550D7E59A0CFFF05E2680F0A661385BFD47AF2DB1E5494BD835F164759906631F818822C8D9DE097C565761BF8EE9FE0F93AFA0EC28F6116043879904058467C809FA0A0B7204E9FAFC05D49F499B75CEC93EDF6E9867533AC4DD19DB330FDF5CD727101913BB701A8A58F757D9D4631F80384207652E05D3A690AE210C10039FF18EC14AE6B103A614A607CFD4AD508AA66CC10296FB206F1A3EF02F4A76A07B51B4A69B938779EBE80F03E7DF8B87CF5F6D7E5E2D47F025EF5A5ECF0B7D087431E364AE30CA8709D83F421F2064175E9A0810C599E48501D1EBC7A6301D715801A1AFE871364B27EC19F16709D3C013743FA75ED375C3C861A56FC67145213DA711697D681D036437047810F95FB6CBBF2BC182432CEFF6A83EF053A853A1DBEFADD02AA4F71F4038DADF02E92E07A7BF8CA8A88D18C0685710E79E8DC4B3B6747816B8CB2617970706001D5D906FE4BA2D081D6B185B5C29BB7B29047F90C05078C63BBAF1FF69B89513A5D7E72DCEFF7719485DE5FA2DB42A3E4F326D120D963DAE7D3E83C75D6B8205B102A0B03D5D0FE41C4ABF85E3EE3BCF9FDED6F7A139C21F2EBF8F9082A458AF1F9F057632817E0298590ACCC2E5F9C440C4B31CE93D5AD137A51086ABDF91445017042632A2E633F8A73AD29A502FD79720C35354CE7BB1838D6E6E21C988651D4B633C7CFA103BDFAE27B854C656B788D7C9070BF3F4FCEF0707D1A7B86A75C4242044A1FD7C65C5ACAA4FAAAEEA98D15C785F3E8DFE7DC9253B35C5C8120AF973CF8DB72D871B5E88669791A479BAB2810E930DDE0661D65B18BF81D99B4BA76E27B90761B5C9686D53CA0F8B8AABFC30C273FD9068E0A979D65DC59B8CD5285936207D32588377E92C89D7B3BA8EC1A907C3D9DC8CC085153C38A48EBD7E6803222F24695E5B16143CA0082154392C39A9C35E9795D602B42D3CBBC6A796EB7314DDB1D5F82495A6F50DA73806D8C320EC479AC8D62AC1592693ADADB5CC7D5847178E0F4824FD70F2746200D44E1924BDAEA79E732009D8CC009DA738AC253B8B886E3700DD2345708C54ED5760B07695EB057B64CF6B890AC6D612D3E3909C0221414C172AD2F28B337499400B9BAC365C34DDDA251146945462BE4B56DA88089D0CB26B5D027BD53D9F3224DB1607ADD4BA8556FB1A6B9CD6488FB2C39060148BB87260B306DF641F296C2C8A33A2C7B1E79FE5DA9ECDD60B4227FDC81D3E2C3D18313DE2B3DC5A2EE671FD6899FF7F096B347488929E78A1D8917A0F0F0493E3361DC2F0A5B798F05003803A9B9D3D9197D636373BA51608DD0F3E13B1B7BD41D3DD5EA6FC16A7E900717C60DD300733324F5582F4356B99B9341F8ACED8D0709613622E211DA75785E801FAA55AA9D848EAFB17FEF874E300C36CD98F93B2B5956E5DF11DA1E81B03F3BC943EFC10142E03D606CE5C9AC91696BEBCCC0C6B32922710D9912F67213EBACAE044E9E521022ED54E47759DAC3EB9A8BD63117EE0A38893C65CF4A266D6F89C8E2E8136678D4BE21344D37540BBE73C854947A876CED4EEEA185F8635F81C7D56D024BDDB454871768AADB790C76CC9FA10953F988DAA9A92F2A95AD10A0D9183A87CAEFE70DDDE73D1E80A142F76497D9D333CD58FF020D4DE6A8D78D5F22D709FCBF17F681D37E8E56BF085BB0D318B72B752DEC387F6709EC2222AA73247D0EC9BFEC903CC7C85D8327E582566528118C491BCB313A4E15737763346B9F7E60BC506C16966296BDC55F7F3B3CF8FDF77E6688D966296CD64594D6CCD139E685D74FF6E8D6D30ABFFD91F99E79401EEBB29DE8B5E9E42F0F1B991CDE5223426814BDB4749EB4564C053A3B69F40DBA559280CD6DF0FCEF199C84E110579DFCB6D95DE9AEAB95BD8F357804CCB9325C859B0A866A589820E931C2D78707BF593A6B1C641EF0064459F914C320CB63768554E47701D889094F67465A67B7891BFBDBEEB3130DE92798A9ECC5C4773E45CE73C70EE68E719B89AFF1BD1396AB66D8AD146D8EA8CC03DE26D9E34198D7D996ED09626AD71307B4A0BADA276B71B8698D906EA3631E199647C6A5138390D565859240EB2DB3FB6F7717E2EF29643507CD27198092A54E1C3DF88107959F9B3541DB9D9BA676933121ACC4644B886BF23225645417E3B50F9AE943DDEADEB59A0F2EEB43F6BA091E59FA10C5D5CE04D37C4EEE78911BBA67C91F31A4F5A57B4768A8751C110844B2C705D45BDA064BB265F75B9B8148141D198840247B5C406361A0793CC4480315FC92DC042C52C59C71927647D08E35BC3C449C1CB5EBDE73A6CD31A8C382B2C08D9D7B252FA27883B6FA9581A27E8EA3F63109BDC483B36BA45AAE8D6C9F3B070EAB396D685E018961701714C890DF10959A75045DC62C79980AA62B1D4C4FC4D4119528EAB0323E75780553EA685D1093C8D6A4E8A42BF089656A19AF1C6B97837F5020C74254A2E8C4CAF824E2153A9D0028D864C72769BCBB97E693F4BC586CDC04C43CE59E562F59260D0D271BC70FD467BA7AA203A914E25AB98BABCA9BB372B26C775C6FE5A1ED56403BF1D1D6591CEE02EFA593243FA258B6F5DA53542617F25114DEF9705CA2A1A0D809786D25F7BDEAEF1548403A08C62F91FB3DCAD293D0430EDAB7D435751557AE0BC7C129E416F0E8ABC65BEC3D9E25354556CE005C3E4421B8C836B7689EEDBAAA52918E212B55A77B07D6C0CD50C2185C246DB6031CBEB8FE119D3A2E9C502D09E02CC187920D782B37F51FC1BCCA9B5779348CC0F1377C973F5F4754E58DB78F7D661C7DBCCC7405A25A6F16B0F9EB4DBA4C40588FEBCD1CA860BD4997F1A9EB7DBD994396AD37B915F8C4765E6F7E89EE7DC152B3405096D3D4E59F05341565B657BE396CC1CA972EE313A65AF9CAA8CB83E662BACA628AA2FC2B9F96A2C8948A721B4242485383A2A52AE0935397768E08E456A7EDD64EDE78CE1E12E3DA599E6E2E1904C0C2AA5103D3306FCF8D7BD71941CA6D69DBD194379E47D30847532E19F8EDD1F7A46BBB9E020415E6018E781A69BB4E5EB648D9E78CEC91EABA8DACEE711B6ACD7C963C8C705FBE4BBA673B7765565989CA760A4BEFE8A8BB1D17E7678DB518DEC4D4ED683B1FC67C6C5030DCE653F1F3A9F8C99C6CECEF54FC14EC62FBFC0ECE6D752F2DB5A3EFC757058FE06898647737E9900AA43DAD66A15F1D42154243B1C42931ED569E979FF7F17E6ADFB2CBEE59610945FB676C2913AEE754B1BD8756A210ECA2B1A5221ABBECA4C91EEC2AC1735EE8224B4474C9DEE0EABCBB57E290EDEF09AA88C8D5DAE3338AB3AD5CB7C87669176A2B9BCFA10B31AE9D45DBF2B8BF1F7E37B4A316D318074D409CE7D71738BF9AEF90ADE0F0DC6C5B1B341CC66CD5C4B85A5935AB0B12EBB1DFCAF07D8D07B54C2FF7FD93215F91B9020976662E77BFE0E0CD47735154242C0C179731B25CDD62CE3C0873C4D9C02EB4424C70BC5B4FD0C95140E82E2DD2B2C62EC38AFD5E3769345C4CAFA8124DF6F365551358C6CCD7B8B51A277F05B70F51F4FDE411A857F765DD640F6FF413CC20657715CE90AE39B3BBF538C2B4C6760FC1595D786B2D7D4DC7C81A849EE6B2911E2958D39F67BCE4E6C10E28E27EE56E10A19BBF85DE70FF79341522E493650971BC11B96E9FD3748B170D38406D44893ABE7E4D4E3B9CA0383B706EC8364D705C51950992ABEA770A96F3145663A5C6188CF94271AD69A364D7B7D81F7E665E033706E9F0786DED25573AD7BB25FC0C1CEF277C7920DB6076E193E37EBF8FA32CF4FE12DD5EC67E5424009D25A781739FD434C9AD040124D9E3C2EC642920BFA1A48267289F52B79E53FAC6CC73804E7C575349F463B9C8F3523F2EDF322C25AA7E0241F4A3B8F8A36E7278206F435757A058DD468F806AF34A81E2B37FFFD0547ECB0AB710A344B4F813B945F8D04CAAF9AC03A59925C5A3BE3E48F66898C34A35D77DE48A976C51B0F0DBD623AA1FCAABD78E7EC5F4163CE7A7D399F15DF29C47097158AE177E821ECBD7597E11852ECBFFEAC4A188DF74DD93388EE2BAF26B79E553B83A6DC61AC7342A25C90BBF9BC9910CDBB1F0EC5DF6692A5143299D858F4EE07BA20D263DF195409ABB64F40499CF73091C04956FC117A9001BB163A7371D94EE1E07E5AF6A4A73C6E46DB19B36CAE6BF299A87DFC3E84778F284E29A4E501E972CDBFE2E6F8B2E6B01DED72CAD1BBC53D38A5D9322A0989E05B5C68D20F4DFC5047241DAB58185532F150F9C7BB4679E2BBCEE610B2ED2AB707DF6AD9F13B876DCBB0029B594FF655114353C7BA39B977CFBDB6FCE5BF7EDAF87EF5EBF0107BFBF6BC13FA85DA91F6600532ED554F2C34FDD0788013AC069E4460166AF0E1416EBEB9F989FA5C0433B15AF54C0D15D4B5BB285C2F65D4461391920693D0234A396175A61401496F022423CCC630C751385152C2FB0A25B292CE0A513A7BE13B0ED140630CF93DF06E0E821F25DD048EBB54A02ABCDAD7F9F4599419373E8507B97003231843406CF584B85F4F296FAD54FD13206ABAE90F415F0FC18B8A97E8B35005FD3078079362A45A8709C03A8529E7E3B6842CBFC29BC914285A0ED85E3EF0967B0427DBE8559426050A8CD35D86CA3D8899F39BC53CC99558B3F01D842A376ABDFF293E35D81BF652069B0BD51E9DCB7D0293D3AAC7B6F540A74E93C6FA08A226C9056BCA142314EA3F8D6F73C10624DD41226F5F58D4ABC850E215F2780AB60823C859873FF08194214BBC09A29A49D2B1379BD2587354AB9E7A243F19328C325A8F093908B03E735BC85C251FA03FA484D6D5558A00812B1FD3954E90854E2282C72B98B3BFCB0B64A8B93F3A20CF644D1171425C69A2B8D49DEFC5BECA3B6118A7FD54D55A6214CB22D1CBA702A3C8703D129D648756B85FE94888177856209509BD65019923B9F54A743853A9D3C6DE1F877B88C5339DCDBFBD8F1002BAD570A9CD0D7C95DF43588E1729C5C96BE551911D8D1B30D9C24914DC090BE55991168B0FE806ECA0FE7196BA39C5AE247381343BBF508794330F6ADCA9494C8E821F656655090CF59FA9748A695826000B44259AB24895C3F976B159D790E9D8DEF56D1D01CDC0DF59172404F426F516CADE834BEA1AED945BB3DBC76CB45E9E8F82E1C711F97FFCC30C4106FFD1092102F8DF290EC2844F9352CA2578B557E7C0C9A3A27711DCEFE1DE4B6477EB9027700BDF154B87CE849223F4CD99D183F74FDAD13B4E818054B735F07D15A63A54B8EC1168428F3A7857C75C8A19AF2A9AB89A038AC62E8877D4CBBB594BE30EE75470CB55EDE5AA2F664C3167AAFC03C61C5D7EBD9709AAF27E3C9AB3E31B029F534D2450920ED01D17636D0A7443C40E44373A4C344A3ABBB1A311AFA60307848003B1B42E5E9D053E0A0E85E794D537DD854A4A5D256BCC1C16D60322EE4183983A03E2F3B36B5D7EAC9003AAE25431D3AB09B1B76A3C2D87EF34D455EF137116BB0A4115781B1FABDEA9426893C8D272C0A9F547688B5D3610DEE0DA1C21A1CD2D2600CCE28D4188EC61BFCBF9E1E33AD548ABC461A34B82EB3640A9579302516B26E602D16F2C6548D21A09D69B2F8D167917A68BC5ADDA8067B348A548F83BD3D3650A6838BA3862A5C965451D9FF01D450C9171D1A8AA7C077A679F8E31122F9735F92208F250E641479EF56509494F7CBF7A2741C460CA0669C4EEB60AD725977A856D825467289F2EE33922B986CE5237C444401936B063B280A4BC160DAC2325407359505BD3BCDC1AF96924A997BCB5447CDE15D4B35ACE67028184A73380CD50AD19017E0EC4E73987BB5A4A2165FB1D551878477720DAB48223286D226117F75F0F36E26DAA15E15EF1CC9854E3D7AB43B17897A6289A2A4CC82EDCF4522193198B2119D9E868B7489BD572595E825EFF1AADD29D825E7A92C8A9CA68A76F0BABDC671D83394DA7158310DDD2BDE24938A997AA06C77FA463E874611523C0BD39F72115C184AAD881E4F43A1EAB7E5A4A2641F9A6BE112896072346400EB437769281DA1BB3D7A3541B46B8505E88A3C65D11BF6129883FBE4220A06D0171143A71216C8E9D7090BD015AD69CE4EC302220A86D29C09870572FAB5C302DCDAD67468F7610129194369D38B080BE43DD159BFD11575B5A9277F9A2187A383A8CE50EB37117B8652C696EBB7EAD9C29DE81EE7950891B8654F463402AF5EF3D1B767927726063366621A06501E3163A7E25371DEF150485BE157B5D6A29DFA56621A86D3A209FB57D46B2B0A494B325E5B6B8F794EAB75E5193E1995CF4F1DC4BBCE3E15BD80A390B28E53DE5A8576EF982B08194EA35E8473AEBA5052A40EDAB74B366AC1BB2F565FFF74AFA764119637638E2D595FB34303E8B3A62C7528A1EFB81D40A7CBD4D4284C610BECCE3BFC45CCE3DBFC3A9127DE0DC570F895B7D724E57D8AB40A22F870695741CEE0B4F025BA4F968B93FA8AC3EAD18CB28CA3C72410F2CA420E24A24271059A0224EFF08F0F78B00587B8F4E0EB406E09B33806A501B73CFAD682214A149CDA4A44A59FC0835ABB552A1044463E070E91B3AE058C3EAE22024A9FEA30A0147E5511BBE6BC0B488324CF09F120D287BB1400BF40CC99C3EFF46A8BE6807CE857D5B4E15D430BA209F33A37360AB8C43D631CB8ECC3360600F1BB9255C0D97B991588E88CEE628B9C45C2AB670C5C07B012281E8064C17162780A78A21E6BF510B97CBCC685E7ACD1B84C44E7432833BB35C094C95A7C3065F6930618112F9A9C030510C9D0D79507FBAC100F1AE7F1211D752F9A89016A71A97CED53C4A8FA2D515DB995BE9A547CB5A3AD0154C53BBA8E16E750239DF1CCABA7048E7B9B3CA0E402400F18E6054B40128B184DC00A7B2CBC229F028FB9C172478AB9A8638135953856F20B3E884599D1C536355F847E1FB35A6879958D1093CF6221D615B0893EB349F7C980DB8A864A26C8DB4BF8CDAE0DD41C5720DB25CB65D771E8725FFB4A0F356F742EF550C8C46024E8E3168B48A50F2D0425BFF4812315835B220836E8DD1381F59959654878AC77250406BC590276E720B67A62EE1CE03150565FD24549331EFBA815AA8C7932C83CDEF197AB5619C99E7A577052714C5ED861F14179012F8B35B4263BC5E7DB7525D5828FE233D71C1E6A1ED0267AA83EA28DF58EE34C4A98A73E916D02BA05F38A5386E56A8D65175E2CEE05568BC79272352961030E80D3717C4569A9C758C285B0DBA2A40C0EE99CA48C160CE0A460A8A0B465009E2B206280309F80259D974F60CE005EF6405F0C60762D455C906F6FB29D106E6F9AF343B899D91B53CA788B88159CB3731CAAC9D3732DBA4D1E7AA3005434DAE931117613745B981BC892CECB0E3467002FA90F8342D06C870D65844CC000CE01239668F2889179A7C9934154FB923E3B9D6D5C6C417FF9E75F5892991330E6BD660EBC6020444B8116FD66CE6B70BA2E3FD341902E3CD58151CF15991C4A8FE68D3976206280DEA4273C9C60CE8081263D7EF6BC880B06939E3CD1DE9C1F434E7A4CEAB7881F7A53803041DC9C0B834E019C2C640E2354B9CA442724D9CA5837EA7D0B093B24F9C93D6804279556CC0A3D5B2149B96DC78A812C06950F2A66833A1826C8196DD7FD61C25CA2E446311B0C6CA62A13B21D6386B49CCA879E593619A5F211FDD34DE6C3FAC9DD2D93B050377D8F4551EDEE69B3B47A7AB64E09ABCB3EECAFDD07B071CA0F1FF66115F4864CE60450AE2048AA827367BB459E61D3B2FCB2586F1D1776E7E85FD6CBC5D32608938FCB8734DDBEDFDF4F72D0C9DEC677E32889EED23D37DAEC3B5EB4FFEAE0E0DDFEE1E1FEA680B1EF12731C9DC0566382D6D8B90754297A45C603A77E9CA4C74EEADC3AE839B6236FC3541325C009F62A2BAC748E1B2BD16ADBB26A817ED7397747D166EB84F98B877B24056574F53486BF7F44F1F726578E42D1301BD6BD470F95E4AC009866889BC2C66BD7099CB80A276319924751906D4271C6A4B875F306370EA3F9AA0FA9CAF5C5E188F27FC550D6C5CB2AE80F098A28D087573EC3C480C3BFEB43BB74908CD3DC0EE2D0F0EFFAD0AE409AC56199888783230AF4E19D3C01374346A378FE1A874815B580799CC54E319973E136C5FAB08F021F0E81B36DFDDE290E99293485CBCA1CFFAE0FED531CFD406A9C272CE0E08802138E22BB0C59750EBB95A7E8910CA54B5B401680348175B681FF9228C40FA811568653DE0E3ADF02F16B18E8409E0B8DE6114A07B0EF2CB40FFB947DA6E7887D6692A0A66E7AD6D19A93A894E9FE262636F5DA7C86D280D1CF5405D1150FA1E120EA8F467056F17DC2C0293E1A4C9D31744AF2B43662EAACBFEA43BA80DE0B6CC79A6DA2401F1EF2E6B9F0880283E19AAC6E9DD08B42400B102F309846633F2ADE6F2726D1FAABC130474B7BEE8C47961842E4DB3CC579DD9D990F51CA4B7F76442BA948C39668C2E9C79E949DCA82807515E8327DA89C579E70C01A8F4089619B3BEBBBD5C82175B1BB160EAD7FD55F56FBC81203DDF3936DE07000120506763FDC66293BE7629F0D7A5B879DA9BE62DF5FFC48A89220071B0DC51AB2F3901080E9675C7016C4C64B617B610D1BF67C447EC1601AC8C16ACB41989C3616E4D374345F8DB591E4874027D94A2FD0BED2A9CFFDE935FF313E73955601E8C9D96D2EFC2074507C0F480EEBA87A3CBD7A655AF02421E56CB8B1BFF1F3D84D1FAAA210EB59827E7FBDFB4733F9925DFAA7C948D6DE54C7FA8DA60EA30D63F9B296F4564D5021D4F15B20C66A70091FD668B49C5FEAB480DE2796168214B6ECC7D274B70FD617A84991D0C28425EBCF06B491F7A811D4C9AF5853C0E4DA32B2C42CB45B246AB8022BC9AFD106039F193AF73B89A1BF2CEBDED6A8284E5F59B32C189E36E645DABC1F1B5360E36807F6DD181A13C1C2BF9B2EE3889742D9F59CF42151156C1B4BC4467D64A16DB2FC052E0CC9D5EF50638DC4D77ACCA9C0F4B921D23CE82C526E43AF01FCE02C0B9AAFFA90BEC6FE3D7410030E38AA689741F8EAAF7804F26BEC64C5574AE1B3933CF0E55394B494110B96533C328B811D5D1E66625E736F4234999BB910FA3111B693A1A6910266DF693D794A418836BDD80C25AA684C4955FD26855D0127A17707AB6FE34F68DD91D16AEE03ECCF5AF1EE1534B7585A505E7E88D47A08C4A5C74CF1C52888E227CE6DC089A2D4DFE7908C18E21C9279012119F21ED4416DE935737625C7D9C29EF2218DDDA656D4B326912C313844521EEA22CE8F94DFF4A1FC09A804D5FCC3B09B61B36D7901B685BC7DB43FDBC2DC606A6E54D4207ADA5AC2F0727C2CA6D460BE671658A6EB2A54BF12090BA9296913A26561D2656DA0AE92046C6E83E77FCF9C000D5CCEF93765E55D84AED7E011B0E7029AAFA66BB784B778338A239C3CB941E6018F0B8F29349F3D13FEF469062B3F5F5C8C11E664225338DBEED6B69BBCE678183BCEDC99DCCDA6ABC18DDD5BB473CCB8BFF966B6EDB335115A13FEDB12FD5912EE1B15E616440FCCD82D47F55A2B115F16BCE02A8642F38286C82BDF4DF46C1E711C710C39DA2C8CB4E98DB24B073D7546436ABE1A685BE4D17A1BB16FD6C920CCE986736C7BB681C48D7F26D6AFE5418A4BFAC1A93667291820D3B3849C7585B1BDF9238668597B537FFE594782D5791B39811AFA365E9D35F66C99031A7C168CEA5897994C91EA4D5AA6C6710E46A67C164CE2D44DDFEBE296EBE021D7BDC7A00ED4D1AE1C566012F18A374EE0FF9D1730A2CBA6395BDAF7F6D7E81D65979E7CABAF66EB863B270B5276DD507E9ED7206288F31A644C9E574B8B5E5C1EDCEF7CDFC2A2F39BF5B5C75D5959845566859BF236D04F368E1F7013AA4575F4B1ACB2F401F2B1DA4DE2E4D9F06B98F93D2C6FDA70C4DEDC24E6685B3E769FEDD6591C3240EA8F26F1BA2481238889D7555F0DB904BDD03B1F6A19123E1BC0135431A7F60A242065E1738A0D6681C8FD1E65E949E81D3B29F89652133FA7D860DCB82ED49053D87BE0712E8DE4149B78043569DC2C5EBAD480DB0F51082EB2CD2DBABC9EE0335E604229D6B05403965E7E1D932C123743F922D04FDB6CE95412A2C884F2EB1FD1A9E3C2E943C065B6DC043A3E3058D874A909E4959BFA8FF4056EF5D7D9EF14439CFDCE17E2770A1FA1B4E97CE6485A7AA082B6630F70DB49C5C93BCF39A2DF7C3684C5C9BBC6BFCF03C87800091F6FB4398072242D0790A0EDCF3180F2CEC36F8FBE47FB69549181E757B661CE401005A352D2BE63C6158E962A3ACD9C293B1A6A27F36A36C7007BD8B33F456FBF5936D9AD7A4B49C59D833AF391B17998634A3CD4C131165BCBA306BA80C66E0FE6E368F391059BC7D1669B560FC4FEED586BBB35F2BBB8C536CFE5243D100543FA304751184201A1CDBF3466328ED8D239983D07B335B46AB6A0C59264E5BA6883B0EF484789A665B043D87AEC8E9F9D85601E92F4C3EF3C48D5F75D6444D8CF63980DE96C48276A48F3D878FDC0FB007B1B25AE2E5B1C421063B7ABB6DD547B761AFDFA1A8B2DA3A88EC9A6E414EE38B57DB3EB15489884E7EADB10D66A879665A8B01D8DAB65D04E0FCCD82D8C1D8BC009607269A36B1804955227A5B3368B4FBB9CC3BBDE21B4C3D136E4097F1EBE96236EFA27FDED8CB8F93E8D4979CE7F05B70F51F4FDE411F41B83C0F1B41861F2E6FD8CAC1227EB901105436E15F5304F58B31ED62307AD56F9BB1D456B107A03AC40596CED47941448AFE32A1FCB3424BACC182A71211E1F385DC5680DB4854B00C0AC82CAAFE69090AB9825ECC1175EF92EED44FF51B2C93C44C5D1A221067BF77B23B5218DDD512D3BF22DF6B9E33BFF6E74BC28065460A3FAB68BBDCCB21709B76F4601A5CFC0F198C55FFD71769439C3BE2A3C8AC2D4F14310D3556AECE597FA7F527D40C3CEB907D016822069DAADDD07B071F2FE275BC705C5ED67A77E9CA4C80DBC75A0B1CFAB2C17554E36D4C3E7044ECD7BA8C2DEFA6F4111096C2A9CC395D41D48D2EBE83B083F2E5F1D1CBE5A2E5681EF24488583BBE5E2691384C97B374BD268E3846194E6E2FAB87C48D3EDFBFDFD24C798EC6D7C378E92E82EDD73A3CDBEE345FB10D6EBFDC3C37DE06DF6E9E625582D2807EF2A2849E205B8ADC16C64A915ABCCF3D32FD1FD7241637C7FFC1C3A10FCA91FA420BEA92ADE9C3BCF9F9D475018912A29A8B19D44AB84FC7B0CEEFC90F3DCEE873FC133AD5195F65E81BB85C8F47DD8A71B7EE0984FD4DB8FCB5BF4681A94636EA1FF0050CD1CE8215F3AD00F8B435411E41D592E2EB22040A70F3F2EEF9C80F530680C8D312DF0E448185E9E851E78FAB8FCEFC5597214C0421003EFFDE21421F8057E838BF2BF65A0FCB0F83F381169CCA6AED234540397ECA9198C35881F7DB7CC502B00858F4EEC3E38F17271EE3C7D01E17DFA0015FEEDAFA6A0CF41FA10797D40BE7490DEA5B96D95403E3C78F5C614F41548B3382C338749D8FFB8719EFEC914DEC91370B3C66E17103DA88369FEDF50EB6A68C7595CDA074CFD0C8131FB271256FE6ACC487C2B4526A357BF9B4226765524A0DF22136D2A2D17E4DEDA3964087A65CBB67AD508E443E2E0E0C01432EF01B92E8681FFE01D57DBB4D421378D4514A653CF719F433AC57D72DCEFF7719485DE5FA25BD6FB9EF2E4033B541CEFD4D77E5DB8ABF89EB1048CE1D39B21E3E7F23E86025AB2718240314DA296EF1767FF797319FB11CA14BEA9A0DC5C80A714FE4166F497C5D718BA64EF17AFC839538B2C0C0E6B8EAD51F6BA056568592FA4CC70F026AB5B27F4A21060BAA8C779AC29B767872D7A56F1ACA225F5C367BB9AD0862A7245D57166A6D652FA9657DB9E952E75F1BDC2AEF4DFB9ADA6EACCF7624CCBCED78F49D336554347491015CF2B3C67DE4D3581D6FA7A80BBFFD7502990FE124EB1B103C060D55C9A74E8C521AF1723584875EAD42B79A7BA8F60D3B13B8F5A0EF8EA6FEB318B0318667CE257695A58599E85DB2CE5B981ADA05DD6B7DD5A01D7F3A8960B4F6196EC8DE0324C60368CF346531DCB7DAD68F4022E9389CC759E8B19008D6552CEB1DD3C4A239DE6349D35BB37CD6E0EE25AB0D05C09B656541A8C81BA8E61046B0F9953B8CACB6250DF08AF182664754B434385B43C0CBB13DC05F85E50BF188B308609CA342EDFDED449C3BB138AD370CC7173E8DC70A15D35145949CDE504FEFE4427516A9BBF92725D1374B38EEED22229713AC3BE9731AF1C6FAFCDA3F59205A564EF4E0B34964AAA153D36B6517A1D248FAE7619AB64326BB7E03A3FFDCE164C3BFD1D87CDD4B72B4526D08313DEABD71E78E5D9B7A0449573C58ED40B505880A9DEB669B56E29E0419F90E58276701A83D169EB47B49232200535ACC3CA153C726712B3C16F8CB31C582CBD117B48117BF8CE387162C44B3672696A6463C846B3AD110FEBCE63BAE380BE003FD4AB8F1609415F63D41D27E805B87C0F0383FDCE3C43AEFC2BB71F531BF362B97F7692072B613142E02DA1B6727BD680C73DB1E703EBCF0669B0C4C0A9E64ACAD7011A36BA1AE43738A44E0958274F2908D146232F19B0DD4EA8DD5445DB999457C04978099F26DC2F6008DDCB1639D43DEFD08A283FB495E66EC2BD0282486B3B18F0D5761B9451802FD028678E866BC9693350709E87798ED08DC99BE9232ADF6798D05524B2B798B1CE124870F90C18167B9C0398730073C4014C8E69BD064F6A8F5ED06EF6ECC7679C2BF9F462A4ABC75E2D83CD9F1A92EDC7927EE3D0092DB321B26E88E4B7D10D6103B27C98F9F9504742308FE5316F446887C6F466655BEB4EF2D108BB018746B04AE82D72911BE8823723FAE80C6FBBA55390B3794EA2DBFE54311CD5C7DE340F78069957BC436E0B6635FB5982465F496801E6848D2473478BCA6593359EAADFD6D9668FC1416B1D27A2279C1BD2F8D61BA6741CE94D9B8D2AE5E4D623C1F446AFB9C9554D4B3D12CFC63CA73BEDF5C8A6D79D653C31634EDF729ABF16AA32E2BC46034561B9A8A718867DC98BFDEA8955EE2692562F7897EF8AB47F4221CD891B07E3D1B923A3301B849119844B270661BBD4C5AA69976CFFE25A52D9EAF96D6F1B436D028FE33056F3FE4BEBFE4ECCCE5FD6C7D7758FE6312D06B2F4C8B3D8156E2480BE70CFB3CDD81301CE923F62D8B36E1BEBE3B00B5A0EBBC6D45CB4EA3231B70E3A51CBF6A99C00D45A5D0FB89A9EECEAB917DB750CEA70B495B8FE45146F9CC0FFBB467CACC501C64958DAB11DCC44CF14F86ED7DCA83B277F4DEE452758E9DC5E81B7EF648B27BF3CD0E0160BA4D39276304F42A36B447BFD5E694F9B08B0967B3EE04A6092D3665F5E7F33D335AF435B4E9C6A5090CFA15A46B3CAD207C48472875A9D58667E5EA537168DC123E855387DF804EB2C0E7B007BE924093405F2A49D36EBD09CC1475178E7C3F18004AA0C6EBE364F23AFA8BF020948FB40F02572BF47597A127AC7D0027D4BDDAE53F4CA75A1C69D42DE008FB838BBDD66514D5FE75CFACB87280417D9E616C85799AF8D37C8CF120C76A911DD685D0337432961D04BDE6CED1F4DB8FE119D3A2E9C7A2CB0F52CC107425758D5E347B3473F7BF4B3473F90477F1438FE46CBD7CE6BCE91F6F1797B3DC56FF5541C2905426CE266EA9D278780EDBD61348E98BFD1C8FC1241805A2333AF398FCCFE4726797D77FEA81EECA885DBBBC735A8737DAA3A687DED8471AE5556A994F3EA4BEF550B5EA331AAB59554559C47E83C77DA4DD09CD8ACA69BD73267750C365E78578DA02F8C7EEF7046931266FCD48D6E40B32B615C1F609073CBE35DCEBF689FBDD006E6F0B2DE75F374B3A9DABE17710A6F3EBD0DE6D3DB439EDE9EA4A5D3B46C93DCA2EFE7B2D99D3EB6904BC3ED25A34B09B34D98E0280A43E0E6FBFF699CAF1A64085ABC633D6F38CD1B4EF386D3E01B4E2BD72D320334A26665DD494E218346016CACC40DE9C8371EFCF07BD7555E9B44AC3E73A0342F781CBBD9FFD90CF758ADAEDDEDC015B41E9BAD9EF1C41B4C359C30D1506AA10A9C77B92DBBEDBA31CAA2FD4D656ABFC6B871BCB9024916A4C21B76DAE5D676D854E1ECA7B68B36B37D1D888516EE369FEA6DFD3D3E6050309989B5F422C1D7C3DE2B623413188798798DA63A23BC8800735703890ED001FE73166D5E1EE26C41D8E3774EAB69C44BDDCF36CF76747E49444D561BBBD1FD364B23F3617C9F10AFD18067BCE67B852669CD0C3B32DF35368685E65FC1ED43147D3F79041A113ABCF240F6804039453BD0793A2D39C073DDDB5D606F6D33DAAAAA8FC1AE8DC382B40FCD998EFA35083DDD0013DBE4A75D50E036490656C3BF2441754A2EAD0484DFEE6DAFCF70B5BC8DC2C44E2E5A050CB9D559821F74DD7564B78F50F6889F19E6E9CC34DFDFB0B0495632E35BECDB9967D7C08D416A07968DD485B27F761E4FF80C1CEFE7788861952491EBE70456137431935588F31CDD1BEA2335844E426F81B2FF99C615856B10DCED3165E75990FAE8B12D48D7C7E5E1921E865FC3C26159ACF2BC19D87B27711D8F6512EC9BA749119172CC23ABAC40D2F6CF0C4A681A00BA43D677D071F1248D1D2802D68EF8A1EB6F9D40C01DAABEA6E5411DAE21D325C7600B7D184898ACFB3A78A9867C326A6C943C54DCF9B08FE99D963A16DA5B51337D7D24FBC3A38BAEF1C23492EADEE45592B093B2CED9D785213555683FB9D5FAD4D9160AD487E61A5B54B2F9CE94B84CC23D85FE441683EA885AF955A8B15539AE00F53752DA077B7B3D29264933410B5DD48B027299D48FCA51FDD1C188A565EF46B172FD3E7A70C27B70539157FC4DC47A853522958B2818C4EE91035448135DA11F55C3BB3F80BE71BBA6A57518A1A3503D38646EF0FF7ABAB76E96B48CFAE565036AA0E168E841E3508F0753BA96CA0669DC99BE315BB9470F7EE041E0425D6337AB31E9B2859C199516B21836826904DF920631680650216EDF75F0368FC8EC4483F24B5FF3BB81C4F6A9B8A8169363F161104B845DA94511507EED4583F20E0EA0354D3F74905541B71D2A4A13FDEBA62D0A4B829A30D683076782F2D6B60C54A8757752C7CE45CC52EF5BEAD42194DD499D3E22328BBE6FD1F30EE5EC50FEE8B8CB789D82F2363F8A80F2EBE475A6E8C7349C82CBFAF5B08EDAD25FC0EE927D0A0EA385533A690562FB330D4542D48FD7E014571352F88B8F93D696BA1BD3509252A56D981AB13BC2B3122FC3364CC622E4177C0EB5DE64C6F60B18D7DA637A0CEBCC5CDA43AD337F6A698F617D994B7BD0F5E54F2DF2D1AC2B73B9EB2C17B4C4F5D2970BDAF2DDC972A1BA6C79278A54DE8437947B50DDCF8741A93E4DDA82949D988A93504A7D28376196FA289C8552EAB613C3C623F701B3B90C44BFEB2CAE52EC837A89F3881F8FAFC83910491CA616C9903C718D49922C18246CC83B07CA524414F7A26762C6F5A36F9C8EE960A50F7E0EA07765225714A6B005882B6727F2C0A91F27293ACB7DEB2480D136D40A7ACB65FD55068DE597082E044EEA334EA58C9BA2B5FB0036CEC7A5778B2E722A8E49AD6EB75585846397482C9F1CF7FB7D1C65A1F797E8B6B8A78841C7A923C04BD45423179C03600810D41310C1ABED036D6AD474E852D01E7779D0404540594D8B8AA2724B9928E8E15636908E2E6D741E3C430F5D414043594D8DB0F6F5184C7589004559AE8182487E65F110C522644446B01E463AD15B8099AE26A580CE8B37E97B9E872CED7E5E438303B09E1AF56A8BE6C3DC747F818D3287CB036E2D0109558556B8AFC113AFFBC29A0A1A5025351DEC15750C016C150166BCA21966E620BB9C0AB6BA06457823357574DA6D112764A8E2571350C3AB6C4E890615DA14A8B17362920C7A4E1D017E3C44ABC22CE0B894C37A1C2D16700CE4E2B300322AD4835CA60F73C19765121C65C6B40EA23225898BA82C93202AB3B074100924D11449D0E84944AC5B2A8DAA77ED5528448F3E311845150504B0D5756911E256E0D2135A7D7B3F576E75A94474651D0365AC179B629DACABA854B3ACA8875D43ACFC6A122ACC44CABFAF914B85B6B5E6555653428623180AC8620166BC92364622DC20C24B549263C7AAEAD3A07624843515D448DD072C0A205FD031F73B2CB0A692159EFC5E0822382458C342BA38654C284475BF88185859810E6391ACD1671BB99C30E09BA2E1608CE387347068748D7E5827BBBF41978BDA7740F4C108354CA16E72AB7566B3FC86010E4F0DAE24E0EF3D613DABBF4998C40F92E4CDE9A2EECCC096DDCCA9781E2F64F525ACE0C4480A7E100512A6C8621E1824BA825506B167B7151C521CF616B2080BA5305CCACB948C3264750BC6880F197398A2792299E888C821CB3BC3164A58C23F816C00AD057BF013B41C86080FD872762F31428B0F92AE326BD8BA59F9D552C7B0141B61EF44693816BAC84890D7AA6DE7F04C1251E784D92663EF1CB3732EEAA17C8B7DF4DD2C0324A2CE714EB159E81211D4A99B955FED748C08C2097A27CCA5ECD8456138316FCE29B5D3E5320A25E82CE778900549E251B3BA55F1D14EA79AD097A05FFC132D1DBBC6939B3D69318733387D931FE0E8D83D466A9624C69C431075ACAF69A1D78EE94C091AB9F963EEA2C26ACA33D0CDC9DCB1D5E4E441733AADCA96EE284F324C9EB7A93ED9EAA06244AA1283C7DF4149504296FF6A250A3140F7740C8F56C2E78825A94A58E474D928C791E8086FF720EF0E592061857837008743146BB3A8BAEBBBCEABABCB3EEC17E1FBF203FC0B2D92730FA0C44190E45F3FEC5F6521BA9BBCF8770C12FFBE01F1A179C6BE015AD5411B04555C88A2A8AA425D677E0E52C773526715A7FE9DE3A6B0D805D04823EB9C8721D1BBC7B7C03B0BBF66E9364B6197C1E63620629F282D5186FFC33E43F387AFC506858D2E40327D749DFBD7F053E6075E4DF729E75544010894EF58BEA1856499A2B7B4EE9F6B481751A809A8645F9DA6790D152780C092AFE1DA41D7EB9BD306C7F41770EFB828E0F7E87B68808B80A80541B2FDC3B1EFDCC7CE26296134EDE15FA8C3DEE6E95FFF079DDA8802A5B20200, N'6.4.4')
GO

GO
SET IDENTITY_INSERT [dbo].[AbpEditions] ON 
GO
INSERT [dbo].[AbpEditions] ([Id], [Name], [DisplayName], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (1, N'Standard', N'Standard', 0, NULL, NULL, NULL, NULL, CAST(N'2023-03-23T21:27:16.413' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[AbpEditions] OFF
GO
SET IDENTITY_INSERT [dbo].[AbpLanguages] ON 
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (1, NULL, N'en', N'English', N'famfamfam-flags gb', 0, 0, NULL, NULL, NULL, NULL, CAST(N'2023-03-23T21:27:16.477' AS DateTime), NULL)
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (2, NULL, N'tr', N'Türkçe', N'famfamfam-flags tr', 0, 0, NULL, NULL, NULL, NULL, CAST(N'2023-03-23T21:27:16.477' AS DateTime), NULL)
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (3, NULL, N'zh-CN', N'简体中文', N'famfamfam-flags cn', 0, 0, NULL, NULL, NULL, NULL, CAST(N'2023-03-23T21:27:16.477' AS DateTime), NULL)
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (4, NULL, N'pt-BR', N'Português-BR', N'famfamfam-flags br', 0, 0, NULL, NULL, NULL, NULL, CAST(N'2023-03-23T21:27:16.477' AS DateTime), NULL)
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (5, NULL, N'es', N'Español', N'famfamfam-flags es', 0, 0, NULL, NULL, NULL, NULL, CAST(N'2023-03-23T21:27:16.477' AS DateTime), NULL)
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (6, NULL, N'fr', N'Français', N'famfamfam-flags fr', 0, 0, NULL, NULL, NULL, NULL, CAST(N'2023-03-23T21:27:16.477' AS DateTime), NULL)
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (7, NULL, N'it', N'Italiano', N'famfamfam-flags it', 0, 0, NULL, NULL, NULL, NULL, CAST(N'2023-03-23T21:27:16.477' AS DateTime), NULL)
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (8, NULL, N'ja', N'日本語', N'famfamfam-flags jp', 0, 0, NULL, NULL, NULL, NULL, CAST(N'2023-03-23T21:27:16.477' AS DateTime), NULL)
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (9, NULL, N'nl-NL', N'Nederlands', N'famfamfam-flags nl', 0, 0, NULL, NULL, NULL, NULL, CAST(N'2023-03-23T21:27:16.477' AS DateTime), NULL)
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (10, NULL, N'lt', N'Lietuvos', N'famfamfam-flags lt', 0, 0, NULL, NULL, NULL, NULL, CAST(N'2023-03-23T21:27:16.477' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[AbpLanguages] OFF
GO
SET IDENTITY_INSERT [dbo].[AbpPermissions] ON 
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [CreationTime], [CreatorUserId], [RoleId], [UserId], [Discriminator]) VALUES (1, NULL, N'Pages.Users', 1, CAST(N'2023-03-23T21:27:16.613' AS DateTime), NULL, 1, NULL, N'RolePermissionSetting')
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [CreationTime], [CreatorUserId], [RoleId], [UserId], [Discriminator]) VALUES (2, NULL, N'Pages.Roles', 1, CAST(N'2023-03-23T21:27:16.633' AS DateTime), NULL, 1, NULL, N'RolePermissionSetting')
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [CreationTime], [CreatorUserId], [RoleId], [UserId], [Discriminator]) VALUES (3, NULL, N'Pages.Tenants', 1, CAST(N'2023-03-23T21:27:16.633' AS DateTime), NULL, 1, NULL, N'RolePermissionSetting')
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [CreationTime], [CreatorUserId], [RoleId], [UserId], [Discriminator]) VALUES (4, 1, N'Pages.Users', 1, CAST(N'2023-03-23T21:27:16.787' AS DateTime), NULL, 2, NULL, N'RolePermissionSetting')
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [CreationTime], [CreatorUserId], [RoleId], [UserId], [Discriminator]) VALUES (5, 1, N'Pages.Roles', 1, CAST(N'2023-03-23T21:27:16.787' AS DateTime), NULL, 2, NULL, N'RolePermissionSetting')
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [CreationTime], [CreatorUserId], [RoleId], [UserId], [Discriminator]) VALUES (6, 1, N'Pages.ApproveBook', 1, CAST(N'2023-04-11T23:48:34.917' AS DateTime), 2, 2, NULL, N'RolePermissionSetting')
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [CreationTime], [CreatorUserId], [RoleId], [UserId], [Discriminator]) VALUES (7, 1, N'Pages.CategoryMng', 1, CAST(N'2023-04-11T23:48:34.930' AS DateTime), 2, 2, NULL, N'RolePermissionSetting')
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [CreationTime], [CreatorUserId], [RoleId], [UserId], [Discriminator]) VALUES (8, 1, N'Pages.ReportMng', 1, CAST(N'2023-04-11T23:48:34.940' AS DateTime), 2, 2, NULL, N'RolePermissionSetting')
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [CreationTime], [CreatorUserId], [RoleId], [UserId], [Discriminator]) VALUES (9, 1, N'Pages.ApproveBook', 1, CAST(N'2023-04-15T01:31:11.757' AS DateTime), 2, 3, NULL, N'RolePermissionSetting')
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [CreationTime], [CreatorUserId], [RoleId], [UserId], [Discriminator]) VALUES (10, 1, N'Pages.ReportMng', 1, CAST(N'2023-04-15T01:31:11.770' AS DateTime), 2, 3, NULL, N'RolePermissionSetting')
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [CreationTime], [CreatorUserId], [RoleId], [UserId], [Discriminator]) VALUES (13, 1, N'Pages.Recharge', 1, CAST(N'2023-04-15T23:39:11.037' AS DateTime), 2, 2, NULL, N'RolePermissionSetting')
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [CreationTime], [CreatorUserId], [RoleId], [UserId], [Discriminator]) VALUES (14, 1, N'Pages.Recharge', 1, CAST(N'2023-04-16T00:37:16.823' AS DateTime), 2, 4, NULL, N'RolePermissionSetting')
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [CreationTime], [CreatorUserId], [RoleId], [UserId], [Discriminator]) VALUES (15, 1, N'Pages.PaymentTicket', 1, CAST(N'2023-04-16T23:13:59.987' AS DateTime), 2, 2, NULL, N'RolePermissionSetting')
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [CreationTime], [CreatorUserId], [RoleId], [UserId], [Discriminator]) VALUES (16, 1, N'Pages.PaymentTicket', 1, CAST(N'2023-04-17T19:32:47.793' AS DateTime), 2, 4, NULL, N'RolePermissionSetting')
GO
SET IDENTITY_INSERT [dbo].[AbpPermissions] OFF
GO
SET IDENTITY_INSERT [dbo].[AbpRoles] ON 
GO
INSERT [dbo].[AbpRoles] ([Id], [Description], [TenantId], [Name], [DisplayName], [IsStatic], [IsDefault], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedName]) VALUES (1, NULL, NULL, N'Admin', N'Admin', 1, 0, 0, NULL, NULL, NULL, NULL, CAST(N'2023-03-23T21:27:16.573' AS DateTime), NULL, N'ADMIN')
GO
INSERT [dbo].[AbpRoles] ([Id], [Description], [TenantId], [Name], [DisplayName], [IsStatic], [IsDefault], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedName]) VALUES (2, NULL, 1, N'Admin', N'Admin', 1, 0, 0, NULL, NULL, CAST(N'2023-04-17T19:36:35.283' AS DateTime), 2, CAST(N'2023-03-23T21:27:16.780' AS DateTime), NULL, N'ADMIN')
GO
INSERT [dbo].[AbpRoles] ([Id], [Description], [TenantId], [Name], [DisplayName], [IsStatic], [IsDefault], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedName]) VALUES (3, NULL, 1, N'Approver', N'Approver', 0, 0, 0, NULL, NULL, NULL, NULL, CAST(N'2023-04-15T01:31:11.620' AS DateTime), 2, N'APPROVER')
GO
INSERT [dbo].[AbpRoles] ([Id], [Description], [TenantId], [Name], [DisplayName], [IsStatic], [IsDefault], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedName]) VALUES (4, NULL, 1, N'Payment Management', N'Payment Management', 0, 0, 0, NULL, NULL, CAST(N'2023-04-25T20:21:42.410' AS DateTime), 2, CAST(N'2023-04-16T00:37:16.600' AS DateTime), 2, N'PAYMENT MANAGEMENT')
GO
INSERT [dbo].[AbpRoles] ([Id], [Description], [TenantId], [Name], [DisplayName], [IsStatic], [IsDefault], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedName]) VALUES (5, N'a', 1, N'aaa', N'aaaa', 0, 0, 1, 2, CAST(N'2023-05-25T07:21:08.847' AS DateTime), NULL, NULL, CAST(N'2023-05-25T07:21:01.267' AS DateTime), 2, N'AAA')
GO
SET IDENTITY_INSERT [dbo].[AbpRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[AbpSettings] ON 
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (1, NULL, NULL, N'Abp.Net.Mail.DefaultFromAddress', N'admin@mydomain.com', NULL, NULL, CAST(N'2023-03-23T21:27:16.730' AS DateTime), NULL)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (2, NULL, NULL, N'Abp.Net.Mail.DefaultFromDisplayName', N'mydomain.com mailer', NULL, NULL, CAST(N'2023-03-23T21:27:16.740' AS DateTime), NULL)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (3, NULL, NULL, N'Abp.Localization.DefaultLanguageName', N'en', NULL, NULL, CAST(N'2023-03-23T21:27:16.743' AS DateTime), NULL)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (4, NULL, 1, N'Abp.Localization.DefaultLanguageName', N'vi-VN', NULL, NULL, CAST(N'2023-03-23T21:28:00.097' AS DateTime), 1)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (6, 1, 2, N'Abp.Localization.DefaultLanguageName', N'vi-VN', NULL, NULL, CAST(N'2023-04-06T06:03:39.467' AS DateTime), 2)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (7, 1, 3, N'Abp.Localization.DefaultLanguageName', N'vi-VN', NULL, NULL, CAST(N'2023-04-06T06:21:27.253' AS DateTime), 3)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (8, 1, 4, N'Abp.Localization.DefaultLanguageName', N'en', NULL, NULL, CAST(N'2023-04-15T23:40:01.323' AS DateTime), 4)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (9, 1, 5, N'Abp.Localization.DefaultLanguageName', N'en-US', NULL, NULL, CAST(N'2023-04-16T00:22:55.950' AS DateTime), 5)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (10, 1, 6, N'Abp.Localization.DefaultLanguageName', N'en', NULL, NULL, CAST(N'2023-04-16T10:27:24.560' AS DateTime), 6)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (11, 1, 7, N'Abp.Localization.DefaultLanguageName', N'vi', NULL, NULL, CAST(N'2023-04-18T22:27:56.267' AS DateTime), 7)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (12, 1, 8, N'Abp.Localization.DefaultLanguageName', N'en-US', NULL, NULL, CAST(N'2023-04-20T09:59:34.537' AS DateTime), 8)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (13, 1, 9, N'Abp.Localization.DefaultLanguageName', N'en-US', NULL, NULL, CAST(N'2023-04-20T10:29:13.400' AS DateTime), 9)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (14, 1, 10, N'Abp.Localization.DefaultLanguageName', N'en-US', NULL, NULL, CAST(N'2023-04-20T13:58:41.960' AS DateTime), 10)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (15, 1, 11, N'Abp.Localization.DefaultLanguageName', N'en-US', NULL, NULL, CAST(N'2023-04-20T18:24:26.293' AS DateTime), 11)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (16, 1, 12, N'Abp.Localization.DefaultLanguageName', N'vi', NULL, NULL, CAST(N'2023-04-21T03:02:35.470' AS DateTime), 12)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (17, 1, 13, N'Abp.Localization.DefaultLanguageName', N'en-US', NULL, NULL, CAST(N'2023-04-21T22:48:38.680' AS DateTime), 13)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (18, 1, 14, N'Abp.Localization.DefaultLanguageName', N'vi', NULL, NULL, CAST(N'2023-04-24T16:02:45.397' AS DateTime), 14)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (19, 1, 15, N'Abp.Localization.DefaultLanguageName', N'en-US', NULL, NULL, CAST(N'2023-04-24T17:39:35.183' AS DateTime), 15)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (20, 1, 16, N'Abp.Localization.DefaultLanguageName', N'en-US', NULL, NULL, CAST(N'2023-04-25T01:32:40.550' AS DateTime), 16)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (21, 1, 17, N'Abp.Localization.DefaultLanguageName', N'vi-VN', NULL, NULL, CAST(N'2023-04-25T01:54:33.213' AS DateTime), 17)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (22, 1, 18, N'Abp.Localization.DefaultLanguageName', N'en', NULL, NULL, CAST(N'2023-04-25T09:58:09.083' AS DateTime), 18)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (23, 1, 19, N'Abp.Localization.DefaultLanguageName', N'en', NULL, NULL, CAST(N'2023-04-25T12:52:45.647' AS DateTime), 19)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (24, 1, 20, N'Abp.Localization.DefaultLanguageName', N'vi', NULL, NULL, CAST(N'2023-04-25T16:21:41.820' AS DateTime), 20)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (25, 1, 21, N'Abp.Localization.DefaultLanguageName', N'en-US', NULL, NULL, CAST(N'2023-04-25T21:01:42.930' AS DateTime), 21)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (26, 1, 22, N'Abp.Localization.DefaultLanguageName', N'en-US', NULL, NULL, CAST(N'2023-04-25T21:35:58.010' AS DateTime), 22)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (27, 1, 23, N'Abp.Localization.DefaultLanguageName', N'vi-VN', NULL, NULL, CAST(N'2023-04-28T04:13:11.457' AS DateTime), 23)
GO
SET IDENTITY_INSERT [dbo].[AbpSettings] OFF
GO
SET IDENTITY_INSERT [dbo].[AbpTenants] ON 
GO
INSERT [dbo].[AbpTenants] ([Id], [EditionId], [TenancyName], [Name], [ConnectionString], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (1, NULL, N'Default', N'Default', NULL, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-03-23T21:27:16.767' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[AbpTenants] OFF
GO
SET IDENTITY_INSERT [dbo].[AbpUserAccounts] ON 
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (1, 1, 3, NULL, N'khangpv1', N'sddd@gmail.com', 0, NULL, NULL, CAST(N'2023-04-15T20:43:56.497' AS DateTime), 3, CAST(N'2023-04-06T06:21:27.173' AS DateTime), 2)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (2, 1, 4, NULL, N'kiuer', N'a@gmail.com', 1, 2, CAST(N'2023-04-15T23:42:56.407' AS DateTime), NULL, NULL, CAST(N'2023-04-15T23:40:01.247' AS DateTime), NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (3, 1, 5, NULL, N'tuan', N'tuan@gmail.com', 0, NULL, NULL, CAST(N'2023-04-25T21:32:41.817' AS DateTime), 2, CAST(N'2023-04-16T00:22:55.787' AS DateTime), NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (4, 1, 6, NULL, N'nghia', N'daoxnghia@gmail.com', 0, NULL, NULL, CAST(N'2023-04-25T16:01:26.883' AS DateTime), 14, CAST(N'2023-04-16T10:27:24.463' AS DateTime), NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (5, 1, 7, NULL, N'TinCD', N'chuductintl@gmail.com', 0, NULL, NULL, CAST(N'2023-05-04T01:07:19.963' AS DateTime), 2, CAST(N'2023-04-18T22:27:56.160' AS DateTime), NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (6, 1, 8, NULL, N'kpv1', N'kp1@gmail.com', 0, NULL, NULL, CAST(N'2023-04-20T12:14:33.060' AS DateTime), 8, CAST(N'2023-04-20T09:59:34.370' AS DateTime), NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (7, 1, 9, NULL, N'kpv2', N'kp2@gmail.com', 0, NULL, NULL, CAST(N'2023-04-20T12:20:31.530' AS DateTime), 9, CAST(N'2023-04-20T10:29:13.263' AS DateTime), NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (8, 1, 10, NULL, N'dat123', N'dinhdatqweqw@gmail.com', 0, NULL, NULL, CAST(N'2023-04-24T15:37:40.390' AS DateTime), 5, CAST(N'2023-04-20T13:58:41.660' AS DateTime), NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (9, 1, 11, NULL, N'datqw', N'dinhdatqwe@gmail.com', 1, 5, CAST(N'2023-04-24T15:37:29.010' AS DateTime), NULL, NULL, CAST(N'2023-04-20T18:24:26.047' AS DateTime), NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (10, 1, 12, NULL, N'TinCD2', N'chuductintl2@gmail.com', 0, NULL, NULL, CAST(N'2023-04-25T16:19:18.900' AS DateTime), NULL, CAST(N'2023-04-21T03:02:35.300' AS DateTime), NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (11, 1, 13, NULL, N'ab', N'ab@gmail.com', 1, 2, CAST(N'2023-04-26T05:45:28.493' AS DateTime), NULL, NULL, CAST(N'2023-04-21T22:48:38.600' AS DateTime), NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (12, 1, 14, NULL, N'khaind', N'nguyenduckhai789@gmail.com', 0, NULL, NULL, CAST(N'2023-04-26T06:41:48.090' AS DateTime), NULL, CAST(N'2023-04-24T16:02:44.923' AS DateTime), NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (13, 1, 15, NULL, N'tuan12', N'tuan123@gmail.com', 0, NULL, NULL, CAST(N'2023-04-25T21:00:27.980' AS DateTime), NULL, CAST(N'2023-04-24T17:39:35.060' AS DateTime), NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (14, 1, 16, NULL, N'tuan123', N'tuan1@gmail.com', 0, NULL, NULL, CAST(N'2023-04-25T21:35:17.933' AS DateTime), NULL, CAST(N'2023-04-25T01:32:40.390' AS DateTime), NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (15, 1, 17, NULL, N'test22', N'khangvp96nd@gmail.com', 0, NULL, NULL, CAST(N'2023-04-25T02:07:55.513' AS DateTime), NULL, CAST(N'2023-04-25T01:54:33.090' AS DateTime), NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (16, 1, 18, NULL, N'bobo', N'nghiadxhe141494@fpt.edu.vn', 0, NULL, NULL, CAST(N'2023-04-27T21:15:06.797' AS DateTime), NULL, CAST(N'2023-04-25T09:58:08.967' AS DateTime), NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (17, 1, 19, NULL, N'123', N'aa@gmail.com', 0, NULL, NULL, NULL, NULL, CAST(N'2023-04-25T12:52:45.593' AS DateTime), NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (18, 1, 20, NULL, N'abc', N'abc@gmail.com', 0, NULL, NULL, CAST(N'2023-04-25T16:29:08.120' AS DateTime), 20, CAST(N'2023-04-25T16:21:41.680' AS DateTime), NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (19, 1, 21, NULL, N'tuan1999', N'tuan1209@gmail.com', 0, NULL, NULL, NULL, NULL, CAST(N'2023-04-25T21:01:42.840' AS DateTime), NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (20, 1, 22, NULL, N'phingoctuan', N'phingoctuan1999@gmail.com', 0, NULL, NULL, CAST(N'2023-04-25T21:43:48.050' AS DateTime), 22, CAST(N'2023-04-25T21:35:57.927' AS DateTime), NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (21, 1, 23, NULL, N'dat1234', N'dinhdat2000@gmail.com', 0, NULL, NULL, NULL, NULL, CAST(N'2023-04-28T04:13:10.957' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[AbpUserAccounts] OFF
GO

SET IDENTITY_INSERT [dbo].[AbpUserRoles] ON 
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (1, NULL, 1, 1, CAST(N'2023-03-23T21:27:16.717' AS DateTime), NULL)
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (2, 1, 2, 2, CAST(N'2023-03-23T21:27:16.813' AS DateTime), NULL)
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (3, 1, 2, 3, CAST(N'2023-04-15T20:48:30.313' AS DateTime), 2)
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (4, 1, 5, 4, CAST(N'2023-04-16T00:37:32.563' AS DateTime), 2)
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (5, 1, 5, 2, CAST(N'2023-04-20T00:39:45.483' AS DateTime), 2)
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (6, 1, 5, 3, CAST(N'2023-04-20T00:39:45.540' AS DateTime), 2)
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (7, 1, 10, 2, CAST(N'2023-04-24T15:37:40.157' AS DateTime), 5)
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (8, 1, 10, 3, CAST(N'2023-04-24T15:37:40.210' AS DateTime), 5)
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (9, 1, 10, 4, CAST(N'2023-04-24T15:37:40.260' AS DateTime), 5)
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (10, 1, 14, 2, CAST(N'2023-04-24T17:18:55.900' AS DateTime), 5)
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (11, 1, 14, 3, CAST(N'2023-04-24T17:18:55.950' AS DateTime), 5)
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (12, 1, 14, 4, CAST(N'2023-04-24T17:18:56.003' AS DateTime), 5)
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (13, 1, 7, 2, CAST(N'2023-04-24T17:30:00.570' AS DateTime), 5)
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (14, 1, 7, 3, CAST(N'2023-04-24T17:30:00.620' AS DateTime), 5)
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (15, 1, 7, 4, CAST(N'2023-04-24T17:30:00.680' AS DateTime), 5)
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (16, 1, 22, 2, CAST(N'2023-04-25T21:38:56.923' AS DateTime), 22)
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (17, 1, 22, 3, CAST(N'2023-04-25T21:38:56.980' AS DateTime), 22)
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (18, 1, 22, 4, CAST(N'2023-04-25T21:38:57.037' AS DateTime), 22)
GO
SET IDENTITY_INSERT [dbo].[AbpUserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[AbpUsers] ON 
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (1, NULL, N'admin', NULL, N'admin@aspnetboilerplate.com', N'System', N'Administrator', N'AGvktkIT7VnR1KakCHneMWF9NqoIsIzbjULZbbPAtjL1blmM1K47HKkc40UFnOcYxA==', NULL, NULL, NULL, 0, 0, NULL, 0, N'5d539450-f45f-20cb-e6ae-3a0a210ac052', 0, 1, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-03-23T21:27:16.690' AS DateTime), NULL, N'ADMIN', N'ADMIN@ASPNETBOILERPLATE.COM', NULL)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (2, NULL, N'admin', 1, N'admin@defaulttenant.com', N'Nghĩa', N'Đào', N'AIY7Iybj3hwvmC4rXU4v/ya9xyW9gMEVVtpUrxIh7+OoPbfZ4ea4W/AlByH+CANoCg==', NULL, NULL, NULL, 0, 0, NULL, 0, N'280adf85-a985-4732-aa79-92f9d80bda1d', 0, 1, 1, 0, NULL, NULL, CAST(N'2023-05-04T01:07:17.837' AS DateTime), 2, CAST(N'2023-03-23T21:27:16.803' AS DateTime), NULL, N'ADMIN', N'ADMIN@DEFAULTTENANT.COM', 21050)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (3, NULL, N'tintd', 1, N'sddd@gmail.com', N'k', N'd', N'AG9HjPuN+bq4m0zKlHC9UKslbYT2bcoLHrTjHwyui9IELTyedEoNlUruj3LxgkBTkA==', NULL, NULL, NULL, 0, 1, NULL, 0, N'6f9420e1-920e-4ddd-94d2-4ab5d1f8bb35', 0, 0, 1, 0, NULL, NULL, CAST(N'2023-04-15T20:43:56.463' AS DateTime), 3, CAST(N'2023-04-06T06:21:26.850' AS DateTime), 2, N'KHANGPV1', N'SDDD@GMAIL.COM', 980)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (4, NULL, N'kiuer', 1, N'a@gmail.com', N'kiuer', N'dao', N'APht8+5gzr/EK8LEcMC1sAYVUZUc1Nw0lQg2Gij5AG9/t9XmHwOiqQEwZh81xPyz0g==', NULL, NULL, NULL, 0, 1, NULL, 0, N'ed50a405-6143-43ef-a780-ce4794988855', 0, 0, 1, 1, 2, CAST(N'2023-04-15T23:42:56.353' AS DateTime), NULL, NULL, CAST(N'2023-04-15T23:40:01.043' AS DateTime), NULL, N'KIUER', N'A@GMAIL.COM', NULL)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (5, NULL, N'tuan', 1, N'tuan@gmail.com', N'Tuan', N'Phi', N'AIf6pfeUkH4F6MHr57nYK7UikaBDcl8xPNWoOT0udlMTDQQLXrUxYtyMbfa71rosOQ==', NULL, NULL, CAST(N'2023-04-25T09:37:00.770' AS DateTime), 1, 1, NULL, 0, N'49c2ce22-fffe-4c7e-8be4-92d316066d48', 0, 0, 1, 0, NULL, NULL, CAST(N'2023-04-25T21:32:41.320' AS DateTime), 2, CAST(N'2023-04-16T00:22:55.453' AS DateTime), NULL, N'TUAN', N'TUAN@GMAIL.COM', 11290)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (6, NULL, N'nghia', 1, N'daoxnghia@gmail.com', N'Nghia', N'Dao', N'AJntiOT7/bdKgOLffCJJIF4iGxzzl02+28YgNLfomzXbjaXmV7HioFLGHfPihrl9Jg==', NULL, NULL, NULL, 0, 1, NULL, 0, N'54b8338e-731e-41fa-b7b2-462ee8b8d88c', 0, 0, 1, 0, NULL, NULL, CAST(N'2023-04-25T16:01:26.763' AS DateTime), 14, CAST(N'2023-04-16T10:27:24.123' AS DateTime), NULL, N'NGHIA', N'NGHIA@GMAIL.COM', 55)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (7, NULL, N'TinCD', 1, N'chuductintl@gmail.com', N'Tin', N'Chu', N'AKdRkzec7sVXYmjKUD7I7s5BdztAcQGwhEXpqEewQTXZ2VbiD0GAx4vnDPJSg++8/w==', NULL, NULL, NULL, 0, 1, NULL, 0, N'86e928e7-31d5-46e4-b775-0b168a73c468', 0, 0, 1, 0, NULL, NULL, CAST(N'2023-05-04T01:07:17.837' AS DateTime), 2, CAST(N'2023-04-18T22:27:55.540' AS DateTime), NULL, N'TINCD', N'CHUDUCTINTL@GMAIL.COM', 1815)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (8, NULL, N'kpv1', 1, N'kp1@gmail.com', N'a', N'b', N'AFpnq6LLn+5Ui6Q2vBvNJG6sAv2OnPPRuoqH2t/wNCVIfWLH+pTVug6vuPurWXev/A==', NULL, NULL, NULL, 0, 1, NULL, 0, N'02fd3e7b-e5eb-435e-9451-89e94a7ca900', 0, 0, 1, 0, NULL, NULL, CAST(N'2023-04-20T12:14:32.660' AS DateTime), 8, CAST(N'2023-04-20T09:59:33.757' AS DateTime), NULL, N'KPV1', N'KP1@GMAIL.COM', 960)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (9, NULL, N'kpv2', 1, N'kp2@gmail.com', N'a1', N'b1', N'ADcJnSNXmg9UqmEZ2qjRqkeMGpMnqmCthcf9HEGwlcJdmkPIyDXY0CaM9Bbs5DtKPg==', NULL, NULL, NULL, 0, 1, NULL, 0, N'0e418495-f165-44f5-acbd-d234c02cecb9', 0, 0, 1, 0, NULL, NULL, CAST(N'2023-04-20T12:20:31.447' AS DateTime), 9, CAST(N'2023-04-20T10:29:12.940' AS DateTime), NULL, N'KPV2', N'KP2@GMAIL.COM', 880)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (10, NULL, N'dat123', 1, N'dinhdatqweqw@gmail.com', N'dat', N'dinh', N'AB+VPEGW3n9cClWK8+LFalSQbbv2YKZabx23WfUUV5dL1R2jY/hfMU8Jp8JYyw57+w==', NULL, NULL, NULL, 0, 1, NULL, 0, N'fcd9c677-874d-462b-84fa-e4b036ac62c2', 0, 0, 1, 0, NULL, NULL, CAST(N'2023-04-24T15:37:40.337' AS DateTime), 5, CAST(N'2023-04-20T13:58:39.737' AS DateTime), NULL, N'DAT123', N'DINHDATQWEQW@GMAIL.COM', NULL)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (11, NULL, N'datqw', 1, N'dinhdatqwe@gmail.com', N'dat', N'dinh', N'AFvAajcU8xDl+7pl8OKznoNzAWCRzi7fuusTYPu8rOzNKBqD6MDGXue7RGmSNN/WHQ==', NULL, NULL, NULL, 0, 1, NULL, 0, N'1835922d-da5a-4605-b928-982358e7fe22', 0, 0, 1, 1, 5, CAST(N'2023-04-24T15:37:28.827' AS DateTime), NULL, NULL, CAST(N'2023-04-20T18:24:24.770' AS DateTime), NULL, N'DATQW', N'DINHDATQWE@GMAIL.COM', NULL)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (12, NULL, N'TinCD2', 1, N'chuductintl2@gmail.com', N'a', N'a', N'AFsHXE05RD4SKY94v0MrjDyn2uLUCW3K/EyPgPyjGLguNkZmUnoNHlhMZFlapyRMrQ==', NULL, NULL, CAST(N'2023-04-25T09:18:12.460' AS DateTime), 1, 1, NULL, 0, N'0eadd2d0-9350-4aac-a527-ccb2fa709693', 0, 0, 1, 0, NULL, NULL, CAST(N'2023-04-25T16:19:18.877' AS DateTime), 12, CAST(N'2023-04-21T03:02:34.343' AS DateTime), NULL, N'TINCD2', N'CHUDUCTINTL2@GMAIL.COM', 1300)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (13, NULL, N'ab', 1, N'ab@gmail.com', N'a', N'b', N'AAafdQRfvpo14dtxMsKGbr2kZCK8bi6S0IFG/0i5t/W3DSr8mnox6cFnA/qKqAP5IA==', NULL, NULL, NULL, 0, 1, NULL, 0, N'9d123366-bb46-431a-a0d5-a35218d52daf', 0, 0, 1, 1, 2, CAST(N'2023-04-26T05:45:27.963' AS DateTime), NULL, NULL, CAST(N'2023-04-21T22:48:37.910' AS DateTime), NULL, N'AB', N'AB@GMAIL.COM', NULL)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (14, NULL, N'khaind', 1, N'nguyenduckhai789@gmail.com', N'khai1992', N'nguyen', N'AFhsB+mp3ekO9z6cvDuXuMFxuPrhgYai6aHq+685D0EYCGy6TowMMm+TnL3Db/2LTg==', NULL, NULL, NULL, 0, 1, NULL, 0, N'77de9e2f-bfd5-4550-9069-299cc864ab0f', 0, 0, 1, 0, NULL, NULL, CAST(N'2023-04-26T06:41:48.043' AS DateTime), NULL, CAST(N'2023-04-24T16:02:42.797' AS DateTime), NULL, N'KHAIND', N'NGUYENDUCKHAI789@GMAIL.COM', 686758)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (15, NULL, N'tuan12', 1, N'tuan123@gmail.com', N'Ngoc', N'Tuan', N'AHLMdjl/OEszfbbt21dsbxemhIh0UYs32UfKv7rBdjg0xBvp/6sjmiWN4MjqdFWDrw==', NULL, NULL, NULL, 1, 1, NULL, 0, N'2c82b0d1-8ee5-4001-a00f-605865508029', 0, 0, 1, 0, NULL, NULL, CAST(N'2023-04-25T21:00:27.960' AS DateTime), NULL, CAST(N'2023-04-24T17:39:34.750' AS DateTime), NULL, N'TUAN12', N'TUAN123@GMAIL.COM', NULL)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (16, NULL, N'tuan123', 1, N'tuan1@gmail.com', N'Tuan', N'Phi Ngoc ', N'AGwI9B1tryM4CdRTqpTxeXpEWSUHNxdHG0DclPeL/6N6UVmj24l/kaPpUh7kwwmA8g==', NULL, NULL, NULL, 1, 1, NULL, 0, N'2bb6f981-4f69-4919-b894-b2ac76914b73', 0, 0, 1, 0, NULL, NULL, CAST(N'2023-04-25T21:35:17.917' AS DateTime), NULL, CAST(N'2023-04-25T01:32:39.883' AS DateTime), NULL, N'TUAN123', N'TUAN1@GMAIL.COM', NULL)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (17, NULL, N'test22', 1, N'123456@gmail.com', N'test', N'forgot', N'AAR5H7kBmbiTkr8iX+nZMg2cyvX6wipfL4ED8URfHjCmv4AlpqVKQBFr0gsC06YKVw==', NULL, NULL, NULL, 0, 1, NULL, 0, N'fcea7a7a-82fe-4f8f-b770-c4ee57e0643d', 0, 0, 1, 0, NULL, NULL, CAST(N'2023-04-25T02:07:55.480' AS DateTime), NULL, CAST(N'2023-04-25T01:54:32.517' AS DateTime), NULL, N'TEST22', N'KHANGVP96ND@GMAIL.COM', NULL)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (18, NULL, N'bobo', 1, N'nghiadxhe141494@fpt.edu.vn', N'bobo', N'bobo', N'APdwJStLgeevBjdQssyQGid/moj8wUsI0cG8Dr17uSflmd9if2fffi0C6rrTe45RUw==', NULL, NULL, NULL, 1, 1, NULL, 0, N'59f132ab-f572-4074-a368-3ae269f4b473', 0, 0, 1, 0, NULL, NULL, CAST(N'2023-04-27T21:15:06.797' AS DateTime), NULL, CAST(N'2023-04-25T09:58:08.603' AS DateTime), NULL, N'BOBO', N'NGHIADXHE141494@FPT.EDU.VN', NULL)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (19, NULL, N'123', 1, N'aa@gmail.com', N'Nghia', N'dao', N'ACzFGSqPIZeUeh4fI/1Be/oToP7JJgkYEpuVJMklO5GqoI2wpItABuUGR2H3FeO6Ag==', NULL, NULL, NULL, 0, 1, NULL, 0, N'9d235f83-5a25-416c-a73d-a67881a3829e', 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-04-25T12:52:45.427' AS DateTime), NULL, N'123', N'AA@GMAIL.COM', NULL)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (20, NULL, N'abc', 1, N'abc@gmail.com', N'Maxlength64charactersMaxlength64charactersMaxlength64charactersM', N'Adam', N'AGAOsGhz/4RfHZ+Zs2gOdeF++YlbvXED/Qo7kiNMc6ai7ryiMlDlu21ULaeoOtbjVQ==', NULL, NULL, NULL, 0, 1, NULL, 0, N'1fa13d8b-7905-4d2f-a63a-62be1d8653ff', 0, 0, 1, 0, NULL, NULL, CAST(N'2023-04-25T16:29:08.067' AS DateTime), 20, CAST(N'2023-04-25T16:21:41.330' AS DateTime), NULL, N'ABC', N'ABC@GMAIL.COM', NULL)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (21, NULL, N'tuan1999', 1, N'tuan1209@gmail.com', N'Phi', N'Tuan', N'AP5UMsMG5n0BwtT/ZsndAmST5eJNf0jXYeMe0+v9DezboqcYLJfR7KMkZJjfXW+EXg==', NULL, NULL, NULL, 0, 1, NULL, 0, N'4c8877a1-5bec-476a-881b-82935940f13f', 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-04-25T21:01:42.667' AS DateTime), NULL, N'TUAN1999', N'TUAN1209@GMAIL.COM', NULL)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (22, NULL, N'phingoctuan', 1, N'phingoctuan1999@gmail.com', N'Phi', N'Ngoc Tuan', N'AIhofsWEFyJ3JucWIrpmQNm8b56GCgS/nqnCezG7Q8MDi12f2jxCZuhUsnAXMDaKKg==', NULL, NULL, NULL, 0, 1, NULL, 0, N'29564658-73e7-4f9f-9715-8912cf1069ae', 0, 0, 1, 0, NULL, NULL, CAST(N'2023-04-25T21:43:48.023' AS DateTime), 22, CAST(N'2023-04-25T21:35:57.757' AS DateTime), NULL, N'PHINGOCTUAN', N'PHINGOCTUAN1999@GMAIL.COM', 11100)
GO
INSERT [dbo].[AbpUsers] ([Id], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId], [NormalizedUserName], [NormalizedEmailAddress], [Coin]) VALUES (23, NULL, N'dat1234', 1, N'dinhdat2000@gmail.com', N'dat', N'dinh', N'AJGYK7RjtHYDKm6nRtuFFLbbiyOGGVmi24ygyRlz6HGPxhybT3SuRXql3gydJJJhsQ==', NULL, NULL, NULL, 0, 1, NULL, 0, N'1d252884-0464-48bd-83e4-02a636e33a25', 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-04-28T04:13:09.170' AS DateTime), NULL, N'DAT1234', N'DINHDAT2000@GMAIL.COM', NULL)
GO
SET IDENTITY_INSERT [dbo].[AbpUsers] OFF
GO

SET IDENTITY_INSERT [dbo].[AppCategory] ON 
GO
INSERT [dbo].[AppCategory] ([Id], [name], [order], [is_display], [is_deleted]) VALUES (1, N'Art', 1, 1, 0)
GO
INSERT [dbo].[AppCategory] ([Id], [name], [order], [is_display], [is_deleted]) VALUES (2, N'Biography', 2, 1, 0)
GO
INSERT [dbo].[AppCategory] ([Id], [name], [order], [is_display], [is_deleted]) VALUES (3, N'Business', 3, 1, 0)
GO
INSERT [dbo].[AppCategory] ([Id], [name], [order], [is_display], [is_deleted]) VALUES (4, N'Art 1', 1, 1, 1)
GO
INSERT [dbo].[AppCategory] ([Id], [name], [order], [is_display], [is_deleted]) VALUES (5, N'Art 2', 2, 1, 0)
GO
INSERT [dbo].[AppCategory] ([Id], [name], [order], [is_display], [is_deleted]) VALUES (6, N'Art 3', 3, 1, 0)
GO
INSERT [dbo].[AppCategory] ([Id], [name], [order], [is_display], [is_deleted]) VALUES (7, N'Biography 1', 1, 1, 0)
GO
INSERT [dbo].[AppCategory] ([Id], [name], [order], [is_display], [is_deleted]) VALUES (8, N'Biography 2', 2, 1, 0)
GO
INSERT [dbo].[AppCategory] ([Id], [name], [order], [is_display], [is_deleted]) VALUES (9, N'Business 1', 1, 1, 0)
GO
INSERT [dbo].[AppCategory] ([Id], [name], [order], [is_display], [is_deleted]) VALUES (10, N'Business 2', 2, 1, 0)
GO
INSERT [dbo].[AppCategory] ([Id], [name], [order], [is_display], [is_deleted]) VALUES (11, N'Classics', 4, 1, 0)
GO
INSERT [dbo].[AppCategory] ([Id], [name], [order], [is_display], [is_deleted]) VALUES (12, N'Fantasy', 5, 1, 0)
GO
INSERT [dbo].[AppCategory] ([Id], [name], [order], [is_display], [is_deleted]) VALUES (13, N'History', 6, 1, 0)
GO
INSERT [dbo].[AppCategory] ([Id], [name], [order], [is_display], [is_deleted]) VALUES (14, N'Self Help1', 8, 1, 1)
GO
INSERT [dbo].[AppCategory] ([Id], [name], [order], [is_display], [is_deleted]) VALUES (15, N'Romance', 8, 1, 0)
GO
INSERT [dbo].[AppCategory] ([Id], [name], [order], [is_display], [is_deleted]) VALUES (16, N'Science', 0, 1, 0)
GO
INSERT [dbo].[AppCategory] ([Id], [name], [order], [is_display], [is_deleted]) VALUES (17, N'1', 1, 1, 1)
GO
INSERT [dbo].[AppCategory] ([Id], [name], [order], [is_display], [is_deleted]) VALUES (18, N'Funny', 0, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[AppCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[AppConfig] ON 
GO
INSERT [dbo].[AppConfig] ([Id], [Key], [Label], [Value], [IsDeleted]) VALUES (1, N'truyen-status', N'Nháp', N'1', 0)
GO
INSERT [dbo].[AppConfig] ([Id], [Key], [Label], [Value], [IsDeleted]) VALUES (3, N'truyen-status', N'Chờ duyệt', N'2', 0)
GO
INSERT [dbo].[AppConfig] ([Id], [Key], [Label], [Value], [IsDeleted]) VALUES (4, N'truyen-status', N'Duyệt', N'3', 0)
GO
INSERT [dbo].[AppConfig] ([Id], [Key], [Label], [Value], [IsDeleted]) VALUES (5, N'truyen-status', N'Từ chối', N'4', 0)
GO
SET IDENTITY_INSERT [dbo].[AppConfig] OFF
GO

ALTER TABLE [dbo].[AbpRoles] ADD  DEFAULT ('') FOR [NormalizedName]
GO
ALTER TABLE [dbo].[AbpUsers] ADD  DEFAULT ('') FOR [NormalizedUserName]
GO
ALTER TABLE [dbo].[AbpUsers] ADD  DEFAULT ('') FOR [NormalizedEmailAddress]
GO
ALTER TABLE [dbo].[AppBook] ADD  CONSTRAINT [DF_AppBook_is_publish]  DEFAULT ((0)) FOR [is_publish]
GO
ALTER TABLE [dbo].[AppBook] ADD  CONSTRAINT [DF_AppBook_is_book_free]  DEFAULT ((0)) FOR [is_book_free]
GO
ALTER TABLE [dbo].[AppBook] ADD  CONSTRAINT [DF_AppBook_isCompleted]  DEFAULT ((0)) FOR [isCompleted]
GO
ALTER TABLE [dbo].[AppBookReport] ADD  CONSTRAINT [DF_AppBookReport_isProcessed]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[AppChapter] ADD  CONSTRAINT [DF_AppChapter_is_publish]  DEFAULT ((0)) FOR [is_publish]
GO
ALTER TABLE [dbo].[AbpDynamicEntityProperties]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpDynamicEntityProperties_dbo.AbpDynamicProperties_DynamicPropertyId] FOREIGN KEY([DynamicPropertyId])
REFERENCES [dbo].[AbpDynamicProperties] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpDynamicEntityProperties] CHECK CONSTRAINT [FK_dbo.AbpDynamicEntityProperties_dbo.AbpDynamicProperties_DynamicPropertyId]
GO
ALTER TABLE [dbo].[AbpDynamicEntityPropertyValues]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpDynamicEntityPropertyValues_dbo.AbpDynamicEntityProperties_DynamicEntityPropertyId] FOREIGN KEY([DynamicEntityPropertyId])
REFERENCES [dbo].[AbpDynamicEntityProperties] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpDynamicEntityPropertyValues] CHECK CONSTRAINT [FK_dbo.AbpDynamicEntityPropertyValues_dbo.AbpDynamicEntityProperties_DynamicEntityPropertyId]
GO
ALTER TABLE [dbo].[AbpDynamicPropertyValues]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpDynamicPropertyValues_dbo.AbpDynamicProperties_DynamicPropertyId] FOREIGN KEY([DynamicPropertyId])
REFERENCES [dbo].[AbpDynamicProperties] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpDynamicPropertyValues] CHECK CONSTRAINT [FK_dbo.AbpDynamicPropertyValues_dbo.AbpDynamicProperties_DynamicPropertyId]
GO
ALTER TABLE [dbo].[AbpEntityChanges]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpEntityChanges_dbo.AbpEntityChangeSets_EntityChangeSetId] FOREIGN KEY([EntityChangeSetId])
REFERENCES [dbo].[AbpEntityChangeSets] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpEntityChanges] CHECK CONSTRAINT [FK_dbo.AbpEntityChanges_dbo.AbpEntityChangeSets_EntityChangeSetId]
GO
ALTER TABLE [dbo].[AbpEntityPropertyChanges]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpEntityPropertyChanges_dbo.AbpEntityChanges_EntityChangeId] FOREIGN KEY([EntityChangeId])
REFERENCES [dbo].[AbpEntityChanges] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpEntityPropertyChanges] CHECK CONSTRAINT [FK_dbo.AbpEntityPropertyChanges_dbo.AbpEntityChanges_EntityChangeId]
GO
ALTER TABLE [dbo].[AbpFeatures]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpFeatures_dbo.AbpEditions_EditionId] FOREIGN KEY([EditionId])
REFERENCES [dbo].[AbpEditions] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpFeatures] CHECK CONSTRAINT [FK_dbo.AbpFeatures_dbo.AbpEditions_EditionId]
GO
ALTER TABLE [dbo].[AbpOrganizationUnits]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpOrganizationUnits_dbo.AbpOrganizationUnits_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[AbpOrganizationUnits] ([Id])
GO
ALTER TABLE [dbo].[AbpOrganizationUnits] CHECK CONSTRAINT [FK_dbo.AbpOrganizationUnits_dbo.AbpOrganizationUnits_ParentId]
GO
ALTER TABLE [dbo].[AbpPermissions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpPermissions_dbo.AbpRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AbpRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpPermissions] CHECK CONSTRAINT [FK_dbo.AbpPermissions_dbo.AbpRoles_RoleId]
GO
ALTER TABLE [dbo].[AbpPermissions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpPermissions_dbo.AbpUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AbpUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpPermissions] CHECK CONSTRAINT [FK_dbo.AbpPermissions_dbo.AbpUsers_UserId]
GO
ALTER TABLE [dbo].[AbpRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpRoles_dbo.AbpUsers_CreatorUserId] FOREIGN KEY([CreatorUserId])
REFERENCES [dbo].[AbpUsers] ([Id])
GO
ALTER TABLE [dbo].[AbpRoles] CHECK CONSTRAINT [FK_dbo.AbpRoles_dbo.AbpUsers_CreatorUserId]
GO
ALTER TABLE [dbo].[AbpRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpRoles_dbo.AbpUsers_DeleterUserId] FOREIGN KEY([DeleterUserId])
REFERENCES [dbo].[AbpUsers] ([Id])
GO
ALTER TABLE [dbo].[AbpRoles] CHECK CONSTRAINT [FK_dbo.AbpRoles_dbo.AbpUsers_DeleterUserId]
GO
ALTER TABLE [dbo].[AbpRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpRoles_dbo.AbpUsers_LastModifierUserId] FOREIGN KEY([LastModifierUserId])
REFERENCES [dbo].[AbpUsers] ([Id])
GO
ALTER TABLE [dbo].[AbpRoles] CHECK CONSTRAINT [FK_dbo.AbpRoles_dbo.AbpUsers_LastModifierUserId]
GO
ALTER TABLE [dbo].[AbpSettings]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpSettings_dbo.AbpUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AbpUsers] ([Id])
GO
ALTER TABLE [dbo].[AbpSettings] CHECK CONSTRAINT [FK_dbo.AbpSettings_dbo.AbpUsers_UserId]
GO
ALTER TABLE [dbo].[AbpTenants]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpTenants_dbo.AbpEditions_EditionId] FOREIGN KEY([EditionId])
REFERENCES [dbo].[AbpEditions] ([Id])
GO
ALTER TABLE [dbo].[AbpTenants] CHECK CONSTRAINT [FK_dbo.AbpTenants_dbo.AbpEditions_EditionId]
GO
ALTER TABLE [dbo].[AbpTenants]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpTenants_dbo.AbpUsers_CreatorUserId] FOREIGN KEY([CreatorUserId])
REFERENCES [dbo].[AbpUsers] ([Id])
GO
ALTER TABLE [dbo].[AbpTenants] CHECK CONSTRAINT [FK_dbo.AbpTenants_dbo.AbpUsers_CreatorUserId]
GO
ALTER TABLE [dbo].[AbpTenants]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpTenants_dbo.AbpUsers_DeleterUserId] FOREIGN KEY([DeleterUserId])
REFERENCES [dbo].[AbpUsers] ([Id])
GO
ALTER TABLE [dbo].[AbpTenants] CHECK CONSTRAINT [FK_dbo.AbpTenants_dbo.AbpUsers_DeleterUserId]
GO
ALTER TABLE [dbo].[AbpTenants]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpTenants_dbo.AbpUsers_LastModifierUserId] FOREIGN KEY([LastModifierUserId])
REFERENCES [dbo].[AbpUsers] ([Id])
GO
ALTER TABLE [dbo].[AbpTenants] CHECK CONSTRAINT [FK_dbo.AbpTenants_dbo.AbpUsers_LastModifierUserId]
GO
ALTER TABLE [dbo].[AbpUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpUserClaims_dbo.AbpUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AbpUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpUserClaims] CHECK CONSTRAINT [FK_dbo.AbpUserClaims_dbo.AbpUsers_UserId]
GO
ALTER TABLE [dbo].[AbpUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpUserLogins_dbo.AbpUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AbpUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpUserLogins] CHECK CONSTRAINT [FK_dbo.AbpUserLogins_dbo.AbpUsers_UserId]
GO
ALTER TABLE [dbo].[AbpUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpUserRoles_dbo.AbpUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AbpUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpUserRoles] CHECK CONSTRAINT [FK_dbo.AbpUserRoles_dbo.AbpUsers_UserId]
GO
ALTER TABLE [dbo].[AbpUsers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpUsers_dbo.AbpUsers_CreatorUserId] FOREIGN KEY([CreatorUserId])
REFERENCES [dbo].[AbpUsers] ([Id])
GO
ALTER TABLE [dbo].[AbpUsers] CHECK CONSTRAINT [FK_dbo.AbpUsers_dbo.AbpUsers_CreatorUserId]
GO
ALTER TABLE [dbo].[AbpUsers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpUsers_dbo.AbpUsers_DeleterUserId] FOREIGN KEY([DeleterUserId])
REFERENCES [dbo].[AbpUsers] ([Id])
GO
ALTER TABLE [dbo].[AbpUsers] CHECK CONSTRAINT [FK_dbo.AbpUsers_dbo.AbpUsers_DeleterUserId]
GO
ALTER TABLE [dbo].[AbpUsers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpUsers_dbo.AbpUsers_LastModifierUserId] FOREIGN KEY([LastModifierUserId])
REFERENCES [dbo].[AbpUsers] ([Id])
GO
ALTER TABLE [dbo].[AbpUsers] CHECK CONSTRAINT [FK_dbo.AbpUsers_dbo.AbpUsers_LastModifierUserId]
GO
ALTER TABLE [dbo].[AbpWebhookSendAttempts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AbpWebhookSendAttempts_dbo.AbpWebhookEvents_WebhookEventId] FOREIGN KEY([WebhookEventId])
REFERENCES [dbo].[AbpWebhookEvents] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpWebhookSendAttempts] CHECK CONSTRAINT [FK_dbo.AbpWebhookSendAttempts_dbo.AbpWebhookEvents_WebhookEventId]
GO
ALTER TABLE [dbo].[AppBook]  WITH CHECK ADD  CONSTRAINT [FK_AppBook_AppBook] FOREIGN KEY([old_id])
REFERENCES [dbo].[AppBook] ([id])
GO
ALTER TABLE [dbo].[AppBook] CHECK CONSTRAINT [FK_AppBook_AppBook]
GO
ALTER TABLE [dbo].[AppBookBuy]  WITH CHECK ADD  CONSTRAINT [FK_AppBookBuy_AppBook] FOREIGN KEY([bookId])
REFERENCES [dbo].[AppBook] ([id])
GO
ALTER TABLE [dbo].[AppBookBuy] CHECK CONSTRAINT [FK_AppBookBuy_AppBook]
GO
ALTER TABLE [dbo].[AppBookCategory]  WITH CHECK ADD  CONSTRAINT [FK_AppBookCategory_AppBook] FOREIGN KEY([BookId])
REFERENCES [dbo].[AppBook] ([id])
GO
ALTER TABLE [dbo].[AppBookCategory] CHECK CONSTRAINT [FK_AppBookCategory_AppBook]
GO
ALTER TABLE [dbo].[AppBookCategory]  WITH CHECK ADD  CONSTRAINT [FK_AppBookCategory_AppCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[AppCategory] ([Id])
GO
ALTER TABLE [dbo].[AppBookCategory] CHECK CONSTRAINT [FK_AppBookCategory_AppCategory]
GO
ALTER TABLE [dbo].[AppBookInterest]  WITH CHECK ADD  CONSTRAINT [FK_AppBookInterest_AppBook] FOREIGN KEY([bookId])
REFERENCES [dbo].[AppBook] ([id])
GO
ALTER TABLE [dbo].[AppBookInterest] CHECK CONSTRAINT [FK_AppBookInterest_AppBook]
GO
ALTER TABLE [dbo].[AppBookRate]  WITH CHECK ADD  CONSTRAINT [FK_AppBookRate_AppBook] FOREIGN KEY([bookId])
REFERENCES [dbo].[AppBook] ([id])
GO
ALTER TABLE [dbo].[AppBookRate] CHECK CONSTRAINT [FK_AppBookRate_AppBook]
GO
ALTER TABLE [dbo].[AppBookReport]  WITH CHECK ADD  CONSTRAINT [FK_AppBookReport_AppBook] FOREIGN KEY([bookId])
REFERENCES [dbo].[AppBook] ([id])
GO
ALTER TABLE [dbo].[AppBookReport] CHECK CONSTRAINT [FK_AppBookReport_AppBook]
GO
ALTER TABLE [dbo].[AppCoinBalance]  WITH CHECK ADD  CONSTRAINT [FK_AppCoinBalance_AppBook] FOREIGN KEY([bookId])
REFERENCES [dbo].[AppBook] ([id])
GO
ALTER TABLE [dbo].[AppCoinBalance] CHECK CONSTRAINT [FK_AppCoinBalance_AppBook]
GO
ALTER TABLE [dbo].[AppNotifications]  WITH CHECK ADD  CONSTRAINT [FK_AppNotifications_AppBook] FOREIGN KEY([bookId])
REFERENCES [dbo].[AppBook] ([id])
GO
ALTER TABLE [dbo].[AppNotifications] CHECK CONSTRAINT [FK_AppNotifications_AppBook]
GO
/****** Object:  StoredProcedure [dbo].[prc_book_createOrEditBook]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_book_createOrEditBook]
	@id int = 0,
	@anhBiaUrl nvarchar(500) = '',
	@giaTronBo bigint  = 0,
	@moTa nvarchar(max) = '',
	@theLoai varchar(250) =  '',
	@trangThai int,
	@tenTruyen nvarchar(500),
	@ownerId int  = 0,
	@isDeleted bit = 0,
	@isPublish bit = 0,
	@approverid int = 0,
	@isFreeBook bit = 0,
	@bookNo varchar(100) = '',
	@isCompleted bit = 0
as
begin
	declare @idNew int = isnull(@id, 0);

	if(isnull(@id, 0) = 0)
		begin
			INSERT INTO [dbo].[AppBook]
			   ([name]
			   ,[cover_book]
			   ,[price]
			   ,[description]
			   ,[status]
			   ,[is_deleted]
			   ,[lastModified]
			   ,[ownerId]
			   ,[createdAt]
			   ,[is_publish]
			   , request_approve_date
			   , rev
			   ,book_no
			   ,is_book_free
			   ,isCompleted
			   )
		 VALUES
			   (@tenTruyen
			   ,@anhBiaUrl
			   ,@giaTronBo
			   ,@moTa 
			   ,@trangThai 
			   ,0
			   ,getDate()
			   ,@ownerId 
			   ,getDate()
			   ,@isPublish
			   , iif(@trangThai = 2, getDate(), null)
			   ,  iif(@trangThai = 2, 1, 0)
			   , @bookNo
			   ,@isFreeBook
			   ,@isCompleted
		)

		set @idNew = SCOPE_IDENTITY();
	end else 
	begin

		declare @currentStatus int = 0;
		declare @currentRev int = 0;
		declare @bookNo1 varchar(100) = ''

		select @currentStatus = ISnull(status, 0), @currentRev = ISnull(rev, 0), @bookNo1 = isnull(book_no, '')
		from AppBook
		where id = @id

		if(@trangThai = 2)
		begin
			-- neu trang thai =2, chuyen tu nhap, gui duyet, tu choi -> publish -> update rev =1
			
			
			if(@currentStatus = 1 or @currentStatus = 2 or @currentStatus = 4)
			begin
				UPDATE [dbo].[AppBook]
				SET [name] = @tenTruyen
					,[cover_book] = @anhBiaUrl
					,[price] = @giaTronBo
					,[description] = @moTa
					,[status] = @trangThai
					,[lastModified] = getDate() 
					,[is_publish] = @isPublish
					,request_approve_date = iif(@trangThai = 2, getDate(), request_approve_date)
					,approve_reject_date = iif(@trangThai in (3, 4), getDate(), approve_reject_date)
					, approverId = iif(@trangThai in (3, 4), @approverid, approverId)
					, rev = iif(@currentStatus = 4, rev, 1)
					, is_book_free = @isFreeBook
					,isCompleted = @isCompleted
				WHERE id = @id
			end else
			begin
				-- neu trang thai =2, truoc do o trang thai 3 -> publish -> insert new record with rev = rev + 1
				if (@currentStatus = 3)
				begin
					INSERT INTO [dbo].[AppBook]
						   ([name]
						   ,[cover_book]
						   ,[price]
						   ,[description]
						   ,[status]
						   ,[is_deleted]
						   ,[lastModified]
						   ,[ownerId]
						   ,[createdAt]
						   ,[is_publish]
						   , request_approve_date
						   , rev
						   ,book_no,
						   is_book_free,
						   old_id
						   ,isCompleted 
						   )
					 VALUES
						   (@tenTruyen
						   ,@anhBiaUrl
						   ,@giaTronBo
						   ,@moTa 
						   ,@trangThai 
						   ,0
						   ,getDate()
						   ,@ownerId 
						   ,getDate()
						   ,@isPublish
						   , iif(@trangThai = 2, getDate(), null)
						   ,  @currentRev + 1
						   , @bookNo1
						   , @isFreeBook
						   ,@id
						   ,@isCompleted
					)

					set @idNew = SCOPE_IDENTITY();
				end
			end
			
		end else
		begin
			-- approve/ reject thi chi can update 
			declare @old_id int;
			declare @rev_no int;

			select @old_id = old_id, @rev_no = rev
			from AppBook
			where id = @id

			UPDATE [dbo].[AppBook]
				SET [name] = @tenTruyen
					,[cover_book] = @anhBiaUrl
					,[price] = @giaTronBo
					,[description] = @moTa
					,[status] = @trangThai
					,[lastModified] = getDate() 
					,[is_publish] = @isPublish
					,request_approve_date = iif(@trangThai = 2, getDate(), request_approve_date)
					,approve_reject_date = iif(@trangThai in (3, 4), getDate(), approve_reject_date)
					, approverId = iif(@trangThai in (3, 4), @approverid, approverId)
					,is_book_free = @isFreeBook
					,old_id = iif(@trangThai = 3, null, old_id)
					,isCompleted = @isCompleted
			WHERE id = @id

			if(@trangThai = 3 and @currentStatus = 2)
			begin
				
				-- update new id chapter
				update AppChapter
				set book_id = @id
				where book_id = @old_id

				-- update new id book buy, book_cate,  book interest, book rate, book rate comment, book_report

				update AppBookBuy
				set bookId = @id
				where bookId = @old_id

				update AppBookInterest
				set bookId = @id
				where bookId = @old_id

				update AppBookRate
				set bookId = @id
				where bookId = @old_id

				update AppBookReport
				set bookId = @id
				where bookId = @old_id

				update AppNotifications
				set bookId = @id
				where bookId = @old_id

				-- insert noti
				if(@rev_no = 1) 
				begin
					declare @content nvarchar(500) = ('Book:' + @tenTruyen +' has been released')
					exec [dbo].[prc_notification_Insert]
							@userId = 0,
							@chapterId = null,
							@bookId = @id,
							@noti_content = @content
				end
			end
		end
	end

	-- the loai
	delete from AppBookCategory
	where BookId = @idNew

	if(isnull(@theLoai, '') <> '')
	begin
		insert into AppBookCategory(BookId, CategoryId)
		select @idNew, value
		from string_split(@theLoai, ',')
	end
	

	select @idNew as newId;
end
GO
/****** Object:  StoredProcedure [dbo].[prc_book_createOrEditChapter]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_book_createOrEditChapter]
	@id				int = 0,
	@giaBan			bigint = 0,
	@noiDung		nvarchar(max) = '',
	@tieuDe			nvarchar(500) = '',
	@trangThai		int = 1,
	@bookId			int,
	@isDeleted		bit = 0,
	@isPublish      bit = 0,
	@approverid int = 0,
	@chapterNo varchar(100) = ''
as
begin

	if(@isDeleted = 1 and @id > 0)
	begin
		update [dbo].[AppChapter]
		set is_deleted = iif([status] in (1,2,4), 1, is_deleted),
			is_publish = 0
		where id = @id
	end

	if(isnull(@id, 0) = 0)
		begin
			INSERT INTO [dbo].[AppChapter]
			   ([title]
			   ,[content]
			   ,[price]
			   ,[status]
			   ,[book_id]
			   ,[is_deleted]
			   ,[createdAt]
			   ,[lastModifiedAt]
			   ,[is_publish]
			   ,request_approve_date
			   ,rev
			   ,chapter_no
			   )
		 VALUES
			   (
				   @tieuDe, 
				   @noiDung, 
				   @giaBan,
				   @trangThai, 
				   @bookId, 0, 
				   GETDATE(),
				   getDate(), 
				   @isPublish
				   , iif(@trangThai = 2, getDate(), null)
				   , iif(@trangThai = 2, 1, 0)
				   , @chapterNo
			   )

	end else 
	begin
		declare @currentStatus int = 0;
		declare @currentRev int = 0;
		declare @chapterNo1 varchar(100) = '';

		select @currentStatus = ISnull(status, 0), @currentRev = ISnull(rev, 0), @chapterNo1 = isnull(chapter_no, '')
		from AppChapter
		where id = @id

		if(@trangThai = 2) 
		begin
			if(@currentStatus = 1 or @currentStatus = 2 or @currentStatus = 4)
			begin
				UPDATE [dbo].[AppChapter]
				SET [title] = @tieuDe,
					[content] = @noiDung,
					[price] = @giaBan,
					[status] = @trangThai,
					[lastModifiedAt] = getDate(),
					[is_publish] = @isPublish
					,content_public = iif(@trangThai in (3), [content], content_public)
					,request_approve_date = iif(@trangThai = 2, getDate(), request_approve_date)
					,approve_reject_date = iif(@trangThai in (3, 4), getDate(), approve_reject_date)
					, approverId = iif(@trangThai in (3, 4), @approverid, approverId)
					, rev = iif(@currentStatus = 4, rev, 1)
				where id = @id
			end else
			begin
				INSERT INTO [dbo].[AppChapter]
				   ([title]
				   ,[content]
				   ,[price]
				   ,[status]
				   ,[book_id]
				   ,[is_deleted]
				   ,[createdAt]
				   ,[lastModifiedAt]
				   ,[is_publish]
				   ,request_approve_date
				   ,rev
				   ,chapter_no
				   )
			 VALUES
				   (
					   @tieuDe, 
					   @noiDung, 
					   @giaBan,
					   @trangThai, 
					   @bookId, 0, 
					   GETDATE(),
					   getDate(), 
					   @isPublish
					   , iif(@trangThai = 2, getDate(), null)
					   , @currentRev + 1
					   , @chapterNo1
				   )
			end
		end else 
		begin
			UPDATE [dbo].[AppChapter]
			SET [title] = @tieuDe,
				[content] = @noiDung,
				[price] = @giaBan,
				[status] = @trangThai,
				[lastModifiedAt] = getDate(),
				[is_publish] = @isPublish
				,content_public = iif(@trangThai in (3), [content], content_public)
				,request_approve_date = iif(@trangThai = 2, getDate(), request_approve_date)
				,approve_reject_date = iif(@trangThai in (3, 4), getDate(), approve_reject_date)
				, approverId = iif(@trangThai in (3, 4), @approverid, approverId)
			where id = @id

			if(@trangThai = 3)
			begin
				-- insert noti
				if(@currentRev = 1 and @currentStatus = 2) 
				begin
					declare @bookName nvarchar(200);
					select @bookName = name
					from AppBook
					where id = @bookId
					declare @content nvarchar(500) = 'Book:' + @bookName +' has been released a new chapter: ' + @tieuDe

					exec [dbo].[prc_notification_Insert]
							@userId = 0,
							@chapterId = @id,
							@bookId = @bookId,
							@noti_content = @content
					
				end
			end
		end

	end

end
GO
/****** Object:  StoredProcedure [dbo].[prc_book_delete]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_book_delete]
	@bookId int = 0,
	@userId int = 0
as
begin
	update AppBook
	set is_deleted = iif(status in (1,2,4), 1, is_deleted),
		is_publish = 0
	where id = @bookId

	update AppChapter
	set is_deleted = iif(status in (1,2,4), 1, is_deleted),
		is_publish = 0
	where book_id = @bookId
end

GO
/****** Object:  StoredProcedure [dbo].[prc_book_getApproveData]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_book_getApproveData]
	@keyword nvarchar(500) = '',
	@status  int  = 0,
	@userId  int = 0,
	@pageOffset int = 0,
	@maxItem int = 20
as
begin
	select *
	into #tmp
	from (
		select a.id, a.cover_book, a.name, ownerP.UserName as ownerName, 
			min(isnull(b.request_approve_date, a.request_approve_date)) as minRequestApprove,
			max(isnull(b.approve_reject_date, a.approve_reject_date)) as maxApproveDate
		from AppBook a
			left join AppChapter b on isnull(a.old_id, a.id) = b.book_id and b.is_deleted = 0 and b.rev = (
				select max(rev)
				from AppChapter tmp
				where tmp.chapter_no = b.chapter_no 
			)
			left join AbpUsers ownerP on a.ownerId = ownerP.Id
			left join AbpUsers approveBook on a.approverId = approveBook.Id
			left join AbpUsers approveChapter on b.approverId = approveChapter.Id
		where a.is_deleted = 0 
			and (isnull(@keyword, '') = ''
				or lower(a.name) like N'%' + lower(@keyword) + '%' collate Latin1_General_100_CI_AI_SC_UTF8
				or lower(b.title) like N'%' + lower(@keyword) + '%' collate Latin1_General_100_CI_AI_SC_UTF8
				or lower(ownerP.UserName) like  N'%' + lower(@keyword) + '%' collate Latin1_General_100_CI_AI_SC_UTF8
			)
			and (isnull(@status, 0) = 0 or a.status = @status or b.status = @status)
			and (isnull(@userId, 0) = 0 or a.approverId = @userId or b.approverId = @userId)
			and (a.status <> 1 
				--and ISNULL(b.status,0) <> 1
			)
			and a.rev = (
				select max(rev)
				from AppBook tmp
				where tmp.book_no = a.book_no
			)
		group by a.id, a.cover_book, a.name, ownerP.UserName
	) a

	select *
	from #tmp a
	order by a.minRequestApprove desc
	OFFSET @pageOffset ROWS 
	FETCH NEXT @maxItem ROWS ONLY;

	select count(1) as totalRow
	from #tmp

	drop table #tmp;

end
GO
/****** Object:  StoredProcedure [dbo].[prc_book_getDetail]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_book_getDetail]
	@bookId int = 0
as
begin
	declare @correctBookId int;



	select  @correctBookId = isnull(a.old_id, a.id)
	from AppBook a
	where id = @bookId

	print @correctBookId

	select a.*, stuff((
		select ',' + CAST(CategoryId as varchar(10))
		from AppBookCategory
		where BookId = @bookId
		for xml path('')
	), 1, 1, '') as theLoaiId
	from AppBook a
	where id = @bookId

	select a.*, b.UserName as approve_reject_user
	from AppChapter a
		left join AbpUsers b on a.approverId = b.id
	where book_id = @correctBookId and is_deleted = 0
		and rev =  (
			select max(tmp.rev)
			from AppChapter tmp
			where tmp.book_id = @correctBookId and tmp.chapter_no = a.chapter_no
		)
end
GO
/****** Object:  StoredProcedure [dbo].[prc_category_createOrUpdate]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_category_createOrUpdate]
	@id int = 0,
	@name nvarchar(200) = '',
	@order int = 0,
	@is_display bit = 0,
	@is_deleted bit  = 0
as
begin
	if(isnull(@id, 0) = 0)
	begin
		insert into AppCategory( name, [order], is_display, is_deleted)
		values( @name, @order, @is_display, 0)
	end else
	begin
		if(@is_deleted = 1)
		begin
			if exists (
				select 1
				from AppBookCategory tmp
				where tmp.CategoryId = @id
			)
			begin
				select 1;
			end

			update AppCategory
			set is_deleted = 1
			where id = @id
		end else
		begin
			update AppCategory
			set name = trim(@name),
				[order] = @order,
				is_display = @is_display
			where id = @id
		end
	end


end
GO
/****** Object:  StoredProcedure [dbo].[prc_category_getDetail]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[prc_category_getDetail]
	@id int = 0
	
as
begin
	select * from AppCategory
	where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[prc_category_getList]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_category_getList]
	@page int = 1,
	@term nvarchar(200) = '',
	@pageSize int = 20
as
begin
	with cteData
	as (
		select *
		from AppCategory
		where is_deleted = 0
			and (isnull(@term, '') = '' or LOWER(name) like N'%' + @term + '%')
		
	)

	select *
	from (
		select a.*, b.total, '' as parentName
		from cteData a cross join (
			select count(1) as total
			from cteData
		) b
	) a
	order by a.[order]
	OFFSET  (@page - 1) * @pageSize rows
	FETCH NEXT @pageSize ROWS ONLY


end
GO
/****** Object:  StoredProcedure [dbo].[prc_chapter_delete]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_chapter_delete]
	@chapterId int = 0,
	@userId int = 0
as
begin
	update AppChapter
	set is_deleted = iif(status in (1,2,4), 1, is_deleted),
		is_publish = 0,
		lastModifiedAt = GETDATE()
	where id = @chapterId
end

GO
/****** Object:  StoredProcedure [dbo].[prc_GetDataBienDongSoDu]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[prc_GetDataBienDongSoDu]
	@page int = 1,
	@pageSize int  = 20,
	@userId	int = 0,
	@term varchar(200) = ''
as
begin
	with cteData as (
		select a.*, b.name
		from AppCoinBalance a
			left join AppBook b on a.bookId = b.id
		where a.userId = @userId
	),
	cteTotal as (
		select count(1) as total from cteData
	)


	select *
	from cteData a cross join cteTotal
	order by a.created_at desc
	offset (@page - 1) * @pageSize rows
	fetch next @pageSize rows only
end
GO
/****** Object:  StoredProcedure [dbo].[prc_home_BookmarkBook]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prc_home_BookmarkBook]
	@bookId int,
	@useId int = 0
as
begin
	if exists(
		select 1
		from AppBookInterest
		where bookId = @bookId and userId = @useId
	)
	begin
		delete from AppBookInterest
		where bookId = @bookId and userId = @useId
	end else 
	begin
		insert into AppBookInterest(bookId, userId)
		values(@bookId, @useId)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[prc_home_BuyChapterOrAllBook]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_home_BuyChapterOrAllBook]
	@bookId int,
	@userId int = 0,
	@chapterId int = 0,
	@isAllBook bit = 0
as
begin
	declare @price bigint = 0;

	if(@isAllBook = 1)
	begin
		select @price = price
		from AppBook
		where Id = @bookId
	end else 
	begin
		select @price = price
		from AppChapter
		where book_id = @bookId and id = @chapterId
	end

	INSERT INTO [dbo].[AppBookBuy]
           ([bookId]
           ,[userId]
           ,[chapterId]
           ,[price]
           ,[isAllBook]
           ,[buyDate])
     VALUES
           (
			@bookId,
			@userId,
			@chapterId,
			@price,
			@isAllBook,
			GETDATE()
		   )

	select @price as price
end
GO
/****** Object:  StoredProcedure [dbo].[prc_home_CheckNewNoti]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_home_CheckNewNoti]
	@userId int = 0
as
begin
	declare @status bit  = 0;

	if exists (
		select 1
		from AppNotiUser
		where userId = @userId and isnull(isRead, 0) = 0
	)
	begin
		set @status = 1
	end

	select @status

end

GO
/****** Object:  StoredProcedure [dbo].[prc_home_createOrDeleteComment]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_home_createOrDeleteComment]
	@Id int,
	@RateId int = 0,
	@Comment nvarchar(500) = '',
	@IsDelete bit = 0,
	@UseId int = 0
as
begin
	declare @returnId int = @Id;

	if(isnull(@Id, 0) = 0 and @IsDelete = 0)
	begin
		insert into AppBookRateComment(rateId, userId, comment, commentDate)
		values(@RateId, @UseId, @Comment, GETDATE())

		set @returnId =  @@IDENTITY
	end else
	begin
		delete from AppBookRateComment
		where Id = @Id
	end

	select a.*, (b.Surname + ' ' + b.Name) as userName
	from AppBookRateComment a
		left join AbpUsers b on a.userId = b.id
	where a.id = @returnId
end
GO
/****** Object:  StoredProcedure [dbo].[prc_home_FollowAuthor]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[prc_home_FollowAuthor]
	@authorId int,
	@userId int = 0
as
begin
	if exists (
		select 1
		from AppAuthorFollow
		where userFollow = @authorId and userId = @userId
	) 
	begin
		-- unfollow
		delete from AppAuthorFollow where userFollow = @authorId and userId = @userId
	end else 
	begin
		insert into AppAuthorFollow(userId, userFollow)
		values(@userId, @authorId)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[prc_home_GetBookBuyMost]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[prc_home_GetBookBuyMost]
	@mode varchar(200) = 'month',
	@page int = 1,
	@pageSize int = 20,
	@userId int  = 0
as
begin
	declare @week int = datepart(wk, getdate())
	declare @year int = datepart(yy, getdate())
	declare @month int = datepart(mm, getdate())

	;with cteData as (
		select a.id, a.cover_book, a.name, a.price, a.is_book_free, a.description,
			a.createdAt, a.[views],
			stuff((
				select ', ' + ac.name
				from AppBookCategory bk join AppCategory ac on bk.CategoryId = ac.Id
				where bk.BookId = a.id
				for xml path('')
			), 1, 1, '') as categories,
			b.Surname + ' ' + b.Name as author,
			(
				select count(1)
				from AppChapter
				where is_deleted = 0 and is_publish = 1 and status = 3 and book_id = a.id
			) as chapterCount,
			rate.quantity,
			rate.rate,
			isnull(bookBuy.sl, 0) as sl
		from AppBook a
			left join AbpUsers b on a.ownerId = b.id
			outer apply (
				select count(1) as quantity, AVG(ISNULL(r.rate, 0)) as rate
				from AppBookRate r
				where r.bookId = a.id
			) rate
			outer apply (
				select count(id) as sl
				from AppBookBuy dd
				where dd.bookId = a.id
				and (
						(@mode = 'month' and datepart(mm, dd.buyDate) = @month)
						or
						(@mode = 'week' and datepart(WK, dd.buyDate) = @week)
					)
			) bookBuy
		where is_deleted = 0 and is_publish = 1 and status = 3
			and a.rev = (
				select max(rev)
				from AppBook tmp
				where a.book_no = tmp.book_no and tmp.status = 3 and tmp.is_publish = 1 and tmp.is_deleted = 0
			)
	)


	select a.*, t.total
	from cteData a
		cross join (
			select count(1) as total from cteData
		) as t
	order by sl desc
	OFFSET (@page - 1)* @pageSize ROWS 
	FETCH NEXT @pageSize ROWS ONLY;
end


GO
/****** Object:  StoredProcedure [dbo].[prc_home_GetBookByAuthor]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_home_GetBookByAuthor]
	@authorId int,
	@page int = 1,
	@pageSize int = 20,
	@sortBy varchar(20) = '',
	@userId int  = 0
as
begin
	with cteData as (
		select a.id, a.cover_book, a.name, a.price, a.is_book_free, a.description,
			a.createdAt, a.[views],
			stuff((
				select ', ' + ac.name
				from AppBookCategory bk join AppCategory ac on bk.CategoryId = ac.Id
				where bk.BookId = a.id
				for xml path('')
			), 1, 1, '') as categories,
			b.Surname + ' ' + b.Name as author,
			(
				select count(1)
				from AppChapter
				where is_deleted = 0 and is_publish = 1 and status = 3 and book_id = a.id
			) as chapterCount,
			rate.quantity,
			rate.rate
		from AppBook a
			left join AbpUsers b on a.ownerId = b.id
			outer apply (
				select count(1) as quantity, AVG(ISNULL(r.rate, 0)) as rate
				from AppBookRate r
				where r.bookId = a.id
			) rate
		where is_deleted = 0 and is_publish = 1 and status = 3 and ownerId = @authorId
			and a.rev = (
				select max(rev)
				from AppBook tmp
				where a.book_no = tmp.book_no and tmp.status = 3 and tmp.is_publish = 1 and tmp.is_deleted = 0
			)
	)


	select a.*, t.total,
	isnull((
			select 1
			from AppAuthorFollow
			where userId = @userId and userFollow = @authorId
		), 0) as isFollowed
	from cteData a
		cross join (
			select count(1) as total from cteData
		) as t
	order by 
		CASE WHEN ISNULL(@sortBy, '') = '' THEN a.createdAt  END desc,
		CASE WHEN ISNULL(@sortBy, '') = 'rate' THEN a.rate  END desc,
		CASE WHEN ISNULL(@sortBy, '') = 'view' THEN a.[views] END desc
	OFFSET (@page - 1)* @pageSize ROWS 
	FETCH NEXT @pageSize ROWS ONLY;
end
GO
/****** Object:  StoredProcedure [dbo].[prc_home_GetBookByCategory]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_home_GetBookByCategory]
	@categoryId int,
	@page int = 1,
	@pageSize int = 20,
	@sortBy varchar(20) = '',
	@keyword nvarchar(200) = ''

as
begin
	with cteData as (
		select a.id, a.cover_book, a.name, a.price, a.is_book_free, 
			a.createdAt, a.[views],
			b.Surname + ' ' + b.Name as author,
			(
				select count(1)
				from AppChapter
				where is_deleted = 0 and is_publish = 1 and status = 3 and book_id = a.id
			) as chapterCount,
			rate.quantity,
			rate.rate,
			(select name from AppCategory where id = @categoryId) as categoryName
		from AppBook a
			left join AbpUsers b on a.ownerId = b.id
			outer apply (
				select count(1) as quantity, AVG(ISNULL(r.rate, 0)) as rate
				from AppBookRate r
				where r.bookId = a.id
			) rate
		where is_deleted = 0 and is_publish = 1 and status = 3
			and (isnull(@keyword, '') = '' or a.name like N'%' + @keyword + '%' or author like N'%' + @keyword + '%')
			and (isnull(@categoryId, 0) = 0 or exists (
				select 1
				from AppBookCategory tmp
					join AppCategory cat on tmp.CategoryId = cat.id and ISNULL(cat.is_deleted , 0) = 0 and ISNULL(cat.is_display, 0) = 1
				where tmp.BookId = a.id and (cat.id = @categoryId)
			))
	)


	select a.*, t.total
	from cteData a
		cross join (
			select count(1) as total from cteData
		) as t
	order by 
		CASE WHEN ISNULL(@sortBy, '') = '' THEN a.createdAt  END desc,
		CASE WHEN ISNULL(@sortBy, '') = 'rate' THEN a.rate  END desc,
		CASE WHEN ISNULL(@sortBy, '') = 'view' THEN a.[views] END desc
	OFFSET (@page - 1)* @pageSize ROWS 
	FETCH NEXT @pageSize ROWS ONLY;

	-- subcategory

	select * 
	from AppCategory
	where is_deleted = 0 and ISNULL(is_display, 0) = 1 and 1 = -1
end
GO
/****** Object:  StoredProcedure [dbo].[prc_home_GetChapterDetail]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_home_GetChapterDetail]
	@chapterId	int = 0,
	@useId		int = 0
as
begin
	select *,
		ISNULL((
			select 1
			from AppBookReport
			where userId = @useId and chapterId = @chapterId
		), 0) as isReported
	from AppChapter
	where id = @chapterId and is_deleted = 0 and [status] = 3


	update AppBook
	set [views] = ISNULL([views], 0) + 1
	where id = (
		select book_id from AppChapter where id = @chapterId
	)

end

select * from AppBookReport
GO
/****** Object:  StoredProcedure [dbo].[prc_home_getCommentOfRate]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_home_getCommentOfRate]
	@rateId int,
	@userId int = 0
as
begin
	select a.*, b.Surname + ' ' + b.Name as userName
	from AppBookRateComment a
		join AbpUsers b on a.userId = b.Id
	where rateId = @rateId
end
GO
/****** Object:  StoredProcedure [dbo].[prc_home_getHomeBookDetail]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_home_getHomeBookDetail]
	@bookId int,
	@userId int = 0
as
begin
	-- book data
	select a.*, b.Surname + ' ' + b.Name as author,
		isnull((
			select 1
			from AppAuthorFollow
			where userId = @userId and userFollow = a.ownerId
		), 0) as isFollowed,
		ISNULL((
			select 1
			from AppBookReport
			where userId = @userId and bookId = @bookId and isnull(chapterId, 0) = 0
		), 0) as isReported
	from AppBook a
		left join AbpUsers b on a.ownerId = b.id
	where a.id = @bookId and a.is_deleted = 0 and is_publish = 1 and status = 3
	and a.rev = (
				select max(rev)
				from AppBook tmp
				where a.book_no = tmp.book_no and tmp.status = 3 and tmp.is_publish = 1 and tmp.is_deleted = 0
			)

	-- chapter
	select *
	from AppChapter a
	where book_id = @bookId
		and is_deleted = 0 and is_publish = 1 and status = 3
		and a.rev = (
				select max(rev)
				from AppChapter tmp
				where a.chapter_no = tmp.chapter_no and tmp.status = 3 and tmp.is_publish = 1 and tmp.is_deleted = 0
			)

	-- rating
	select a.*, b.Surname + ' ' + b.[Name] as userName,
		(
			select count(1)
			from AppBookRateComment
			where rateId = a.Id
		) as countComments
	from AppBookRate a
		join AbpUsers b on a.userId = b.Id
	where a.bookId = @bookId

	-- rate score
	select count(1) as quantity, AVG(ISNULL(r.rate, 0)) as rate
	from AppBookRate r
	where r.bookId = @bookId

	-- interest book
	select count(1) as quantity, sum(iif(userId = @userId, 1, 0)) as isInterest
	from AppBookInterest
	where bookId = @bookId

	-- buy chapter 
	select *
	from AppBookBuy
	where bookId = @bookId and userId = @userId
end
GO
/****** Object:  StoredProcedure [dbo].[prc_home_getHomeMainData]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_home_getHomeMainData]
as
begin
	-- book new
	select top(10) a.id, a.cover_book, a.name, a.price, a.is_book_free,  
		b.Surname + ' ' + b.Name as author,
		(
			select count(1)
			from AppChapter
			where is_deleted = 0 and is_publish = 1 and status = 3 and book_id = a.id
		) as chapterCount,
		rate.quantity,
		rate.rate
	from AppBook a
		left join AbpUsers b on a.ownerId = b.id
		outer apply (
			select count(1) as quantity, AVG(ISNULL(r.rate, 0)) as rate
			from AppBookRate r
			where r.bookId = a.id
		) rate
	where is_deleted = 0 and is_publish = 1 and status = 3
		and a.rev = (
			select max(rev)
			from AppBook tmp
			where a.book_no = tmp.book_no and tmp.status = 3 and tmp.is_publish = 1 and tmp.is_deleted = 0
		)
	order by approve_reject_date desc

	-- book sellest
	select top(10) a.id, a.cover_book, a.name, a.price, a.is_book_free,  
		b.Surname + ' ' + b.Name as author,
		(
			select count(1)
			from AppChapter
			where is_deleted = 0 and is_publish = 1 and status = 3 and book_id = a.id
		) as chapterCount,
		rate.quantity,
		rate.rate
	from AppBook a
		left join AbpUsers b on a.ownerId = b.id
		outer apply (
			select count(1) as quantity, AVG(ISNULL(r.rate, 0)) as rate
			from AppBookRate r
			where r.bookId = a.id
		) rate
	where is_deleted = 0 and is_publish = 1 and status = 3
		and a.rev = (
				select max(rev)
				from AppBook tmp
				where a.book_no = tmp.book_no and tmp.status = 3 and tmp.is_publish = 1 and tmp.is_deleted = 0
			)
	order by approve_reject_date desc

	-- book read
	select top(10) a.id, a.cover_book, a.name, a.price, a.is_book_free,  
		b.Surname + ' ' + b.Name as author,
		(
			select count(1)
			from AppChapter
			where is_deleted = 0 and is_publish = 1 and status = 3 and book_id = a.id
		) as chapterCount,
		rate.quantity,
		rate.rate
	from AppBook a
		left join AbpUsers b on a.ownerId = b.id
		outer apply (
			select count(1) as quantity, AVG(ISNULL(r.rate, 0)) as rate
			from AppBookRate r
			where r.bookId = a.id
		) rate
		outer apply(
			select sum(isnull(tmp.price, 0)) as [money]
			from appBookBuy tmp
			where a.is_book_free = 0 and tmp.bookId = a.id
		) as buy
	where is_deleted = 0 and is_publish = 1 and status = 3
		and a.rev = (
				select max(rev)
				from AppBook tmp
				where a.book_no = tmp.book_no and tmp.status = 3 and tmp.is_publish = 1 and tmp.is_deleted = 0
			)
	order by buy.[money] desc

	-- book rate
	select top(10) a.id, a.cover_book, a.name, a.price, a.is_book_free,  
		b.Surname + ' ' + b.Name as author,
		(
			select count(1)
			from AppChapter
			where is_deleted = 0 and is_publish = 1 and status = 3 and book_id = a.id
		) as chapterCount,
		rate.quantity,
		rate.rate
	from AppBook a
		left join AbpUsers b on a.ownerId = b.id
		outer apply (
			select count(1) as quantity, AVG(ISNULL(r.rate, 0)) as rate
			from AppBookRate r
			where r.bookId = a.id
		) rate
	where is_deleted = 0 and is_publish = 1 and status = 3
		and a.rev = (
			select max(rev)
			from AppBook tmp
			where a.book_no = tmp.book_no and tmp.status = 3 and tmp.is_publish = 1 and tmp.is_deleted = 0
		)
	order by rate.rate desc


end
GO
/****** Object:  StoredProcedure [dbo].[prc_home_GetMyAccountData]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_home_GetMyAccountData] 
	@useId int = 0
as
begin
	-- book favorite
	select b.Id, b.name, b.cover_book
	from AppBookInterest a join AppBook b on a.bookId = b.id
	where userId = @useId

	-- author follow
	select b.Surname + ' ' + b.Name as AuthorName, b.id,
		(
			select count(1)
			from AppBook
			where ownerId = b.Id and status = 3 and is_publish = 1 and is_deleted = 0
		) as bookNumber
	from AppAuthorFollow a join AbpUsers b on a.userFollow = b.Id
	where a.userId = @useId

	-- notification
	select 1

	--account info
	select * from AbpUsers where id = @useId


	-- book bought
	select b.Id, b.name, b.cover_book
	from (
		select distinct COALESCE(b.id, c.book_id) as bookId
		from AppBookBuy a 
			left join AppBook b on a.isAllBook = 1 and a.bookId = b.id
			left join AppChapter c on a.isAllBook = 0 and a.chapterId = c.id
		where a.userId = @useId
	) a join AppBook b on a.bookId = b.id
	
end
GO
/****** Object:  StoredProcedure [dbo].[prc_home_InsertUpdateRateComment]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_home_InsertUpdateRateComment]
	@bookId int,
	@rate int = 0,
	@rateComment nvarchar(500) = '',
	@userId int = 0,
	@isDeleted bit = 0
as
begin
	if(@isDeleted = 1)
	begin
		delete from AppBookRate
		where bookId = @bookId and userId = @userId
	end else
	begin
		if exists (
			select 1
			from AppBookRate
			where bookId = @bookId and userId = @userId
		) 
		begin
			update AppBookRate
			set rate = @rate,
				rateComment = @rateComment,
				rateDate = GETDATE()
			where bookId = @bookId and userId = @userId
		end else 
		begin
			insert into AppBookRate(userId, bookId, rate, rateComment, rateDate)
			values(@userId, @bookId, @rate, @rateComment, GETDATE())
		end
	end
end
GO
/****** Object:  StoredProcedure [dbo].[prc_home_ReportBook]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_home_ReportBook]
	@bookId int,
	@userId int = 0,
	@comment nvarchar(500) = '',
	@type int = 1,
	@chapterId int = 0
as
begin
	insert into AppBookReport(bookId, userId, report_comment, report_date, [type], [status], chapterId)
	values(@bookId, @userId, @comment, GETDATE(), @type, 0, @chapterId)
end
GO
/****** Object:  StoredProcedure [dbo].[prc_insert_blanceChange]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_insert_blanceChange]
	@bookId int,
	@userId int = 0,
	@isAllBook bit = 0,
	@price int = 0,
	@authorId int = 0,
	@chapterIds varchar(200) = ''
as
begin
	if(@isAllBook = 1)
	begin
		declare @bookName nvarchar(500);

		select @bookName = name
		from AppBook
		where id = @bookId

		insert into AppCoinBalance(userId, bookId, amount, content, created_at)
		values(@userId, @bookId, @price * (-1), N'mua sách ' + @bookName, getdate())

		insert into AppCoinBalance(userId, bookId, amount, content, created_at)
		values(@authorId, @bookId, @price, N'bán sách ' + @bookName, getdate())
	end else
	begin
		declare @listChapterName nvarchar(2000);

		select @listChapterName = stuff((
				select ',' + a.title
				from AppChapter a join (
				select value
				from string_split(@chapterIds, ',')
			) b on a.id = b.value
			for xml path('')
		), 1, 1, '')

		insert into AppCoinBalance(userId, bookId, amount, content, created_at)
		values(@userId, @bookId, @price * (-1), N'mua chapter: ' + @listChapterName, getdate())

		insert into AppCoinBalance(userId, bookId, amount, content, created_at)
		values(@authorId, @bookId, @price, N'bán chapter: ' + @listChapterName, getdate())
	end
	
end
GO
/****** Object:  StoredProcedure [dbo].[prc_MyBook]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_MyBook]
	@term nvarchar(100) = '',
	@userId int = 0,
	@page int  = 1,
	@pageSize int = 10
as
begin
	;with cteBookOwner
	as (
		select a.id,
			sum(iif(b.[status] = 1, 1, 0)) as soChapterNhap,
			sum(iif(b.[status] = 2, 1, 0)) as soChapterGuiDuyet,
			sum(iif(b.[status] = 3, 1, 0)) as soChapterDuyet,
			sum(iif(b.[status] = 4, 1, 0)) as soChapterTuChoi,
			sum(iif(b.[status] = 5, 1, 0)) as soChapterSuaNoiDung
		from AppBook a
			left join AppChapter b on ISNULL(a.old_id, a.id) = b.book_id and b.is_deleted = 0 and b.rev = (
				select max(rev)
				from AppChapter tmp
				where tmp.chapter_no = b.chapter_no
			)
		where a.is_deleted = 0 
			and (@userId = 1 or a.ownerId = @userId)
			and (LOWER(a.[name]) like N'%' + @term + '%' COLLATE Latin1_General_100_CI_AI_SC_UTF8
				or (b.title is not null and LOWER(b.title) like N'%' + @term + '%' COLLATE Latin1_General_100_CI_AI_SC_UTF8))
			and a.rev = (
				select max(rev)
				from AppBook tmp
				where tmp.book_no = a.book_no
			)
			
		group by a.id
	)

	select a.*, b.[name], b.[cover_book], 
		iif(b.is_publish = 0, 5, b.[status]) as status
		, b.lastModified
		, count(1) over() as totalRows
	from cteBookOwner a join AppBook b on a.id = b.id
	order by b.lastModified desc
	OFFSET (@page -1) * @pageSize ROWS 
	FETCH NEXT @pageSize ROWS ONLY; 
end


GO
/****** Object:  StoredProcedure [dbo].[prc_notification_getListNoti]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_notification_getListNoti]
	@userId int = 0,
	@page int = 1,
	@pageSize int = 20
as
begin
	with cteData as (
		select a.*, c.name
		from AppNotifications a
			join AppNotiUser b on a.id = b.notiId
			join AppBook c on a.bookId = c.id 
		where b.userId = @userId
	)

	select a.*, b.total
	from cteData a
		cross join (
			select count(1) as total
			from cteData
		) b
	order by a.created_at desc
	OFFSET (@page - 1) * @pageSize ROWS 
	FETCH NEXT @pageSize ROWS ONLY; 

end
GO
/****** Object:  StoredProcedure [dbo].[prc_notification_Insert]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_notification_Insert]
	@userId int = 0,
	@chapterId int = 0,
	@bookId int = 0,
	@noti_content nvarchar(500) = '',
	@isNotiForAuthor bit = 0

as
begin
	declare @newId int;

	insert into AppNotifications(bookId, chapterId, noti_content, created_at)
	values(@bookId, @chapterId, @noti_content, GETDATE())

	select @newId = SCOPE_IDENTITY();

	if(@isNotiForAuthor = 1)
	begin
		insert into AppNotiUser(notiId, userId)
			select @newId, a.userId
			from (
				select distinct userId
				from AppBookInterest
				where bookId = @bookId

				union

				select distinct a.userId
				from AppAuthorFollow a
					join AppBook b on a.userFollow = b.ownerId and b.id = @bookId
				where b.id = @bookId
			) a
	end else 
	begin
		insert into AppNotiUser(notiId, userId)
		select @newId, a.userId
		from (
			select ownerId as userId
			from AppBook a 
			where id = @bookId
		) a
	end
	

end
GO
/****** Object:  StoredProcedure [dbo].[prc_notification_updateReadStatus]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prc_notification_updateReadStatus]
	@userId int = 0
as
begin
	update AppNotiUser
	set isRead = 1
	where userId = @userId

end
GO
/****** Object:  StoredProcedure [dbo].[prc_payment_GetAll]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_payment_GetAll]
	@page int = 1,
	@pageSize int  = 20,
	@userId	int = 0,
	@term varchar(200) = ''
as
begin
	with cteData as (
		select a.*, 
			b.Surname + ' ' + b.Name as PaymentUser,
			c.Surname + ' ' + c.Name as ApproveUser
		from AppPaymentHistory a
			join AbpUsers b on a.userId = b.Id
			left join AbpUsers c on a.approve_user = c.Id
		where (ISNULL(@term, '') = '' or a.code like N'%' + @term +'%' or b.userName like N'%' + @term +'%' or c.username like N'%' + @term +'%')
	),
	cteTotal as (
		select count(1) as total from cteData
	)


	select *
	from cteData a cross join cteTotal
	order by a.created_at desc
	offset (@page - 1) * @pageSize rows
	fetch next @pageSize rows only
end
GO
/****** Object:  StoredProcedure [dbo].[prc_payment_GetByUser]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_payment_GetByUser]
	@page int = 1,
	@pageSize int  = 20,
	@userId	int = 0,
	@term varchar(200) = ''
as
begin
	with cteData as (
		select a.*, 
			b.Surname + ' ' + b.Name as PaymentUser,
			c.Surname + ' ' + c.Name as ApproveUser
		from AppPaymentHistory a
			join AbpUsers b on a.userId = b.Id
			left join AbpUsers c on a.approve_user = c.Id
		where (ISNULL(@term, '') = '' or a.code like N'%' + @term +'%' or b.userName like N'%' + @term +'%' or c.username like N'%' + @term +'%')
			and (isnull(@userId, 0) = 0 or a.userId = @userId)
	),
	cteTotal as (
		select count(1) as total from cteData
	)


	select *
	from cteData a cross join cteTotal
	order by a.created_at desc
	offset (@page - 1) * @pageSize rows
	fetch next @pageSize rows only
end
GO
/****** Object:  StoredProcedure [dbo].[prc_payment_Insert]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[prc_payment_Insert]
	@amount int = 0,
	@userId	int = 0,
	@code varchar(100) = ''
as
begin
	insert into AppPaymentHistory(userId, code, amount, created_at, [status])
	values(@userId, @code, @amount, getDate(), 0)
end
GO
/****** Object:  StoredProcedure [dbo].[prc_payment_Process]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_payment_Process]
	@id int,
	@userId	int = 0,
	@status int
as
begin
	if(@status = 1) -- approve
	begin
		-- cong tien cho  user
		update AbpUsers
		set coin = ISNULL(coin, 0) + b.amount / 1000
		from AbpUsers a join AppPaymentHistory b on a.id = b.userId
		where b.id = @id
	end

	update AppPaymentHistory
	set status = @status,
		approve_at = getDate(),
		approve_user = @userId
	where id = @id
end
	GO
	/****** Object:  StoredProcedure [dbo].[prc_report_getList]    Script Date: 5/30/2023 11:24:22 PM ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	CREATE proc [dbo].[prc_report_getList]
		@page int = 1,
		@term nvarchar(200) = '',
		@pageSize int = 20
	as
	begin
		with cteData
		as (
			select a.*, b.Surname + ' ' + b.Name as reportUser,
				c.Name as bookName,
				d.title as chapterName
			from AppBookReport a
				join AbpUsers b on a.userId = b.Id
				join AppBook c on a.bookId = c.id
				left join AppChapter d on a.chapterId = d.id
			where isnull(@term, '') = '' or LOWER(b.UserName) like N'%' + @term + '%'
				or LOWER(c.name) like N'%' + @term + '%'
				or LOWER(d.title) like N'%' + @term + '%'
		)

		select *
		from (
			select a.type as [type], a.id,
				iif(type = 1, a.bookName, a.chapterName) as entityName,
				a.report_comment as reportContent,
				a.reportUser as userReport,
				a.report_date as reportDate,
				isnull(a.status, 0) as status
				, b.total 
			from cteData a cross join (
				select count(1) as total
				from cteData
			) b
		) a
		order by a.reportDate desc
		OFFSET  (@page - 1) * @pageSize rows
		FETCH NEXT @pageSize ROWS ONLY


	end
GO
/****** Object:  StoredProcedure [dbo].[prc_report_updateProcessed]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_report_updateProcessed]
	@id int = 0,
	@value int = 0
as
begin
	declare @type int = 0;
	declare @userId int = 0;
	declare @bookId int = 0;
	declare @chapterId int = 0;
	declare @bookName nvarchar(500);
	declare @chapterName nvarchar(500);

	select @type = type, @userId = userId, @bookId = bookId, @chapterId = chapterId
	from AppBookReport
	where id = @id

	update AppBookReport
	set [status] = @value
	where id = @id

	if(@value = 1)
	begin
		declare @message nvarchar(250) = '';

		select @bookName = name
		from AppBook
		where id = @bookId

		select @chapterName = title
		from AppChapter
		where id = @chapterId

		if(@type = 1)
		begin
			update AppBook
			set is_publish = 0
			where id = @bookId

			set @message = N'Book name: ' + @bookName + N' has been taken down due to content violation'
		end else 
		begin
			update AppChapter
			set is_publish = 0
			where id = @chapterId

			set @message = N'Chapter name: ' + @chapterName + N' of book name: ' + @bookName + ' has been taken down due to content violation'
		end

		insert into AppNotifications(bookId, chapterId, noti_content, created_at)
		values(@bookId, @chapterId, @message, GETDATE())

		insert into AppNotiUser(NotiId, UserId, IsRead)
		values(SCOPE_IDENTITY(), @userId, 0)

	end
end
GO
/****** Object:  StoredProcedure [dbo].[prc_suggestion_SuggestByKey]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_suggestion_SuggestByKey]
	@keyCode nvarchar(50) = '',
	@term nvarchar(250) = ''
as
begin
	select Id, [name] as Name
	from AppCategory
	where is_deleted = 0 and is_display = 1 
	order by [order]
end

GO
/****** Object:  StoredProcedure [dbo].[prc_updateChapterIsPublic]    Script Date: 5/30/2023 11:24:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[prc_updateChapterIsPublic]
	@userId  int = 0,
	@chapterId int = 0,
	@isShow bit = 0
as
begin
	update AppChapter
	set is_publish = @isShow,
		lastModifiedAt = GETDATE()
	where id = @chapterId



end
GO
