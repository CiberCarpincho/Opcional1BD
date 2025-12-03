
CREATE TYPE estado_enum AS ENUM ('pendiente', 'enviada', 'leída', 'fallida');
CREATE TYPE estado_reserva_enum AS ENUM ('pendiente', 'confirmada', 'activa', 'completada', 'cancelada', 'no_show');
CREATE TYPE estado_mision_enum AS ENUM ('planificada', 'activa', 'completada', 'cancelada');
CREATE TYPE tipo_nave_enum AS ENUM ('destructor sayayin', 'ataque rapidisimo', 'la nave de anakin', 'motocicleta intergalactica');


CREATE TABLE usuario (
    usuario_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    condicion VARCHAR(200) NOT NULL
);

CREATE TABLE medio (
    medio_id SERIAL PRIMARY KEY,
    tipo_medio VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100)
);

CREATE TABLE notificacion (
    usuario_id INT NOT NULL,
    medio_id INT NOT NULL,
    mensaje VARCHAR(300) NOT NULL,
    estado estado_enum DEFAULT 'pendiente',
    fecha_envio TIMESTAMP,
    PRIMARY KEY (usuario_id, medio_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
    FOREIGN KEY (medio_id) REFERENCES medio(medio_id)
);

CREATE TABLE mision (
    id_mision SERIAL PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT,
    duracion INT,
    destino VARCHAR(20),
    fecha_inicio TIMESTAMP NOT NULL,
    fecha_fin TIMESTAMP,
    capacidad_max INT DEFAULT 1,
    estado estado_mision_enum DEFAULT 'planificada'
);

CREATE TABLE nave (
    nave_id SERIAL PRIMARY KEY,
    mision_id INT,
    tipo tipo_nave_enum DEFAULT 'destructor sayayin',
    nombre VARCHAR(100),
    FOREIGN KEY (mision_id) REFERENCES mision(id_mision)
);

CREATE TABLE carga (
     carga_id SERIAL PRIMARY KEY,
     id_mision INT NOT NULL,
     tipo VARCHAR(20),
     peso DECIMAL(10,2) NOT NULL,
     descripcion VARCHAR(300),
     FOREIGN KEY (id_mision) REFERENCES mision(id_mision)
);

CREATE TABLE reserva (
     id_usuario INT NOT NULL,
     id_mision INT NOT NULL,
     estado_reserva estado_reserva_enum DEFAULT 'pendiente',
     comentarios VARCHAR(200),
     PRIMARY KEY (id_usuario, id_mision),
     FOREIGN KEY (id_usuario) REFERENCES usuario(usuario_id),
     FOREIGN KEY (id_mision) REFERENCES mision(id_mision)
);

