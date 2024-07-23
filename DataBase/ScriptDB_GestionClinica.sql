USE [master]
GO
/****** Object:  Database [TP_FINAL_PR3]    Script Date: 18/7/2024 00:02:14 ******/
CREATE DATABASE [TP_FINAL_PR3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP_FINAL_PR3_dat', FILENAME = N'C:\DB_GESTION_CLINICA\TP_FINAL_PR3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TP_FINAL_PR3_log', FILENAME = N'C:\DB_GESTION_CLINICA\TP_FINAL_PR3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TP_FINAL_PR3] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP_FINAL_PR3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP_FINAL_PR3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP_FINAL_PR3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP_FINAL_PR3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP_FINAL_PR3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP_FINAL_PR3] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP_FINAL_PR3] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TP_FINAL_PR3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP_FINAL_PR3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP_FINAL_PR3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP_FINAL_PR3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP_FINAL_PR3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP_FINAL_PR3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP_FINAL_PR3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP_FINAL_PR3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP_FINAL_PR3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TP_FINAL_PR3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP_FINAL_PR3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP_FINAL_PR3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP_FINAL_PR3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP_FINAL_PR3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP_FINAL_PR3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP_FINAL_PR3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP_FINAL_PR3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TP_FINAL_PR3] SET  MULTI_USER 
GO
ALTER DATABASE [TP_FINAL_PR3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP_FINAL_PR3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP_FINAL_PR3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP_FINAL_PR3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP_FINAL_PR3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TP_FINAL_PR3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TP_FINAL_PR3] SET QUERY_STORE = ON
GO
ALTER DATABASE [TP_FINAL_PR3] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TP_FINAL_PR3]
GO
/****** Object:  Table [dbo].[DiasAtencion]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiasAtencion](
	[IdDia_di] [char](1) NOT NULL,
	[NombreDia_di] [varchar](20) NOT NULL,
 CONSTRAINT [PK_DiasAtencion] PRIMARY KEY CLUSTERED 
(
	[IdDia_di] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidades]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidades](
	[IdEspecialidad_esp] [char](2) NOT NULL,
	[NombreEspecialidad_esp] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Especialidades] PRIMARY KEY CLUSTERED 
(
	[IdEspecialidad_esp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HorariosAtencion]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HorariosAtencion](
	[IdDia_ha] [char](1) NOT NULL,
	[IdMedico_ha] [int] NOT NULL,
	[IdHorario_ha] [int] IDENTITY(1,1) NOT NULL,
	[IdEspecialidad_ha] [char](2) NOT NULL,
	[DNI_ha] [char](8) NOT NULL,
	[HoraInicio_ha] [time](7) NULL,
	[HoraFin_ha] [time](7) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_HorariosAtencion] PRIMARY KEY CLUSTERED 
(
	[IdDia_ha] ASC,
	[IdMedico_ha] ASC,
	[IdHorario_ha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidades](
	[IdLocalidad_lo] [int] IDENTITY(1,1) NOT NULL,
	[IdProvincia_lo] [char](2) NOT NULL,
	[NombreLocalidad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Localidades] PRIMARY KEY CLUSTERED 
(
	[IdLocalidad_lo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicos](
	[IdEspecialidad_me] [char](2) NOT NULL,
	[IdMedico_me] [int] IDENTITY(1,1) NOT NULL,
	[DNI_me] [char](8) NOT NULL,
	[IdRol_me] [char](1) NOT NULL,
	[IdUsuario_me] [int] NOT NULL,
	[Legajo_me] [char](4) NOT NULL,
	[Activo_me] [bit] NOT NULL,
 CONSTRAINT [PK_Medicos] PRIMARY KEY CLUSTERED 
(
	[IdEspecialidad_me] ASC,
	[IdMedico_me] ASC,
	[DNI_me] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_Medicos] UNIQUE NONCLUSTERED 
(
	[Legajo_me] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[DNI_pa] [char](8) NOT NULL,
	[IdPaciente_pa] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Pacientes] PRIMARY KEY CLUSTERED 
(
	[DNI_pa] ASC,
	[IdPaciente_pa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[DNI_pe] [char](8) NOT NULL,
	[IdLocalidad_pe] [int] NOT NULL,
	[IdSexo_pe] [char](1) NOT NULL,
	[Nombre_pe] [varchar](20) NOT NULL,
	[Apellido_pe] [varchar](30) NOT NULL,
	[Nacionalidad_pe] [varchar](30) NOT NULL,
	[FechaNacimiento_pe] [date] NOT NULL,
	[Direccion_pe] [varchar](100) NOT NULL,
	[Email_pe] [varchar](50) NOT NULL,
	[Telefono_pe] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[DNI_pe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias](
	[IdProvincia_pro] [char](2) NOT NULL,
	[NombreProvincia_pro] [varchar](50) NULL,
 CONSTRAINT [PK_Provincias] PRIMARY KEY CLUSTERED 
(
	[IdProvincia_pro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id_rol] [char](1) NOT NULL,
	[nombre_rol] [varchar](20) NOT NULL,
	[descripcion_rol] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sexo]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sexo](
	[IdSexo_se] [char](1) NOT NULL,
	[descripcion_se] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Sexo] PRIMARY KEY CLUSTERED 
(
	[IdSexo_se] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turnos]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turnos](
	[IdEspecialidad_tu] [char](2) NOT NULL,
	[IdMedico_tu] [int] NOT NULL,
	[DNI_Medico_tu] [char](8) NOT NULL,
	[DNI_Paciente_tu] [char](8) NOT NULL,
	[IdPaciente_tu] [int] NOT NULL,
	[IdTurno_tu] [int] IDENTITY(1,1) NOT NULL,
	[FechaTurno_tu] [date] NOT NULL,
	[HoraTurno_tu] [time](7) NULL,
	[Asistencia_tu] [bit] NOT NULL,
	[Observacion_tu] [varchar](255) NULL,
 CONSTRAINT [PK_Turnos] PRIMARY KEY CLUSTERED 
(
	[IdEspecialidad_tu] ASC,
	[IdMedico_tu] ASC,
	[DNI_Medico_tu] ASC,
	[DNI_Paciente_tu] ASC,
	[IdPaciente_tu] ASC,
	[IdTurno_tu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idRol_us] [char](1) NOT NULL,
	[idUsuario_us] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario_us] [varchar](20) NOT NULL,
	[Contrasenia_us] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idRol_us] ASC,
	[idUsuario_us] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_Usuarios] UNIQUE NONCLUSTERED 
(
	[NombreUsuario_us] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Medicos] ADD  DEFAULT ((1)) FOR [Activo_me]
GO
ALTER TABLE [dbo].[Turnos] ADD  DEFAULT ((0)) FOR [Asistencia_tu]
GO
ALTER TABLE [dbo].[HorariosAtencion]  WITH CHECK ADD  CONSTRAINT [FK_HorariosAtencion_DiasAtencion] FOREIGN KEY([IdDia_ha])
REFERENCES [dbo].[DiasAtencion] ([IdDia_di])
GO
ALTER TABLE [dbo].[HorariosAtencion] CHECK CONSTRAINT [FK_HorariosAtencion_DiasAtencion]
GO
ALTER TABLE [dbo].[HorariosAtencion]  WITH CHECK ADD  CONSTRAINT [FK_HorariosAtencion_Medicos] FOREIGN KEY([IdEspecialidad_ha], [IdMedico_ha], [DNI_ha])
REFERENCES [dbo].[Medicos] ([IdEspecialidad_me], [IdMedico_me], [DNI_me])
GO
ALTER TABLE [dbo].[HorariosAtencion] CHECK CONSTRAINT [FK_HorariosAtencion_Medicos]
GO
ALTER TABLE [dbo].[Localidades]  WITH CHECK ADD  CONSTRAINT [FK_Localidades_Provincias] FOREIGN KEY([IdProvincia_lo])
REFERENCES [dbo].[Provincias] ([IdProvincia_pro])
GO
ALTER TABLE [dbo].[Localidades] CHECK CONSTRAINT [FK_Localidades_Provincias]
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD  CONSTRAINT [FK_Medicos_Especialidad] FOREIGN KEY([IdEspecialidad_me])
REFERENCES [dbo].[Especialidades] ([IdEspecialidad_esp])
GO
ALTER TABLE [dbo].[Medicos] CHECK CONSTRAINT [FK_Medicos_Especialidad]
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD  CONSTRAINT [FK_Medicos_Personas] FOREIGN KEY([DNI_me])
REFERENCES [dbo].[Personas] ([DNI_pe])
GO
ALTER TABLE [dbo].[Medicos] CHECK CONSTRAINT [FK_Medicos_Personas]
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD  CONSTRAINT [FK_Medicos_Usuarios] FOREIGN KEY([IdRol_me], [IdUsuario_me])
REFERENCES [dbo].[Usuarios] ([idRol_us], [idUsuario_us])
GO
ALTER TABLE [dbo].[Medicos] CHECK CONSTRAINT [FK_Medicos_Usuarios]
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD  CONSTRAINT [FK_Pacientes_Personas] FOREIGN KEY([DNI_pa])
REFERENCES [dbo].[Personas] ([DNI_pe])
GO
ALTER TABLE [dbo].[Pacientes] CHECK CONSTRAINT [FK_Pacientes_Personas]
GO
ALTER TABLE [dbo].[Personas]  WITH CHECK ADD  CONSTRAINT [FK_Personas_Localidades] FOREIGN KEY([IdLocalidad_pe])
REFERENCES [dbo].[Localidades] ([IdLocalidad_lo])
GO
ALTER TABLE [dbo].[Personas] CHECK CONSTRAINT [FK_Personas_Localidades]
GO
ALTER TABLE [dbo].[Personas]  WITH CHECK ADD  CONSTRAINT [FK_Personas_Sexo] FOREIGN KEY([IdSexo_pe])
REFERENCES [dbo].[Sexo] ([IdSexo_se])
GO
ALTER TABLE [dbo].[Personas] CHECK CONSTRAINT [FK_Personas_Sexo]
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD  CONSTRAINT [FK_Turnos_Medicos] FOREIGN KEY([IdEspecialidad_tu], [IdMedico_tu], [DNI_Medico_tu])
REFERENCES [dbo].[Medicos] ([IdEspecialidad_me], [IdMedico_me], [DNI_me])
GO
ALTER TABLE [dbo].[Turnos] CHECK CONSTRAINT [FK_Turnos_Medicos]
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD  CONSTRAINT [FK_Turnos_Pacientes] FOREIGN KEY([DNI_Paciente_tu], [IdPaciente_tu])
REFERENCES [dbo].[Pacientes] ([DNI_pa], [IdPaciente_pa])
GO
ALTER TABLE [dbo].[Turnos] CHECK CONSTRAINT [FK_Turnos_Pacientes]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Roles] FOREIGN KEY([idRol_us])
REFERENCES [dbo].[Roles] ([id_rol])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuario_Roles]
GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarMedico_Especialidades]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ActualizarMedico_Especialidades]
@ID_MEDICO INT,
@ID_ESPECIALIDAD CHAR(2)
AS
BEGIN
    UPDATE Medicos
    SET IdEspecialidad_me = @ID_ESPECIALIDAD
    WHERE IdMedico_me = @ID_MEDICO
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarMedico_Personas]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_ActualizarMedico_Personas] -- EDITA LOS DATOS DE LA TABLA PERSONA VINCULADA AL MEDICO
@DNI CHAR(8),
@DIRECCION VARCHAR(100),
@ID_SEXO CHAR(1),
@EMAIL VARCHAR(50),
@TELEFONO VARCHAR(30)
AS
BEGIN
UPDATE Personas 
SET 
Direccion_pe = @DIRECCION, 
IdSexo_pe = @ID_SEXO, 
Email_pe = @EMAIL, 
Telefono_pe = @TELEFONO
WHERE 
DNI_pe = @DNI;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarMedico_Usuarios]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ActualizarMedico_Usuarios] -- EDITA LOS DATOS DE LA TABLA USUARIOS VINCULADOS AL MEDICO
@ID_USUARIO INT,
@USUARIO VARCHAR(20),
@CONTRASENIA CHAR(20)
AS
BEGIN
UPDATE Usuarios 
SET 
NombreUsuario_us = @USUARIO, 
Contrasenia_us = @CONTRASENIA
WHERE 
idUsuario_us = @ID_USUARIO;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarPaciente_Personas]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_ActualizarPaciente_Personas] -- EDITA LOS DATOS DE LA TABLA PERSONA VINCULADA AL PACIENTE
@DNI CHAR(8),
@FECHA_NACIMIENTO DATE,
@DIRECCION VARCHAR(100),
@ID_SEXO CHAR(1),
@EMAIL VARCHAR(50),
@TELEFONO VARCHAR(30)

AS

BEGIN
UPDATE Personas 
SET 
FechaNacimiento_pe = @FECHA_NACIMIENTO,
Direccion_pe = @DIRECCION, 
IdSexo_pe = @ID_SEXO, 
Email_pe = @EMAIL, 
Telefono_pe = @TELEFONO
WHERE 
DNI_pe = @DNI
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Agregar_Asistencia_Observaciones]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_Agregar_Asistencia_Observaciones]
@DNI_PACIENTE CHAR(8),
@ID_TURNO INT,
@ASISTENCIA BIT,
@OBSERVACIONES VARCHAR(255)
AS
UPDATE Turnos
SET 
Asistencia_tu = @ASISTENCIA,
Observacion_tu = @OBSERVACIONES
WHERE DNI_Paciente_tu = @DNI_PACIENTE AND IdTurno_tu = @ID_TURNO
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarHorariosAtencion]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AgregarHorariosAtencion]
 @ID_DIA CHAR(1),
 @ID_MEDICO INT, 
 @ID_ESPECIALIDAD CHAR(2),
 @DNI CHAR(8),
 @HORARIO_INI TIME,
 @HORARIO_FIN TIME,
 @ACTIVO BIT

 AS
 INSERT INTO HorariosAtencion(IdDia_ha,IdMedico_ha,IdEspecialidad_ha,DNI_ha,HoraInicio_ha,
 HoraFin_ha,Activo)
 SELECT @ID_DIA,@ID_MEDICO, @ID_ESPECIALIDAD, @DNI, @HORARIO_INI, @HORARIO_FIN, @ACTIVO
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarMedico]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AgregarMedico]
 @ID_ESPECIALIDAD CHAR(2),
 @DNI CHAR(8), 
 @ID_ROL CHAR(1),
 @ID_USUARIO INT,
 @LEGAJO CHAR(4),
 @ACTIVO BIT

 AS
 INSERT INTO Medicos(IdEspecialidad_me,DNI_me,IdRol_me,IdUsuario_me,Legajo_me, Activo_me)
 SELECT @ID_ESPECIALIDAD, @DNI, @ID_ROL, @ID_USUARIO, @LEGAJO, @ACTIVO
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarPaciente]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AgregarPaciente]
 @DNI CHAR(8)

 AS
 INSERT INTO Pacientes(DNI_pa)
 SELECT @DNI
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarPersona]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AgregarPersona]
@DNI CHAR(8),
@NOMBRE VARCHAR(20),
@APELLIDO VARCHAR(30),
@ID_SEXO CHAR(1),
@NACIONALIDAD VARCHAR(30),
@FECHA_NACIMIENTO DATE,
@DIRECCION VARCHAR(100),
@ID_LOCALIDAD INT,
@EMAIL VARCHAR(50),
@TELEFONO VARCHAR(30)

AS

IF NOT EXISTS (SELECT DNI_pe FROM Personas WHERE @DNI = DNI_pe) 
INSERT INTO Personas (DNI_pe,IdLocalidad_pe,IdSexo_pe,Nombre_pe,Apellido_pe,
Nacionalidad_pe,FechaNacimiento_pe,Direccion_pe,Email_pe,Telefono_pe)

SELECT @DNI,@ID_LOCALIDAD,@ID_SEXO, @NOMBRE,@APELLIDO,@NACIONALIDAD,
@FECHA_NACIMIENTO,@DIRECCION,@EMAIL,@TELEFONO
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarTurno]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_AgregarTurno]
@ID_ESPECIALIDAD CHAR(2),
@ID_MEDICO INT,
@DNI_MEDICO CHAR(8),
@DNI_PACIENTE CHAR(8),
@ID_PACIENTE INT,
@FECHA_TURNO DATE,
@HORA_TURNO TIME,
@ASISTENCIA BIT

AS

IF EXISTS (SELECT DNI_pa FROM Pacientes WHERE @DNI_PACIENTE = DNI_pa) 
INSERT INTO Turnos (IdEspecialidad_tu, IdMedico_tu, DNI_Medico_tu, DNI_Paciente_tu,
IdPaciente_tu,FechaTurno_tu,HoraTurno_tu, Asistencia_tu)

SELECT @ID_ESPECIALIDAD, @ID_MEDICO, @DNI_MEDICO, @DNI_PACIENTE, @ID_PACIENTE, @FECHA_TURNO, @HORA_TURNO, @ASISTENCIA
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarUsuario]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AgregarUsuario]
 @IdRol CHAR(1),
 @NombreUsuario VARCHAR(20), 
 @Contrasenia VARCHAR(20)

 AS
 INSERT INTO Usuarios (idRol_us,NombreUsuario_us,Contrasenia_us)
 SELECT @IdRol,@NombreUsuario,@Contrasenia
GO
/****** Object:  StoredProcedure [dbo].[SP_BajaLogicaMedico]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BajaLogicaMedico]
@DNI_MEDICO CHAR(8)

AS
UPDATE Medicos 
SET Activo_me = 0 WHERE DNI_me = @DNI_MEDICO
GO
/****** Object:  StoredProcedure [dbo].[SP_CargarEspecialidades]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CargarEspecialidades]
AS
SELECT IdEspecialidad_esp, NombreEspecialidad_esp
FROM Especialidades
GO
/****** Object:  StoredProcedure [dbo].[SP_CargarGrillaMedicoPorDni]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CargarGrillaMedicoPorDni]
@DNI_MEDICO CHAR(8)
AS
SELECT Apellido_pe AS Apellido, Nombre_pe AS Nombre, NombreEspecialidad_esp AS Especialidad, 
NombreDia_di AS DiasAtencion, HoraInicio_ha AS HorarioInicio, HoraFin_ha AS HorarioFin
FROM Especialidades INNER JOIN Medicos
ON IdEspecialidad_esp = IdEspecialidad_me INNER JOIN Personas
ON DNI_me = DNI_pe INNER JOIN HorariosAtencion
ON IdMedico_ha = IdMedico_me INNER JOIN DiasAtencion
ON IdDia_di = IdDia_ha
WHERE DNI_me = @DNI_MEDICO AND Activo_me = 1 AND HorariosAtencion.Activo = 1
GO
/****** Object:  StoredProcedure [dbo].[SP_CargarGrillaMedicos]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CargarGrillaMedicos]

 AS
 SELECT 
Nombre_pe AS Nombre, Apellido_pe AS Apellido, DNI_pe AS DNI,
NombreEspecialidad_esp AS Especialidad,NombreProvincia_pro as Provincia,
NombreLocalidad AS Localidad, Direccion_pe AS Direccion ,IdSexo_pe AS Sexo,
Email_pe AS Email, Telefono_pe AS Telefono, NombreUsuario_us AS Usuario,
Contrasenia_us AS Contraseña, idUsuario_us AS ID_Usuario, IdEspecialidad_me AS ID_Especialidad,
IdMedico_me AS ID_Med
FROM MEDICOS INNER JOIN Especialidades
ON IdEspecialidad_me = IdEspecialidad_esp INNER JOIN Personas
ON DNI_pe = DNI_me INNER JOIN Localidades
ON IdLocalidad_lo = IdLocalidad_pe INNER JOIN Provincias
ON IdProvincia_pro = IdProvincia_lo INNER JOIN Usuarios
ON idUsuario_us = IdUsuario_me
WHERE Medicos.Activo_me = 1
GO
/****** Object:  StoredProcedure [dbo].[SP_CargarGrillaPacientes]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CargarGrillaPacientes]

 AS

 SELECT Nombre_pe, Apellido_pe, DNI_pe, IdSexo_pe, NombreProvincia_pro, NombreLocalidad,
 FechaNacimiento_pe, Direccion_pe, Email_pe, Telefono_pe, IdPaciente_pa
 FROM Pacientes INNER JOIN Personas
 ON DNI_pa = DNI_pe INNER JOIN Localidades
 ON IdLocalidad_pe = IdLocalidad_lo INNER JOIN Provincias
 ON IdProvincia_lo = IdProvincia_pro
GO
/****** Object:  StoredProcedure [dbo].[SP_CargarGrillaTurnos]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_CargarGrillaTurnos]
@FechaTurno DATE = NULL
AS
BEGIN

IF @FechaTurno IS NULL -- Asignar el valor predeterminado si @FechaTurno es NULL
BEGIN
SET @FechaTurno = GETDATE();
END

SELECT Nombre_pe,Apellido_pe,DNI_Paciente_tu,CAST(FechaTurno_tu AS DATE) AS Fecha,
HoraTurno_tu, IdTurno_tu
FROM Turnos INNER JOIN Personas
ON DNI_Paciente_tu = DNI_pe
WHERE CAST(FechaTurno_tu AS DATE) >= @FechaTurno
ORDER BY FechaTurno_tu ASC, HoraTurno_tu ASC

END
GO
/****** Object:  StoredProcedure [dbo].[SP_CargarHorariosAtencionMedico]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CargarHorariosAtencionMedico]
@DNI_MEDICO CHAR(8)

AS

SELECT Nombre_pe AS Nombre, Apellido_pe AS Apellido, DNI_pe AS DNI, IdMedico_ha AS ID_Medico,
NombreDia_di AS Dias_Atencion, HoraInicio_ha AS Horario_Inicio, HoraFin_ha AS Horario_Fin,
Activo
FROM ((HorariosAtencion INNER JOIN DiasAtencion
ON IdDia_ha = IdDia_di) INNER JOIN Personas
ON DNI_pe = DNI_ha) 
WHERE DNI_pe = @DNI_MEDICO
GO
/****** Object:  StoredProcedure [dbo].[SP_CargarLocalidades]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CargarLocalidades]
@IdProvincia CHAR(2)

AS
SELECT IdLocalidad_lo,NombreLocalidad
FROM Localidades
WHERE @IdProvincia = IdProvincia_lo
GO
/****** Object:  StoredProcedure [dbo].[SP_CargarMedicoPorDni]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CargarMedicoPorDni]
@DNI_MEDICO CHAR(8)

AS
SELECT 
Nombre_pe AS Nombre, Apellido_pe AS Apellido, DNI_pe AS DNI,
NombreEspecialidad_esp AS Especialidad,NombreProvincia_pro as Provincia,
NombreLocalidad AS Localidad,Direccion_pe AS Direccion ,IdSexo_pe AS Sexo,
Email_pe AS Email, Telefono_pe AS Telefono, NombreUsuario_us AS Usuario,
Contrasenia_us AS Contraseña, idUsuario_us AS ID_Usuario, IdEspecialidad_esp AS ID_Especialidad,
IdMedico_me AS ID_Med
FROM MEDICOS INNER JOIN Especialidades
ON IdEspecialidad_me = IdEspecialidad_esp INNER JOIN Personas
ON DNI_pe = DNI_me INNER JOIN Localidades
ON IdLocalidad_lo = IdLocalidad_pe INNER JOIN Provincias
ON IdProvincia_pro = IdProvincia_lo INNER JOIN Usuarios
ON idUsuario_us = IdUsuario_me
WHERE Medicos.Activo_me = 1 AND  DNI_me = @DNI_MEDICO
GO
/****** Object:  StoredProcedure [dbo].[SP_CargarMedicoPorEspecialidad]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_CargarMedicoPorEspecialidad]
@IdEspecialidad CHAR(2)
AS
SELECT (Apellido_pe + ' ' + Nombre_pe) AS  NombreCompleto, DNI_me
FROM Personas INNER JOIN Medicos
ON DNI_pe = DNI_me INNER JOIN Especialidades
ON IdEspecialidad_me = IdEspecialidad_esp
WHERE IdEspecialidad_esp = @IdEspecialidad AND Activo_me = 1
GO
/****** Object:  StoredProcedure [dbo].[SP_CargarMedicoPorId]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_CargarMedicoPorId]
@ID_MEDICO INT
AS
SELECT Apellido_pe AS Apellido, Nombre_pe AS Nombre, NombreEspecialidad_esp AS Especialidad, NombreDia_di AS DiasAtencion, 
HoraInicio_ha AS HorarioInicio, HoraFin_ha AS HorarioFin
FROM Especialidades INNER JOIN Medicos
ON IdEspecialidad_esp = IdEspecialidad_me INNER JOIN Personas
ON DNI_me = DNI_pe INNER JOIN HorariosAtencion
ON IdMedico_ha = IdMedico_me INNER JOIN DiasAtencion
ON IdDia_di = IdDia_ha
WHERE IdMedico_me = @ID_MEDICO AND Activo_me = 1 AND HorariosAtencion.Activo = 1
GO
/****** Object:  StoredProcedure [dbo].[SP_CargarPacientePorDni]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CargarPacientePorDni]
@DNI_PACIENTE CHAR(8)

AS
SELECT Nombre_pe, Apellido_pe, DNI_pe, IdSexo_pe, NombreProvincia_pro, NombreLocalidad,
FechaNacimiento_pe, Direccion_pe, Email_pe, Telefono_pe, IdPaciente_pa
FROM Pacientes INNER JOIN Personas
ON DNI_pa = DNI_pe INNER JOIN Localidades
ON IdLocalidad_pe = IdLocalidad_lo INNER JOIN Provincias
ON IdProvincia_lo = IdProvincia_pro
WHERE DNI_pe = @DNI_PACIENTE
GO
/****** Object:  StoredProcedure [dbo].[SP_CargarProvincias]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CargarProvincias]
AS
SELECT IdProvincia_pro, NombreProvincia_pro
FROM Provincias
GO
/****** Object:  StoredProcedure [dbo].[SP_CargarSexos]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_CargarSexos]

AS

SELECT IdSexo_se
FROM Sexo

GO
/****** Object:  StoredProcedure [dbo].[SP_CargarTurnosPorFecha]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CargarTurnosPorFecha]
@FECHA DATE
AS
SELECT Nombre_pe, Apellido_pe, DNI_Paciente_tu, FechaTurno_tu AS FECHA, HoraTurno_tu
FROM Turnos INNER JOIN Personas
ON DNI_Paciente_tu = DNI_pe
WHERE CAST(FechaTurno_tu AS DATE) = @FECHA
ORDER BY FechaTurno_tu ASC, HoraTurno_tu ASC
GO
/****** Object:  StoredProcedure [dbo].[SP_EditarHorarioAtencion]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EditarHorarioAtencion]
@ID_DIA CHAR(1),
@DNI CHAR(8),
@HORARIO_INI TIME,
@HORARIO_FIN TIME,
@ACTIVO BIT
AS
BEGIN
UPDATE HorariosAtencion
SET
HoraInicio_ha=@HORARIO_INI,
HoraFin_ha=@HORARIO_FIN,
Activo=@ACTIVO
WHERE IdDia_ha=@ID_DIA AND DNI_ha=@DNI
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_FiltrarTurnosDelDiaActual]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_FiltrarTurnosDelDiaActual]
AS
SELECT Nombre_pe, Apellido_pe, DNI_Paciente_tu, FechaTurno_tu AS Fecha, HoraTurno_tu
FROM Turnos INNER JOIN Personas
ON DNI_Paciente_tu = DNI_pe
WHERE CAST(FechaTurno_tu AS DATE) = CAST(GETDATE() AS DATE)
ORDER BY FechaTurno_tu ASC, HoraTurno_tu ASC
GO
/****** Object:  StoredProcedure [dbo].[SP_Informe_Ausentes]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Informe_Ausentes]
    @FECHA_DESDE DATE,
    @FECHA_HASTA DATE,
    @DNI CHAR(8)   -- Parámetro DNI opcional, inicializado a NULL
AS
BEGIN
	-- Verifica y convierte cadena vacía en NULL para el parámetro @DNI
    IF @DNI = ''
    BEGIN
        SET @DNI = NULL;
    END
    -- Selecciona el número total de turnos, la cantidad de presentes y su porcentaje dentro del rango de fechas y opcionalmente para un DNI específico
    IF @DNI IS NOT NULL
    BEGIN
        -- Consulta cuando se proporciona un DNI específico
        SELECT 
            COUNT(*) AS [Total Turnos],
            SUM(CASE WHEN Asistencia_tu = 0 THEN 1 ELSE 0 END) AS [Cantidad Ausentes],
            CAST(ROUND(100.0 * SUM(CASE WHEN Asistencia_tu = 0 THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5, 2)) AS [Ausentes %]
        FROM 
            turnos
        WHERE 
            FechaTurno_tu BETWEEN @FECHA_DESDE AND @FECHA_HASTA
            AND DNI_Paciente_tu = @DNI;  -- Filtra por el DNI del paciente
    END
    ELSE
    BEGIN
        -- Consulta cuando NO se proporciona un DNI específico
        SELECT 
            COUNT(*) AS [Total Turnos],
            SUM(CASE WHEN Asistencia_tu = 0 THEN 1 ELSE 0 END) AS [Cantidad Ausentes],
            CAST(ROUND(100.0 * SUM(CASE WHEN Asistencia_tu = 0 THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5, 2)) AS [Ausentes %]
        FROM 
            turnos
        WHERE 
            FechaTurno_tu BETWEEN @FECHA_DESDE AND @FECHA_HASTA;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Informe_Presentes]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_Informe_Presentes]
    @FECHA_DESDE DATE,
    @FECHA_HASTA DATE,
    @DNI CHAR(8)   -- Parámetro DNI opcional, inicializado a NULL
AS
BEGIN
	-- Verifica y convierte cadena vacía en NULL para el parámetro @DNI
    IF @DNI = ''
    BEGIN
        SET @DNI = NULL;
    END
    -- Selecciona el número total de turnos, la cantidad de presentes y su porcentaje dentro del rango de fechas y opcionalmente para un DNI específico
    IF @DNI IS NOT NULL
    BEGIN
        -- Consulta cuando se proporciona un DNI específico
        SELECT 
            COUNT(*) AS [Total Turnos],
            SUM(CASE WHEN Asistencia_tu = 1 THEN 1 ELSE 0 END) AS [Cantidad Presentes],
            CAST(ROUND(100.0 * SUM(CASE WHEN Asistencia_tu = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5, 2)) AS [Presentes %]
        FROM 
            turnos
        WHERE 
            FechaTurno_tu BETWEEN @FECHA_DESDE AND @FECHA_HASTA
            AND DNI_Paciente_tu = @DNI;  -- Filtra por el DNI del paciente
    END
    ELSE
    BEGIN
        -- Consulta cuando NO se proporciona un DNI específico
        SELECT 
            COUNT(*) AS [Total Turnos],
            SUM(CASE WHEN Asistencia_tu = 1 THEN 1 ELSE 0 END) AS [Cantidad Presentes],
            CAST(ROUND(100.0 * SUM(CASE WHEN Asistencia_tu = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5, 2)) AS [Presentes %]
        FROM 
            turnos
        WHERE 
            FechaTurno_tu BETWEEN @FECHA_DESDE AND @FECHA_HASTA;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Informe_Total_Turnos]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_Informe_Total_Turnos]
AS
BEGIN
    -- Selecciona el número total de turnos, la cantidad de presentes y ausentes, y sus porcentajes
    SELECT 
        COUNT(*) AS [Total Turnos],
        SUM(CASE WHEN Asistencia_tu = 1 THEN 1 ELSE 0 END) AS [Cantidad Presentes],
        SUM(CASE WHEN Asistencia_tu = 0 THEN 1 ELSE 0 END) AS [Cantidad Ausentes],
        CAST(ROUND(100.0 * SUM(CASE WHEN Asistencia_tu = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5, 2)) AS [Presentes %],
        CAST(ROUND(100.0 * SUM(CASE WHEN Asistencia_tu = 0 THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5, 2)) AS [Ausentes %]
    FROM 
        turnos;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerFechaNacimiento]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ObtenerFechaNacimiento]
@DNI CHAR(8)
AS
SELECT FechaNacimiento_pe 
FROM Personas
WHERE DNI_pe = @DNI
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerHorariosAtencion]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ObtenerHorariosAtencion]
@DNI_MEDICO CHAR(8)
AS
SELECT IdDia_ha, IdMedico_ha, IdHorario_ha, IdEspecialidad_ha, DNI_ha, HoraInicio_ha, HoraFin_ha, Activo
FROM HorariosAtencion
WHERE DNI_ha = @DNI_MEDICO
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerHoraTurno]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ObtenerHoraTurno]
    @FechaTurno date
AS
BEGIN
    -- Cuerpo del procedimiento almacenado
    SELECT HoraTurno_tu as Turnos
    FROM turnos
    WHERE FechaTurno_tu = @FechaTurno;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerIdPacientePorDNI]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ObtenerIdPacientePorDNI]
@DNI_PACIENTE CHAR(8),
@ID_PACIENTE INT OUTPUT -- Parámetro de salida para el IdPaciente
AS
BEGIN
SELECT @ID_PACIENTE = IdPaciente_pa
FROM Pacientes
WHERE DNI_pa = @DNI_PACIENTE;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerIdUsuario]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ObtenerIdUsuario]
 @NombreUsuario VARCHAR(20)

 AS
 SELECT Usuarios.idRol_us, Usuarios.idUsuario_us, Usuarios.NombreUsuario_us, Usuarios.Contrasenia_us
 FROM Usuarios
 WHERE Usuarios.NombreUsuario_us = @NombreUsuario
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerMedico]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ObtenerMedico]
 @DNI CHAR(8)

 AS
 SELECT IdEspecialidad_me,IdMedico_me,DNI_me,IdRol_me,IdUsuario_me,Legajo_me
 FROM Medicos
 WHERE DNI_me = @DNI
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerPaciente]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ObtenerPaciente]
@DNI_PACIENTE CHAR(8)
AS
SELECT IdPaciente_pa
FROM Pacientes
WHERE DNI_pa = @DNI_PACIENTE
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerPaciente_DFH]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ObtenerPaciente_DFH]
@DNI CHAR(8)
AS
SELECT Nombre_pe, Apellido_pe, DNI_Paciente_tu, FechaTurno_tu, HoraTurno_tu,
Asistencia_tu, Observacion_tu, IdTurno_tu
FROM Turnos INNER JOIN Personas
ON DNI_Paciente_tu = DNI_pe
WHERE DNI_Paciente_tu = @DNI
ORDER BY FechaTurno_tu ASC, HoraTurno_tu ASC
GO
/****** Object:  StoredProcedure [dbo].[SP_TraeridDia]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TraeridDia]
@NOMBRE_DIA VARCHAR(20)
AS
SELECT idDia_di FROM diasAtencion
WHERE NombreDia_di = @NOMBRE_DIA
GO
/****** Object:  StoredProcedure [dbo].[SP_VerificarDniPersona]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[SP_VerificarDniPersona]
 @DNI_PERSONA CHAR(8)
 
 AS
 SELECT DNI_pe
 FROM Personas
 WHERE DNI_pe = @DNI_PERSONA
GO
/****** Object:  StoredProcedure [dbo].[SP_VerificarLegajoMedico]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_VerificarLegajoMedico]
 @LEGAJO_MEDICO CHAR(4)
 
 AS
 SELECT Legajo_me
 FROM Medicos
 WHERE Legajo_me = @LEGAJO_MEDICO
GO
/****** Object:  StoredProcedure [dbo].[SP_VerificarNombreUsuario]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_VerificarNombreUsuario]
 @NOMBRE_USUARIO VARCHAR(20)
 
 AS
 SELECT NombreUsuario_us
 FROM Usuarios
 WHERE NombreUsuario_us = @NOMBRE_USUARIO
GO
/****** Object:  StoredProcedure [dbo].[SP_VerificarUsuario]    Script Date: 18/7/2024 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_VerificarUsuario]
 @NombreUsuario VARCHAR(20), 
 @Contrasenia VARCHAR(20)

 AS
 SELECT Usuarios.idRol_us, Usuarios.idUsuario_us, Usuarios.NombreUsuario_us, Usuarios.Contrasenia_us
 FROM Usuarios
 WHERE Usuarios.NombreUsuario_us = @NombreUsuario AND Usuarios.Contrasenia_us = @Contrasenia
GO
USE [master]
GO
ALTER DATABASE [TP_FINAL_PR3] SET  READ_WRITE 
GO
