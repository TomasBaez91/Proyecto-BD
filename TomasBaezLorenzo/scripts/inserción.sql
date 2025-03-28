-- Con estas insercciones de prueba podemos realizar  una comprobación y testeo de la funciónalidad y eficacia de la base de datos

USE RENTALCARX;
-- Desactivacion temporal de llaves foraneas para la insercion de datos
SET foreign_key_checks = 0;
SET foreign_key_checks = 1;


-- Insertar promociones con fechas relacionadas a las estaciones
INSERT INTO Promociones (nombrePromocion, descuento, fechaInicio, fechaFin) VALUES
('SinPromocion', 0.00, NULL, NULL),
('descuentoVerano', 10.00, '2025-06-21', '2025-09-23'),  -- Descuento Verano, del 21 de junio al 23 de septiembre
('descuentoInvierno', 15.00, '2025-12-21', '2026-03-20'),  -- Descuento Invierno, del 21 de diciembre al 20 de marzo
('ofertaEspecial', 20.00, NULL, NULL),  -- Oferta Especial, no tiene fechas asignadas, puede ser para todo el año
('descuentoPrimavera', 12.00, '2025-03-21', '2025-06-20'),  -- Descuento Primavera
('descuentoOtoño', 8.00, '2025-09-23', '2025-12-20'),      -- Descuento Otoño
('ofertaNavidad', 25.00, '2025-12-01', '2025-12-31');        -- Oferta Navidad
SELECT* FROM PROMOCIONES;

-- Insertar  de  clientes 
INSERT INTO Clientes (nombreCliente, direccionCliente, emailCliente, nacionalidadCliente, numeroTarjetaCredito, telefonoCliente, fechaNacimiento, puntosCliente, tipoCliente, identificacion) VALUES
('Juan Pérez', 'Calle Falsa 123, Madrid, España', 'juan.perez@mail.com', 'Española', 1234567812345678, 123456789, '1990-05-12', 500, 'frecuente', '123456789G'), 
('Ana García', 'Avenida de la Constitución 45, Sevilla, España', 'ana.garcia@mail.com', 'Española', 8765432187654321, 876543210, '1985-03-22', 400, 'frecuente', '234567890F'),  
('Carlos Sánchez', 'Calle Mayor 30, Valencia, España', 'carlos.sanchez@mail.com', 'Española', 2345678923456789, 234567890, '1992-11-04', 300, 'frecuente', '345678901'),  
('Lucía Rodríguez', 'Carrer del Nord 60, Barcelona, España', 'lucia.rodriguez@mail.com', 'Española', 3456789034567890, 345678901, '1988-06-15', 0, 'nuevo', '456789012R'), 
('Pedro López', 'Calle de los Olivos 22, Granada, España', 'pedro.lopez@mail.com', 'Española', 4567890145678901, 456789012, '1995-07-20', 0, 'nuevo', '567890123D'), 
('María López', 'Calle Falsa 45, Madrid, España', 'maria.lopez@mail.com', 'Española', 9876543212345678, 911234567, '1992-10-12', 500, 'frecuente', '112233445Z'),  
('Fernando Pérez', 'Avenida Alcalá 88, Madrid, España', 'fernando.perez@mail.com', 'Española', 8765432109876543, 922345678, '1986-07-25', 200, 'frecuente', '223344556Y'),
('Laura Sánchez', 'Carrer de Pau 12, Valencia, España', 'laura.sanchez@mail.com', 'Española', 2345678901234567, 963852741, '1994-11-30', 50, 'nuevo', '334455667X'), 
('Carlos Gómez', 'Calle 30, Sevilla, España', 'carlos.gomez@mail.com', 'Española', 3456789012345678, 945678901, '1980-03-05', 350, 'frecuente', '445566778W'), 
('Isabel Martín', 'Carrer de Muntanya 25, Barcelona, España', 'isabel.martin@mail.com', 'Española', 4567890123456789, 976543210, '1995-02-22', 150, 'nuevo', '556677889V'), 
('José Martínez', 'Calle Gran Vía 15, Madrid, España', 'jose.martinez@mail.com', 'Española', 1122334455667788, 912345678, '1990-08-12', 0, 'nuevo', '123123456H'),
('Laura Fernández', 'Avenida de la Paz 22, Madrid, España', 'laura.fernandez@mail.com', 'Española', 2233445566778899, 923456789, '1995-12-09', 0, 'nuevo', '234234567K'),
('Miguel Álvarez', 'Carrer de Pau 13, Barcelona, España', 'miguel.alvarez@mail.com', 'Española', 3344556677889900, 934567890, '1987-06-21', 0, 'nuevo', '345345678L'),
('Pedro Gómez', 'Calle de San Pedro 8, Valencia, España', 'pedro.gomez@mail.com', 'Española', 4455667788990011, 945678901, '1983-04-15', 0, 'nuevo', '456456789M'),
('Elena Rodríguez', 'Carrer de Gran de Gracia 30, Barcelona, España', 'elena.rodriguez@mail.com', 'Española', 5566778899001122, 956789012, '1992-11-25', 0, 'nuevo', '567567890N'),
('Francisco López', 'Avenida del Mar 45, Valencia, España', 'francisco.lopez@mail.com', 'Española', 6677889900112233, 967890123, '1996-01-20', 0, 'nuevo', '678678901O'),
('Ana Sánchez', 'Calle del Sol 11, Sevilla, España', 'ana.sanchez@mail.com', 'Española', 7788990011223344, 978901234, '1993-05-02', 0, 'nuevo', '789789012P'),
('Carlos Pérez', 'Carrer de la Pau 45, Valencia, España', 'carlos.perez@mail.com', 'Española', 8899001122334455, 989012345, '1989-09-18', 0, 'nuevo', '890890123Q'),
('Beatriz Martín', 'Calle de la Princesa 17, Madrid, España', 'beatriz.martin@mail.com', 'Española', 9900112233445566, 912345678, '1991-10-03', 0, 'nuevo', '901901234R'),
('José Luis García', 'Avenida Andalucía 50, Sevilla, España', 'jose.garcia@mail.com', 'Española', 1001122334456677, 923456789, '1988-07-11', 0, 'nuevo', '012345678S');  

