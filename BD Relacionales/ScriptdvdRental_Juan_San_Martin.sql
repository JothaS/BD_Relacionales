
--insertar, modificar y eliminar un Customer
insert into customer (store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active)
values (1, 'Juan', 'San', 'juansan@example.com', 1, true, '2023-06-06', now(), NULL);

update customer
set email = 'juansan@gmail.com'
where  customer_id = 600;

delete from customer
where  customer_id = 600;



--insertar, modificar y eliminar un Staff

insert into public.staff (first_name, last_name, address_id, email, store_id, active, username, password, last_update, picture)
values ('Juan', 'San', 1, 'juansan@example.com', 1, true, 'Juan', 'password123', now(), NULL);

update public.staff
set email = 'newemail@example.com'
where  staff_id = 3;

delete  from  public.staff
where  staff_id = 3;



--insertar, modificar y eliminar un Actor

insert into public.actor (first_name, last_name, last_update)
values ('Juan', 'San', now());

update public.actor
set first_name = 'Jota', last_name = 'SanM', last_update = now()
where  actor_id = 201;

delete from public.actor
where  actor_id = 201;




--Listar todas las “rental” con los datos del “customer” dado un año y mes. 


select r.rental_id, r.rental_date Fecha_Arriendo, r.return_date fecha_devolucion, c.first_name Nombre, c.last_name Apellido, c.email
from public.rental r
inner join public.customer c on r.customer_id = c.customer_id
where  extract(year from r.rental_date) = 2005 and extract(month from r.rental_date) = 05;




--Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”
select payment_id, payment_date Fecha, amount Total
from public.payment;




--Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0.

select f.title Pelicula, f.release_year Año,f.rental_rate Precio_Arriendo
from public.film f
where  release_year = 2006
  and rental_rate > 4.0;
 
 
 SELECT
t1.TABLE_NAME AS tabla_nombre,
t1.COLUMN_NAME AS columna_nombre,
t1.COLUMN_DEFAULT AS columna_defecto,
t1.IS_NULLABLE AS columna_nulo,
t1.DATA_TYPE AS columna_tipo_dato,
COALESCE(t1.NUMERIC_PRECISION,
t1.CHARACTER_MAXIMUM_LENGTH) AS columna_longitud,
PG_CATALOG.COL_DESCRIPTION(t2.OID,
t1.DTD_IDENTIFIER::int) AS columna_descripcion,
t1.DOMAIN_NAME AS columna_dominio
FROM
INFORMATION_SCHEMA.COLUMNS t1
INNER JOIN PG_CLASS t2 ON (t2.RELNAME = t1.TABLE_NAME)
WHERE
t1.TABLE_SCHEMA = 'public'
ORDER BY
t1.TABLE_NAME;

