CREATE PROCEDURE SP_VerificarUsuario
@NombreUsuario VARCHAR(20), 
@Contrasenia VARCHAR(20)
AS
SELECT Usuarios.idRol_us, Usuarios.idUsuario_us, Usuarios.NombreUsuario_us, Usuarios.Contrasenia_us
FROM Usuarios
WHERE Usuarios.NombreUsuario_us = @NombreUsuario AND Usuarios.Contrasenia_us = @Contrasenia
GO 

EXEC SP_VerificarUsuario 'admin1', 'contraseña123'


-------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_AgregarUsuario
 @IdRol CHAR(1),
 @NombreUsuario VARCHAR(20), 
 @Contrasenia VARCHAR(20)

 AS
 INSERT INTO Usuarios (idRol_us,NombreUsuario_us,Contrasenia_us)
 SELECT @IdRol,@NombreUsuario,@Contrasenia
 GO

 EXEC SP_AgregarUsuario '2','medico1', '123'


 -----------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_CargarProvincias
AS
SELECT IdProvincia_pro, NombreProvincia_pro
FROM Provincias
GO

EXEC SP_CargarProvincias


-----------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_CargarLocalidades
@IdProvincia CHAR(2)

AS
SELECT IdLocalidad_lo,NombreLocalidad
FROM Localidades
WHERE @IdProvincia = IdProvincia_lo
GO

EXEC SP_CargarLocalidades '01'


---------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_AgregarPersona
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

EXEC SP_AgregarPersona '39900211','Lucas','De Marchi','M','PERUKIANO','1995/12/13',
'LUGONES 2445','15','LUCAS@GMAIL.COM','3854166838'

SELECT * FROM Personas


---------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_CargarEspecialidades
AS
SELECT IdEspecialidad_esp, NombreEspecialidad_esp
FROM Especialidades
GO

EXEC SP_CargarEspecialidades


---------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_ObtenerIdUsuario
@NombreUsuario VARCHAR(20)
AS
SELECT Usuarios.idRol_us, Usuarios.idUsuario_us, Usuarios.NombreUsuario_us, Usuarios.Contrasenia_us
FROM Usuarios
WHERE Usuarios.NombreUsuario_us = @NombreUsuario
GO 


------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_ObtenerMedico
@DNI CHAR(8)
AS
SELECT IdEspecialidad_me,IdMedico_me,DNI_me,IdRol_me,IdUsuario_me,Legajo_me
FROM Medicos
WHERE DNI_me = @DNI
GO 

EXEC SP_ObtenerMedico'1234'


-----------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_AgregarMedico
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

 EXEC SP_AgregarMedico '01','39900211','2', '4', '0001',1


 -----------------------------------------------------------------------------------------------------------


 CREATE PROCEDURE SP_AgregarHorariosAtencion
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

 
 -----------------------------------------------------------------------------------------------------------


 CREATE PROCEDURE SP_VerificarDniPersona
 @DNI_PERSONA CHAR(8)
 AS
 SELECT DNI_pe
 FROM Personas
 WHERE DNI_pe = @DNI_PERSONA
 GO
 EXEC SP_VerificarDniPersona '1234'

 ----------------------------------------------------------------------------------------------------------

 CREATE PROCEDURE SP_VerificarNombreUsuario
 @NOMBRE_USUARIO VARCHAR(20)
 AS
 SELECT NombreUsuario_us
 FROM Usuarios
 WHERE NombreUsuario_us = @NOMBRE_USUARIO
 GO

 
 ----------------------------------------------------------------------------------------------------------


 CREATE PROCEDURE SP_VerificarLegajoMedico
 @LEGAJO_MEDICO CHAR(4)
 AS
 SELECT Legajo_me
 FROM Medicos
 WHERE Legajo_me = @LEGAJO_MEDICO
 GO


 ------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_CargarGrillaMedicos
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


----------------------------------------------------------------------------------------------------------------


