# Sistema Automatizado de Control para  Alquiler de Vehículos

## Descripción

Este proyecto implementa un sistema automatizado y de control creando una base  de datos para una empresa de alquiler de vehículos. El sistema gestiona el alquiler, mantenimiento, devolución de vehículos, y la gestión de clientes, permitiendo una administración eficiente y sin errores manuales. 

El sistema facilita el seguimiento de los vehículos disponibles, la asignación de vehículos a clientes, el cálculo de tarifas según el tiempo de alquiler, y el mantenimiento de un historial completo de transacciones y como añadido un sistema de promociones y puntos para los clientes.

## Características

- **Gestión de vehículos**: Registro y seguimiento de la flota de vehículos, incluyendo el tipo, la marca, el modelo, el año, y la disponibilidad etc..
- **Gestión de clientes**: Registro de información personal de los clientes y historial de alquileres.
- **Alquileres**: Proceso de alquiler de vehículos, con cálculo automático de tarifas basadas en el tiempo de alquiler.
- **Devoluciones**: Registro de devoluciones de vehículos y actualización de disponibilidad con diferentes trigger.
- **Mantenimiento**: Control de mantenimiento de los vehículos, incluyendo reparaciones y revisiones periódicas.
- **Informes**: Generación de informes de reservas, sucursales, departamentos, empleados ,reservas y  vehículos.

## Tecnologías Utilizadas

- **Base de Datos**: MySQL 
- **Lenguaje de programación**: SQL 
- **Programas Utilizados**: MYSQL WORKBENCH,
MYSQL WORKBENCH-> Para la creación de la base de datos.
IO.DRAW-> Para la creacion de mapa conceptual

## Estructura de la Base de Datos

La base de datos está estructurada para manejar las siguientes tablas principales:

- **Clientes**: Información de los clientes (nombre, dirección, número de teléfono, historial de alquileres).
- **Vehículos**: Información sobre los vehículos (marca, modelo, año, tipo, estado de disponibilidad etc,,).
- **Reservas**: Registros de los alquileres de vehículos, incluyendo el cliente, vehículo, fecha de alquiler, fecha de devolución, y el costo.
- **Sucursales**: Registro de ubicacion, empleados y vehículos disponibles.
- **Departmaentos**: Registro de diferentes departamentos que actuan sobre el numero de vehículos y empleados .
- **Empleados**: Control  de los empleados, información personal y roles que ocupan.



