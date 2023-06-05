-- Universidad - 1
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
-- Universidad - 2
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
-- Universidad - 3
SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = '1999';
-- Universidad - 4
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';
-- Universidad - 5
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
-- Universidad - 6
SELECT apellido1, apellido2, persona.nombre, departamento.nombre FROM persona, profesor, departamento WHERE profesor.id_profesor = persona.id AND departamento.id = profesor.id_departamento ORDER BY apellido1 ASC, apellido2 ASC, persona.nombre ASC;
-- Universidad - 7
SELECT asignatura.nombre, anyo_inicio, anyo_fin FROM persona JOIN alumno_se_matricula_asignatura AS asma ON persona.id = asma.id_alumno JOIN curso_escolar ON curso_escolar.id = asma.id_curso_escolar JOIN asignatura ON asignatura.id = asma.id_asignatura WHERE Persona.nif = '26902806M';
-- Universidad - 8
SELECT DISTINCT departamento.nombre FROM grado JOIN asignatura ON grado.id = asignatura.id_grado JOIN profesor ON profesor.id_profesor = asignatura.id_profesor JOIN departamento ON departamento.id = profesor.id_departamento WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
-- Universidad - 9
SELECT DISTINCT persona.* FROM persona JOIN alumno_se_matricula_asignatura AS asma ON persona.id = asma.id_alumno JOIN curso_escolar ON curso_escolar.id = asma.id_curso_escolar WHERE anyo_inicio = 2018;
-- Universidad - LEFT-RIGHT JOIN - 1
SELECT apellido1, apellido2, persona.nombre, departamento.nombre FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id RIGHT JOIN persona ON persona.id = profesor.id_profesor WHERE persona.tipo = 'profesor' ORDER BY apellido1 ASC, apellido2 ASC, persona.nombre ASC;
-- Universidad - LEFT-RIGHT JOIN - 2
SELECT DISTINCT persona.* FROM persona RIGHT JOIN profesor ON profesor.id_departamento IS NULL;
-- Universidad - LEFT-RIGHT JOIN - 3
SELECT DISTINCT departamento.* FROM departamento RIGHT JOIN profesor ON profesor.id_departamento IS NULL;
-- Universidad - LEFT-RIGHT JOIN - 4
SELECT DISTINCT persona.* FROM profesor RIGHT JOIN persona ON profesor.id_profesor = persona.id LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor IS NULL AND persona.tipo = 'profesor';
-- Universidad - LEFT-RIGHT JOIN - 5
SELECT DISTINCT asignatura.* FROM profesor RIGHT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;
-- Universidad - LEFT-RIGHT JOIN - 6
SELECT DISTINCT departamento.* FROM departamento LEFT JOIN profesor ON departamento.id != profesor.id_departamento LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor RIGHT JOIN alumno_se_matricula_asignatura AS asma ON asma.id_asignatura = asignatura.id;
-- Universidad . Consultas resumen - 1
SELECT COUNT(*) FROM persona WHERE tipo = 'alumno';
-- Universidad . Consultas resumen - 2
SELECT COUNT(*) FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
-- Universidad . Consultas resumen - 3
SELECT departamento.nombre, COUNT(profesor.id_profesor) FROM departamento, profesor WHERE departamento.id = profesor.id_departamento GROUP BY departamento.nombre ORDER BY COUNT(profesor.id_profesor) DESC;
-- Universidad . Consultas resumen - 4
SELECT departamento.nombre, COUNT(profesor.id_profesor) FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre ORDER BY COUNT(profesor.id_profesor) DESC;
-- Universidad . Consultas resumen - 5
SELECT grado.nombre, COUNT(asignatura.id) FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre ORDER BY COUNT(asignatura.id) DESC;
-- Universidad . Consultas resumen - 6
SELECT grado.nombre, COUNT(asignatura.id) FROM grado, asignatura WHERE asignatura.id_grado = grado.id  GROUP BY grado.nombre HAVING COUNT(asignatura.id)>40;
-- Universidad . Consultas resumen - 7
SELECT grado.nombre, asignatura.tipo, COUNT(asignatura.id) FROM grado, asignatura WHERE grado.id = asignatura.id_grado GROUP BY asignatura.tipo, grado.nombre;
-- Universidad . Consultas resumen - 8
SELECT curso_escolar.anyo_inicio, COUNT(IF(persona.tipo = 'alumno', persona.id, 0)) AS alumnos_matriculados
FROM persona, curso_escolar, alumno_se_matricula_asignatura AS asma
WHERE persona.id = asma.id_alumno AND asma.id_curso_escolar = curso_escolar.id
GROUP BY curso_escolar.anyo_inicio;


SELECT * FROM profesor;