/*CREATE or alter PROCEDURE SP_CargarMedicoPorDni
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

DROP PROCEDURE SP_CargarMedicoPorDni
*/


CREATE OR ALTER PROCEDURE SP_Buscar_Medico_por_texto
@TEXTO VARCHAR(255)
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
WHERE 
Nombre_pe LIKE '%' + @TEXTO + '%' OR
Apellido_pe LIKE '%' + @TEXTO + '%' OR
DNI_pe LIKE '%' + @TEXTO + '%' OR
IdSexo_pe LIKE '%' + @TEXTO + '%' OR
NombreProvincia_pro LIKE '%' + @TEXTO + '%' OR
NombreLocalidad LIKE '%' + @TEXTO + '%' OR
FechaNacimiento_pe LIKE '%' + @TEXTO + '%'OR
Direccion_pe LIKE '%' + @TEXTO + '%'OR
Email_pe LIKE '%' + @TEXTO + '%'OR
Telefono_pe LIKE '%' + @TEXTO + '%'OR
NombreUsuario_us LIKE '%' + @TEXTO + '%'OR
idUsuario_us LIKE '%' + @TEXTO + '%'OR
IdEspecialidad_esp LIKE '%' + @TEXTO
GO

EXEC SP_Buscar_Medico_por_texto 'MEDICO10'


---------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_CargarHorariosAtencionMedico
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

EXEC SP_CargarHorariosAtencionMedico '39900200'


------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_BajaLogicaMedico
@DNI_MEDICO CHAR(8)
AS
UPDATE Medicos 
SET Activo_me = 0 WHERE DNI_me = @DNI_MEDICO
GO
EXEC SP_BajaLogicaMedico '39900210'
GO


---------------------------------------------------------------------------------------------------------------


CREATE OR ALTER PROCEDURE SP_ActualizarMedico_Personas -- EDITA LOS DATOS DE LA TABLA PERSONA VINCULADA AL MEDICO
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


------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_ActualizarMedico_Usuarios -- EDITA LOS DATOS DE LA TABLA USUARIOS VINCULADOS AL MEDICO
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


-------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_ActualizarMedico_Especialidades
@ID_MEDICO INT,
@ID_ESPECIALIDAD CHAR(2)
AS
BEGIN
    UPDATE Medicos
    SET IdEspecialidad_me = @ID_ESPECIALIDAD
    WHERE IdMedico_me = @ID_MEDICO
END
GO

UPDATE Medicos
set IdEspecialidad_me = '01'
where IdMedico_me = 1


--------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_CargarEspecialidades
AS
SELECT IdEspecialidad_esp, NombreEspecialidad_esp
FROM ESPECIALIDADES
GO


-------------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_CargarSexos
AS
SELECT IdSexo_se
FROM Sexo
GO


---------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_TraeridDia
@NOMBRE_DIA VARCHAR(20)
AS
SELECT idDia_di FROM diasAtencion
WHERE NombreDia_di = @NOMBRE_DIA
GO

EXEC SP_TraeridDia 'Martes'


----------------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_EditarHorarioAtencion
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


-------------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_AgregarPaciente
@DNI CHAR(8)
AS
INSERT INTO Pacientes(DNI_pa)
SELECT @DNI
GO

 EXEC SP_AgregarPaciente '37731240'


 -------------------------------------------------------------------------------------------------------------------------------


 CREATE PROCEDURE SP_CargarGrillaPacientes
 AS
 SELECT Nombre_pe, Apellido_pe, DNI_pe, IdSexo_pe, NombreProvincia_pro, NombreLocalidad,
 FechaNacimiento_pe, Direccion_pe, Email_pe, Telefono_pe, IdPaciente_pa
 FROM Pacientes INNER JOIN Personas
 ON DNI_pa = DNI_pe INNER JOIN Localidades
 ON IdLocalidad_pe = IdLocalidad_lo INNER JOIN Provincias
 ON IdProvincia_lo = IdProvincia_pro
 GO


 --------------------------------------------------------------------------------------------------------------------------------------


