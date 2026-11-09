USE mda;

-- 1. Mostrar todos los usuarios con el nombre de su rol.
SELECT
    u.id,
    u.nombre,
    u.primer_apellido,
    u.segundo_apellido,
    u.email,
    r.nombre AS rol
FROM usuario u
INNER JOIN rol r ON u.rol_id = r.id;

-- 2. Mostrar solamente los administradores.
SELECT
    u.nombre,
    u.primer_apellido,
    u.email,
    r.nombre AS rol
FROM usuario u
INNER JOIN rol r ON u.rol_id = r.id
WHERE r.nombre = 'ADMINISTRADOR';

-- 3. Contar cuántos usuarios hay de cada rol.
SELECT
    r.nombre AS rol,
    COUNT(u.id) AS cantidad_usuarios
FROM rol r
LEFT JOIN usuario u ON r.id = u.rol_id
GROUP BY r.id, r.nombre;

-- 4. Buscar usuarios por apellido.
SELECT *
FROM usuario
WHERE primer_apellido LIKE '%ez%';

-- 5. Mostrar todos los usuarios asociados a cada ministerio.
SELECT
    m.nombre AS ministerio,
    u.nombre AS usuario,
    u.primer_apellido,
    u.email
FROM pertenencia p
INNER JOIN ministerio m ON p.ministerio_id = m.id
INNER JOIN usuario u ON p.usuario_id = u.id
ORDER BY m.nombre;

-- 6. Contar los miembros de cada ministerio.
SELECT
    m.nombre AS ministerio,
    COUNT(p.usuario_id) AS total_miembros
FROM ministerio m
LEFT JOIN pertenencia p ON m.id = p.ministerio_id
GROUP BY m.id, m.nombre;

-- 7. Mostrar los usuarios que pertenecen a más de un ministerio.
SELECT
    u.nombre,
    u.primer_apellido,
    COUNT(p.ministerio_id) AS total_ministerios
FROM usuario u
INNER JOIN pertenencia p ON u.id = p.usuario_id
GROUP BY u.id, u.nombre, u.primer_apellido
HAVING COUNT(p.ministerio_id) > 1;

-- 8. Mostrar los usuarios que no pertenecen a ningún ministerio.
SELECT
    u.nombre,
    u.primer_apellido,
    u.email
FROM usuario u
LEFT JOIN pertenencia p ON u.id = p.usuario_id
WHERE p.id IS NULL;

-- 9. Mostrar todos los eventos con su ministerio y creador.
SELECT
    e.titulo AS evento,
    e.descripcion,
    e.fecha_hora,
    e.ubicacion,
    m.nombre AS ministerio,
    u.nombre AS creador
FROM evento e
INNER JOIN ministerio m ON e.id_ministerio = m.id
LEFT JOIN usuario u ON e.creado_por = u.id
ORDER BY e.fecha_hora;

-- 10. Mostrar todos los inscritos en cada evento.
SELECT
    e.titulo AS evento,
    i.nombre,
    i.primer_apellido,
    i.email,
    i.estado,
    i.fecha_inscripcion
FROM inscripcion i
INNER JOIN evento e ON i.evento_id = e.id
ORDER BY e.titulo;

-- 11. Contar cuántas personas están inscritas en cada evento.
SELECT
    e.titulo AS evento,
    COUNT(i.id) AS total_inscritos
FROM evento e
LEFT JOIN inscripcion i ON e.id = i.evento_id
GROUP BY e.id, e.titulo;

-- 12. Mostrar las inscripciones pendientes.
SELECT
    nombre,
    primer_apellido,
    email,
    estado
FROM inscripcion
WHERE estado = 'PENDIENTE';

-- 13. Mostrar los eventos que no tienen ninguna inscripción.
SELECT
    e.id,
    e.titulo,
    e.fecha_hora
FROM evento e
LEFT JOIN inscripcion i ON e.id = i.evento_id
WHERE i.id IS NULL;

-- 14. Mostrar los turnos con el nombre del usuario y del ministerio.
SELECT
    t.fecha_hora,
    t.tarea,
    u.nombre AS usuario,
    u.primer_apellido,
    m.nombre AS ministerio
FROM turno t
LEFT JOIN usuario u ON t.id_usuario = u.id
INNER JOIN ministerio m ON t.id_ministerio = m.id
ORDER BY t.fecha_hora;

-- 15. Buscar los turnos que todavía no tienen un usuario asignado.
SELECT
    t.id,
    t.fecha_hora,
    t.tarea,
    m.nombre AS ministerio
FROM turno t
INNER JOIN ministerio m ON t.id_ministerio = m.id
WHERE t.id_usuario IS NULL;

-- 16. Contar los turnos asignados a cada ministerio.
SELECT
    m.nombre AS ministerio,
    COUNT(t.id) AS total_turnos
FROM ministerio m
LEFT JOIN turno t ON m.id = t.id_ministerio
GROUP BY m.id, m.nombre;

-- 17. Mostrar los materiales con la persona que los ha subido.
SELECT
    ma.titulo,
    ma.descripcion,
    ma.ruta_archivo_url,
    ma.fecha_subida,
    u.nombre AS subido_por
FROM material ma
LEFT JOIN usuario u ON ma.subido_por_id = u.id;

-- 18. Mostrar las consultas que todavía no han sido atendidas.
SELECT
    nombre,
    email,
    asunto,
    mensaje,
    fecha_envio
FROM consulta
WHERE consulta_atendida = FALSE;

-- 19. Contar las consultas atendidas y pendientes.
SELECT
    consulta_atendida,
    COUNT(*) AS total
FROM consulta
GROUP BY consulta_atendida;

-- 20. Mostrar un resumen de toda la base de datos.
SELECT
    (SELECT COUNT(*) FROM usuario) AS usuarios,
    (SELECT COUNT(*) FROM ministerio) AS ministerios,
    (SELECT COUNT(*) FROM evento) AS eventos,
    (SELECT COUNT(*) FROM material) AS materiales,
    (SELECT COUNT(*) FROM turno) AS turnos,
    (SELECT COUNT(*) FROM consulta) AS consultas,
    (SELECT COUNT(*) FROM inscripcion) AS inscripciones;
    
-- 21. Mostrar el número de inscripciones por estado.
SELECT
    estado,
    COUNT(*) AS total
FROM inscripcion
GROUP BY estado;

-- 22. Mostrar los próximos eventos.
SELECT
    titulo,
    fecha_hora,
    ubicacion
FROM evento
WHERE fecha_hora >= NOW()
ORDER BY fecha_hora ASC;

-- 23. Buscar un usuario por correo electrónico.
SELECT *
FROM usuario
WHERE email = 'lucia.fernandez@outlook.com';

-- 24. Mostrar los ministerios que tienen más de un miembro.
SELECT
    m.nombre AS ministerio,
    COUNT(p.usuario_id) AS miembros
FROM ministerio m
INNER JOIN pertenencia p ON m.id = p.ministerio_id
GROUP BY m.id, m.nombre
HAVING COUNT(p.usuario_id) > 1;

