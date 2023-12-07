-- ordenar tabla
DELIMITER //

CREATE PROCEDURE sp_ordenar_tabla(
    IN p_nombre_tabla VARCHAR(50),
    IN p_campo_orden VARCHAR(50),
    IN p_tipo_orden VARCHAR(10)
)
BEGIN
    SET @sql_query = CONCAT('SELECT * FROM ', p_nombre_tabla, ' ORDER BY ', p_campo_orden, ' ', p_tipo_orden);
    PREPARE stmt FROM @sql_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;

-- para probarlo

CALL sp_ordenar_tabla('afiliado', 'nombre', 'ASC');