/*CREATE PROCEDURE SP_CargarPacientePorDni
@DNI_PACIENTE CHAR(8)

AS
SELECT Nombre_pe, Apellido_pe, DNI_pe, IdSexo_pe, NombreProvincia_pro, NombreLocalidad,
FechaNacimiento_pe, Direccion_pe, Email_pe, Telefono_pe, IdPaciente_pa
FROM Pacientes INNER JOIN Personas
ON DNI_pa = DNI_pe INNER JOIN Localidades
ON IdLocalidad_pe = IdLocalidad_lo INNER JOIN Provincias
ON IdProvincia_lo = IdProvincia_pro
WHERE DNI_pe = @DNI_PACIENTE
GO*/

CREATE OR ALTER PROCEDURE SP_Buscar_Paciente_por_texto
@TEXTO VARCHAR(255)
AS
SELECT Nombre_pe, Apellido_pe, DNI_pe, IdSexo_pe, NombreProvincia_pro, NombreLocalidad,
FechaNacimiento_pe, Direccion_pe, Email_pe, Telefono_pe, IdPaciente_pa
FROM Pacientes INNER JOIN Personas
ON DNI_pa = DNI_pe INNER JOIN Localidades
ON IdLocalidad_pe = IdLocalidad_lo INNER JOIN Provincias
ON IdProvincia_lo = IdProvincia_pro
WHERE 
Nombre_pe LIKE '%' + @TEXTO + '%' OR
Apellido_pe LIKE '%' + @TEXTO + '%' OR
DNI_pe LIKE '%' + @TEXTO + '%' OR
IdSexo_pe LIKE '%' + @TEXTO + '%' OR
NombreProvincia_pro LIKE '%' + @TEXTO + '%' OR
NombreLocalidad LIKE '%' + @TEXTO + '%' OR
FechaNacimiento_pe LIKE '%' + @TEXTO + '%'OR
Direccion_pe LIKE '%' + @TEXTO + '%'OR
Email_pe LIKE '%' + @TEXTO + '%'OR
Telefono_pe LIKE '%' + @TEXTO + '%'OR
IdPaciente_pa LIKE '%' + @TEXTO + '%'
GO


EXEC SP_Buscar_Paciente_por_texto 'pe'

-------------------------------------------------------------------------------------------------------------------------------


CREATE OR ALTER PROCEDURE SP_ActualizarPaciente_Personas -- EDITA LOS DATOS DE LA TABLA PERSONA VINCULADA AL PACIENTE
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

------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE SP_ObtenerFechaNacimiento
@DNI CHAR(8)
AS
SELECT FechaNacimiento_pe 
FROM Personas
WHERE DNI_pe = @DNI
GO


------------------------------------------------------------------------------------------------------------------------------------


CREATE OR ALTER PROCEDURE SP_CargarMedicoPorEspecialidad
@IdEspecialidad CHAR(2)
AS
SELECT (Apellido_pe + ' ' + Nombre_pe) AS  NombreCompleto, DNI_me
FROM Personas INNER JOIN Medicos
ON DNI_pe = DNI_me INNER JOIN Especialidades
ON IdEspecialidad_me = IdEspecialidad_esp
WHERE IdEspecialidad_esp = @IdEspecialidad AND Activo_me = 1
GO


----------------------------------------------------------------------------------------------------------------------------------------


CREATE OR ALTER PROCEDURE SP_CargarGrillaMedicoPorDni
@DNI_MEDICO CHAR(8)
AS
SELECT Apellido_pe AS Apellido, Nombre_pe AS Nombre, NombreEspecialidad_esp AS Especialidad, NombreDia_di AS DiasAtencion, 
HoraInicio_ha AS HorarioInicio, HoraFin_ha AS HorarioFin
FROM Especialidades INNER JOIN Medicos
ON IdEspecialidad_esp = IdEspecialidad_me INNER JOIN Personas
ON DNI_me = DNI_pe INNER JOIN HorariosAtencion
ON IdMedico_ha = IdMedico_me INNER JOIN DiasAtencion
ON IdDia_di = IdDia_ha
WHERE DNI_me = @DNI_MEDICO AND Activo_me = 1 AND HorariosAtencion.Activo = 1
GO


