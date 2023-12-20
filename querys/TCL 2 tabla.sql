-- Comienza la transacción
START TRANSACTION;

-- Inserta ocho nuevos registros
INSERT INTO historial_medico (historial_id, ID_afiliado, Medicacion, alergias)
VALUES (6, 1, 'Aspirina', 'Ninguna'),
       (7, 2, 'Ibuprofeno', 'Polen'),
       (8, 3, 'Paracetamol', 'Penicilina'),
       (9, 4, 'Insulina', 'Ninguna'),
       (10, 5, 'Antihistamínicos', 'Ninguna'),
       (11, 1, 'Antibiótico', 'Ninguna'),
       (12, 2, 'Analgésico', 'Polen'),
       (13, 3, 'Antiacido', 'Penicilina');

-- Savepoint después de la inserción del registro #4
SAVEPOINT savepoint_4;

-- Savepoint después de la inserción del registro #8
SAVEPOINT savepoint_8;

-- Comentado: Elimina el savepoint después de los primeros 4 registros insertados (descomentar si es necesario)
-- ROLLBACK TO savepoint_4;

-- Comentado: Sentencia Rollback (descomentar para revertir cambios)
-- ROLLBACK;

-- Comentado: Sentencia Commit (descomentar para confirmar cambios)
-- COMMIT;
