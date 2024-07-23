USE TP_FINAL_PR3

CREATE TRIGGER TR_ActualizarIdEspecialidad
ON Medicos
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF UPDATE(IdEspecialidad_me)
    BEGIN
        DECLARE @OldIdEspecialidad CHAR(2);
        DECLARE @NewIdEspecialidad CHAR(2);
        DECLARE @IdMedico INT;
        DECLARE @DNI CHAR(8);

        SELECT 
            @OldIdEspecialidad = deleted.IdEspecialidad_me,
            @NewIdEspecialidad = inserted.IdEspecialidad_me,
            @IdMedico = inserted.IdMedico_me,
            @DNI = inserted.DNI_me
        FROM 
            deleted 
        INNER JOIN 
            inserted  ON deleted.IdMedico_me = inserted.IdMedico_me AND 
			deleted.DNI_me = inserted.DNI_me;

        -- Actualizar HorariosAtencion
        UPDATE HorariosAtencion
        SET IdEspecialidad_ha = @NewIdEspecialidad
        WHERE IdEspecialidad_ha = @OldIdEspecialidad
        AND IdMedico_ha = @IdMedico
        AND DNI_ha = @DNI;

        -- Actualizar Turnos
        UPDATE Turnos
        SET IdEspecialidad_tu = @NewIdEspecialidad
        WHERE IdEspecialidad_tu = @OldIdEspecialidad
        AND IdMedico_tu = @IdMedico
        AND DNI_Medico_tu = @DNI;
    END
END;
GO

EXEC SP_CargarHorariosAtencionMedico '39900211'



---------------------------------------


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
        RAISERROR ('El paciente ya tiene un turno asignado en esa fecha y horario.', 16, 1);
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
