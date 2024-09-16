-- 1. Consulta para obtener el número identificativo de cliente más bajo:

SELECT MIN(customer_number) AS ClienteMinimo
FROM customers;

-- 2. Selecciona el límite de crédito medio para los clientes de España:

SELECT AVG(credit_limit) AS CreditoMedio
FROM customers
WHERE country = 'Spain';

-- 3. Selecciona el número de clientes en Francia:

SELECT COUNT(*) AS ClientesEnFrancia
FROM customers
WHERE country = 'France';

-- 4. Selecciona el máximo de crédito que tiene cualquiera de los clientes del empleado con número 1323:

SELECT MAX(credit_limit) AS MaxCredito
FROM customers
WHERE sales_rep_employee_number = 1323;

-- 5. ¿Cuál es el número máximo de empleado de la tabla customers?

SELECT MAX(sales_rep_employee_number) AS MaxNumeroEmpleado
FROM customers;

-- 6.Consulta para seleccionar el número de cada empleado de ventas y el número de clientes distintos que tiene cada uno:

SELECT sales_rep_employee_number, COUNT(DISTINCT customer_number) AS NumeroClientes
FROM customers
GROUP BY sales_rep_employee_number;

-- 7. Selecciona el número de cada empleado de ventas que tenga más de 7 clientes distintos:

SELECT sales_rep_employee_number
FROM customers
GROUP BY sales_rep_employee_number
HAVING COUNT(DISTINCT customer_number) > 7;

-- 8. Selecciona el número de cada empleado de ventas, el número de clientes distintos que tiene y etiqueta "AltoRendimiento" a aquellos con más de 7 clientes distintos:

SELECT sales_rep_employee_number,
	COUNT(DISTINCT customer_number) AS NumeroClientes,
    CASE
    WHEN COUNT(DISTINCT customer_number) > 7 THEN 'AltoRendimiento'
    ELSE 'Normal'
    END AS Rendimiento
FROM customers
GROUP BY sales_rep_employee_number;

-- 9. Selecciona el número de clientes en cada país:

SELECT country, COUNT(*) AS NumeroClientes
FROM customers
GROUP BY country;

-- 10. Selecciona aquellos países que tienen clientes de más de 3 ciudades diferentes:

SELECT country AS Pais, COUNT(DISTINCT city) AS Ciudades
FROM customers
GROUP BY country
HAVING COUNT(DISTINCT city) > 3;