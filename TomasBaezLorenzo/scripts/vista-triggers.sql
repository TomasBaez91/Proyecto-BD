-- Vistas 
Use RentalCarx;

-- Vista de Ingresos Mensuales de Cada Sucursal
CREATE VIEW Ingresos_Mensuales_Sucursales AS
SELECT s.nombreSucursal AS Sucursal, YEAR(r.fechaReserva) AS Año, 
MONTH(r.fechaReserva) AS Mes, SUM(r.costoTotal) AS Ingresos_Mensuales
FROM Reservas r
JOIN Sucursales s ON s.idSucursal = r.sucursales_idSucursal
WHERE r.estadoReserva = 'confirmada'
GROUP BY s.nombreSucursal, YEAR(r.fechaReserva), MONTH(r.fechaReserva)
ORDER BY Año DESC, Mes DESC, s.nombreSucursal;

-- Vista para conocer que meses se alquilan mas vehiculos y en que sucursal
CREATE VIEW Coches_Alquilados_Cada_Mes AS
SELECT s.nombreSucursal AS Sucursal, YEAR(r.fechaReserva) AS Año, 
MONTH(r.fechaReserva) AS Mes, COUNT(r.idReserva) AS Coches_Alquilados_Mensuales
FROM Reservas r
JOIN Sucursales s ON s.idSucursal = r.sucursales_idSucursal
WHERE r.estadoReserva = 'confirmada'
GROUP BY s.nombreSucursal, YEAR(r.fechaReserva), MONTH(r.fechaReserva)
ORDER BY Año DESC, Mes DESC, s.nombreSucursal;


-- Vista con listado de Empleados en cada Sucursal
CREATE VIEW Empleados_Sucursal AS
SELECT s.nombreSucursal AS Sucursal,e.idempleado,  e.nombreEmpleado AS Nombre_Empleado, d.nombreDepartamento AS Departamento
FROM Empleados e
JOIN Sucursales s ON s.idSucursal = e.sucursales_idSucursal
JOIN Departamento d ON d.idDepartamento = e.departamento_iddepartamento
GROUP BY s.nombreSucursal, e.idEmpleado, e.nombreEmpleado, d.nombreDepartamento;


-- Vista  con listado de reservas confirmadas
CREATE VIEW Reservas_Confirmadas AS
SELECT r.idReserva, cl.nombreCliente, cl.telefonoCliente, co.marca, co.modelo, 
r.fechaReserva, r.fechaFinReserva, r.estadoReserva
FROM Reservas r
JOIN Clientes cl ON r.clientes_idcliente = cl.idCliente
JOIN Coches co ON r.coches_idcoche = co.idCoche
WHERE r.estadoReserva = 'confirmada';


-- Vista de Coches que aun no han sido reservados y estan disponibles sin reserva ( por ejemplo en la oficina de un aeropuerto)
 CREATE VIEW Coches_Disponibles AS
SELECT co.idCoche, co.marca, co.modelo, s.nombreSucursal
FROM Coches co
JOIN Sucursales s ON co.sucursales_idsucursal = s.idSucursal
WHERE co.estadoVehiculo = 'SinAlquilar' AND NOT EXISTS (
    SELECT 1 FROM Reservas r
    WHERE r.coches_idcoche= co.idCoche AND r.estadoReserva = 'confirmada'
    AND (r.fechaReserva <= CURDATE() AND r.fechaFinReserva >= CURDATE()));
    
    
-- Vista de Coches en mantenimiento
CREATE VIEW Coches_en_Mantenimiento AS
SELECT idCoche,marca,modelo
FROM  Coches 
WHERE estadoVehiculo = 'enMantenimiento';


-- Vista de Coches para venta por muchos kilometros
 CREATE VIEW Coches_para_Venta AS
SELECT idCoche,marca,modelo, kilometros
FROM  Coches 
WHERE kilometros > 80000;


-- Vista para conocer los puntos de cada cliente y poder enviarle correos si acumula cierta cantidad puntos recompensando a los clientes mas recurrentes y con la nacionalidad saber el idioma
 CREATE VIEW Puntos_Cliente_Recompensas AS
SELECT nombreCliente, puntosCliente,nacionalidadCliente,emailCliente
FROM  Clientes 
ORDER BY puntosCliente DESC;

-- Vista de coches que existen en cada sucursal
CREATE VIEW Flota_Vehiculos AS
Select nombreSucursal,numeroCoches
FROM Sucursales;

-- Ingresos Anuales de cada sucursal
CREATE VIEW Ingresos_Anuales_Sucursales AS
SELECT s.nombreSucursal AS Sucursal, YEAR(r.fechaReserva) AS Año, 
SUM(r.costoTotal) AS Ingresos_Anuales
FROM Reservas r
JOIN Sucursales s ON s.idSucursal = r.sucursales_idSucursal
WHERE r.estadoReserva = 'confirmada'
GROUP BY s.nombreSucursal, YEAR(r.fechaReserva)
ORDER BY Año DESC, s.nombreSucursal;

