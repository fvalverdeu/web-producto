USE [master]
GO
/****** Object:  Database [BDPrueba]    Script Date: 1/03/2023 23:55:46 ******/
CREATE DATABASE [BDPrueba]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDPrueba', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BDPrueba.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDPrueba_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BDPrueba_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BDPrueba] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDPrueba].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDPrueba] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDPrueba] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDPrueba] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDPrueba] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDPrueba] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDPrueba] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDPrueba] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDPrueba] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDPrueba] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDPrueba] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDPrueba] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDPrueba] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDPrueba] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDPrueba] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDPrueba] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDPrueba] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDPrueba] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDPrueba] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDPrueba] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDPrueba] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDPrueba] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDPrueba] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDPrueba] SET RECOVERY FULL 
GO
ALTER DATABASE [BDPrueba] SET  MULTI_USER 
GO
ALTER DATABASE [BDPrueba] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDPrueba] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDPrueba] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDPrueba] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDPrueba] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BDPrueba] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BDPrueba', N'ON'
GO
ALTER DATABASE [BDPrueba] SET QUERY_STORE = OFF
GO
USE [BDPrueba]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 1/03/2023 23:55:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [char](3) NOT NULL,
	[descripcion] [varchar](200) NOT NULL,
	[fechaRegistro] [datetime] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([id], [codigo], [descripcion], [fechaRegistro], [estado]) VALUES (4, N'P01', N'Teclado', CAST(N'2023-02-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Producto] ([id], [codigo], [descripcion], [fechaRegistro], [estado]) VALUES (6, N'P02', N'Mouse', CAST(N'2023-02-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Producto] ([id], [codigo], [descripcion], [fechaRegistro], [estado]) VALUES (7, N'P03', N'CPU', CAST(N'2023-02-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Producto] ([id], [codigo], [descripcion], [fechaRegistro], [estado]) VALUES (8, N'P04', N'Laptop', CAST(N'2023-02-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Producto] ([id], [codigo], [descripcion], [fechaRegistro], [estado]) VALUES (9, N'P05', N'Disco duro', CAST(N'2023-01-30T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
/****** Object:  StoredProcedure [dbo].[USP_PRODUCTO_DELETE]    Script Date: 1/03/2023 23:55:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_PRODUCTO_DELETE](@id INT)
AS BEGIN
	DELETE Producto WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[USP_PRODUCTO_GET]    Script Date: 1/03/2023 23:55:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_PRODUCTO_GET](@id INT)
AS BEGIN
	SELECT id, codigo, descripcion, fechaRegistro, estado FROM Producto P
	WHERE P.id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[USP_PRODUCTO_INSERT]    Script Date: 1/03/2023 23:55:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_PRODUCTO_INSERT](@codigo CHAR(3), @descripcion VARCHAR(200), @fechaRegistro DATETIME, @estado BIT)
AS BEGIN
	INSERT INTO Producto(codigo, descripcion, fechaRegistro, estado) 
	VALUES (@codigo, @descripcion, @fechaRegistro, @estado)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_PRODUCTO_LIST]    Script Date: 1/03/2023 23:55:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_PRODUCTO_LIST]
AS BEGIN
	SELECT id, codigo, descripcion, fechaRegistro, estado FROM Producto
END
GO
/****** Object:  StoredProcedure [dbo].[USP_PRODUCTO_UPDATE]    Script Date: 1/03/2023 23:55:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_PRODUCTO_UPDATE](@id INT, @codigo CHAR(3), @descripcion VARCHAR(200), @fechaRegistro DATETIME, @estado BIT)
AS BEGIN
	UPDATE Producto
	SET codigo = @codigo, descripcion = @descripcion, fechaRegistro = @fechaRegistro, estado = @estado
	WHERE id = @id
END
GO
USE [master]
GO
ALTER DATABASE [BDPrueba] SET  READ_WRITE 
GO
