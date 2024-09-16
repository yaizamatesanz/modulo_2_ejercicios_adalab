
/*EJERCICIO 1
Selecciona el ID, nombre, apellidos de las empleadas 
y el ID de cada cliente asociado a ellas, usando CROSS JOIN.

CROSS JOIN combina todas las filas de la tabla employees con todas las filas 
de la tabla customers, generando un producto cartesiano. 
No requiere una condición de unión.*/

SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees
CROSS JOIN customers;


/*EJERCICIO 2
Selecciona el ID, nombre, apellidos de las empleadas, para aquellas 
con más de 8 clientes, usando CROSS JOIN.

CROSS JOIN para combinar las tablas y GROUP BY junto con HAVING 
para contar los clientes y filtrar empleadas con más de 8 clientes.*/

SELECT e.employee_number, CONCAT(e.first_name,' ', e.last_name) AS NombreEmpleado
FROM employees AS e
CROSS JOIN customers AS c
WHERE e.employee_number = c.sales_rep_employee_number
GROUP BY e.employee_number
HAVING COUNT(c.customer_number) > 8;


/*EJERCICIO 3
Selecciona el nombre y apellidos de las empleadas que tienen clientes 
de más de un país, usando CROSS JOIN.

CROSS JOIN y HAVING permiten contar los países distintos por cada empleada.*/

SELECT CONCAT(e.last_name, ' ' , e.first_name) AS NombreEmpleadas, COUNT(DISTINCT country) AS PaisesClientes
FROM employees AS e
CROSS JOIN customers AS c
WHERE e.employee_number = c.sales_rep_employee_number
GROUP BY e.employee_number, CONCAT(e.last_name, ' ' , e.first_name)
HAVING COUNT(DISTINCT c.country) > 1;

/*EJERCICIO 4
Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada 
cliente asociado a ellas, usando INNER JOIN.

INNER JOIN combina las tablas donde existe una relación entre empleadas y clientes.*/

SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees
INNER JOIN customers ON employees.employee_number = customers.sales_rep_employee_number;


/*EJERCICIO 5
Selecciona el ID, nombre, apellidos de las empleadas, para aquellas 
con más de 8 clientes, usando INNER JOIN.

INNER JOIN y HAVING permite filtrar empleadas con más de 8 clientes.*/

SELECT employees.employee_number, employees.first_name, employees.last_name
FROM employees
INNER JOIN customers ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(customers.customer_number) > 8;


/*EJERCICIO 6
Selecciona el nombre y apellidos de las empleadas que tienen clientes 
de más de un país, usando INNER JOIN.*/

SELECT employees.first_name, employees.last_name
FROM employees
INNER JOIN customers ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(DISTINCT customers.country) > 1;


/*EJERCICIO 7
Selecciona el ID, nombre, apellidos de todas las empleadas y el ID 
de cada cliente asociado a ellas (si es que lo tienen).

LEFT JOIN asegura que todas las empleadas aparecen, tengan clientes o no.*/

SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees
LEFT JOIN customers ON employees.employee_number = customers.sales_rep_employee_number;



/*EJERCICIO 8
Selecciona el ID de todos los clientes, y el nombre, apellidos de 
las empleadas que llevan sus pedidos (si es que las hay).
Asegura que todos los clientes estén presentes en el resultado, 
con sus empleadas asociadas si las hay.*/

SELECT employees.employee_number, employees.first_name, employees.last_name
FROM employees
LEFT JOIN customers ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(customers.customer_number) > 8;



/*EJERCICIO 9
Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con 
más de 8 clientes, usando LEFT JOIN.*/

SELECT employees.employee_number, employees.first_name, employees.last_name
FROM employees
LEFT JOIN customers ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(customers.customer_number) > 8;


/*EJERCICIO 10
Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con 
más de 8 clientes, usando RIGHT JOIN.*/

SELECT employees.employee_number, employees.first_name, employees.last_name
FROM customers
RIGHT JOIN employees ON customers.sales_rep_employee_number = employees.employee_number
GROUP BY employees.employee_number
HAVING COUNT(customers.customer_number) > 8;



/*EJERCICIO 11
Selecciona el nombre y apellidos de las empleadas que tienen clientes 
de más de un país, usando LEFT JOIN.*/

SELECT employees.first_name, employees.last_name
FROM employees
LEFT JOIN customers ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(DISTINCT customers.country) > 1;

