-- auditorias

CREATE TABLE log_atenciones (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    fecha DATE,
    hora TIME,
    accion_realizada VARCHAR(255)
);

CREATE TABLE log_servicio_contratado (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    fecha DATE,
    hora TIME,
    accion_realizada VARCHAR(255)
);


-- triggers

DELIMITER //

CREATE TRIGGER before_insert_atenciones
BEFORE INSERT ON atenciones
FOR EACH ROW
BEGIN
    INSERT INTO log_atenciones (user_id, fecha, hora, accion_realizada)
    VALUES (CURRENT_USER(), CURDATE(), CURTIME(), 'INSERT en atenciones');
END //

CREATE TRIGGER after_update_atenciones
AFTER UPDATE ON atenciones
FOR EACH ROW
BEGIN
    INSERT INTO log_atenciones (user_id, fecha, hora, accion_realizada)
    VALUES (CURRENT_USER(), CURDATE(), CURTIME(), 'UPDATE en atenciones');
END //

DELIMITER ;


-- Trigger servicio_contratado
DELIMITER //

CREATE TRIGGER before_delete_servicio_contratado
BEFORE DELETE ON servicio_contratado
FOR EACH ROW
BEGIN
    INSERT INTO log_servicio_contratado (user_id, fecha, hora, accion_realizada)
    VALUES (CURRENT_USER(), CURDATE(), CURTIME(), 'DELETE en servicio_contratado');
END //

CREATE TRIGGER after_insert_servicio_contratado
AFTER INSERT ON servicio_contratado
FOR EACH ROW
BEGIN
    INSERT INTO log_servicio_contratado (user_id, fecha, hora, accion_realizada)
    VALUES (CURRENT_USER(), CURDATE(), CURTIME(), 'INSERT en servicio_contratado');
END //

DELIMITER ;


-- PRUEBA PARA ATENCIONES

-- Insertar un nuevo registro en atenciones
INSERT INTO atenciones (ID_atencion, ID_afiliado, fecha, diagnostico, descripcion_atencion, profesional)
VALUES
  (6, 3, '2023-06-15 09:45:00', 'Dolor de estómago', 'Consulta médica', 'Dr. Fernandez');

INSERT INTO atenciones (ID_atencion, ID_afiliado, fecha, diagnostico, descripcion_atencion, profesional)
VALUES
  (6, 3, '2023-06-15 09:45:00', 'Dolor de estómago', 'Consulta médica', 'Dr. Fernandez');
  
  
  -- Trigger servicio_contratado
DELIMITER //

CREATE TRIGGER before_delete_servicio_contratado
BEFORE DELETE ON servicio_contratado
FOR EACH ROW
BEGIN
    INSERT INTO log_servicio_contratado (user_id, fecha, hora, accion_realizada)
    VALUES (CURRENT_USER(), CURDATE(), CURTIME(), 'DELETE en servicio_contratado');
END //

CREATE TRIGGER after_insert_servicio_contratado
AFTER INSERT ON servicio_contratado
FOR EACH ROW
BEGIN
    INSERT INTO log_servicio_contratado (user_id, fecha, hora, accion_realizada)
    VALUES (CURRENT_USER(), CURDATE(), CURTIME(), 'INSERT en servicio_contratado');
END //

DELIMITER ;

-- prueba servicio_copntratado  



-- Insertar un nuevo servicio
-- Modificar la definición de la tabla servicio_contratado
ALTER TABLE servicio_contratado
MODIFY COLUMN servicio_id INT AUTO_INCREMENT;


INSERT INTO servicio_contratado (valor_servicio, fecha_contratacion, ID_afiliado, user_id)
VALUES (1000, '2023-06-20', 1, 2); 




-- Actualizar un servicio existente
UPDATE servicio_contratado
SET valor_servicio = 1200
WHERE servicio_id = 1;

-- Eliminar un servicio existente
DELETE FROM servicio_contratado WHERE servicio_id = 1;

-- Verificar registros en log_servicio_contratado
SELECT * FROM log_servicio_contratado;
SELECT * FROM log_atenciones;