-----------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_ObtenerPaciente
@DNI_PACIENTE CHAR(8)
AS
SELECT IdPaciente_pa
FROM Pacientes
WHERE DNI_pa = @DNI_PACIENTE
GO


----------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_ObtenerIdPacientePorDNI
@DNI_PACIENTE CHAR(8),
@ID_PACIENTE INT OUTPUT -- Parámetro de salida para el IdPaciente
AS
BEGIN
SELECT @ID_PACIENTE = IdPaciente_pa
FROM Pacientes
WHERE DNI_pa = @DNI_PACIENTE;
END


--------------------------------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE SP_AgregarTurno
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

--------------------------------------------------------------------------------------------------------------------

CREATE OR ALTER TRIGGER TRG_TURNO_DUPLICADO
ON TURNOS
INSTEAD OF INSERT
AS
BEGIN
    -- Verificar si ya existe un turno para cualquier paciente en la misma fecha y horario
    IF EXISTS (
        SELECT *
        FROM TURNOS AS t
        INNER JOIN inserted AS i
        ON t.fechaturno_TU = i.fechaturno_TU
        AND t.horaturno_TU = i.horaturno_TU
    )
    BEGIN
        -- Si existe, lanzar un error
        RAISERROR ('Ya existe un turno asignado en esa fecha y horario.', 16, 1);
    END
    ELSE
    BEGIN
        -- Verificar si la fecha y hora del turno es desde la fecha y hora actuales en adelante
        IF EXISTS (
            SELECT *
            FROM inserted AS i
            WHERE CAST(i.FechaTurno_tu AS DATETIME) + CAST(i.HoraTurno_tu AS DATETIME) < GETDATE()
        )
        BEGIN
            -- Si la fecha y hora del turno es anterior a la fecha y hora actual, lanzar un error
            RAISERROR ('No se pueden cargar turnos en fechas y horas pasadas.', 16, 1);
        END
        ELSE
        BEGIN
            -- Comprobar disponibilidad del médico
            IF EXISTS (
                SELECT *
                FROM inserted AS i
                JOIN horariosatencion AS h
                ON i.DNI_Medico_tu = h.DNI_ha
                AND (DATEPART(dw, i.FechaTurno_tu)-1) = h.IdDia_ha
                AND i.HoraTurno_tu >= h.HoraInicio_ha
                AND i.HoraTurno_tu < h.HoraFin_ha
                AND h.Activo = 1
            )
            BEGIN
                -- Si el médico está disponible, insertar el nuevo turno
                INSERT INTO turnos (IdEspecialidad_tu, IdMedico_tu, DNI_Medico_tu, DNI_Paciente_tu, IdPaciente_tu, FechaTurno_tu, HoraTurno_tu, Asistencia_tu, Observacion_tu)
                SELECT IdEspecialidad_tu, IdMedico_tu, DNI_Medico_tu, DNI_Paciente_tu, IdPaciente_tu, FechaTurno_tu, HoraTurno_tu, Asistencia_tu, Observacion_tu
                FROM inserted;
            END
            ELSE
            BEGIN
                -- Si el médico no está disponible, lanzar un error
                RAISERROR ('El médico no está disponible en esa fecha u horario.', 16, 1);
            END
        END
    END
END;
GO

------------------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_ObtenerHoraTurno
@FechaTurno date
AS
BEGIN
SELECT HoraTurno_tu as Turnos
FROM turnos
WHERE FechaTurno_tu = @FechaTurno;
END;


-----------------------------------------------------------------------------------------------------------------------------------------


