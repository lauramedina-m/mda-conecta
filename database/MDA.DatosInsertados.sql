USE mda;

-- ==========================================
-- 1. TABLA ROL
-- ==========================================

INSERT IGNORE INTO rol (id, nombre) VALUES
(1, 'ADMINISTRADOR'),
(2, 'LIDER'),
(3, 'MIEMBRO'),
(4, 'VISITANTE');


-- ==========================================
-- 2. TABLA MINISTERIO
-- ==========================================

INSERT IGNORE INTO ministerio (id, nombre) VALUES
(1, 'Alabanza'),
(2, 'Bienvenida'),
(3, 'Jóvenes'),
(4, 'Infantil'),
(5, 'Acción social');


-- ==========================================
-- 3. TABLA USUARIO
-- ==========================================

INSERT IGNORE INTO usuario
(id, nombre, primer_apellido, segundo_apellido, email, password, rol_id)
VALUES
(1, 'Ana', 'Torres', 'Sánchez',
'ana.torres@gmail.com',
'1234asd', 1),

(2, 'Carlos', 'Méndez', 'Ruiz',
'carlos.mendez@hotmail.com',
'aqswdefr', 2),

(3, 'Lucía', 'Fernández', 'Soto',
'lucia.fernandez@outlook.com',
'contraseña1234', 3),

(4, 'Pedro', 'Almeida', 'Santos',
'pedro.almeida@icloud.com',
'mda2020', 3),

(5, 'María', 'Oliveira', 'Costa',
'maria.oliveira@gmail.com',
'789poij', 4),

(6, 'David', 'Romero', 'Pérez',
'david.romero@gmail.com',
'1998david', 2);


-- ==========================================
-- 4. TABLA PERTENENCIA
-- ==========================================

INSERT IGNORE INTO pertenencia (id, usuario_id, ministerio_id) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 2),
(5, 6, 3),
(6, 3, 4),
(7, 4, 5);


-- ==========================================
-- 5. TABLA MATERIAL
-- ==========================================

INSERT IGNORE INTO material
(id, titulo, descripcion, ruta_archivo_url, subido_por_id)
VALUES
(1, 'Guía de bienvenida',
'Documento de apoyo para recibir a las personas visitantes.',
'/materiales/guia_bienvenida.pdf', 2),

(2, 'Partituras del domingo',
'Partituras para el equipo de alabanza.',
'/materiales/partituras_domingo.pdf', 3),

(3, 'Plan de actividades juveniles',
'Calendario de actividades del ministerio de jóvenes.',
'/materiales/plan_jovenes.pdf', 6);


-- ==========================================
-- 6. TABLA TURNO
-- ==========================================

INSERT IGNORE INTO turno
(id, fecha_hora, tarea, id_usuario, id_ministerio)
VALUES
(1, '2026-11-01 10:00:00',
'Preparar la recepción y acomodar a las personas visitantes.',
4, 2),

(2, '2026-11-01 09:30:00',
'Preparar los instrumentos y comprobar el sonido.',
2, 1),

(3, '2026-11-06 18:30:00',
'Organizar las sillas y el material de la reunión juvenil.',
6, 3),

(4, '2026-11-14 09:00:00',
'Preparar las cajas para la jornada de recogida solidaria.',
NULL, 5);


-- ==========================================
-- 7. TABLA EVENTO
-- ==========================================

INSERT IGNORE INTO evento
(id, titulo, descripcion, fecha_hora, ubicacion, id_ministerio, creado_por)
VALUES
(1, 'Culto de bienvenida',
'Reunión general para dar la bienvenida a visitantes.',
'2026-11-01 11:00:00', 'Salón principal', 2, 1),

(2, 'Encuentro de jóvenes',
'Actividad y dinámica para el grupo juvenil.',
'2026-11-06 19:00:00', 'Sala juvenil', 3, 6),

(3, 'Ensayo de alabanza',
'Ensayo del repertorio para la reunión del domingo.',
'2026-11-07 17:00:00', 'Salón principal', 1, 2),

(4, 'Jornada solidaria',
'Recogida y preparación de donaciones para familias.',
'2026-11-14 10:00:00', 'Centro comunitario', 5, 1);


-- ==========================================
-- 8. TABLA CONSULTA
-- ==========================================

INSERT IGNORE INTO consulta
(id, nombre, email, asunto, mensaje, consulta_atendida)
VALUES
(1, 'Elena Martín',
'elena.martin@example.com',
'Horarios de reunión',
'¿Podrían indicarme los horarios de las reuniones de esta semana?',
FALSE),

(2, 'Jorge Silva',
'jorge.silva@example.com',
'Participar como voluntario',
'Me gustaría saber cómo puedo colaborar en las actividades solidarias.',
TRUE),

(3, 'Rita Gómez',
'rita.gomez@example.com',
'Información para visitantes',
'¿Es necesario inscribirse antes de asistir por primera vez?',
FALSE);


-- ==========================================
-- 9. TABLA INSCRIPCION
-- ==========================================

INSERT IGNORE INTO inscripcion
(id, usuario_id, evento_id, nombre, primer_apellido,
segundo_apellido, email, estado)
VALUES
(1, 3, 1, 'Lucía', 'Fernández', 'Soto',
'lucia.fernandez@outlook.com', 'CONFIRMADA'),

(2, 4, 1, 'Pedro', 'Almeida', 'Santos',
'pedro.almeida@icloud', 'CONFIRMADA'),

(3, 6, 2, 'David', 'Romero', 'Pérez',
'david.romero@gmail.com', 'CONFIRMADA'),

(4, NULL, 4, 'Isabel', 'Martínez', 'Ruiz',
'isabel.martinez@example.com', 'PENDIENTE'),

(5, 2, 3, 'Carlos', 'Méndez', 'Ruiz',
'carlos.mendez@hotmail.com', 'CONFIRMADA');


-- ==========================================
-- FIN DE LA INSERCIÓN DE DATOS
-- ==========================================


-- ==========================================
-- QUERYS DE PRUEBA
-- ==========================================

USE mda;

SELECT * FROM inscripcion;

SELECT 'ministerio' AS tabla, COUNT(*) AS total FROM ministerio
UNION ALL

SELECT 'rol', COUNT(*) FROM rol
UNION ALL

SELECT 'usuario', COUNT(*) FROM usuario
UNION ALL

SELECT 'pertenencia', COUNT(*) FROM pertenencia
UNION ALL

SELECT 'material', COUNT(*) FROM material
UNION ALL

SELECT 'turno', COUNT(*) FROM turno
UNION ALL

SELECT 'evento', COUNT(*) FROM evento
UNION ALL

SELECT 'consulta', COUNT(*) FROM consulta
UNION ALL

SELECT 'inscripcion', COUNT(*) FROM inscripcion;

