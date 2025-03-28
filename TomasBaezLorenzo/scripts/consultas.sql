USE RentalCarx;


-- MUESTRA TODAS LAS RESERVAS REALIZADAS EN UNA SUCURSAL<<
SELECT r.idreserva,costototal, r.estadoReserva, r.diasReservados, c.marca, c.modelo, c.matricula, s.nombreSucursal 
FROM RESERVAS r
 JOIN COCHES c ON c.idcoche = r.coches_idCoche
 JOIN SUCURSALES s ON s.idSucursal =  c.sucursales_idSucursal
WHERE  s.nombreSucursal = 'Sucursal Madrid'; -- Muestra  la sucursal específica


-- SUMA DE LA FACTURACION DE UNA SUCURSAL EN CONCRETO <<
SELECT SUM(r.costoTotal) AS Total_Recaudacion, s.nombreSucursal AS Sucursal_Ciudad
FROM Reservas r
 JOIN  sucursales s ON s.idSucursal = r.sucursales_idSucursal
WHERE s.nombreSucursal = 'Sucursal Barcelona';


-- SUMA DE LA FACTURACION TOTAL DE TODAS LAS SUCURSALES<<
SELECT SUM(costoTotal) AS Facturacion_Total
FROM Reservas r
JOIN Sucursales s ON  s.idSucursal = r.sucursales_idSucursal
WHERE estadoReserva = 'confirmada';


-- SUMA DEL GASTO TOTAL DE UN CLIENTE Y CONTEO DE RESERVAS<<
SELECT SUM(r.costoTotal) AS Total_Pagado, c.nombreCliente AS Nombre_Cliente, COUNT(r.idreserva) AS Reservas
FROM Reservas r
JOIN Clientes c on c.idCliente = r.clientes_idCliente
WHERE clientes_idCliente = 2;


-- NUMERO DE  VECES  QUE UN VEHICULO  HA SIDO ALQUILADO <<
SELECT 
    c.marca AS Marca_Vehiculo, c.modelo AS Modelo_Vehiculo, COUNT(r.idReserva ) AS Recurrencia
FROM Coches c
JOIN Reservas r ON c.idCoche = r.coches_idCoche
GROUP BY c.marca, c.modelo
ORDER BY Recurrencia DESC;
-- NUMERO DE RESERVAS QUE HA REALZIADO CADA CLIENTE<<
SELECT cl.nombreCliente, cl.idcliente, COUNT(r.idReserva) AS numeroReservas
FROM Clientes cl
JOIN Reservas r ON cl.idCliente = r.clientes_idCliente
WHERE r.estadoReserva = 'confirmada'
GROUP BY cl.idCliente
ORDER BY numeroReservas DESC;


-- MARCA Y MODELO DE COCHES SIN ALQUILAR EN UNA SUCURSAL ESPECIFICA>>
SELECT marca, modelo, matricula
FROM Coches
WHERE estadoVehiculo = 'sinAlquilar' AND sucursales_idSucursal = 1;


-- NUMERO DE COCHES EN MANTENIMIENTO<<
SELECT * FROM Coches
WHERE estadoVehiculo = 'enMantenimiento';

-- COCHES ALQUILADOS DURANTE EL MES  MARZO DE 2025<<
SELECT c.idCoche AS ID, c.marca AS Marca, c.modelo AS Modelo, r.fechaReserva AS Fecha_De_Recepcion, r.fechafinreserva AS Fecha_de_Entrega
FROM Reservas r
JOIN Coches c ON r.coches_idcoche = c.idCoche
WHERE r.fechaReserva BETWEEN '2025-03-01' AND '2025-03-30';

-- PRECIO DE LAS RESERVAS MAS CARAS<<
SELECT r.fechaReserva AS Fecha_Rserva, r.precioFinal AS Precio, c.marca AS Marca, c.modelo AS Modelo, cl.nombreCliente AS Cliente
FROM Reservas r
JOIN Coches c ON r.coches_idCoche = c.idCoche
JOIN Clientes cl ON r.clientes_idCliente = cl.idCliente
ORDER BY r.precioFinal DESC
LIMIT 3; 