/*CREATE OR ALTER PROCEDURE SP_CargarGrillaTurnos
@NOMBRE_USUARIO VARCHAR(20)
AS
SELECT Nombre_pe,Apellido_pe,DNI_Paciente_tu,CAST(FechaTurno_tu AS DATE) AS Fecha,
HoraTurno_tu, IdTurno_tu
FROM Usuarios INNER JOIN Medicos
ON idUsuario_us = IdMedico_me INNER JOIN Turnos
ON DNI_me = DNI_Medico_tu INNER JOIN Personas
ON DNI_Paciente_tu = DNI_pe
WHERE NombreUsuario_us = @NOMBRE_USUARIO
ORDER BY FechaTurno_tu ASC, HoraTurno_tu ASC
GO

EXEC SP_CargarGrillaTurnos 'MEDICO1'
*/

CREATE OR ALTER PROCEDURE SP_CargarGrillaTurnos
@ID_MEDICO INT
AS
SELECT Nombre_pe,Apellido_pe,DNI_Paciente_tu,CAST(FechaTurno_tu AS DATE) AS Fecha,
HoraTurno_tu
FROM Turnos INNER JOIN Pacientes
ON DNI_Paciente_tu = DNI_pa INNER JOIN Personas
ON DNI_pe = DNI_Paciente_tu
WHERE IdMedico_tu = @ID_MEDICO
ORDER BY FechaTurno_tu ASC, HoraTurno_tu ASC
GO

EXEC SP_CargarGrillaTurnos 1

------------------------------------------------------------------------------------------------------------------------


CREATE OR ALTER PROCEDURE SP_FiltrarTurnosDelDiaActual
@ID_MEDICO INT
AS
SELECT Nombre_pe, Apellido_pe, DNI_Paciente_tu, FechaTurno_tu AS Fecha, HoraTurno_tu
FROM Turnos INNER JOIN Personas
ON DNI_Paciente_tu = DNI_pe
WHERE CAST(FechaTurno_tu AS DATE) = CAST(GETDATE() AS DATE) 
AND IdMedico_tu = @ID_MEDICO
ORDER BY FechaTurno_tu ASC, HoraTurno_tu ASC
GO
/*
CAST(FechaTurno_tu AS DATE): Convierte FechaTurno_tu a solo la parte de la fecha.

CAST(GETDATE() AS DATE): Convierte GETDATE() a solo la parte de la fecha, 
eliminando la hora. */


EXEC SP_FiltrarTurnosDelDiaActual 1


------------------------------------------------------------------------------------------------------------------------



CREATE OR ALTER PROCEDURE SP_CargarTurnosPorFecha
@FECHA DATE
AS
SELECT Nombre_pe, Apellido_pe, DNI_Paciente_tu, FechaTurno_tu AS FECHA, HoraTurno_tu
FROM Turnos INNER JOIN Personas
ON DNI_Paciente_tu = DNI_pe
WHERE CAST(FechaTurno_tu AS DATE) = @FECHA
ORDER BY FechaTurno_tu ASC, HoraTurno_tu ASC
GO

EXEC SP_CargarTurnosPorFecha '2024-07-22'

--PRUEBA
CREATE OR ALTER PROCEDURE SP_CargarTurnosPorFecha
@FECHA DATE,
@ID_MEDICO INT
AS
SELECT Nombre_pe, Apellido_pe, DNI_Paciente_tu, FechaTurno_tu AS FECHA, HoraTurno_tu
FROM Turnos INNER JOIN Personas
ON DNI_Paciente_tu = DNI_pe INNER JOIN Pacientes
ON DNI_Paciente_tu = DNI_pa INNER JOIN Medicos
ON IdMedico_tu = IdMedico_me
WHERE CAST(FechaTurno_tu AS DATE) = @FECHA
AND IdMedico_tu = @ID_MEDICO
ORDER BY FechaTurno_tu ASC, HoraTurno_tu ASC
GO

EXEC SP_CargarTurnosPorFecha '2024-07-22',1

-------------------------------------------------------------------------------------------------------------------------------


