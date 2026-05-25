DROP TABLE turno;
DROP TABLE notificacion;
DROP TABLE empleado;
DROP TABLE servicio;
DROP TABLE medio_notificacion;
DROP TABLE usuario;
DROP TABLE ciudad;

CREATE TABLE ciudad(
	ciudad_id SERIAL PRIMARY KEY,
	nombre_ciudad VARCHAR (100) NOT NULL,
	codigo_postal VARCHAR (100) NOT NULL
);

CREATE TABLE usuario(
	usuario_id 	SERIAL PRIMARY KEY,
	nombre VARCHAR (100) NOT NULL,
	apellido VARCHAR (100) NOT NULL,
	tipo_usuario VARCHAR (100) NOT NULL,
	condicion_especial VARCHAR (100),
	ciudad_id INT,
	FOREIGN KEY (ciudad_id) REFERENCES ciudad (ciudad_id)
);
CREATE TABLE empleado (
	empleado_id SERIAL PRIMARY KEY,
	cargo VARCHAR (100) NOT NULL,
	departamento VARCHAR (100) NOT NULL,
	usuario_id INT,
	FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id) 
);
CREATE TABLE servicio (
	servicio_id SERIAL PRIMARY KEY,
	nombre VARCHAR (100) NOT NULL,
	descripcion TEXT NOT NULL,
	estado VARCHAR (100) NOT NULL
);
CREATE TABLE turno(
	turno_id SERIAL PRIMARY KEY,
	fecha DATE NOT NULL,
	hora_inicio TIME NOT NULL,
	hora_fin TIME NOT NULL,
	estado VARCHAR (100) NOT NULL,
	usuario_id INT,
	servicio_id INT,
 	empleado_id INT,
	FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
	FOREIGN KEY (servicio_id) REFERENCES servicio(servicio_id), 
	FOREIGN KEY (empleado_id) REFERENCES empleado(empleado_id)
);
CREATE TABLE medio_notificacion (
	medio_id SERIAL PRIMARY KEY,
	nombre_medio VARCHAR (100) NOT NULL
);
CREATE TABLE notificacion(
	notificacion_id SERIAL PRIMARY KEY,
	mensaje TEXT NOT NULL,
	fecha_envio DATE NOT NULL,
	estado VARCHAR (100) NOT NULL,
	usuario_id INT,
    medio_id INT,
	FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id), 
	FOREIGN KEY (medio_id) REFERENCES medio_notificacion(medio_id)
);


INSERT INTO ciudad (nombre_ciudad, codigo_postal)
VALUES
('Cali', '760001'),
('Bogota', '110111'),
('Medellin', '050001'),
('Barranquilla', '080001'),
('Cartagena', '130001'),
('Pasto', '520001'),
('Bucaramanga', '680001'),
('Manizales', '170001'),
('Pereira', '660001'),
('Santa Marta', '470001');


INSERT INTO usuario
(nombre, apellido, tipo_usuario, condicion_especial, ciudad_id)
VALUES
('Juan', 'Perez', 'cliente', 'Ninguna', 1),
('Maria', 'Gomez', 'cliente', 'Embarazo', 2),
('Carlos', 'Lopez', 'proveedor', 'Ninguna', 3),
('Ana', 'Martinez', 'empleado', 'Silla de ruedas', 4),
('Pedro', 'Ramirez', 'cliente', 'Adulto mayor', 5),
('Luisa', 'Fernandez', 'cliente', NULL, 6),
('Jorge', 'Castro', 'proveedor', NULL, 7),
('Sofia', 'Morales', 'empleado', NULL, 8),
('Daniel', 'Herrera', 'cliente', NULL, 9),
('Camila', 'Vargas', 'cliente', NULL, 10);

INSERT INTO empleado
(cargo, departamento, usuario_id)
VALUES
('Asesor', 'Atencion Cliente', 4),
('Consultor', 'Consultoria', 8);