SELECT* FROM CLIENTES;


-- Insertado de  sucursales
INSERT INTO Sucursales (nombreSucursal, telefonoSucursal, direccionSucursal, numeroCoches, numeroEmpleados) VALUES
('Sucursal Madrid', 912345678, 'Calle Mayor 1, Madrid', 20, 5),
('Sucursal Barcelona', 932345678, 'Carrer de Sant Joan 45, Barcelona', 15, 4),
('Sucursal Valencia', 952345678, 'Avenida de la Constitución 10, Valencia', 10, 3),
('Sucursal Sevilla', 953456789, 'Avenida de Andalucía 33, Sevilla', 25, 6),
('Sucursal Bilbao', 944567890, 'Calle de Abando 55, Bilbao', 18, 5);

SELECT* FROM SUCURSALES;


-- Insertardo de  departamentos
INSERT INTO Departamento (nombreDepartamento, sucursales_idSucursal) VALUES
('Ventas', 1),      
('Mantenimiento', 1),
('Ventas', 2),         
('Mantenimiento', 2), 
('Ventas', 3),         
('Administración', 3),
('Administración', 3),   
('Marketing', 4),         
('Soporte Técnico', 5);     

SELECT* FROM DEPARTAMENTO;


-- Insertardo de empleados en cada sucursal y departamento asignado
INSERT INTO Empleados (nombreEmpleado, telefonoEmpleado, sucursales_idSucursal, departamento_idDepartamento) VALUES
('Juan Pérez', 612345678, 1, 2),  
('Ana García', 623456789, 1,1),  
('Carlos Sánchez', 634567890, 2, 3),  
('Marta López', 645678901, 2, 3),  
('Pedro Rodríguez', 656789012, 3, 5), 
('José Torres', 612345679, 2, 6),  
('Raquel Martínez', 623456780, 4, 7),  
('Alberto López', 634567891, 2, 8),
('Nuria González', 645678902, 1, 9), 
('David Pérez', 656789013, 5, 9), 
('Mónica Ruiz', 667890124, 1, 5),
('Carlos Soto', 678901235, 2, 7);  