CREATE OR ALTER PROCEDURE SP_Obtener_Historiales_Por_Texto
@NOMBRE_USUARIO VARCHAR(20),
@TEXTO VARCHAR(255)
AS
SELECT Nombre_pe, Apellido_pe, DNI_Paciente_tu, FechaTurno_tu, HoraTurno_tu, Asistencia_tu, Observacion_tu, IdTurno_tu
FROM Usuarios INNER JOIN Medicos
ON idUsuario_us = IdMedico_me INNER JOIN Turnos
ON DNI_me = DNI_Medico_tu INNER JOIN Personas
ON DNI_Paciente_tu = DNI_pe
WHERE 
NombreUsuario_us = @NOMBRE_USUARIO AND
(Nombre_pe LIKE '%' + @TEXTO + '%' OR
Apellido_pe LIKE '%' + @TEXTO + '%' OR
DNI_pe LIKE '%' + @TEXTO + '%' OR
FechaTurno_tu LIKE '%' + @TEXTO + '%' OR
HoraTurno_tu LIKE '%' + @TEXTO + '%' OR
Observacion_tu LIKE '%' + @TEXTO + '%' OR
IdTurno_tu LIKE '%' + @TEXTO + '%')
ORDER BY FechaTurno_tu ASC, HoraTurno_tu ASC
GO


EXEC SP_Obtener_Historiales_Por_Texto 'medico2','2024'

--PRUEBA
CREATE OR ALTER PROCEDURE SP_Obtener_Historiales_Por_Texto
@ID_MEDICO INT,
@TEXTO VARCHAR(255)
AS
SELECT Nombre_pe, Apellido_pe, DNI_Paciente_tu, FechaTurno_tu, HoraTurno_tu, 
Asistencia_tu, Observacion_tu, IdTurno_tu
FROM Turnos INNER JOIN Personas
ON DNI_Paciente_tu = DNI_pe INNER JOIN Pacientes
ON DNI_Paciente_tu = DNI_pa INNER JOIN Medicos
ON IdMedico_tu = IdMedico_me
WHERE 
IdMedico_tu = @ID_MEDICO AND
(Nombre_pe LIKE '%' + @TEXTO + '%' OR
Apellido_pe LIKE '%' + @TEXTO + '%' OR
DNI_pe LIKE '%' + @TEXTO + '%' OR
FechaTurno_tu LIKE '%' + @TEXTO + '%' OR
HoraTurno_tu LIKE '%' + @TEXTO + '%' OR
Observacion_tu LIKE '%' + @TEXTO + '%' OR
IdTurno_tu LIKE '%' + @TEXTO + '%')
ORDER BY FechaTurno_tu ASC, HoraTurno_tu ASC
GO

EXEC SP_Obtener_Historiales_Por_Texto 1,'2024'

------------------------------------------------------------------------------------------------------------------------------



CREATE OR ALTER PROCEDURE SP_Agregar_Asistencia_Observaciones
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

EXEC SP_Agregar_Asistencia_Observaciones '10000000',13,1,'ASDASD ASDADS'



--------------------------------------------------------------------------------------------------------


CREATE OR ALTER PROCEDURE SP_Informe_Total_Turnos
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


------------------------------------------------------------------------------------------------------

CREATE OR ALTER PROCEDURE SP_Informe_Presentes
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



-----------------------------------------------------------------------------------------------------------



CREATE OR ALTER PROCEDURE SP_Informe_Ausentes
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
-------------------------------------------------------------------------------------------------------------------------------


CREATE OR ALTER PROCEDURE SP_Obtener_Medico_Por_Nombre_Usuario
@NOMBRE_USUARIO VARCHAR(20)
AS
SELECT IdEspecialidad_me,IdMedico_me,DNI_me,IdRol_me,IdUsuario_me,Legajo_me
FROM Usuarios INNER JOIN Medicos
ON idUsuario_us = IdUsuario_me
WHERE NombreUsuario_us = @NOMBRE_USUARIO
GO 

EXEC SP_Obtener_Medico_Por_Nombre_Usuario 'Medico1'


------------------------------------------------------------------------------------