INSERT INTO servicio
(nombre, descripcion, estado)
VALUES
('Despacho', 'Servicio de despacho de productos', 'Activo'),
('Recepcion', 'Recepcion de articulos', 'Activo'),
('Entrega', 'Entrega de pedidos', 'Activo'),
('Consultoria', 'Asesoria personalizada', 'Activo'),
('Atencion Cliente', 'Servicio al cliente', 'Activo'),
('Garantias', 'Gestion de garantias', 'Activo'),
('Facturacion', 'Procesos de pago', 'Activo'),
('Soporte', 'Soporte tecnico', 'Activo'),
('Inventario', 'Control de inventario', 'Activo'),
('Reclamos', 'Gestion de reclamos', 'Activo');

INSERT INTO medio_notificacion (nombre_medio)
VALUES
('Correo'),
('SMS'),
('Telefono'),
('WhatsApp'),
('Notificacion App'),
('Telegram'),
('Facebook'),
('Instagram'),
('Llamada'),
('Correo Corporativo');

INSERT INTO turno
(fecha, hora_inicio, hora_fin, estado,
usuario_id, servicio_id, empleado_id)
VALUES
('2026-05-20','08:00', '08:30', 'Pendiente', 1, 1, 1),
('2026-05-20','09:00', '09:30', 'Atendido', 2, 2, 2),
('2026-05-20','10:00', '10:30', 'Pendiente', 3, 3, 1),
('2026-05-20','11:00', '11:30', 'Cancelado', 5, 4, 2),
('2026-05-20','12:00', '12:30', 'Pendiente', 6, 5, 1),
('2026-05-21','08:00', '08:30', 'Atendido', 7, 6, 2),
('2026-05-21','09:00', '09:30', 'Pendiente', 9, 7, 1),
('2026-05-21','10:00', '10:30', 'Atendido', 10, 8, 2),
('2026-05-21','11:00', '11:30', 'Pendiente', 1, 9, 1),
('2026-05-21','12:00', '12:30', 'Pendiente', 2, 10, 2);

INSERT INTO notificacion
(mensaje, fecha_envio, estado, usuario_id, medio_id)
VALUES
('Turno registrado', '2026-05-20', 'Enviado', 1, 1),
('Turno confirmado', '2026-05-20', 'Enviado', 2, 2),
('Cambio de horario', '2026-05-20', 'Pendiente', 3, 3),
('Recordatorio de turno', '2026-05-20', 'Enviado', 4, 4),
('Turno cancelado', '2026-05-20', 'Enviado', 5, 5),
('Nuevo servicio disponible', '2026-05-21', 'Enviado', 6, 6),
('Turno actualizado', '2026-05-21', 'Pendiente', 7, 7),
('Atencion completada', '2026-05-21', 'Enviado', 8, 8),
('Pago confirmado', '2026-05-21', 'Enviado', 9, 9),
('Encuesta de satisfaccion', '2026-05-21', 'Pendiente', 10, 10);

SELECT * FROM usuario;
SELECT * FROM empleado;
SELECT * FROM turno;

--este codigo sirve para mostrar los turnos junto con la información del usuario y del servicio relacionado
SELECT
    turno.turno_id,
    usuario.nombre,
    usuario.apellido,
    servicio.nombre AS nombre_servicio,
    turno.fecha,
    turno.estado
FROM turno
JOIN usuario
	ON turno.usuario_id=usuario.usuario_id
JOIN servicio
	ON turno.servicio_id=servicio.servicio_id;

--Este código sirve para mostrar cada turno junto con el cliente, el empleado encargado y el servicio solicitado

SELECT
    turno.turno_id,
    usuario.nombre AS cliente,
    empleado.empleado_id,
    usuario_empleado.nombre AS empleado,
    servicio.nombre AS servicio
FROM turno

JOIN usuario
	ON turno.usuario_id = usuario.usuario_id

JOIN empleado
	ON turno.empleado_id = empleado.empleado_id

JOIN usuario AS usuario_empleado
	ON empleado.usuario_id = usuario_empleado.usuario_id

JOIN servicio
	ON turno.servicio_id = servicio.servicio_id;
