-- tabla usuarios
INSERT INTO usuarios (id_usuario, nombre_usuario, primer_apellido, segundo_apellido, identificacion, edad, correo_electronico, contrasena, direccion, numero_telefonico)
VALUES 
('USR1', 'Juan', 'Perez', 'Lopez', '123456789A', 28, 'juan.perez@email.com', 'contrasena123', 'Calle A #123', 123456789),
('USR2', 'Maria', 'Gomez', 'Ramirez', '987654321B', 35, 'maria.gomez@email.com', 'password456', 'Calle B #456', 987654321);

-- la tabla coches
INSERT INTO coches (id_coche, id_transportistas, matricula_coche, modelo_coche, color_coche)
VALUES 
('CAR1', 'TRN1', 'ABC123', 'Toyota', 'Rojo'),
('CAR2', 'TRN2', 'XYZ789', 'Honda', 'Azul');

-- tabla transportistas
INSERT INTO transportistas (id_transportista, id_coche, nombre_transportista, primer_apellido, segundo_apellido, identificacion, edad, correo_electronico, contrasena, numero_telefonico)
VALUES 
('TRN1', 'CAR1', 'Carlos', 'Fernandez', 'Lopez', '111111111A', 30, 'carlos.fernandez@email.com', 'password789', 654321987),
('TRN2', 'CAR2', 'Laura', 'Martinez', 'Garcia', '222222222B', 28, 'laura.martinez@email.com', 'pass123', 987654321);

-- tabla pagos
INSERT INTO pagos (id_pago, id_servicio, id_usuario, fecha, monto_pago)
VALUES 
('PAY1', 'SERV1', 'USR1', '2023-01-01', 50.00),
('PAY2', 'SERV2', 'USR2', '2023-02-15', 60.00);

-- la tabla evaluaciones
INSERT INTO evaluaciones (id_evaluacion, id_usuario, id_servicio, valoracion, fecha)
VALUES 
('EVAL1', 'USR1', 'SERV1', 4, '2023-01-05'),
('EVAL2', 'USR2', 'SERV2', 5, '2023-02-20');

-- tabla servicios_transporte
INSERT INTO servicios_transporte (id_servicio, id_usuario, id_transportista, id_evaluacion, id_pago, ubicacion_inicial, ubicacion_final, mercancia, fecha)
VALUES 
('SERV1', 'USR1', 'TRN1', 'EVAL1', 'PAY1', 'Ciudad A', 'Ciudad B', 'Electrodomésticos', '2023-01-01'),
('SERV2', 'USR2', 'TRN2', 'EVAL2', 'PAY2', 'Ciudad C', 'Ciudad D', 'Muebles', '2023-02-15');

-- tabla registros
INSERT into registros (id_registro, id_usuario, id_transportista)
VALUES
('REG1', 'USR1', 'TRN1'),
('REG2', 'USR2', 'TRN2');



SELECT u.nombre_usuario, COUNT(st.id_servicio) AS total_servicios
FROM usuarios u
LEFT JOIN servicios_transporte st ON u.id_usuario = st.id_usuario
GROUP BY u.nombre_usuario;

SELECT COUNT(*) AS registros
FROM registros
WHERE id_usuario