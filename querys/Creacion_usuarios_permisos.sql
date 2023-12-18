

-- USUARIOS

-- Crear usuario solo_lectura
CREATE USER 'usuario_lectura'@'localhost' IDENTIFIED BY 'contrasena_lectura';

-- Crear usuario lectura_escritura
CREATE USER 'usuario_lectura_escritura'@'localhost' IDENTIFIED BY 'contrasena_lectura_escritura';





-- PERMISOS

-- Usuario solo_lectura
GRANT SELECT ON ser_emerg.* TO 'usuario_lectura'@'localhost';

-- Usuario lectura_escritura
GRANT SELECT, INSERT, UPDATE ON ser_emerg.* TO 'usuario_lectura_escritura'@'localhost';

-- Restringir la eliminación para ambos usuarios
REVOKE DELETE ON ser_emerg.* FROM 'usuario_lectura'@'localhost';
REVOKE DELETE ON ser_emerg.* FROM 'usuario_lectura_escritura'@'localhost';




