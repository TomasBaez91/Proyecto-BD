--  Trigger para actualizar el estado del vehículo al ser alquilado - VERIFICADO
DELIMITER $$
CREATE TRIGGER Actualizar_Estado_Vehiculo_Alquilado
AFTER INSERT ON reservas
FOR EACH ROW
BEGIN UPDATE coches
SET estadoVehiculo = 'alquilado' WHERE idcoche = NEW.coches_idCoche;
END $$
DELIMITER ;


--  Trigger para actualizar el estado del vehículo al ser devuelto - VERIFICADO
DELIMITER $$
CREATE TRIGGER Actualizar_Estado_Vehiculo_Devuelto
AFTER UPDATE ON reservas
FOR EACH ROW BEGIN
IF NEW.fechafinreserva IS NOT NULL AND OLD.fechafinreserva IS NULL THEN
UPDATE coches SET estadoVehiculo = 'SinAlquilar'
WHERE idcoche = NEW.coches_idCoche;
END IF;
END $$
DELIMITER ;


-- Trigger para verificar si el vehículo está disponible antes de realizar un alquiler - VERIFICADO
DELIMITER $$
CREATE TRIGGER Comprobar_Disponibilidad
BEFORE INSERT ON reservas
FOR EACH ROW BEGIN
DECLARE vehiculo_disponible INT;

-- Verificar si el vehículo ya está reservado 
SELECT COUNT(*) INTO vehiculo_disponible
FROM reservas
WHERE coches_idCoche = NEW.coches_idCoche  AND (
(NEW.fechaReserva BETWEEN fechaReserva AND fechafinreserva) 
OR
(NEW.fechaFinReserva BETWEEN fechaReserva AND fechafinreserva));
IF vehiculo_disponible > 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El vehículo ya está alquilado.';
END IF;
END $$
DELIMITER ;


-- Trigger para verificar si el vehículo está en mantenimiento y no pueda alquilarse - VERIFICADO
DELIMITER $$
CREATE TRIGGER Comprobar_Vehiculo_Operativo
BEFORE INSERT ON reservas
FOR EACH ROW BEGIN
IF (SELECT estadoVehiculo FROM coches WHERE coches_idcoche = NEW.coches_idCoche) = 'Mantenimiento' THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El vehículo está en mantenimiento y no puede ser alquilado.';
END IF;
END$$
DELIMITER ;


-- Trigger cuando una reserva es Cancelada -- No se como verificarlo :( no puedo cancelar reservas
DELIMITER $$
CREATE TRIGGER Actualizar_Estado_De_Reserva_Cancelada
AFTER DELETE ON reservas
FOR EACH ROW BEGIN
UPDATE coches SET estadoVehiculo = 'Disponible'
WHERE idcoche = OLD.coches_idCoche;
END $$
DELIMITER ;


-- Trigger para comprobar  que el cliente tiene mayoria de edad para alquilar
DELIMITER $$
CREATE TRIGGER Comprobar_Mayoria_Edad
BEFORE INSERT ON reservas
FOR EACH ROW BEGIN
IF TIMESTAMPDIFF(YEAR, (SELECT fechaNacimiento FROM clientes WHERE clientes.idcliente = NEW.clientes.idCliente), CURDATE()) < 18 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no cumple con la edad mínima para alquilar un vehículo.';
END IF;
END $$
DELIMITER ;


-- Trigger para registrar la fecha de contratación:
DELIMITER $$
CREATE TRIGGER Registrar_Fecha_Contratacion
BEFORE INSERT ON empleados
FOR EACH ROW BEGIN
-- Si no se ha proporcionado fecha de contratación, registrar la fecha actual
IF NEW.fechaContratacion IS NULL THEN SET NEW.fechaContratacion = CURDATE();
END IF;
END $$
DELIMITER ;



