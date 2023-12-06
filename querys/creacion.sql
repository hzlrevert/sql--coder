
CREATE DATABASE ser_emerg;
use ser_emerg;
CREATE TABLE AFILIADO (
    ID_afiliado INT PRIMARY KEY,
    nombre VARCHAR(20),
    apellido VARCHAR(20),
    fecha_de_nacimiento DATE,
    domicilio VARCHAR(20),
    numero_contacto VARCHAR(20),
    genero VARCHAR(2),
    obra_social VARCHAR(20)
);



CREATE TABLE atenciones (
    ID_atencion INT PRIMARY KEY not null,
    ID_afiliado INT not null,
    fecha timestamp,
    diagnostico VARCHAR(100),
    descripcion_atencion TEXT,
    profesional VARCHAR(20),
    FOREIGN KEY (ID_afiliado) REFERENCES AFILIADO(ID_afiliado)
);



CREATE TABLE servicio_contratado (
    servicio_id INT PRIMARY KEY not null,
    valor_servicio INT ,
    fecha_contratacion DATE,
    ID_afiliado INT not null,
    FOREIGN KEY (ID_afiliado) REFERENCES AFILIADO(ID_afiliado)
);

CREATE TABLE historial_medico (
    historial_id INT PRIMARY KEY not null,
    ID_afiliado INT not null,
    Medicacion TEXT,
    alergias TEXT,
    FOREIGN KEY (ID_afiliado) REFERENCES AFILIADO(ID_afiliado)
);


CREATE TABLE hospital_de_cabecera (
    ID_afiliado INT not null,
    Hospital_internacion VARCHAR(100),
    FOREIGN KEY (ID_afiliado) REFERENCES AFILIADO(ID_afiliado)
);


INSERT INTO AFILIADO (ID_afiliado, nombre, apellido, fecha_de_nacimiento, domicilio, numero_contacto, genero, obra_social)
VALUES
  (1, 'Juan', 'Perez', '1990-05-15', 'Calle A', '123456789', 'M', 'osde'),
  (2, 'Ana', 'Gomez', '1985-08-20', 'Calle B', '987654321', 'F', 'asssp'),
  (3, 'Carlos', 'Rodriguez', '1992-02-10', 'Calle C', '555666777', 'M', 'osppr'),
  (4, 'Maria', 'Lopez', '1980-12-01', 'Calle D', '111222333', 'F', 'osrt'),
  (5, 'Pedro', 'Martinez', '1988-07-25', 'Calle E', '999888777', 'M', 'ObraSocial');

-- Datos para la tabla atenciones
INSERT INTO atenciones (ID_atencion, ID_afiliado, fecha, diagnostico, descripcion_atencion, profesional)
VALUES
  (1, 1, '2023-01-15 10:30:00', 'Fiebre', 'Consulta de rutina', 'Dr. Ramirez'),
  (2, 2, '2023-02-20 14:45:00', 'Dolor de cabeza', 'Examen neurológico', 'Dra. Gonzalez'),
  (3, 3, '2023-03-05 09:15:00', 'Presión alta', 'Control de presión', 'Dr. Fernandez'),
  (4, 4, '2023-04-10 11:00:00', 'Alergia', 'Tratamiento para alergia', 'Dra. Martinez'),
  (5, 5, '2023-05-12 15:30:00', 'Dolor de espalda', 'Radiografía de espalda', 'Dr. Rodriguez');

-- Datos para la tabla servicio_contratado
INSERT INTO servicio_contratado (servicio_id, valor_servicio, fecha_contratacion, ID_afiliado)
VALUES
  (1, 500, '2022-12-01', 1),
  (2, 800, '2023-01-10', 2),
  (3, 600, '2023-02-20', 3),
  (4, 900, '2023-03-15', 4),
  (5, 700, '2023-04-25', 5);

-- Datos para la tabla historial_medico
INSERT INTO historial_medico (historial_id, ID_afiliado, Medicacion, alergias)
VALUES
  (1, 1, 'Paracetamol', 'Ninguna'),
  (2, 2, 'Aspirina', 'Polen'),
  (3, 3, 'Insulina', 'Penicilina'),
  (4, 4, 'Antihistamínicos', 'Ninguna'),
  (5, 5, 'Ibuprofeno', 'Ninguna');

-- Datos para la tabla hospital_de_cabecera
INSERT INTO hospital_de_cabecera (ID_afiliado, Hospital_internacion)
VALUES
  (1, 'Hospital COrdoba'),
  (2, 'Hospital provincial'),
  (3, 'Instituto de cardiologia'),
  (4, 'Centro medico Urca'),
  (5, 'Hospital ');
  
  -- Vistas, nueva entrega
  
  CREATE VIEW vista_datos_afiliados AS
SELECT ID_afiliado, nombre, apellido, fecha_de_nacimiento, genero, obra_social
FROM AFILIADO;
  
  
-- vista Historial medico
CREATE VIEW vista_historial_completo AS
SELECT h.historial_id, a.ID_afiliado, a.nombre, a.apellido, h.Medicacion, h.alergias
FROM historial_medico h
JOIN AFILIADO a ON h.ID_afiliado = a.ID_afiliado;

-- atenciones por afiliado
CREATE VIEW vista_ultima_atencion AS
SELECT at.ID_afiliado, af.nombre, af.apellido, MAX(at.fecha) AS ultima_fecha_atencion
FROM atenciones at
JOIN AFILIADO af ON at.ID_afiliado = af.ID_afiliado
GROUP BY at.ID_afiliado, af.nombre, af.apellido;




-- servicios superiores a 600 pesos

CREATE VIEW vista_servicios_costosos AS
SELECT s.servicio_id, a.ID_afiliado, a.nombre, a.apellido, s.valor_servicio
FROM servicio_contratado s
JOIN AFILIADO a ON s.ID_afiliado = a.ID_afiliado
WHERE s.valor_servicio > 600;

-- vista de hospitales

CREATE VIEW vista_afiliados_con_hospital AS
SELECT h.ID_afiliado, a.nombre, a.apellido, h.Hospital_internacion
FROM hospital_de_cabecera h
JOIN AFILIADO a ON h.ID_afiliado = a.ID_afiliado;


-- ver los resultados de las vistas
SELECT * FROM vista_datos_afiliados;

SELECT * FROM vista_historial_completo;

SELECT * FROM vista_ultima_atencion;

SELECT * FROM vista_servicios_costosos;

SELECT * FROM vista_afiliados_con_hospital;

-- funciones

DELIMITER //

CREATE FUNCTION calcular_edad(fecha_nacimiento DATE) RETURNS INT
BEGIN
    DECLARE edad INT;
    SET edad = YEAR(CURDATE()) - YEAR(fecha_nacimiento) - 
               (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(fecha_nacimiento, '%m%d'));
    RETURN edad;
END //

DELIMITER ;


