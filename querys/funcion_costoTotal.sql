DELIMITER //

CREATE FUNCTION calcular_costo_total_servicios(id_afiliado INT) RETURNS INT
READS SQL DATA
BEGIN
    DECLARE total_costo INT;
    SELECT SUM(valor_servicio) INTO total_costo FROM servicio_contratado WHERE ID_afiliado = id_afiliado;
    RETURN total_costo;
END //

DELIMITER ;

-- pruebas  --- cambiar el numero (id) por el q se quiera averiguar
SELECT calcular_costo_total_servicios(1) AS costo_total_servicios;
