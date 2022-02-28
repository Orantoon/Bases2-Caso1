USE [master]
GO

DROP DATABASE IF EXISTS [bases2_caso1];

/****** Object:  Database [bases2_caso1]    Script Date: 2/26/2022 6:11:41 PM ******/
CREATE DATABASE [bases2_caso1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bases2_caso1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\bases2_caso1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bases2_caso1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\bases2_caso1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [bases2_caso1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bases2_caso1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bases2_caso1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bases2_caso1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bases2_caso1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bases2_caso1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bases2_caso1] SET ARITHABORT OFF 
GO
ALTER DATABASE [bases2_caso1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bases2_caso1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bases2_caso1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bases2_caso1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bases2_caso1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bases2_caso1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bases2_caso1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bases2_caso1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bases2_caso1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bases2_caso1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bases2_caso1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bases2_caso1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bases2_caso1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bases2_caso1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bases2_caso1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bases2_caso1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bases2_caso1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bases2_caso1] SET RECOVERY FULL 
GO
ALTER DATABASE [bases2_caso1] SET  MULTI_USER 
GO
ALTER DATABASE [bases2_caso1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bases2_caso1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bases2_caso1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bases2_caso1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bases2_caso1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bases2_caso1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'bases2_caso1', N'ON'
GO
ALTER DATABASE [bases2_caso1] SET QUERY_STORE = OFF
GO
USE [bases2_caso1]
GO
/****** Object:  Table [dbo].[Accion]    Script Date: 2/26/2022 6:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accion](
	[accionId] [int] IDENTITY(1,1) NOT NULL,
	[planId] [int] NOT NULL,
	[descripcion] [nvarchar](500) NOT NULL,
	[kpiType] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Accion] PRIMARY KEY CLUSTERED 
(
	[accionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Canton]    Script Date: 2/26/2022 6:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canton](
	[cantonId] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[provinciaId] [smallint] NOT NULL,
 CONSTRAINT [PK_Canton] PRIMARY KEY CLUSTERED 
(
	[cantonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entregable]    Script Date: 2/26/2022 6:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entregable](
	[entregableId] [smallint] IDENTITY(1,1) NOT NULL,
	[planId] [int] NOT NULL,
	[cantonId] [smallint] NOT NULL,
	[kpiValue] [smallint] NOT NULL,
	[kpiType] [nvarchar](50) NOT NULL,
	[postTime] [date] NOT NULL,
	[checksum] [bigint] NOT NULL,
	[accionId] [int] NOT NULL,
 CONSTRAINT [PK_entregable] PRIMARY KEY CLUSTERED 
(
	[entregableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partido]    Script Date: 2/26/2022 6:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partido](
	[partidoId] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[bandera] [varbinary](max) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Partido] PRIMARY KEY CLUSTERED 
(
	[partidoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plan]    Script Date: 2/26/2022 6:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plan](
	[planId] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](300) NOT NULL,
	[partidoId] [smallint] NOT NULL,
 CONSTRAINT [PK_Plan] PRIMARY KEY CLUSTERED 
(
	[planId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 2/26/2022 6:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[provinciaId] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[provinciaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 2/26/2022 6:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[tipoUsuarioId] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](30) NOT NULL,
	[descripcion] [nvarchar](100) NULL,
 CONSTRAINT [PK_tipoUsuario] PRIMARY KEY CLUSTERED 
(
	[tipoUsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 2/26/2022 6:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[usuarioId] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellidos] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[foto] [varbinary](max) NULL,
	[tipoUsuarioId] [smallint] NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[partidoId] [smallint] NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[usuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accion]  WITH CHECK ADD  CONSTRAINT [FK_Accion_Plan] FOREIGN KEY([planId])
REFERENCES [dbo].[Plan] ([planId])
GO
ALTER TABLE [dbo].[Accion] CHECK CONSTRAINT [FK_Accion_Plan]
GO
ALTER TABLE [dbo].[Canton]  WITH CHECK ADD  CONSTRAINT [FK_Canton_Provincia] FOREIGN KEY([provinciaId])
REFERENCES [dbo].[Provincia] ([provinciaId])
GO
ALTER TABLE [dbo].[Canton] CHECK CONSTRAINT [FK_Canton_Provincia]
GO
ALTER TABLE [dbo].[Entregable]  WITH CHECK ADD  CONSTRAINT [FK_Entregable_Accion] FOREIGN KEY([accionId])
REFERENCES [dbo].[Accion] ([accionId])
GO
ALTER TABLE [dbo].[Entregable] CHECK CONSTRAINT [FK_Entregable_Accion]
GO
ALTER TABLE [dbo].[Entregable]  WITH CHECK ADD  CONSTRAINT [FK_Entregable_Canton] FOREIGN KEY([cantonId])
REFERENCES [dbo].[Canton] ([cantonId])
GO
ALTER TABLE [dbo].[Entregable] CHECK CONSTRAINT [FK_Entregable_Canton]
GO
ALTER TABLE [dbo].[Entregable]  WITH CHECK ADD  CONSTRAINT [FK_Entregable_Plan] FOREIGN KEY([planId])
REFERENCES [dbo].[Plan] ([planId])
GO
ALTER TABLE [dbo].[Entregable] CHECK CONSTRAINT [FK_Entregable_Plan]
GO
ALTER TABLE [dbo].[Plan]  WITH CHECK ADD  CONSTRAINT [FK_Plan_Partido] FOREIGN KEY([partidoId])
REFERENCES [dbo].[Partido] ([partidoId])
GO
ALTER TABLE [dbo].[Plan] CHECK CONSTRAINT [FK_Plan_Partido]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Partido] FOREIGN KEY([partidoId])
REFERENCES [dbo].[Partido] ([partidoId])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Partido]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_tipoUsuario_tipoUsuarioId] FOREIGN KEY([tipoUsuarioId])
REFERENCES [dbo].[TipoUsuario] ([tipoUsuarioId])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_usuario_tipoUsuario_tipoUsuarioId]
GO
USE [master]
GO
ALTER DATABASE [bases2_caso1] SET  READ_WRITE 
GO


-- LLENADO

use bases2_caso1;

INSERT INTO Partido (nombre, bandera, fechaCreacion)
VALUES 
('PLN', 100000, GETDATE()),
('PAC', 100001, GETDATE()),
('PUSC', 100002, GETDATE()),
('FA', 100003, GETDATE());

INSERT INTO [Plan] (titulo, descripcion, partidoId)
VALUES 
('Plan PLN', 'Plan de gobierno del Partido Liberacion Nacional.', 1),
('Plan PAC', 'Plan de gobierno del Partido Accion Ciudadana.', 2),
('Plan PUSC', 'Plan de gobierno del Partido Unidad Social Cristiana.', 3),
('Plan FA', 'Plan de gobierno del Frente Amplio.', 4);

INSERT INTO Accion (planid, descripcion, kpiType)
VALUES 
(1, 'Traer empresas internacionales.', 'empresas'),
(1, 'Eliminar restricciones vehiculares.', 'restricciones'),
(1, 'Aumentar impuestos.', 'impuestos'),
(2, 'Traer empresas internacionales.', 'empresas'),
(2, 'Eliminar restricciones vehiculares.', 'restricciones'),
(2, 'Aumentar impuestos.', 'impuestos'),
(3, 'Traer empresas internacionales.', 'empresas'),
(3, 'Eliminar restricciones vehiculares.', 'restricciones'),
(3, 'Aumentar impuestos.', 'impuestos'),
(4, 'Traer empresas internacionales.', 'empresas'),
(4, 'Eliminar restricciones vehiculares.', 'restricciones'),
(4, 'Aumentar impuestos.', 'impuestos');

INSERT INTO Provincia (nombre)
VALUES 
('San Jose'),
('Cartago'),
('Alajuela'),
('Heredia'),
('Limon'),
('Puntarenas'),
('Guanacaste');

INSERT INTO Canton (nombre, provinciaId)
VALUES 
('Tibas', 1),
('Paraiso', 2),
('Atenas', 3),
('Barva', 4),
('Guacimo', 5),
('Garabito', 6),
('Liberia', 7),
('Alajuelita', 1),
('Turrialba', 2),
('Grecia', 3);

DECLARE @cantidad INT;
DECLARE @canton INT;
DECLARE @accion INT;
DECLARE @kpiType NVARCHAR(20);
DECLARE @plan INT;

SET @accion = 12

WHILE @accion > 0
BEGIN

	SET @cantidad = RAND()*(8-3)+3; -- Numero random entre 3 y 7

	WHILE @cantidad > 0
	BEGIN

		SET @kpiType = (SELECT kpiType FROM Accion WHERE accionId = @accion);
		SET @plan = (SELECT planId FROM Accion WHERE accionId = @accion);
		SET @canton = RAND()*(11-1)+1; -- Numero random entre 1 y 10
		
		INSERT INTO Entregable (planid, cantonId, kpiValue, kpiType, postTime, checksum, accionId)
		VALUES (@plan, @canton, RAND()*(50-1)+1, @kpiType, GETDATE(), CHECKSUM(@canton,@accion),@accion);

		SET @cantidad = @cantidad - 1;
	END;
 
	SET @accion = @accion - 1;
END;