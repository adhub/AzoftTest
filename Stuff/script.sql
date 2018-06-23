USE [master]
GO
/****** Object:  Database [AzoftCurrencies]    Script Date: 30.09.2015 2:35:56 ******/
CREATE DATABASE [AzoftCurrencies]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'aspnet-AzoftCurrencies-20150926053454.mdf', FILENAME = N'D:\Work\AzoftTest\AzoftCurrencies\App_Data\AzoftCurrencies.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'aspnet-AzoftCurrencies-20150926053454_log.ldf', FILENAME = N'D:\Work\AzoftTest\AzoftCurrencies\App_Data\AzoftCurrencies_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AzoftCurrencies] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AzoftCurrencies].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AzoftCurrencies] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AzoftCurrencies] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AzoftCurrencies] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AzoftCurrencies] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AzoftCurrencies] SET ARITHABORT OFF 
GO
ALTER DATABASE [AzoftCurrencies] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AzoftCurrencies] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AzoftCurrencies] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AzoftCurrencies] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AzoftCurrencies] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AzoftCurrencies] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AzoftCurrencies] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AzoftCurrencies] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AzoftCurrencies] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AzoftCurrencies] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AzoftCurrencies] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AzoftCurrencies] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AzoftCurrencies] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AzoftCurrencies] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AzoftCurrencies] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AzoftCurrencies] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [AzoftCurrencies] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AzoftCurrencies] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AzoftCurrencies] SET  MULTI_USER 
GO
ALTER DATABASE [AzoftCurrencies] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AzoftCurrencies] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AzoftCurrencies] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AzoftCurrencies] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AzoftCurrencies] SET DELAYED_DURABILITY = DISABLED 
GO
USE [AzoftCurrencies]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 30.09.2015 2:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 30.09.2015 2:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 30.09.2015 2:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 30.09.2015 2:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 30.09.2015 2:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 30.09.2015 2:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 30.09.2015 2:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currencies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodeIso4217] [nchar](3) NOT NULL,
	[CodeCbr] [nchar](10) NOT NULL,
	[NameEn] [nvarchar](max) NOT NULL,
	[NameRu] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CurrenciesUsers]    Script Date: 30.09.2015 2:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrenciesUsers](
	[UserId] [nvarchar](128) NOT NULL,
	[CurrencyId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExchangeRatesRub]    Script Date: 30.09.2015 2:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExchangeRatesRub](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Value] [money] NULL,
 CONSTRAINT [PK__Exchange__3214EC075D1C4999] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201509261144008_InitialCreate', N'AzoftCurrencies.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FDB36147E1FB0FF20E8691B522B97B5E802BB43EA245BB0E6823A2DF656D012ED08952855A2D264C37ED91EF693F617762851375E74B115DB19060CB5487EE7F0F023797878987FFFFE67FCF383EF19F7388ADD804CCC83D1BE696062078E4B961333A18B17AFCD9FDF7CFBCDF8CCF11F8C8F79BD23560F5A927862DE511A1E5B566CDF611FC523DFB5A3200E16746407BE859CC03ADCDFFFC93A38B0304098806518E3F709A1AE8FD31FF0731A101B873441DE65E0602FE6DFA16496A21A57C8C771886C3C314FFE00EC691245A0A68BE351D6C2344E3C17813633EC2D4C031112504441D7E30F319ED12820CB59081F9077FB1862A8B7405E8C791F8ECBEA5DBBB37FC8BA63950D73283B8969E0F7043C38E2F6B1C4E62B59D92CEC07163C034BD347D6EBD48A13F3C2C1E9A7F781070610051E4FBD88559E989785889338BCC27494371C6590E711C07D0DA2CFA32AE29ED1B9DD5EC1A7C3D13EFB6FCF98261E4D223C2138A111F2F68C9B64EEB9F66FF8F136F88CC9E4E860BE387AFDF215728E5EFD888F5E567B0A7D857AB50FF0E9260A421C816E7851F4DF34AC7A3B4B6C5834ABB4C9AC025C82A9611A97E8E11D264B7A0793E6F0B5699CBB0FD8C9BF70727D202ECC246844A3047E5E259E87E61E2ECAAD4699ECFF0D520F5FBE1A44EA15BA7797E9D00BF261E24430AFDE632F2D8DEFDC309B5EB5F1FEC4AB9D4781CF7ED7F995957E9A054964B3CE04DA2AB7285A625AD76E6C95E4ED446906353CAD73D4DDA736D354A6B7B22AEBD02A332117B1E9D990EBFBB4723B33EE240C61F0526A318B34114EBD618D04843D43A85752E8A02B850874EDFFBC229EF9C8F50658123B48018F64E1463E2E7AF936000222D25BE71B14C7B02238BFA2F8AE4175F8E700AACFB09D4440D419457EF8E4D26EEE0282AF127FCEF8BF3959830DCDEDD7E01CD93488CE086BB536DEBBC0FE1C24F48C38A788E20FD4CE01D9CF5BD7EF0E30883A27B68DE3F81CC88C9D69000E770E7841E8D1616F38B6486DDB25997AC8F5D53E89B09C7ECAAB967E89BA86E49B68AAA9FC932655DF054B97745335AFAA5735ABD1AA2AAFD6575506D64D535E53AF685AA155CFACD6601E5F3A42C3BB7C29ECEEFB7CEB6DDEBAB5A062C619AC90F8174C7004CB98738328C5112947A0CBBAB10D67211D3E26F4C9F7A654D247E425438B5A6936A48BC0F0B32185DDFDD990AA099FEF5D8779251D0E42796580EF545F7DC66A9F7382669B9E0EB56E6E5AF866D600DD743989E3C076D359A00881F100465D7FF0E18CF66846D61B3122021D03A2BB6CCB832FD0375324D53539C51EA6D838B1B310E114C53672643342879C1E8AE53BAA42B132325257EE074926301D47AC116287A01866AA4BA83C2D5C38A486C86BB592D0B2E316C6FA5EC8104B4E71880913D86A892EC2D58110A64021471894360B8DAD0AE39A89A8F15A7563DEE6C296E32EC52736C2C916DF59C34BEEBF3D09319B2DB60172369BA48B02DAA0DE3608CACF2A5D09201E5C768DA0C289494350EE526D84A0758B6D81A075933C3B826647D4AEE32F9C57778D9EF583F2E6B7F546736D819B357BEC183533DF13DA50688123999EA77356881FA8E270067AF2F359CC5D5D91220C7C86693D6453FABB4A3FD46A061149D4045812AD05945F074A40D284EAA15C1ECB6BD48E7B113D60F3B85B232C5FFB05D80A0764ECEAB568A5A2FEF2542467A7D347D1B3820D12C93B1D162A380A42888B57BDE31D8CA28BCBCA86E9E20BF7F1862B1DE383D160A016CF5563A4BC33835B29A766BB95540E591F976C2D2B09EE93C64A796706B712E768BB91144E410FB7602D13D5B7F081265B1EE928769BA26C6C651953FCC3D8D2A4568D2F5118BA645949B5E25F8C599667357D31EB9F7CE46718961D2B72900A6D0B493488D0120BA5201A343D77A3989E228AE688C579A68E2F5553EEAD9AE53F1759DD3EE541CCF781BC36FB37A79EFA12BFB6DFCA0E09C739875EFACCAB4943E90A0EA89B1B2CFD0D79285244EFA78197F844EF64E95B677778D5F6D91719616C09FA4B4E946431C9D5AD9BBFD3E0C81363C0812AFC98D5074B0FA13379EE85568DAEF34CF52879A0AA8AA20B5E6D6DF0740E4DEF0113FDC5FEE3D58AF034F38B27A95401F8A79E18953C0709AC52D61DB59E8A52C5AC97744714F24DAA9042510F2DAB59253525AB052BE1692CAAAED15D829C475245974BBB232B324AAAD08AE215B0153A8B65DD511549275560457177EC3203455C48777807D39E62D6DAC2B2C3EE7A7B9806E36956C561B6C0CA9D7E15A8F2B92716BFB597C0F8F79D6494F6C4B716A3B238C77A8CD260E857A0DA8D787D016ABCC6D763D6AEB96B8B7CD335BF1EAF1F6F9F941DD2A14FAC52482F0E7FC2216FCC0F5CED8F6CA4135856C5347233C206FF1853EC8F5885D1EC8B37F55CCC96F3BCC22522EE02C7344BED300FF70F0E85373ABBF35EC68A63C7531C58758F66EA63B6812C2D728F22FB0E4572CEC41A6F4A4A50291C7D411CFC3031FF4C5B1DA7910DF6AFF4F39E71117F20EE97040A6EA3041B7FC939A0C3E4D8371FB876F4454477AB5EFCFE296BBA675C4730638E8D7DC196AB8C70FD9D442F6DB2A66B68B3F2EB89E73BA16A4F1294A8C28458FD05C2DCA583BC3EC8B5FCCE470FDFF7554DF9C2602D44C52B82A1F00631A1EE95C02A58DA17020EFCA4E90B817E9D55BF18584535ED6B0197F40713DF0A745F86F2965BDC6A14E7A24D2C49A99D5B73ADD74ABCDCF6DE24A564AF35D1E5B4EB1E706BA456AFC08C6796953CD8EEA8483A1E0C7B9BD47EF24CE35D492E2ED33EB69B53BCC934E2862BA2FF55F6F00EE4BB29F277B69F23BC69AEE962B93B9E68D92F1378C7C8C6B3BAB69FEFBB69B2E9C2BC3B4EB65E59BD3BC6B56DED9F5B665AE72D74EB39BA72BA91E64E46150B6ECBC1CD02E770C29F074082CCA3CC9E4EAA93BE9A12565B049655F442F5D966A26069E24872A51ACD62FBF5956FF88D9DE5759AC56A72349B64F3F5BF5136AFD32C5B93F9B88DEC6165EEA12AA3BB651D6B4A887A4ED9C2B59EB424A7B7F9AC8D17ECCF29397810A3D4668FE68EF8F9E4020F629221A74E8FDC5FF9BA17F6CECA5F5E84FD3B76972504FB3B8C04DBB55DB3A873411641BE790B1AE5558408CD25A6C8812DF524A2EE02D9148A598C397DFB9DC6EDD84DC71C3B17E43AA16142A1CBD89F7BB5801773029AE4A709CE759DC7D761FA674C86E802A8E9B2D8FC35799BB89E53E87DAE880969209877C123BA6C2C298BEC2E1F0BA4AB807404E2E62B9CA25BEC871E80C5D76486EEF12ABA01FDDEE125B21FCB08A00EA47D20EA661F9FBA6819213FE618657BF8091C76FC8737FF015CAF2BB580540000, N'6.1.3-40302')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201509261312058_InitialCreate', N'GeekQuiz.Models.TriviaContext', 0x1F8B0800000000000400ED5ACD6E1B3710BE17E83B2CF6D4168ED6722EAD212570643B301ADB89A504BD19D4EE4826C2E56E49AE2BA5E893F5D047EA2B7456FBCFFD972CDB090A5F2C6AFE38FC86437ED4BF7FFF337ABD7299710F42528F8FCDE1E0D03480DB9E43F9726C066AF1E267F3F5ABEFBF1B9D39EECAF894C8BD0CE55093CBB179A7947F6C59D2BE0397C8814B6DE1496FA106B6E75AC4F1ACA3C3C35FACE1D0023461A22DC318DD045C5117361FF0E3C4E336F82A20ECD27380C9781CBF996EAC1A57C405E9131BC6E65B80CF1F02FA6510899AC609A304C398025B9806E1DC53446190C71F254C95F0F872EAE30061B3B50F28B7204C421CFC7126DE751E8747E13CAC4C3131650752796E4F83C39771622C5D7DABF49A69E23075679862B50E67BD49DFD89C097A4FC909977F80300DDDE1F1848950B894E1415EEFC038F982CE27811008130AF22005056227FC3B30260153818031874009C20E8CF7C19C51FB5758CFBCCFC0C73C602C1F29C68ADF150670E8BDF07C106A7D038B38FE0BC734ACA29EA52BA66A399D6856175CBD3C328D2B744EE60C5220E43230559E80B7C0411005CE7BA214081EDA804D2A4BDE355F083891F943EC610D99C62559BD03BE54776313FF358D73BA0227198963F8C829961C2A2911409B9B6B3F0CB67D62CD563E0420B7B27345EEE972932FCD620493283AD3B801B6119277D48F8AB380A3DBA2F4B9F0DC1B8F69202D08DD4EBD40D818CFCC6B939C11B104558C7C6465F5D0A14A92C0FA5649A4F79455925F586B3F45B535769EB0386754317880DAEC3B4539F11004B64A5CBFF110BC84EF5C67C91A34545A520D9ABC5E6B956235D5562DFB00F59685D7B7E212CDFF3BD3D383BF16B3116EE4BEC09A00B00B5813607701EB89949E4D37015774073DD8622ECEB863F428B36869F47CE02A2164A98F20C5F0C6E64FA5947773932648779365BAE86868EAA8BFE6A7C04081716247C7DB09913671CA20C05C3AC5112C1410215209C393BEC4D2A35C95AB8A62D9FA84759F8E66A263698621A6CEF46F4EC1071E5655F7B5EB12456353B652A75A22DBF236B27200ED82DBAAB357339C1A0F623A9892AB455FCC369DE13A16C673C16BC35476C5C9FEE0DDB0C87B093ABBC13C422D443B3BEA28D40051A887701456AAE2D08177B9F8DC21E3E6A74338B43A0555515FD8E6B276525920A57AA83296F6CC1A634921743296AC51BDB9AC1368067379AD0EB1D4B4731A1D7ABC0E817E8D339D6E296D256CF56B9525C3B914EA3B4831459DD3577915AE4B5EEBDEDD73F72ECD2F056F6BE29AF6EBAEEBD190B4E43496D66C46075A111F98F086560D7138BA24BE8F87DC1C91188F18D388459CBC98F667D8DCC88665CB0AA22D8D36F5846776B204ED5B748D919E5321D52951644EC263F4C4714B62C51DAAA6C6135F559B50791593BA4FB4C2FF23CD26CAAFA207C406CE717E6ED84C36D7931A4095D537B42E614454DC88261E0B5C5EDFDBEAB513F62D6F2119EB6E256B4D793BF50DABDE52BE2BE66DB5744B4BCB6DA9419696B1749A2962A307729252DD1D39D5FB5367E4D4A93F6CAEF783C3F8AE9D37100FF58820638D0A8164C3CF0C39596FDC1D3B750783CEE8A937F0F42BBED7552A354E5D24F59E3650AD518EE2A6D5FE0C57EA629188696072EEA91376B0E95A2A7007A1C060FA3B9B308AF3CD042E09A70B5CA9887A338F0E8747DA63DEF37958B3A474588FD7B547E210CB443CE555B7990BBC51ADC6E69F1BB563E3E2B7DB4CF336696E07C6B5C06539360E8DBF7AF3DCFAA3D443C431DC220E2D8256DEB4A7F9E2131FBF27C2BE23E20797AC7ECCDB2A3FE36DF7FCF4B53CFFF45FED9DC0B6E7452EB0E5B56BBCDDF3CF9CAA1623DB3E9C3CFAB3C5F3CAFD6350F819C3F1343C7A3581B1C3E3C10E4467C3296DAF24FCB74DB7F75CD1BDA22B212BB7A6F9777EF679F694F9374B8F9739AAEEF4772BFB1DDD14C6A633F7105DD18EDE48413612E4ADFC78BDBB3A6AB29942EFC0A0D7BBAC27919F9A66D7A75775A1EECAA9D7D2C05F0F75DE73220DFB671D2FBA1742BC7C7FC7BD21F7635BDCCE245D6626C29FDE72B00BBB422A73C1175EB23D69112522DAF1ED12147170CB38118A2E88ADF06B1BA4DCFCDEE41361018A9CB973702EF875A0FC40E194C19DB3C20F58C24DAEC9FF86F52FC63C8A2BF921A68061529C025CF33701654E1AF779C599B3C644B87BC667E2702D5578365EAE534B571EEF68284E5FBAE9CFC0F5191A93D77C4AEE619BD8F006FB0E96C45E27344CBD91F68528A67D744AC9521057C636327DFC881876DCD5ABFF00194110E8732E0000, N'6.1.3-40302')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3633ebe8-5075-47ac-ba36-b2febf3f4fed', N'asd@example.com', 0, N'ALuFZZChmNkjdcSDf+ZaXEHqlBP8PIVnSgdUSmczrbcsgpBNJ5RWk434COGCYBWeZw==', N'76da19e7-610c-4899-8055-bd207842d9cb', NULL, 0, 0, NULL, 1, 0, N'asd@example.com')
