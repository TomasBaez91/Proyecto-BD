## AMPLIACION DE LA BASE DE DATOS
-- Creacion de nueva tabla ExperienciaAlquiler para que los usuarios nos de informacion sobre 
-- su experiencia personal en el alquiler del vehiculo
Use RentalCarx;
CREATE TABLE experiencia_alquiler (
    idExperienciaAlquiler INT PRIMARY KEY AUTO_INCREMENT, calificacion INT, comentarios TEXT, problemas TEXT );
    -- Añadimos el atributo que haga referencia al idReservas de la tabla reservas
ALTER TABLE experiencia_alquiler
ADD COLUMN reservas_idreserva INT;
 -- La convertimos a  llave foranea para que se relacione con la tabla reservas y el cliente
ALTER TABLE experiencia_alquiler
ADD CONSTRAINT fk_reserva_id FOREIGN KEY (reservas_idreserva) REFERENCES reservas(idreserva);
INSERT INTO experiencia_alquiler (reservas_idreserva, calificacion, comentarios, problemas)
VALUES (1, 5, 'Excelente experiencia', 'Ningún problema');

-- Creacion de nuevos atributos interesantes para la empresa y los clientes 
-- Vehiculos
-- Añadir Color de Vehiculo
ALTER TABLE coches
ADD COLUMN colorVehiculo Text;

-- Añadir si tiene o no aire acondicionado
ALTER TABLE coches
ADD COLUMN aireAcondicionado ENUM('Si','No');
-- Añadir numero de asientos
ALTER TABLE coches
ADD COLUMN aireAcondicionado Int;

-- Si hay coches averiados o fuera de servicio para renting
ALTER TABLE coches
ADD COLUMN disponibilidadVehiculo ENUM('Activo','Inactivo');


-- Empleados..
-- si hay empleados de baja 
ALTER TABLE empleados
ADD COLUMN estadoEmpleado ENUM('Activo','Baja');

-- si hay empleado de vacaciones
ALTER TABLE empleados
ADD COLUMN comienzoVacaciones  DATE;
ALTER TABLE empleados
ADD COLUMN finVacaciones  DATE;

-- añadir fecha contratacion
ALTER TABLE empleados
ADD COLUMN fechaContratacion DATE;

-- añadir fecha despido
ALTER TABLE empleados
ADD COLUMN fechadespido DATE;


-- Clientes...
-- Permiso de conduncir
ALTER TABLE clientes
ADD COLUMN numeroPermiso int;


## Mas adelante se podrian añadir mas datos que recojan la siguiente informacion:

-- Reservas:
-- Si algun cliente ha confirmado la reserva pero no ha recogido el vehiculo -->  un trigger pasaria  a Cancelada por no recogida pasado unas horas.
-- Si la reservas confirmadas estan activas, es decir en uso o no activas, aun no ha recibido el cliente el vehiculo
-- Si algun cliente ha causado daños en el vehiculo
-- Si el cliente ha superado los kilometros establecidos si la reserva fuera limitada

-- Departamentos: 
-- Si hay puestos vacantes

-- Sucursales:
-- Añadir gastos fijos cada de sucursal como empleados, suministros, alquileres, para llevar un control de gastos.
-- Comprobar si cada sucursal de beneficios o perdidas
