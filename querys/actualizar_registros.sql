DELIMITER //

CREATE PROCEDURE sp_actualizar_registro(
    IN p_id_registro INT,
    IN p_nombre_tabla VARCHAR(50),
    -- Agrega más parámetros según los campos que deseas actualizar
    IN p_nuevo_valor VARCHAR(50)
)
BEGIN
    -- Ajusta la actualización según tus necesidades
    -- UPDATE p_nombre_tabla SET campo1 = p_nuevo_valor WHERE id = p_id_registro;
    -- Ejemplo:
    -- UPDATE p_nombre_tabla SET nombre = p_nuevo_valor WHERE id = p_id_registro;
END //

DELIMITER ;


-- para probarlo cambir    numero por el registro q se quiere cambiar    nombre_tabl por algun de las que existen ej: afiliado/atenciones/historial_medico   ingresar nuevo valor    
CALL sp_actualizar_registro(1, 'nombre_tabla', 'NuevoValor');

