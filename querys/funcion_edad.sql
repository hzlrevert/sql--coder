DELIMITER //

CREATE FUNCTION calcular_edad(fecha_nacimiento DATE) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE edad INT;
    SET edad = YEAR(CURDATE()) - YEAR(fecha_nacimiento) - 
               (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(fecha_nacimiento, '%m%d'));
    RETURN edad;
END //

DELIMITER ;

-- pruebas  
 SELECT nombre, apellido, calcular_edad(fecha_de_nacimiento) AS edad FROM AFILIADO;



