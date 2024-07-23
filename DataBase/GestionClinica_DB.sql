CREATE DATABASE TP_FINAL_PR3
ON (name='TP_FINAL_PR3_dat',filename='C:\DB_GESTION_CLINICA\TP_FINAL_PR3.mdf')
GO

USE TP_FINAL_PR3
GO

--TABLA ROLES--
CREATE TABLE Roles (
id_rol CHAR(1) NOT NULL,
nombre_rol VARCHAR(20) NOT NULL,
descripcion_rol VARCHAR(50) NOT NULL
CONSTRAINT PK_Roles PRIMARY KEY (id_rol)
)



--TABLA USUARIOS--
CREATE TABLE Usuarios (
idRol_us CHAR(1) NOT NULL,
idUsuario_us INT IDENTITY(1,1) NOT NULL,
NombreUsuario_us VARCHAR(20) NOT NULL,
Contrasenia_us VARCHAR(20) NOT NULL
CONSTRAINT PK_Usuarios PRIMARY KEY (idRol_us,idUsuario_us),
CONSTRAINT FK_Usuario_Roles FOREIGN KEY (idRol_us) REFERENCES Roles (id_rol),
CONSTRAINT UK_Usuarios UNIQUE (NombreUsuario_us)
)
GO


--TABLA PROVINCIAS--
CREATE TABLE Provincias (
IdProvincia_pro CHAR(2),
NombreProvincia_pro VARCHAR(50)
CONSTRAINT PK_Provincias PRIMARY KEY (IdProvincia_pro)
)


--TABLA LOCALIDADES--
CREATE TABLE Localidades (
IdLocalidad_lo INT IDENTITY(1,1) NOT NULL,
IdProvincia_lo CHAR(2) NOT NULL,
NombreLocalidad VARCHAR (50) NOT NULL,
CONSTRAINT PK_Localidades PRIMARY KEY (IdLocalidad_lo),
CONSTRAINT FK_Localidades_Provincias FOREIGN KEY (IdProvincia_lo) REFERENCES Provincias (IdProvincia_pro)
)


--TABLA ESPECIALIDADES--
CREATE TABLE Especialidades (
IdEspecialidad_esp CHAR(2) NOT NULL,
NombreEspecialidad_esp VARCHAR(30) NOT NULL,
CONSTRAINT PK_Especialidades PRIMARY KEY (IdEspecialidad_esp)
)


--TABLA SEXO--
CREATE TABLE Sexo (
IdSexo_se CHAR(1) NOT NULL,
descripcion_se VARCHAR(20) NOT NULL,
CONSTRAINT PK_Sexo PRIMARY KEY (idSexo_se),
);


--TABLA PERSONAS--
CREATE TABLE Personas (
DNI_pe CHAR(8) NOT NULL,
IdLocalidad_pe INT NOT NULL,
IdSexo_pe CHAR(1) NOT NULL,
Nombre_pe VARCHAR(20) NOT NULL,
Apellido_pe VARCHAR(30) NOT NULL,
Nacionalidad_pe VARCHAR(30) NOT NULL,
FechaNacimiento_pe DATE NOT NULL,
Direccion_pe VARCHAR(100) NOT NULL,
Email_pe VARCHAR(50) NOT NULL,
Telefono_pe VARCHAR(30) NOT NULL,
CONSTRAINT PK_Personas PRIMARY KEY (DNI_pe),
CONSTRAINT FK_Personas_Localidades FOREIGN KEY (IdLocalidad_pe) REFERENCES Localidades (IdLocalidad_lo),
CONSTRAINT FK_Personas_Sexo FOREIGN KEY (IdSexo_pe) REFERENCES Sexo (IdSexo_se)
)
GO


--TABLA PACIENTES--
CREATE TABLE Pacientes (
DNI_pa CHAR(8) NOT NULL,
IdPaciente_pa INT IDENTITY (1,1) NOT NULL,
CONSTRAINT PK_Pacientes PRIMARY KEY (DNI_pa,IdPaciente_pa),
CONSTRAINT FK_Pacientes_Personas FOREIGN KEY (DNI_pa) REFERENCES Personas (DNI_pe)
)
GO


