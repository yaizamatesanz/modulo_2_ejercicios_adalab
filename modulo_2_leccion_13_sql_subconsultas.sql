/*EJERCICIO 1:
Calcula el numero de clientes por cada ciudad.*/
-- Esta consulta cuenta el número de clientes agrupados por ciudad utilizando COUNT() y GROUP BY.
USE tienda;

SELECT city, COUNT(customer_number) AS numero_clientes
FROM customers
GROUP BY city;


/*EJERCICIO 2:
Usando la consulta anterior como subconsulta, 
selecciona la ciudad con el mayor numero de clientes.
-- La subconsulta interna calcula el número de clientes por ciudad, 
y luego seleccionamos la ciudad con el mayor número de clientes 
ordenando en orden descendente y limitando el resultado a uno.*/

SELECT city, numero_clientes
FROM (
    SELECT city, COUNT(customer_number) AS numero_clientes
    FROM customers
    GROUP BY city
) AS subconsulta
ORDER BY numero_clientes DESC
LIMIT 1;


/*EJERCICIO 3:
Por último, usa todas las consultas anteriores para seleccionar el customerNumber, 
nombre y apellido de las clientas asignadas a la ciudad con mayor numero de clientas.
-- Esta consulta usa una subconsulta anidada para encontrar la ciudad con más clientes y 
luego selecciona los detalles de los clientes que pertenecen a esa ciudad.*/

SELECT customer_number, customer_name, contact_last_name, contact_first_name
FROM customers
WHERE city = (
    SELECT city
    FROM (
        SELECT city, COUNT(customer_number) AS numero_clientes
        FROM customers
        GROUP BY city
    ) AS subconsulta
    ORDER BY numero_clientes DESC
    LIMIT 1
);


/*EJERCICIO 4:
Queremos ver ahora que empleados tienen algún contrato asignado con alguno 
de los clientes existentes. Para ello selecciona employeeNumber como 'Número empleado', 
firstName como 'nombre Empleado' y lastName como 'Apellido Empleado'
--Utilizamos JOIN para enlazar empleados con clientes en base al employee_number y 
sales_rep_employee_number, seleccionando empleados con contratos asignados.*/

SELECT DISTINCT e.employee_number AS 'Número empleado', 
       e.first_name AS 'nombre Empleado', 
       e.last_name AS 'Apellido Empleado'
FROM employees e
JOIN customers c ON e.employee_number = c.sales_rep_employee_number;


/*EJERCICIO 5:
Queremos ver ahora en cuantas ciudades en las cuales tenemos clientes, 
no también una oficina de nuestra empresa para ello: Selecciona aquellas 
ciudades como 'ciudad' y los nombres de las empresas como 'nombre de la empresa ' 
de la tabla customers, sin repeticiones, que no tengan una oficina en dicha ciudad 
de la tabla offices.
Usamos una subconsulta con NOT IN para seleccionar las ciudades de clientes 
que no tienen una oficina en la tabla offices.*/

SELECT DISTINCT c.city AS 'ciudad', c.customer_name AS 'nombre de la empresa'
FROM customers c
WHERE c.city NOT IN (
    SELECT o.city
    FROM offices o
);


