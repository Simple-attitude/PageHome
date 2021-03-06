USE [master]
GO
/****** Object:  Database [SelfHomePage]    Script Date: 2020/5/8 13:21:20 ******/
CREATE DATABASE [SelfHomePage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SelfHomePage', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SelfHomePage.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SelfHomePage_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SelfHomePage_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SelfHomePage] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SelfHomePage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SelfHomePage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SelfHomePage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SelfHomePage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SelfHomePage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SelfHomePage] SET ARITHABORT OFF 
GO
ALTER DATABASE [SelfHomePage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SelfHomePage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SelfHomePage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SelfHomePage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SelfHomePage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SelfHomePage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SelfHomePage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SelfHomePage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SelfHomePage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SelfHomePage] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SelfHomePage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SelfHomePage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SelfHomePage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SelfHomePage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SelfHomePage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SelfHomePage] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SelfHomePage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SelfHomePage] SET RECOVERY FULL 
GO
ALTER DATABASE [SelfHomePage] SET  MULTI_USER 
GO
ALTER DATABASE [SelfHomePage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SelfHomePage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SelfHomePage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SelfHomePage] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SelfHomePage] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SelfHomePage', N'ON'
GO
ALTER DATABASE [SelfHomePage] SET QUERY_STORE = OFF
GO
USE [SelfHomePage]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2020/5/8 13:21:20 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 2020/5/8 13:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[UpdateTime] [datetime] NULL,
	[UserId] [bigint] NOT NULL,
	[TypeName] [nvarchar](max) NULL,
	[CreateTime] [datetime] NOT NULL,
	[DeleteTime] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Article] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 2020/5/8 13:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Url] [nvarchar](50) NOT NULL,
	[Remark] [nvarchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[DeleteTime] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Image] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 2020/5/8 13:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[DeleteTime] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Permission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2020/5/8 13:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[DeleteTime] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolePermissions]    Script Date: 2020/5/8 13:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermissions](
	[RoleId] [bigint] NOT NULL,
	[PermissionId] [bigint] NOT NULL,
 CONSTRAINT [PK_dbo.RolePermissions] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2020/5/8 13:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [varchar](20) NOT NULL,
	[PhoneNum] [nvarchar](11) NOT NULL,
	[PasswordHash] [varchar](max) NOT NULL,
	[PasswordSalt] [varchar](max) NOT NULL,
	[AdminUser] [nvarchar](20) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[DeleteTime] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersRoles]    Script Date: 2020/5/8 13:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersRoles](
	[UserId] [bigint] NOT NULL,
	[RoleId] [bigint] NOT NULL,
 CONSTRAINT [PK_dbo.UsersRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202003210952338_InitialCreate', N'EntitySerives.PHPDBContext', 0x1F8B0800000000000400ED1CD96EE4B8F17D81FC83A0A764E1B56C6F122446F72C3CEDF18E91F501B76790B7012DD16D6125AA43528E8DC57E591EF249F985903A794AA2FA985E6F635EA62956B158AC2A16EBF0FFFEF3DFC90F2F69E23D434CE20C4DFDE3C323DF8328CCA2182DA67E4E1FBFFB9BFFC3BB3F7C33F910A52FDEE77ADEF77C1E834464EA3F51BA3C0D02123EC11490C3340E7146B2477A18666900A22C38393AFA7B707C1C4086C267B83C6F7297231AA7B0F8C17ECE3214C225CD417295453021D538FB322FB07AD7208564094238F53F3048FA3A87387E86C4F7CE92183022E63079F43D8050460165249E7E22704E718616F3251B00C9FDEB12B2798F2021B022FDB49D3E741747277C17410B58A30A7342B3D411E1F1F7155B02157C1473FD866D8C71259BF8AE0BE64DFD334CE330617B57D73A9D2598CF53587B581CC5610576E0491F0F1A516012C3FF1D78B33CA139865304738A4172E0DDE60F491CFE03BEDE673F43344579928814321AD93769800DDDE26C09317DBD838F15DD9791EF05325CA0023660024CB9A54B44FFFA67DFBB668B8387043602206C7F4E330C7F8408624061740B288518711CB0D8B1B6BAB2D67D4C3957CBE598C831C5F1BD2BF0F213440BFA34F54F98A65CC42F30AA072A0A3EA198A91983A13887060ABB57651A43197D1DEBB2FF6E62E14FCB88B1E99E296FBDF679F3BB079240DC7F303DCC66B0FC7F6BD8770F7F31B46ED391E67398C0711CBB24256CC3B4F759964080FA49B806CFF1A2106FC32130AB790793E22B798A97A5F13C2CBE7CA9D49D4DB9C0597A9725354CF3E5CB3DC00BC8252F337E9E67390E158A26416B8E3A8D5445DE5013554CDF9B26DB5A3D9AF2978D58A60F29889355EC61F5DB71D9DBA70CC1EB3CED58F9F87813FBBD0584FC3BC3D147409E56324B23F75D2D3F07C96AB7C1B8E5CFA234465C0DB77F03BE510BDD5AE0558C746D852D46BAB6E14389E248BA28AABEABE414C3165ACA6F264206DF161C85AB3FCB61F637866DAD9E1B63AFC92E9A7C0B711A132E5866D5E1A2F8459AD4EA8FFA4D53226D82AB4AF779829D2A6DF60165751FA5D2ED8E5C15BB85DCABB75D3D4888E3651961D8B25FF8559CD1B76A5AECF7B1935151D5D86A7546E9F2650A16CEF77301B4D7E09DD2A24FB8EB41B79935EF600AF0CF7B83E160306C8A79464816C685F889777FFB8C9089F98022AFFB4D511E49E32AB06361DA182F99FEB1D5D93B5BDB9F156563805A944D9C5A46FAAD8694292DC45C6B403263B68A998118515DC36314C64B90746E49811A681938C71BFCEA9773B884882B75E7C6872C5CC74DF5C59B351483D5C79949208844B7A468D789ED60ED0E6B7BB4E57BADEF5C3B701AC44574183B313B6C5A7480BB055979E0F62846D75E8DDEB513EBAC1B2CAD02CF18303980B8F6B43FDE9EBF2FD2082FD47049337AAA7B9A54A654A5BCBCA0A916B6688D90AAD1DAE6651415CF34F86ABC07BA728934E892733DC092C3A4A11065AC0751E1BE987054CE90022E9C98C20721C8234C32878154C3D06BC11BAA1BA66BC6A5D7640B385A5255D749DEDF80BDEBEEABBEFB6E9B34CC2A09D45782D3C101AB1D12B04834AFCC06E9096E3B7F8381EA3551234E5EB6497D8CEBD86CED9F3496A84DF307659EBFAE07082C0501932BB05C3247502810A846BC79591D30FB6EEE9E3B4F4B1C41480C29F486DA6625E6C1335D56BEF2946C042F624C2873F3C003E0DED92C4AB56992DDB518937A29C5B4EA27551B991AA0CE8FAA6FABDA04EBFE460579C1B694726FA5789FE8BAAD4316C5192001D8F01A9A65499E22BBDF6487AEB2E922826A68388E26372E62690687E31153DD222A71DC015BE5C649982CAE5D077F9A04B8C4A266D4814BC24B476294303E1C9BF8D811B189E3C3B1090F204994DA611DD72450445973973575510C97AA7E8394B3B4A2E335D3083F402F2D709BD14A5DE25CA5ADCA0A8B28AAA1E138DA14AF88A61D75C024E56C256CD217778C651AD684B1FC321CA3905915D109C37B5DDFB2AEDB1CAEA1BA5E3C45DC55DD0CB6AB9ABE97B5B5C85AF7FB66A8C4092F5777B9EB02DE8CF449F929F9B8850F7B69FECD49731516192FC865F8C45D862D70BB6A3C8B4C8BF442C04E2E529D351151D4637BA1DF94D0CB110FDD6790035A5DDE813CD3E408D88D320FDC18D2C4A6F097CEA141DAC0D1993311C2D223A8B226430651D56272A34D8D54391FAD14A4EB7CDFD5938C8F38937B67E09A219A379261F68492D3311AA2835B93ABFEB3D3828DEA94C62834414725B838A9027DFD2D495AE4AF9CE27B8CF6E738E251BFF92BA1303DE4130EE7FF4A66495C04A3EA095700C58F90D0B278C13F393A3E515A9B76A7CD2820244A0C815243AF917C665B28C078881731E76B6F95856BDF89D8E4839E010E9F00D64A2357EBE1A9D1FE31052F7F5A435F0EFF4D95C28521AD2F729F4ECD512D41788922F832F57F29A04EBDCB7F7E29010FBC1BCC24FAD43BF27E5DB9BFC7CA93713D3C26968CACE518CB5DADB6E321A623EB3A2CDD336F46E94C82A09500ADD29DB2263D565B4F8CB4F2E693357496AC64234CBD222B21D4BA3FD6661A7F6FAAAB3B816F5A73F722E1540AFF6604C35080BE2ECBBE89DBE27727738670D96F59DC3621134231F4BA50CAB5CE7BE15DE10E5DCD685A0311FAD4AEA853BFE8D70B39BFB14AC095DE5832E5CE1488E00E74B83D62C6BA43D6D0D6D0B3EE3FBAAFF93CDE9ED86CA69760B5DE81A68E78BBDD02DBE80EB0D7E7ED783F803114AD94CEF616B21F6BE1EF1B545E13DE5958863967808420D215844788BBD6164BB7152A06770E8C951E4BB9C7DA85A73B2DE476D17D151932650F8473B49CA1FDFCDEA83C399EF1F6A5AA2F13B705D9EACB928DB99136224CAD9BA35130AC4D6AB72F346B6673F7AEB4BE3CE68EDC665F4760B67587B9C9CB16AF2F73F39CDEEBA11E9BB13BAEAB39AECC19B397F543C64EB874CCD7D43967426D2A2136F6D4595BEA4C581D9BED7A7AED4C2B88DF87F4E2D95BF14CD8CD5D7A26B6746E429D6063D56D47D398F18C2D07227CB39D3531776B6DA501D1B1ED4C5116A90D69FD1D864D6B5C7FA3A1A5EE46BB20D4DAEDBEDE425D964CE55E1BD87ADDD43760EBE60A1F8B976E2E22DE153698FA223B7B2CFBCF7D8C986B0AAD9484AD77A3F6A3EEAFE35A49C0D7B74D87FE51BD748BB900C2DF9C66FE0789172D0AFE17A8110CA5CBBF9973891EB3DA075128AAA72871BA2B4841C43C036EB51E4148D9E71032F1E57FC2E4334872C80B111E6074896E72BACC29DB324C1F12E9AFBF705FA66BFDA24956A679725364D6C83AB6C0C88C7990FF06BDCFE3246AE8BE30C40A2D28B893542573F859529ED459BC3698AE33341051C5BEC6B7BB87E93261C8C80D9A8367388636267F3FC105085FEB0A3C3B92FE8390D93E398FC102839454385A78F693C97094BEBCFB3FB140C4987A5D0000, N'6.4.0')
GO
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([Id], [Title], [Content], [UpdateTime], [UserId], [TypeName], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (1, N'张三', N'发动afdas', CAST(N'2020-03-25T10:29:15.117' AS DateTime), 1, N'随笔心得', CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Article] ([Id], [Title], [Content], [UpdateTime], [UserId], [TypeName], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (3, N'李四', N'这是一个没用的技术', CAST(N'2020-03-24T23:38:17.687' AS DateTime), 1, N'后端笔记', CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Article] ([Id], [Title], [Content], [UpdateTime], [UserId], [TypeName], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (5, N'ASP.NET Web程序设计', N'一、Cookie对象
1、Cookie 用于在客户端浏览器中存储少量信息，通常存放非敏感的用户信息，保存的时间可以设置。
1）临时型：如果没有设定 Cookie 的过期时间，则 Cookie 的生命周期仅保持到关闭浏览器为止。
2）持久型：将 Cookie 的过期时间设定为一个未来的时刻，则Cookie 的生命周期会持续到设定的时刻结束，即使在此期间关闭浏览器甚至重启电脑。
注意：出于安全考虑，Cookie的个数及存储的数据量都有严格限制。另外，Cookie的使用也会受限于用户对于自己浏览器的设置，比如：禁用Cookie。
 
二、Session对象
1、Session 对象用于存储在多个页面之间传递的特定会话的信息。
 
2、Session 对象特点：
1）Session 对象包含某一个会话的状态信息，不与其他会话共享。
2）当会话超时（默认20分钟）或会话中止（调用Abandon方法），服务器会即刻清除 Session 对象，释放所有资源。
3）会话通过 SessionID 传递状态信息，客户端仅知道 SessionID，但对其状态信息不可见。', NULL, 1, N'技术', CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Article] ([Id], [Title], [Content], [UpdateTime], [UserId], [TypeName], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (6, N'111', N'111', NULL, 1, N'随笔心得', CAST(N'2020-03-24T23:12:43.827' AS DateTime), NULL, 1)
INSERT [dbo].[Article] ([Id], [Title], [Content], [UpdateTime], [UserId], [TypeName], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (8, N'背影', N'我与父亲不相见已二年余了，我最不能忘记的是他的背影。那年冬天，祖母死了，父亲的差使也交卸了，正是祸不单行的日子，我从北京到徐州，打算跟着父亲奔丧回家。到徐州见着父亲，看见满院狼藉的东西，又想起祖母，不禁簌簌地流下眼泪。父亲说，“事已如此，不必难过，好在天无绝人之路！”
　　回家变卖典质，父亲还了亏空；又借钱办了丧事。这些日子，家中光景很是惨淡，一半为了丧事，一半为了父亲赋闲。丧事完毕，父亲要到南京谋事，我也要回北京念书，我们便同行。
　　到南京时，有朋友约去游逛，勾留了一日；第二日上午便须渡江到浦口，下午上车北去。父亲因为事忙，本已说定不送我，叫旅馆里一个熟识的茶房陪我同去。他再三嘱咐茶房，甚是仔细。但他终于不放心，怕茶房不妥帖；颇踌躇了一会。其实我那年已二十岁，北京已来往过两三次，是没有甚么要紧的了。他踌躇了一会，终于决定还是自己送我去。我两三回劝他不必去；他只说，“不要紧，他们去不好！”
　　我们过了江，进了车站。我买票，他忙着照看行李。行李太多了，得向脚夫行些小费，才可过去。他便又忙着和他们讲价钱。我那时真是聪明过分，总觉他说话不大漂亮，非自己插嘴不可。但他终于讲定了价钱；就送我上车。他给我拣定了靠车门的一张椅子；我将他给我做的紫毛大衣铺好坐位。他嘱我路上小心，夜里警醒些，不要受凉。又嘱托茶房好好照应我。我心里暗笑他的迂；他们只认得钱，托他们直是白托！而且我这样大年纪的人，难道还不能料理自己么？唉，我现在想想，那时真是太聪明了！
　　我说道，“爸爸，你走吧。”他望车外看了看，说，“我买几个橘子去。你就在此地，不要走动。”我看那边月台的栅栏外有几个卖东西的等着顾客。走到那边月台，须穿过铁道，须跳下去又爬上去。父亲是一个胖子，走过去自然要费事些。我本来要去的，他不肯，只好让他去。我看见他戴着黑布小帽，穿着黑布大马褂，深青布棉袍，蹒跚地走到铁道边，慢慢探身下去，尚不大难。可是他穿过铁道，要爬上那边月台，就不容易了。他用两手攀着上面，两脚再向上缩；他肥胖的身子向左微倾，显出努力的样子。这时我看见他的背影，我的泪很快地流下来了。我赶紧拭干了泪，怕他看见，也怕别人看见。我再向外看时，他已抱了朱红的橘子望回走了。过铁道时，他先将橘子散放在地上，自己慢慢爬下，再抱起橘子走。到这边时，我赶紧去搀他。他和我走到车上，将橘子一股脑儿放在我的皮大衣上。于是扑扑衣上的泥土，心里很轻松似的，过一会说，“我走了；到那边来信！”我望着他走出去。他走了几步，回过头看见我，说，“进去吧，里边没人。”等他的背影混入来来往往的人里，再找不着了，我便进来坐下，我的眼泪又来了。
　　近几年来，父亲和我都是东奔西走，家中光景是一日不如一日。他少年出外谋生，独力支持，做了许多大事。那知老境却如此颓唐！他触目伤怀，自然情不能自已。情郁于中，自然要发之于外；家庭琐屑便往往触他之怒。他待我渐渐不同往日。但最近两年的不见，他终于忘却我的不好，只是惦记着我，惦记着我的儿子。我北来后，他写了一信给我，信中说道，“我身体平安，惟膀子疼痛利害，举箸提笔，诸多不便，大约大去之期不远矣。”我读到此处，在晶莹的泪光中，又看见那肥胖的，青布棉袍，黑布马褂的背影。唉！我不知何时再能与他相见！
　
　　1925年10月在北京。', NULL, 1, N'随笔心得', CAST(N'2020-03-24T23:41:58.853' AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Content], [UpdateTime], [UserId], [TypeName], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (9, N'岳阳楼记', N'庆历四年春，滕子京谪守巴陵郡。越明年，政通人和，百废具兴。乃重修岳阳楼，增其旧制，刻唐贤今人诗赋于其上。属予作文以记之。

予观夫巴陵胜状，在洞庭一湖。衔远山，吞长江，浩浩汤汤，横无际涯；朝晖夕阴，气象万千。此则岳阳楼之大观也，前人之述备矣。然则北通巫峡，南极潇湘，迁客骚人，多会于此，览物之情，得无异乎？

若夫淫雨霏霏，连月不开，阴风怒号，浊浪排空；日星隐曜，山岳潜形；商旅不行，樯倾楫摧；薄暮冥冥，虎啸猿啼。登斯楼也，则有去国怀乡，忧谗畏讥，满目萧然，感极而悲者矣。

至若春和景明，波澜不惊，上下天光，一碧万顷；沙鸥翔集，锦鳞游泳；岸芷汀兰，郁郁青青。而或长烟一空，皓月千里，浮光跃金，静影沉璧，渔歌互答，此乐何极！登斯楼也，则有心旷神怡，宠辱偕忘，把酒临风，其喜洋洋者矣。

嗟夫！予尝求古仁人之心，或异二者之为，何哉？不以物喜，不以己悲；居庙堂之高则忧其民；处江湖之远则忧其君。是进亦忧，退亦忧。然则何时而乐耶？其必曰“先天下之忧而忧，后天下之乐而乐”乎。噫！微斯人，吾谁与归？

时六年九月十五日。', NULL, 1, N'随笔心得', CAST(N'2020-03-24T23:44:51.973' AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Content], [UpdateTime], [UserId], [TypeName], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (10, N'岳阳楼记2', N'<p>
    庆历四年春，滕子京谪守巴陵郡。越明年，政通人和，百废具兴。乃重修岳阳楼，增其旧制，刻唐贤今人诗赋于其上。属予作文以记之。
</p>
<p>
    <br/>
</p>
<p>
    予观夫巴陵胜状，在洞庭一湖。衔远山，吞长江，浩浩汤汤，横无际涯；朝晖夕阴，气象万千。此则岳阳楼之大观也，前人之述备矣。然则北通巫峡，南极潇湘，迁客骚人，多会于此，览物之情，得无异乎？
</p>
<p>
    <br/>
</p>
<p>
    若夫淫雨霏霏，连月不开，阴风怒号，浊浪排空；日星隐曜，山岳潜形；商旅不行，樯倾楫摧；薄暮冥冥，虎啸猿啼。登斯楼也，则有去国怀乡，忧谗畏讥，满目萧然，感极而悲者矣。
</p>
<p>
    <br/>
</p>
<p>
    至若春和景明，波澜不惊，上下天光，一碧万顷；沙鸥翔集，锦鳞游泳；岸芷汀兰，郁郁青青。而或长烟一空，皓月千里，浮光跃金，静影沉璧，渔歌互答，此乐何极！登斯楼也，则有心旷神怡，宠辱偕忘，把酒临风，其喜洋洋者矣。
</p>
<p>
    <br/>
</p>
<p>
    嗟夫！予尝求古仁人之心，或异二者之为，何哉？不以物喜，不以己悲；居庙堂之高则忧其民；处江湖之远则忧其君。是进亦忧，退亦忧。然则何时而乐耶？其必曰“先天下之忧而忧，后天下之乐而乐”乎。噫！微斯人，吾谁与归？
</p>
<p>
    <br/>
</p>
<p>
    时六年九月十五日。
</p>', NULL, 1, N'随笔心得', CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Content], [UpdateTime], [UserId], [TypeName], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (11, N'岳阳楼记3', N'<p><span>庆历四年春，滕子京谪守巴陵郡。越明年，政通人和，百废具兴。乃重修岳阳楼，增其旧制，刻唐贤今人诗赋于其上。属予作文以记之。</span></p><p><span><br></span></p><p><span>予观夫巴陵胜状，在洞庭一湖。衔远山，吞长江，浩浩汤汤，横无际涯；朝晖夕阴，气象万千。此则岳阳楼之大观也，前人之述备矣。然则北通巫峡，南极潇湘，迁客骚人，多会于此，览物之情，得无异乎？</span></p><p><span><br></span></p><p><span>若夫淫雨霏霏，连月不开，阴风怒号，浊浪排空；日星隐曜，山岳潜形；商旅不行，樯倾楫摧；薄暮冥冥，虎啸猿啼。登斯楼也，则有去国怀乡，忧谗畏讥，满目萧然，感极而悲者矣。</span></p><p><span><br></span></p><p><span>至若春和景明，波澜不惊，上下天光，一碧万顷；沙鸥翔集，锦鳞游泳；岸芷汀兰，郁郁青青。而或长烟一空，皓月千里，浮光跃金，静影沉璧，渔歌互答，此乐何极！登斯楼也，则有心旷神怡，宠辱偕忘，把酒临风，其喜洋洋者矣。</span></p><p><span><br></span></p><p><span>嗟夫！予尝求古仁人之心，或异二者之为，何哉？不以物喜，不以己悲；居庙堂之高则忧其民；处江湖之远则忧其君。是进亦忧，退亦忧。然则何时而乐耶？其必曰“先天下之忧而忧，后天下之乐而乐”乎。噫！微斯人，吾谁与归？</span></p><p><span><br></span></p><p><span>时六年九月十五日。</span></p>', NULL, 1, N'随笔心得', CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Content], [UpdateTime], [UserId], [TypeName], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (12, N'岳阳楼记4', N'<p><span>庆历四年春，滕子京谪守巴陵郡。越明年，政通人和，百废具兴。乃重修岳阳楼，增其旧制，刻唐贤今人诗赋于其上。属予作文以记之。</span></p><p><span><br></span></p><p><span>予观夫巴陵胜状，在洞庭一湖。衔远山，吞长江，浩浩汤汤，横无际涯；朝晖夕阴，气象万千。此则岳阳楼之大观也，前人之述备矣。然则北通巫峡，南极潇湘，迁客骚人，多会于此，览物之情，得无异乎？</span></p><p><span><br></span></p><p><span>若夫淫雨霏霏，连月不开，阴风怒号，浊浪排空；日星隐曜，山岳潜形；商旅不行，樯倾楫摧；薄暮冥冥，虎啸猿啼。登斯楼也，则有去国怀乡，忧谗畏讥，满目萧然，感极而悲者矣。</span></p><p><span><br></span></p><p><span>至若春和景明，波澜不惊，上下天光，一碧万顷；沙鸥翔集，锦鳞游泳；岸芷汀兰，郁郁青青。而或长烟一空，皓月千里，浮光跃金，静影沉璧，渔歌互答，此乐何极！登斯楼也，则有心旷神怡，宠辱偕忘，把酒临风，其喜洋洋者矣。</span></p><p><span><br></span></p><p><span>嗟夫！予尝求古仁人之心，或异二者之为，何哉？不以物喜，不以己悲；居庙堂之高则忧其民；处江湖之远则忧其君。是进亦忧，退亦忧。然则何时而乐耶？其必曰“先天下之忧而忧，后天下之乐而乐”乎。噫！微斯人，吾谁与归？</span></p><p><span><br></span></p><p><span>时六年九月十五日。</span></p>', NULL, 1, N'随笔心得', CAST(N'2020-03-25T00:59:16.667' AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Content], [UpdateTime], [UserId], [TypeName], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (13, N'桃花源记', N'呆呆地送死', NULL, 1, N'随笔心得', CAST(N'2020-03-25T10:28:29.510' AS DateTime), NULL, 0)
INSERT [dbo].[Article] ([Id], [Title], [Content], [UpdateTime], [UserId], [TypeName], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (14, N'asp.net', N'<p style="text-align: center; "><span><b>ASP.NET Web程序设计</b></span></p><p><span><b>第5章 页面状态管理</b></span></p><div yne-bulb-block="paragraph">&nbsp;</div><div yne-bulb-block="paragraph"><span>一、Cookie对象（重点）</span></div><div yne-bulb-block="paragraph"><span>二、Session对象（重点）</span></div><div yne-bulb-block="paragraph"><span>三、Application对象（重点）</span></div><div yne-bulb-block="paragraph"><span>四、Session购物车综合案例</span></div><div yne-bulb-block="paragraph">&nbsp;</div><div yne-bulb-block="paragraph"><span>一、Cookie对象</span></div><div yne-bulb-block="paragraph"><span>1、Cookie 用于在客户端浏览器中存储少量信息，通常存放非敏感的用户信息，保存的时间可以设置。</span></div><div yne-bulb-block="paragraph"><span>1）临时型：如果没有设定 Cookie 的过期时间，则 Cookie 的生命周期仅保持到关闭浏览器为止。</span></div><div yne-bulb-block="paragraph"><span>2）持久型：将 Cookie 的过期时间设定为一个未来的时刻，则Cookie 的生命周期会持续到设定的时刻结束，即使在此期间关闭浏览器甚至重启电脑。</span></div><div yne-bulb-block="paragraph"><span>注意：出于安全考虑，Cookie的个数及存储的数据量都有严格限制。另外，Cookie的使用也会受限于用户对于自己浏览器的设置，比如：禁用Cookie。</span></div><div yne-bulb-block="paragraph">&nbsp;</div><div yne-bulb-block="paragraph"><span>二、Session对象</span></div><div yne-bulb-block="paragraph"><span>1、Session 对象用于存储在多个页面之间传递的特定会话的信息。</span></div><div yne-bulb-block="paragraph">&nbsp;</div><div yne-bulb-block="paragraph"><span>2、Session 对象特点：</span></div><div yne-bulb-block="paragraph"><span>1）Session 对象包含某一个会话的状态信息，不与其他会话共享。</span></div><div yne-bulb-block="paragraph"><span>2）当会话超时（默认20分钟）或会话中止（调用Abandon方法），服务器会即刻清除 Session 对象，释放所有资源。</span></div><div yne-bulb-block="paragraph"><span>3）会话通过 SessionID 传递状态信息，客户端仅知道 SessionID，但对其状态信息不可见。</span></div><div yne-bulb-block="paragraph">&nbsp;</div><div yne-bulb-block="paragraph"><span>3、Session对象的方法：</span></div><div yne-bulb-block="paragraph"><span>1）Abandon：中止当前会话。</span></div><div yne-bulb-...', CAST(N'2020-03-27T11:00:39.230' AS DateTime), 1, N'前端笔记', CAST(N'2020-03-27T11:00:27.407' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Article] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Name], [Email], [PhoneNum], [PasswordHash], [PasswordSalt], [AdminUser], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (1, N'江浩一', N'1597100808@qq.com', N'13991414185', N'FC62D07D6314AE95C7679FA370854D7C', N'kety', N'管理员', CAST(N'2020-03-21T17:52:34.610' AS DateTime), NULL, 0)
INSERT [dbo].[User] ([Id], [Name], [Email], [PhoneNum], [PasswordHash], [PasswordSalt], [AdminUser], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (2, N'1111', N'123@qq.com', N'13991414135', N'0DA97C70155746975F905820E6C737AD', N'mxxa', N'管理员', CAST(N'2020-03-21T17:54:36.317' AS DateTime), NULL, 0)
INSERT [dbo].[User] ([Id], [Name], [Email], [PhoneNum], [PasswordHash], [PasswordSalt], [AdminUser], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (3, N'111', N'1@qq.com', N'13991414812', N'B1806FA1364CB0A233CE3EB550917A29', N'mtmd', N'用户', CAST(N'2020-03-21T18:06:56.240' AS DateTime), NULL, 0)
INSERT [dbo].[User] ([Id], [Name], [Email], [PhoneNum], [PasswordHash], [PasswordSalt], [AdminUser], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (4, N'张三', N'1@qq.com', N'13991414166', N'E95861E1B7AA8A3B4DE988AA7D1214FF', N'xxrd', N'用户', CAST(N'2020-03-21T18:34:36.457' AS DateTime), NULL, 0)
INSERT [dbo].[User] ([Id], [Name], [Email], [PhoneNum], [PasswordHash], [PasswordSalt], [AdminUser], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (5, N'111', N'111', N'111', N'111', N'111', N'111', CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[User] ([Id], [Name], [Email], [PhoneNum], [PasswordHash], [PasswordSalt], [AdminUser], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (7, N'222', N'222', N'222', N'222', N'222', N'222', CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[User] ([Id], [Name], [Email], [PhoneNum], [PasswordHash], [PasswordSalt], [AdminUser], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (8, N'333', N'333', N'333', N'333', N'333', N'333', CAST(N'2020-01-05T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([Id], [Name], [Email], [PhoneNum], [PasswordHash], [PasswordSalt], [AdminUser], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (9, N'3444', N'4444', N'4444', N'444', N'444', N'444', CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([Id], [Name], [Email], [PhoneNum], [PasswordHash], [PasswordSalt], [AdminUser], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (10, N'纷纷', N'111', N'111', N'111', N'111', N'111', CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([Id], [Name], [Email], [PhoneNum], [PasswordHash], [PasswordSalt], [AdminUser], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (11, N'5555', N'111', N'111', N'111', N'111', N'111', CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([Id], [Name], [Email], [PhoneNum], [PasswordHash], [PasswordSalt], [AdminUser], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (12, N'1111', N'111', N'111', N'111', N'111', N'111', CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([Id], [Name], [Email], [PhoneNum], [PasswordHash], [PasswordSalt], [AdminUser], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (13, N'1111', N'11111', N'11111', N'11111', N'111111', N'111111', CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([Id], [Name], [Email], [PhoneNum], [PasswordHash], [PasswordSalt], [AdminUser], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (14, N'曹芬', N'123@qq.com', N'15191053851', N'6A93DA2DFB3A93879834538A665BF82C', N'asfn', N'用户', CAST(N'2020-03-24T16:19:49.787' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([Id], [Name], [Email], [PhoneNum], [PasswordHash], [PasswordSalt], [AdminUser], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (15, N'jl', N'jiwanyue521@qq.com', N'13991414186', N'C49B3288FF9A6D8A694857D5416B40E3', N'aafs', N'管理员', CAST(N'2020-03-24T19:28:30.330' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([Id], [Name], [Email], [PhoneNum], [PasswordHash], [PasswordSalt], [AdminUser], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (16, N'111', N'jiwan@qq.com', N'13991414187', N'6D3D41724426DC4898E720299FB718F8', N'dwyy', N'', CAST(N'2020-03-24T20:00:12.323' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([Id], [Name], [Email], [PhoneNum], [PasswordHash], [PasswordSalt], [AdminUser], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (17, N'111', N'1597100808@qq.com', N'17572696393', N'0F51308C29729BCA153DB29B1B7DBA51', N'mrmr', N'管理员', CAST(N'2020-03-24T23:09:53.487' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([Id], [Name], [Email], [PhoneNum], [PasswordHash], [PasswordSalt], [AdminUser], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (18, N'一一一', N'123@qq.com', N'17572696394', N'1327EF0DCBFFA824607A27C80C85C6AC', N'aaan', N'', CAST(N'2020-03-24T23:14:48.230' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([Id], [Name], [Email], [PhoneNum], [PasswordHash], [PasswordSalt], [AdminUser], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (19, N'简约态度', N'123@qq.com', N'11111111111', N'31D96C3EC318480922F9E52F04A6B7C3', N'hcwf', N'用户', CAST(N'2020-03-25T10:21:54.877' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([Id], [Name], [Email], [PhoneNum], [PasswordHash], [PasswordSalt], [AdminUser], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (20, N'江浩一', N'1597100808@qq.com', N'13991414110', N'A161E0D41765ED9708C1E0707D272912', N'cydr', N'用户', CAST(N'2020-03-25T10:23:46.403' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([Id], [Name], [Email], [PhoneNum], [PasswordHash], [PasswordSalt], [AdminUser], [CreateTime], [DeleteTime], [IsDeleted]) VALUES (21, N'hahah', N'jiwanyue521@qq.com', N'13881444413', N'1E8E8146B7475E59F905C7DF95D2DCA4', N'xthx', N'', CAST(N'2020-05-05T15:40:13.727' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
/****** Object:  Index [IX_UserId]    Script Date: 2020/5/8 13:21:20 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Article]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PermissionId]    Script Date: 2020/5/8 13:21:20 ******/
CREATE NONCLUSTERED INDEX [IX_PermissionId] ON [dbo].[RolePermissions]
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 2020/5/8 13:21:20 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[RolePermissions]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 2020/5/8 13:21:20 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[UsersRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 2020/5/8 13:21:20 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[UsersRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Article_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_dbo.Article_dbo.User_UserId]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RolePermissions_dbo.Permission_PermissionId] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permission] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_dbo.RolePermissions_dbo.Permission_PermissionId]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RolePermissions_dbo.Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_dbo.RolePermissions_dbo.Role_RoleId]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UsersRoles_dbo.Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_dbo.UsersRoles_dbo.Role_RoleId]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UsersRoles_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_dbo.UsersRoles_dbo.User_UserId]
GO
USE [master]
GO
ALTER DATABASE [SelfHomePage] SET  READ_WRITE 
GO
