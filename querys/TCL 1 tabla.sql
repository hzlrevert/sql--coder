-- Comienza la transacción
START TRANSACTION;

-- Verifica si hay registros en la tabla
IF (SELECT COUNT(*) FROM AFILIADO) > 0 THEN
    -- Elimina algunos registros (o reemplaza con inserción si no hay registros)
    DELETE FROM AFILIADO WHERE ID_afiliado = 1 OR ID_afiliado = 2;

    -- Comentado: Sentencia para re-insertar registros eliminados (si es necesario)
	INSERT INTO AFILIADO (ID_afiliado, nombre, apellido, fecha_de_nacimiento, domicilio, numero_contacto, genero, obra_social)
	VALUES (1, 'Haziel', 'revert', '1990-05-15', 'Calle A', '123456789', 'M', 'ObraSocial1'),
           (2, 'Ana', 'Gomez', '1985-08-20', 'Calle B', '987654321', 'F', 'ObraSocial2');



    -- Comentado: Sentencia Rollback (descomentar para revertir cambios)
    -- ROLLBACK;



    -- Comentado: Sentencia Commit (descomentar para confirmar cambios)
    -- COMMIT;
    
    
ELSE
    -- Si no hay registros, realiza una inserción
    INSERT INTO AFILIADO (ID_afiliado, nombre, apellido, fecha_de_nacimiento, domicilio, numero_contacto, genero, obra_social)
    VALUES (1, 'Juan', 'Perez', '1990-05-15', 'Calle A', '123456789', 'M', 'ObraSocial1'),
           (2, 'Ana', 'Gomez', '1985-08-20', 'Calle B', '987654321', 'F', 'ObraSocial2');

    -- Comentado: Sentencia Rollback (descomentar para revertir cambios)
    -- ROLLBACK;

    -- Comentado: Sentencia Commit (descomentar para confirmar cambios)
    -- COMMIT;
END IF;