SET IDENTITY_INSERT [dbo].[Currencies] ON 

INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (1, N'MDL', N'R01500    ', N'Moldovan Leu', N'Молдавский лей')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (2, N'USD', N'R01235    ', N'US Dollar', N'Доллар США')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (3, N'ZAR', N'R01810    ', N'Rand', N'Южноафриканский рэнд')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (4, N'TMT', N'R01710    ', N'Turkmenistan New Manat', N'Новый туркменский манат')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (5, N'TJS', N'R01670    ', N'Somoni', N'Таджикский сомони')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (6, N'AUD', N'R01010    ', N'Australian Dollar', N'Австралийский доллар')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (7, N'AZN', N'R01020A   ', N'Azerbaijanian Manat', N'Азербайджанский манат')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (8, N'GBP', N'R01035    ', N'Pound Sterling', N'Фунт стерлингов Соединенного королевства')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (9, N'AOA', N'R01040F   ', N'Kwanza', N'Ангольская новая кванза')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (10, N'AMD', N'R01060    ', N'Armenian Dram', N'Армянский драм')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (11, N'BYR', N'R01090    ', N'Belarussian Ruble', N'Белорусский рубль')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (12, N'BGN', N'R01100    ', N'Bulgarian Lev', N'Болгарский лев')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (13, N'BRL', N'R01115    ', N'Brazilian Real', N'Бразильский реал')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (14, N'HUF', N'R01135    ', N'Forint', N'Венгерский форинт')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (15, N'DKK', N'R01215    ', N'Danish Krone', N'Датская крона')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (16, N'EUR', N'R01239    ', N'Euro', N'Евро')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (17, N'INR', N'R01270    ', N'Indian Rupee', N'Индийская рупия')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (18, N'ISK', N'R01310    ', N'Iceland Krona', N'Исландская крона')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (19, N'KZT', N'R01335    ', N'Tenge', N'Казахстанский тенге')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (20, N'CAD', N'R01350    ', N'Canadian Dollar', N'Канадский доллар')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (21, N'KGS', N'R01370    ', N'Som', N'Киргизский сом')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (22, N'CNY', N'R01375    ', N'Yuan Renminbi', N'Китайский юань')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (23, N'KWD', N'R01390    ', N'Kuwaiti Dinar', N'Кувейтский динар')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (24, N'LVL', N'R01405    ', N'Latvian Lats', N'Латвийский лат')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (25, N'LBP', N'R01420    ', N'Lebanese Pound', N'Ливанский фунт')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (26, N'LTL', N'R01435    ', N'Lithuanian Litas', N'Литовский лит')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (27, N'ANG', N'R01523    ', N'Netherlands Antillean Guilder', N'Нидерландский гульден')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (28, N'NOK', N'R01535    ', N'Norwegian Krone', N'Норвежская крона')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (29, N'PLN', N'R01565    ', N'Zloty', N'Польский злотый')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (30, N'RON', N'R01585    ', N'Romanian Leu', N'Румынский лей')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (31, N'XDR', N'R01589    ', N'SDR (Special Drawing Right)', N'СДР (специальные права заимствования)')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (32, N'SGD', N'R01625    ', N'Singapore Dollar', N'Сингапурский доллар')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (33, N'SRD', N'R01665A   ', N'Surinam Dollar', N'Суринамский доллар')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (34, N'TRY', N'R01700J   ', N'Turkish Lira', N'Турецкая лира')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (35, N'UZS', N'R01717    ', N'Uzbekistan Sum', N'Узбекский сум')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (36, N'UAH', N'R01720    ', N'Hryvnia', N'Украинская гривна')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (37, N'CZK', N'R01760    ', N'Czech Koruna', N'Чешская крона')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (38, N'SEK', N'R01770    ', N'Swedish Krona', N'Шведская крона')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (39, N'CHF', N'R01775    ', N'Swiss Franc', N'Швейцарский франк')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (40, N'EEK', N'R01795    ', N'Estonian Kroon', N'Эстонская крона')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (41, N'YUM', N'R01805    ', N'Yugoslav Novi Dinar', N'Югославский новый динар')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (42, N'KRW', N'R01815    ', N'Won', N'Вон Республики Корея')
INSERT [dbo].[Currencies] ([Id], [CodeIso4217], [CodeCbr], [NameEn], [NameRu]) VALUES (43, N'JPY', N'R01820    ', N'Yen', N'Японская иена')
SET IDENTITY_INSERT [dbo].[Currencies] OFF
INSERT [dbo].[CurrenciesUsers] ([UserId], [CurrencyId]) VALUES (N'3633ebe8-5075-47ac-ba36-b2febf3f4fed', 16)
INSERT [dbo].[CurrenciesUsers] ([UserId], [CurrencyId]) VALUES (N'3633ebe8-5075-47ac-ba36-b2febf3f4fed', 1)
INSERT [dbo].[CurrenciesUsers] ([UserId], [CurrencyId]) VALUES (N'3633ebe8-5075-47ac-ba36-b2febf3f4fed', 11)
SET IDENTITY_INSERT [dbo].[ExchangeRatesRub] ON 

INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (1, 27, CAST(N'2015-09-28' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (2, 27, CAST(N'2015-09-29' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (3, 2, CAST(N'2015-09-28' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (4, 2, CAST(N'2015-09-29' AS Date), 65.5470)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (5, 2, CAST(N'2015-09-30' AS Date), 66.2367)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (6, 2, CAST(N'2015-09-14' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (7, 2, CAST(N'2015-09-15' AS Date), 67.9571)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (8, 2, CAST(N'2015-09-16' AS Date), 67.1574)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (9, 2, CAST(N'2015-09-17' AS Date), 65.9273)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (10, 2, CAST(N'2015-09-18' AS Date), 65.3623)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (11, 2, CAST(N'2015-09-19' AS Date), 65.6445)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (12, 2, CAST(N'2015-09-20' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (13, 2, CAST(N'2015-09-21' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (14, 2, CAST(N'2015-09-22' AS Date), 66.1455)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (15, 2, CAST(N'2015-09-23' AS Date), 66.1747)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (16, 2, CAST(N'2015-09-24' AS Date), 66.0410)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (17, 2, CAST(N'2015-09-25' AS Date), 66.5151)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (18, 2, CAST(N'2015-09-26' AS Date), 65.6727)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (19, 2, CAST(N'2015-09-27' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (20, 2, CAST(N'2015-08-31' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (21, 2, CAST(N'2015-09-01' AS Date), 66.7152)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (22, 2, CAST(N'2015-09-02' AS Date), 65.3495)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (23, 2, CAST(N'2015-09-03' AS Date), 66.6756)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (24, 2, CAST(N'2015-09-04' AS Date), 67.0102)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (25, 2, CAST(N'2015-09-05' AS Date), 67.6850)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (26, 2, CAST(N'2015-09-06' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (27, 2, CAST(N'2015-09-07' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (28, 2, CAST(N'2015-09-08' AS Date), 68.4864)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (29, 2, CAST(N'2015-09-09' AS Date), 68.7932)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (30, 2, CAST(N'2015-09-10' AS Date), 67.6219)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (31, 2, CAST(N'2015-09-11' AS Date), 68.4961)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (32, 2, CAST(N'2015-09-12' AS Date), 68.0093)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (33, 2, CAST(N'2015-09-13' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (34, 7, CAST(N'2015-09-14' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (35, 7, CAST(N'2015-09-15' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (36, 7, CAST(N'2015-09-16' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (37, 7, CAST(N'2015-09-17' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (38, 7, CAST(N'2015-09-18' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (39, 7, CAST(N'2015-09-19' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (40, 7, CAST(N'2015-09-20' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (41, 7, CAST(N'2015-09-21' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (42, 7, CAST(N'2015-09-22' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (43, 7, CAST(N'2015-09-23' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (44, 7, CAST(N'2015-09-24' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (45, 7, CAST(N'2015-09-25' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (46, 7, CAST(N'2015-09-26' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (47, 7, CAST(N'2015-09-27' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (48, 7, CAST(N'2015-09-28' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (49, 7, CAST(N'2015-09-29' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (50, 7, CAST(N'2015-09-30' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (51, 16, CAST(N'2015-09-14' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (52, 16, CAST(N'2015-09-15' AS Date), 77.1313)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (53, 16, CAST(N'2015-09-16' AS Date), 75.9013)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (54, 16, CAST(N'2015-09-17' AS Date), 74.2407)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (55, 16, CAST(N'2015-09-18' AS Date), 73.9378)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (56, 16, CAST(N'2015-09-19' AS Date), 74.9726)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (57, 16, CAST(N'2015-09-20' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (58, 16, CAST(N'2015-09-21' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (59, 16, CAST(N'2015-09-22' AS Date), 74.8304)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (60, 16, CAST(N'2015-09-23' AS Date), 73.9568)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (61, 16, CAST(N'2015-09-24' AS Date), 73.5367)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (62, 16, CAST(N'2015-09-25' AS Date), 74.5435)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (63, 16, CAST(N'2015-09-26' AS Date), 73.1397)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (64, 16, CAST(N'2015-09-27' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (65, 16, CAST(N'2015-09-28' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (66, 16, CAST(N'2015-09-29' AS Date), 73.2684)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (67, 16, CAST(N'2015-09-30' AS Date), 74.5825)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (68, 1, CAST(N'2015-09-30' AS Date), 32.9577)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (69, 1, CAST(N'2015-09-14' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (70, 1, CAST(N'2015-09-15' AS Date), 34.8052)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (71, 1, CAST(N'2015-09-16' AS Date), 34.3077)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (72, 1, CAST(N'2015-09-17' AS Date), 33.1626)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (73, 1, CAST(N'2015-09-18' AS Date), 33.0948)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (74, 1, CAST(N'2015-09-19' AS Date), 33.2883)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (75, 1, CAST(N'2015-09-20' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (76, 1, CAST(N'2015-09-21' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (77, 1, CAST(N'2015-09-22' AS Date), 33.2389)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (78, 1, CAST(N'2015-09-23' AS Date), 33.0956)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (79, 1, CAST(N'2015-09-24' AS Date), 33.2031)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (80, 1, CAST(N'2015-09-25' AS Date), 32.9283)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (81, 1, CAST(N'2015-09-26' AS Date), 32.5273)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (82, 1, CAST(N'2015-09-27' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (83, 1, CAST(N'2015-09-28' AS Date), NULL)
INSERT [dbo].[ExchangeRatesRub] ([Id], [CurrencyId], [Date], [Value]) VALUES (84, 1, CAST(N'2015-09-29' AS Date), 32.5699)
SET IDENTITY_INSERT [dbo].[ExchangeRatesRub] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 30.09.2015 2:35:57 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 30.09.2015 2:35:57 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 30.09.2015 2:35:57 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 30.09.2015 2:35:57 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 30.09.2015 2:35:57 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 30.09.2015 2:35:57 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CurrenciesUsers]  WITH CHECK ADD  CONSTRAINT [FK_CurrenciesUsers_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CurrenciesUsers] CHECK CONSTRAINT [FK_CurrenciesUsers_AspNetUsers]
GO
ALTER TABLE [dbo].[CurrenciesUsers]  WITH CHECK ADD  CONSTRAINT [FK_CurrenciesUsers_Currencies] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currencies] ([Id])
GO
ALTER TABLE [dbo].[CurrenciesUsers] CHECK CONSTRAINT [FK_CurrenciesUsers_Currencies]
GO
ALTER TABLE [dbo].[ExchangeRatesRub]  WITH CHECK ADD  CONSTRAINT [FK_ExchangeRatesRub_Currencies] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currencies] ([Id])
GO
ALTER TABLE [dbo].[ExchangeRatesRub] CHECK CONSTRAINT [FK_ExchangeRatesRub_Currencies]
GO
USE [master]
GO
ALTER DATABASE [AzoftCurrencies] SET  READ_WRITE 
GO
