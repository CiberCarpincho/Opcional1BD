
CREATE TABLE usuario (
    usuario_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL ,
    condicion VARCHAR(200) NOT NULL ,
);

CREATE TABLE notificacion (
    usuario_id INT NOT NULL ,
    medio_id INT NOT NULL,
    notificacion_id SERIAL PRIMARY KEY,
    medio_id SERIAL,
    mensaje VARCHAR(300) NOT NULL ,
    estado ENUM('pendiente', 'enviada', 'leída', 'fallida') DEFAULT 'pendiente',
    fecha_envio TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
    FOREIGN KEY (medio_id) REFERENCES medio(medio_id)
);

CREATE TABLE medio (
    medio_id SERIAL PRIMARY KEY,
    tipo_medio VARCHAR(50) NOT NULL ,
    descripcion VARCHAR (100),
);

CREATE TABLE reserva (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_mision INT NOT NULL,
    estado_reserva ENUM('pendiente', 'confirmada', 'activa', 'completada', 'cancelada', 'no_show') DEFAULT 'pendiente',
    comentarios VARCHAR(200),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_mision) REFERENCES mision(id_mision)
);

CREATE TABLE mision (
    id_mision SERIAL PRIMARY KEY ,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME,}
    capacidad_max INT DEFAULT 1,
    estado ENUM('planificada', 'activa', 'completada', 'cancelada') DEFAULT 'planificada',
);

CREATE TABLE nave (
    nave_id SERIAL PRIMARY KEY,
    tipo ENUM('destructor sayayin', 'ataque rapidisimo', 'la nave de anakin', 'motocicleta intergalactica') DEFAULT 'destructor sayayin',
    nombre VARCHAR (100),
);

CREATE TABLE carga(
    carga_id SERIAL PRIMARY KEY,
    id_mision INT NOT NULL,
    peso DECIMAL(10,2) NOT NULL,
    descripcion VARCHAR(300),
    FOREIGN KEY (id_mision) REFERENCES mision(id_mision)
);