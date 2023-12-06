DELIMITER //

CREATE FUNCTION contar_atenciones(id_afiliado INT) RETURNS INT
READS SQL DATA
BEGIN
    DECLARE cantidad_atenciones INT;
    SELECT COUNT(*) INTO cantidad_atenciones FROM atenciones WHERE ID_afiliado = id_afiliado;
    RETURN cantidad_atenciones;
END //

DELIMITER ;

-- pruebas  --- cambiar el numero (id) por el q se quiera averiguar
SELECT contar_atenciones(1) AS cantidad_atenciones;