SELECT* FROM EMPLEADOS;


-- Insertar de vehiculos con sucursales asignadas
INSERT INTO Coches (estadoVehiculo, marca, modelo, combustible, aireAcondicionado, transmicion, kilometros, precioPorDia, matricula, sucursales_idSucursal) VALUES
('sinAlquilar', 'Honda', 'Civic', 'gasolina', 'SI', 'manual', 35000, 35.00, '1122ABC', 1),
('Alquilado', 'Nissan', 'Qashqai', 'diesel', 'NO', 'automatica', 90000, 55.00, '2233DEF', 2),
('sinAlquilar', 'Mazda', 'CX-5', 'gasolina', 'SI', 'manual', 45000, 50.00, '3344GHI', 3),
('enMantenimiento', 'BMW', 'X5', 'diesel', 'NO', 'automatica', 120000, 80.00, '4455JKL', 4),
('Alquilado', 'Mercedes', 'GLK', 'diesel', 'SI', 'manual', 60000, 60.00, '5566MNO', 5),
('sinAlquilar', 'Toyota', 'Corolla', 'gasolina', 'SI', 'manual', 20000, 40.00, '1122XYZ', 1),
('Alquilado', 'Ford', 'Focus', 'diesel', 'NO', 'automatica', 50000, 55.00, '2233XYZ', 2),
('enMantenimiento', 'Chevrolet', 'Cruze', 'gasolina', 'SI', 'manual', 75000, 45.00, '3344XYZ', 3),
('sinAlquilar', 'Audi', 'A4', 'diesel', 'SI', 'automatica', 30000, 65.00, '4455XYZ', 4),
('Alquilado', 'BMW', '320', 'gasolina', 'SI', 'manual', 40000, 70.00, '5566XYZ', 5),
('sinAlquilar', 'Peugeot', '208', 'gasolina', 'SI', 'manual', 15000, 35.00, '1122XYZ', 1),
('sinAlquilar', 'Fiat', 'Panda', 'diesel', 'NO', 'automatica', 23000, 40.00, '2233ABC', 2),
('enMantenimiento', 'Renault', 'Clio', 'gasolina', 'SI', 'manual', 30000, 42.00, '3344DEF', 3),
('sinAlquilar', 'Volkswagen', 'Golf', 'diesel', 'NO', 'automatica', 27000, 50.00, '4455GHI', 4),
('sinAlquilar', 'Ford', 'Fiesta', 'gasolina', 'SI', 'manual', 35000, 45.00, '5566JKL', 5),
('enMantenimiento', 'Chevrolet', 'Aveo', 'diesel', 'NO', 'manual', 15000, 38.00, '6677MNO', 6),
('sinAlquilar', 'Hyundai', 'i30', 'gasolina', 'SI', 'automatica', 20000, 48.00, '7788PQR', 7),
('sinAlquilar', 'Nissan', 'Micra', 'diesel', 'NO', 'manual', 25000, 55.00, '8899STU', 8),
('enMantenimiento', 'BMW', 'Serie 1', 'gasolina', 'SI', 'automatica', 45000, 65.00, '9900VWX', 9),
('sinAlquilar', 'Audi', 'A3', 'diesel', 'SI', 'manual', 28000, 60.00, '1001YZA', 10);

SELECT* FROM COCHES;

