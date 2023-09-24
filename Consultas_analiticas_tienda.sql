-- Minimos, maximos y promedio
select MIN(precio_unitario) as PRECIO_MINIMO from producto p 

select max(precio_unitario) as PRECIO_MAXIMO from producto p

select avg(precio_unitario) as PRECIO_AVG FROM PRODUCTO

-- Cantidad total de productos en stock por sucursal

select sucursal_id, sum(cantidad)  as STOCK_SUCURSAL
from stock s 
group by sucursal_id;

--Total de ventas por cliente

select cliente_id, sum(total) as total_ventas_cliente
from orden o 
group by cliente_id 