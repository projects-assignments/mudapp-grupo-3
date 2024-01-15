/*Cuántos servicios de transporte ha realizado cada usuario y cuál es el nombre del usuario junto con el total de servicios*/
/*SELECT u.nombre_usuario, COUNT(st.id_servicio) AS total_servicios
LEFT JOIN servicios_transporte st ON u.id_usuario = st.id_usuario
GROUP BY u.nombre_usuario;*/

/*Consulta para calcular el promedio de las valoraciones de todos los servicios de transporte:*/
/*SELECT AVG(e.valoracion) AS media_valoraciones
FROM evaluaciones e;*/

/*Consulta para obtener la lista de servicios de transporte que incluyen la palabra "Electrodomésticos" en la descripción de la mercancía:*/
/*SELECT id_servicio, ubicacion_inicial, ubicacion_final, mercancia
FROM servicios_transporte
WHERE mercancia LIKE '%Electrodomésticos%';*/

/*Consulta para obtener el total de registros
SELECT COUNT(*) registros
FROM registros
where id_usuario = "USR2";*/