--TABLA MEDICOS--
CREATE TABLE Medicos (
--PK CONCATENADA--
IdEspecialidad_me CHAR(2) NOT NULL,
IdMedico_me INT IDENTITY(1,1) NOT NULL,
DNI_me CHAR(8) NOT NULL,
--FK CONCATENADA--
IdRol_me CHAR(1) NOT NULL,
IdUsuario_me INT NOT NULL,
--UNIQUE
Legajo_me CHAR(4) NOT NULL,
--BOOL
Activo_me BIT NULL
CONSTRAINT PK_Medicos PRIMARY KEY (IdEspecialidad_me, IdMedico_me, DNI_me),
CONSTRAINT FK_Medicos_Usuarios FOREIGN KEY (IdRol_me, IdUsuario_me) REFERENCES Usuarios (idRol_us, idUsuario_us),
CONSTRAINT FK_Medicos_Especialidad FOREIGN KEY (IdEspecialidad_me) REFERENCES Especialidades (IdEspecialidad_esp),
CONSTRAINT FK_Medicos_Personas FOREIGN KEY (DNI_me) REFERENCES Personas (DNI_pe),
CONSTRAINT UK_Medicos UNIQUE (Legajo_me)
)


--TABLA DIAS ATENCION--
CREATE TABLE DiasAtencion (
IdDia_di CHAR(1) NOT NULL,
NombreDia_di VARCHAR(20) NOT NULL,
CONSTRAINT PK_DiasAtencion PRIMARY KEY (IdDIa_di)
)


--TABLA HORARIOS ATENCION--
CREATE TABLE HorariosAtencion (
--PK CONCATENADA--
IdDia_ha CHAR(1) NOT NULL,
IdMedico_ha INT NOT NULL,
IdHorario_ha INT IDENTITY(1,1) NOT NULL,
--FK--
IdEspecialidad_ha CHAR(2) NOT NULL,
DNI_ha CHAR(8) NOT NULL,
---
HoraInicio_ha TIME NULL,
HoraFin_ha TIME NULL,
CONSTRAINT PK_HorariosAtencion PRIMARY KEY (IdDia_ha,IdMedico_ha,IdHorario_ha),
CONSTRAINT FK_HorariosAtencion_DiasAtencion FOREIGN KEY (IdDia_ha) REFERENCES DiasAtencion (IdDia_di),
CONSTRAINT FK_HorariosAtencion_Medicos FOREIGN KEY (IdEspecialidad_ha,IdMedico_ha,DNI_ha) REFERENCES Medicos (IdEspecialidad_me,IdMedico_me,DNI_me)
)


--TABLA TURNOS--
CREATE TABLE Turnos (
--PK CONCATENADA--
IdEspecialidad_tu CHAR(2) NOT NULL,
IdMedico_tu INT NOT NULL,
DNI_Medico_tu CHAR(8) NOT NULL,

DNI_Paciente_tu CHAR(8) NOT NULL,
IdPaciente_tu INT NOT NULL,

IdTurno_tu INT IDENTITY(1,1) NOT NULL,
--
FechaTurno_tu DATE NOT NULL,
HoraTurno_tu TIME NULL,
Asistencia_tu BIT NULL DEFAULT 0,
Observacion_tu VARCHAR(255) NULL,
BuscarTexto_tu VARCHAR(255) NULL,
CONSTRAINT PK_Turnos PRIMARY KEY (IdEspecialidad_tu,IdMedico_tu,DNI_Medico_tu,DNI_Paciente_tu,IdPaciente_tu,IdTurno_tu),
CONSTRAINT FK_Turnos_Medicos FOREIGN KEY (IdEspecialidad_tu,IdMedico_tu,DNI_Medico_tu) REFERENCES Medicos (IdEspecialidad_me,IdMedico_me,DNI_me),
CONSTRAINT FK_Turnos_Pacientes FOREIGN KEY (DNI_Paciente_tu,IdPaciente_tu) REFERENCES Pacientes (DNI_pa,IdPaciente_pa)
);