-- Clientes Sin Promocion<<
SELECT r.promociones_idpromociones AS Numero_Promocion,p.nombrePromocion AS Nombre_Promo, r.idreserva, c.nombreCliente  AS Cliente
From reservas r
JOIN clientes c ON c.idCliente = r.clientes_idcliente
JOIN promociones p ON p.idPromociones = r.promociones_idpromociones
WHERE p.idpromociones = 1;
									
-- Clientes con Promocion Especial <<
SELECT r.promociones_idpromociones AS Numero_Promocion,p.nombrePromocion AS Nombre_Promo, r.idreserva, c.nombreCliente  AS Cliente
From reservas r
JOIN clientes c ON c.idCliente = r.clientes_idcliente
JOIN promociones p ON p.idPromociones = r.promociones_idpromociones
WHERE p.idpromociones = 4;
								
-- Clientes con Descuento de Primavera con porcentaje descuento<<
SELECT r.promociones_idpromociones AS Numero_Promocion,p.nombrePromocion AS Nombre_Promo, r.idreserva, c.nombreCliente  AS Cliente, p.descuento AS Porcentaje_Descuento
From reservas r
JOIN clientes c ON c.idCliente = r.clientes_idcliente
JOIN promociones p ON p.idPromociones = r.promociones_idpromociones
WHERE p.idpromociones = 5;


-- 3 CLIENTES QUE MAS DIAS HAN ALQUILADO<<
SELECT cl.nombreCliente AS Nombre_Cliente, SUM(r.diasreservados) AS Dias_Alquilados
FROM Reservas r
JOIN Clientes cl ON cl.idCliente = r.clientes_idCliente
GROUP BY cl.nombreCliente
ORDER BY Dias_Alquilados DESC
LIMIT 3;

-- Empleados que mas coches han alquilado<<
SELECT e.idEmpleado, e.nombreEmpleado, COUNT(r.idReserva) AS Total_Coches_Alquilados,
RANK() OVER (ORDER BY COUNT(r.idReserva) DESC) AS Calificacion
FROM Reservas r
JOIN Empleados e ON r.empleados_idEmpleado = e.idEmpleado
GROUP BY  e.idEmpleado, e.nombreEmpleado
ORDER BY  Total_Coches_Alquilados DESC;

--  Empleados que trabajan en cada departamento en cada sucursal>>
 SELECT e.nombreEmpleado AS Nombre_Empleado ,d.nombredepartamento AS Nombre_Departamento, s.nombreSucursal AS Nombre_Sucursal
 FROM Sucursales s
 JOIN Departamento d ON d.sucursales_idsucursal = s.idSucursal
 JOIN Empleados e ON e.departamento_idDepartamento = d.idDepartamento
 GROUP BY d.nombreDepartamento, E.nombreEmpleado, s.nombreSucursal;
 --  Empleados que trabajan en cada departamento una sucursal en concreto>>
 SELECT e.nombreEmpleado AS Nombre_Empleado ,d.nombredepartamento AS Nombre_Departamento, s.nombreSucursal AS Nombre_Sucursal
 FROM Sucursales s
 JOIN Departamento d ON d.sucursales_idsucursal = s.idSucursal
 JOIN Empleados e ON e.departamento_idDepartamento = d.idDepartamento
 WHERE s.idSucursal = 3
 GROUP BY d.nombreDepartamento, E.nombreEmpleado, s.nombreSucursal;
 
 
 -- Ingresos Mensuales Por Sucursal
 SELECT s.nombreSucursal AS Sucursal, 
YEAR(r.fechaReserva) AS Año, MONTH(r.fechaReserva) AS Mes, 
SUM(r.costoTotal) AS Ingresos_Mensuales
FROM Reservas r
JOIN Sucursales s ON s.idSucursal = r.sucursales_idSucursal
WHERE r.estadoReserva = 'confirmada'
GROUP BY s.nombreSucursal, YEAR(r.fechaReserva), MONTH(r.fechaReserva)
ORDER BY Año DESC, Mes DESC, s.nombreSucursal;

-- CLientes mas frecuentes o con mayor numero de reservas
SELECT cl.nombreCliente AS Nombre_Cliente, COUNT(r.idReserva) AS Numero_De_Reservas
FROM Reservas r
JOIN Clientes cl ON cl.idCliente = r.clientes_idCliente
GROUP BY cl.nombreCliente
HAVING COUNT(r.idReserva) 
ORDER BY Numero_De_Reservas DESC;


