# My-Ecp

###电商网站
- 
Server :Tomcat 8;
IDE:J2EE Mars;
Java:8;
Jquery:1.11.2;
DBMS:sql server 2014+Mysql 5.6;
Struct2 version:2.3.4;
####SQL脚本
CREATE TABLE [dbo].[attg](
	[attrigid] [varchar](20) NOT NULL,
	[attrigname] [varchar](20) NULL,
	[attid] [varchar](20) NULL,
 CONSTRAINT [PK_attg] PRIMARY KEY CLUSTERED 
(
	[attrigid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[attg]  WITH CHECK ADD  CONSTRAINT [FK_attg_attribute] FOREIGN KEY([attid])
REFERENCES [dbo].[attribute] ([attid])
GO

ALTER TABLE [dbo].[attg] CHECK CONSTRAINT [FK_attg_attribute]
GO

CREATE TABLE [dbo].[attribute](
	[attid] [varchar](20) NOT NULL,
	[attname] [varchar](20) NOT NULL,
 CONSTRAINT [PK_attribute] PRIMARY KEY CLUSTERED 
(
	[attid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[cart](
	[cartid] [int] IDENTITY(1,1) NOT NULL,
	[itemid] [varchar](20) NOT NULL,
	[num] [int] NOT NULL,
	[attrigid] [varchar](20) NULL,
	[username] [varchar](50) NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[cartid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[firtype](
	[firtypeid] [varchar](20) NOT NULL,
	[firtypename] [varchar](20) NULL,
 CONSTRAINT [PK_firtype] PRIMARY KEY CLUSTERED 
(
	[firtypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[item](
	[itemid] [varchar](20) NOT NULL,
	[itemname] [varchar](20) NOT NULL,
	[qty] [int] NOT NULL,
	[price] [money] NOT NULL,
	[thitypeid] [varchar](20) NOT NULL,
	[imgurl] [varchar](100) NOT NULL,
 CONSTRAINT [PK_item] PRIMARY KEY CLUSTERED 
(
	[itemid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[item_att](
	[iaid] [int] IDENTITY(1,1) NOT NULL,
	[itemid] [varchar](20) NOT NULL,
	[attid] [varchar](20) NOT NULL,
	[attrigid] [varchar](20) NOT NULL,
 CONSTRAINT [PK_item_att] PRIMARY KEY CLUSTERED 
(
	[iaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[remark](
	[remarkid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[neirong] [varchar](max) NULL,
	[levels] [varchar](20) NOT NULL,
	[itemid] [varchar](20) NULL,
 CONSTRAINT [PK_remark] PRIMARY KEY CLUSTERED 
(
	[remarkid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[salorder](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[salorderid] [varchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[attrigid] [varchar](20) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[itemid] [varchar](20) NOT NULL,
	[total] [money] NOT NULL,
	[num] [int] NOT NULL,
 CONSTRAINT [PK_salorder] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[sectype](
	[sectypeid] [varchar](20) NOT NULL,
	[sectypename] [varchar](20) NULL,
	[firtypeid] [varchar](20) NULL,
 CONSTRAINT [PK_sectype] PRIMARY KEY CLUSTERED 
(
	[sectypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[thi_att](
	[taid] [int] IDENTITY(1,1) NOT NULL,
	[attid] [varchar](20) NOT NULL,
	[thitypeid] [varchar](20) NOT NULL,
 CONSTRAINT [PK_thi_att] PRIMARY KEY CLUSTERED 
(
	[taid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[thitype](
	[thitypeid] [varchar](20) NOT NULL,
	[thitypename] [varchar](20) NOT NULL,
	[sectypeid] [varchar](20) NOT NULL,
 CONSTRAINT [PK_thitype] PRIMARY KEY CLUSTERED 
(
	[thitypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[users](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[usertype] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[address] [varchar](20) NULL,
	[phone] [varchar](20) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

