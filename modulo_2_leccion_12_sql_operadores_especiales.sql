/*1. Selecciona los apellidos que se encuentren en ambas tablas 
para employees y customers, con alias 'Apellidos'.*/
-- Combina los apellidos de empleados y clientes sin duplicados.

SELECT last_name AS 'Apellidos'
FROM employees
UNION
SELECT contact_last_name AS'Apellidos'
FROM customers;

/*2. Selecciona los nombres con alias 'nombre' y apellidos, 
con alias 'Apellidos' tanto de los clientes como de los empleados 
de las tablas employees y customers.*/
-- Combina los nombres y apellidos de empleados y clientes sin duplicados.

SELECT first_name AS 'Nombre', last_name AS 'Apellidos'
FROM employees
UNION
SELECT contact_first_name AS 'Nombre', contact_last_name AS 'Apellidos'
FROM customers;

/*3. Selecciona todos los nombres con alias 'nombre' y apellidos, 
con alias 'Apellidos' tanto de los clientes como de los empleados 
de las tablas employees y customers.*/
-- Combina todos los nombres y apellidos de empleados y clientes incluyendo duplicados.

SELECT first_name AS 'Nombre', last_name AS 'Apellidos'
FROM employees
UNION ALL
SELECT contact_first_name AS 'Nombre', contact_last_name AS 'Apellidos'
FROM customers;

/*4. Queremos ver ahora el employee_number como 'Número empleado', 
first_name como 'nombre Empleado' y last_name como 'Apellido Empleado' 
para los empleados con employee_number: 1002,1076,1088 y 1612.*/
-- Selecciona empleados específicos utilizando la lista de IDs con IN.

SELECT employee_number AS 'Número empleado', first_name 'Nombre empleado', last_name 'Apellido empleado' 
FROM employees
WHERE employee_number IN (1002,1076,1088,1612);

/*5. Queremos ver ahora la 'ciudad' y los nombres de las empresas 
como 'nombre de la empresa ' de la tabla customers, que no estén en: 
Ireland, France, Germany.*/
-- Filtra empresas en ciudades que no están en los países especificados.

SELECT city, customer_name AS 'Nombre de la empresa'
FROM customers
WHERE country NOT IN ('Ireland', 'France', 'Germany');

/*6. Encuentra los campos nombre del cliente y ciudad, de aquellas ciudades 
de la tabla de customers que terminen en 'on'.*/
-- Busca clientes en ciudades cuyos nombres terminen en 'on'.

SELECT customer_name, city
FROM customers
WHERE city LIKE '%on';

/*7. Encuentra los campos nombre del cliente, ciudad de aquellas ciudades 
de la tabla de customers que terminen en 'on' y que unicamente sean de longitud 4.*/
-- Filtra ciudades que terminen en 'on' y tengan exactamente 4 caracteres.

SELECT customer_name, city
FROM customers
WHERE city LIKE '__on';

/*8. Encuentra el nombre del cliente, primera dirección 
y ciudad de aquellas ciudades que contengan el número 3 
en su dirección postal (o lo que es lo mismo, su primera dirección).*/
-- Busca clientes cuyas direcciones contengan el número 3.

SELECT customer_name, address_line1, city
FROM customers
WHERE address_line1 LIKE '%3%';

/*9. Encuentra el nombre del cliente, primera dirección y 
ciudad de aquellas ciudades que contengan el número 3 en su dirección 
postal y la ciudad no empiece por T.*/
-- Filtra clientes con el número 3 en la dirección y ciudades que no empiecen con 'T'.

SELECT customer_name, address_line1, city
FROM customers
WHERE address_line1 LIKE '%3%' AND city NOT LIKE 'T%';

/*10. Selecciona, haciendo uso de expresiones regulares, 
los campos nombre del cliente, primera dirección y ciudad. 
Unicamente en el caso que la dirección postal, 
posea algún número en dicho campo.*/
-- Utiliza expresiones regulares para filtrar direcciones postales que contengan números.

SELECT customer_name, address_line1, city
FROM customers
WHERE address_line1 REGEXP '[0-9]';


