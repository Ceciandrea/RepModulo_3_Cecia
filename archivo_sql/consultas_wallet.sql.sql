-- consulta para obtener el nombre de la moneda elegida ´por un usuario especifico
SELECT moneda.divisa_nombre, moneda.divisa_simbolo, usuarios.id_usuario
FROM moneda
INNER JOIN usuarios ON moneda.divisa_id = usuarios.id_usuario
WHERE id_usuario = 1;

-- consulta para obtener todas las transacciones registradas
select *from transaccion; 

-- consulta para obtener todas las transacciones realizadas por un usuario especifico
select transaccion.idtransaccion, 
transaccion.cantidad,
transaccion.transaction_date,
usuarios.nombre, 
usuarios. id_usuario
from transaccion
inner join usuarios
on transaccion.idtransaccion = usuarios.id_usuario
where id_usuario = 3; 

-- sentencia DML para modificar el campo correo electronico de un usuario especifico 
update usuarios
set correo_electronico = "roberto_28@hotmail.com"
where id_usuario = 3;
select * from usuarios;

-- sentencia para eliminar los datos de una transaccion (eliminado de la fila completa)
delete from transaccion 
where idtransaccion = 4;
select * from transaccion;