-- Insertado de reservas
INSERT INTO Reservas (costoTotal, kilometraje, estadoReserva, fechaReserva, fechaFinReserva, metodoPago, empleados_idEmpleado, clientes_idCliente, coches_idCoche, precioFinal, diasReservados, promociones_idPromociones,sucursales_idSucursal)VALUES
    (55 * DATEDIFF('2025-03-18', '2025-03-12'), 'ilimitado', 'confirmada', '2025-03-12 09:00:00', '2025-03-18 09:00:00', 'TRANSFERENCIA', 2, 2, 2, 
    (55.00 * DATEDIFF('2025-03-18', '2025-03-12')) - ((55.00 * DATEDIFF('2025-03-18', '2025-03-12')) * (SELECT descuento FROM Promociones WHERE idPromociones = 2)/100), 
    DATEDIFF('2025-03-18', '2025-03-12'), 4,1),  -- Ana García
    
  (70 * DATEDIFF('2025-03-20', '2025-03-15'), 'limitado', 'confirmada', '2025-03-15 10:00:00', '2025-03-20 10:00:00', 'TRANSFERENCIA', 3, 3, 3, 
    (70.00 * DATEDIFF('2025-03-20', '2025-03-15')) - ((70.00 * DATEDIFF('2025-03-20', '2025-03-15')) * (SELECT descuento FROM Promociones WHERE idPromociones = 3)/100), 
    DATEDIFF('2025-03-20', '2025-03-15'), 3,2),  -- Carlos Sánchez
    
  (60 * DATEDIFF('2025-03-25', '2025-03-22'), 'ilimitado', 'confirmada', '2025-03-22 08:00:00', '2025-03-25 08:00:00', 'TRANSFERENCIA', 4, 4, 4, 
    (60.00 * DATEDIFF('2025-03-25', '2025-03-22')) - ((60.00 * DATEDIFF('2025-03-25', '2025-03-22')) * (SELECT descuento FROM Promociones WHERE idPromociones = 1)/100), 
    DATEDIFF('2025-03-25', '2025-03-22'), 1,2),  -- Lucía Rodríguez
    
  (50 * DATEDIFF('2025-03-18', '2025-03-12'), 'ilimitado', 'confirmada', '2025-03-12 09:00:00', '2025-03-18 09:00:00', 'TRANSFERENCIA', 2, 5, 5, 
    (50.00 * DATEDIFF('2025-03-18', '2025-03-12')) - ((50.00 * DATEDIFF('2025-03-18', '2025-03-12')) * (SELECT descuento FROM Promociones WHERE idPromociones = 4)/100), 
    DATEDIFF('2025-03-18', '2025-03-12'), 4,2),  -- Pedro López	5
    
  (100 * DATEDIFF('2025-03-22', '2025-03-15'), 'limitado', 'confirmada', '2025-03-15 10:00:00', '2025-03-22 10:00:00', 'TRANSFERENCIA', 3, 6, 6, 
    (100.00 * DATEDIFF('2025-03-22', '2025-03-15')) - ((100.00 * DATEDIFF('2025-03-22', '2025-03-15')) * (SELECT descuento FROM Promociones WHERE idPromociones = 2)/100), 
    DATEDIFF('2025-03-22', '2025-03-15'), 4,1),  -- María López
    
  (120 * DATEDIFF('2025-03-25', '2025-03-20'), 'ilimitado', 'confirmada', '2025-03-20 09:00:00', '2025-03-25 09:00:00', 'TRANSFERENCIA', 2, 7, 7, 
    (120.00 * DATEDIFF('2025-03-25', '2025-03-20')) - ((120.00 * DATEDIFF('2025-03-25', '2025-03-20')) * (SELECT descuento FROM Promociones WHERE idPromociones = 5)/100), 
    DATEDIFF('2025-03-25', '2025-03-20'), 5,2),  -- Fernando Pérez
    
  (110 * DATEDIFF('2025-03-22', '2025-03-18'), 'ilimitado', 'confirmada', '2025-03-18 08:00:00', '2025-03-22 08:00:00', 'TRANSFERENCIA', 2, 8, 8, 
    (110.00 * DATEDIFF('2025-03-22', '2025-03-18')) - ((110.00 * DATEDIFF('2025-03-22', '2025-03-18')) * (SELECT descuento FROM Promociones WHERE idPromociones = 4)/100), 
    DATEDIFF('2025-03-22', '2025-03-18'), 4,2),  -- Laura Sánchez
    
  (90 * DATEDIFF('2025-03-20', '2025-03-16'), 'ilimitado', 'confirmada', '2025-03-16 09:00:00', '2025-03-20 09:00:00', 'TRANSFERENCIA', 2, 9, 9, 
    (90.00 * DATEDIFF('2025-03-20', '2025-03-16')) - ((90.00 * DATEDIFF('2025-03-20', '2025-03-16')) * (SELECT descuento FROM Promociones WHERE idPromociones = 2)/100), 
    DATEDIFF('2025-03-20', '2025-03-16'), 4,1),  -- Carlos Gómez
    
  (80 * DATEDIFF('2025-03-23', '2025-03-18'), 'ilimitado', 'confirmada', '2025-03-18 09:00:00', '2025-03-23 09:00:00', 'TRANSFERENCIA', 2, 10, 10, 
    (80.00 * DATEDIFF('2025-03-23', '2025-03-18')) - ((80.00 * DATEDIFF('2025-03-23', '2025-03-18')) * (SELECT descuento FROM Promociones WHERE idPromociones = 5)/100), 
    DATEDIFF('2025-03-23', '2025-03-18'), 7,3),  -- Isabel Martín
    
  (95 * DATEDIFF('2025-03-25', '2025-03-22'), 'ilimitado', 'confirmada', '2025-03-22 09:00:00', '2025-03-25 09:00:00', 'TRANSFERENCIA', 2, 11, 11, 
    (95.00 * DATEDIFF('2025-03-25', '2025-03-22')) - ((95.00 * DATEDIFF('2025-03-25', '2025-03-22')) * (SELECT descuento FROM Promociones WHERE idPromociones = 3)/100), 
    DATEDIFF('2025-03-25', '2025-03-22'), 6,4),  -- José Martínez
      (95 * DATEDIFF('2025-08-25', '2025-08-22'), 'ilimitado', 'confirmada', '2025-08-22 09:00:00', '2025-08-25 09:00:00', 'TRANSFERENCIA', 2, 1, 11, 
    (95.00 * DATEDIFF('2025-08-25', '2025-08-22')) - ((95.00 * DATEDIFF('2025-08-25', '2025-08-22')) * (SELECT descuento FROM Promociones WHERE idPromociones = 3)/100), 
    DATEDIFF('2025-08-25', '2025-08-22'), 6,3),  -- José Martínez
    
    
  (85 * DATEDIFF('2025-03-30', '2025-03-26'), 'ilimitado', 'confirmada', '2025-03-26 09:00:00', '2025-03-30 09:00:00', 'TRANSFERENCIA', 2, 12, 12, 
    (85.00 * DATEDIFF('2025-03-30', '2025-03-26')) - ((85.00 * DATEDIFF('2025-03-30', '2025-03-26')) * (SELECT descuento FROM Promociones WHERE idPromociones = 1)/100), 
    DATEDIFF('2025-03-30', '2025-03-26'), 6,2),  -- Laura Fernández
     (55 * DATEDIFF('2025-06-18', '2025-06-12'), 'ilimitado', 'confirmada', '2025-06-12 09:00:00', '2025-06-18 09:00:00', 'TRANSFERENCIA', 2, 2, 2, 
    (55.00 * DATEDIFF('2025-06-18', '2025-06-12')) - ((55.00 * DATEDIFF('2025-06-18', '2025-06-12')) * (SELECT descuento FROM Promociones WHERE idPromociones = 2)/100), 
    DATEDIFF('2025-06-18', '2025-06-12'),2, 4);  -- Juan Pérez
SELECT* FROM RESERVAS;
