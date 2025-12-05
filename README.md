
Proyecto: Despliegue de Base de Datos para AeroGalaxy
Este repositorio documenta la implementación de una base de datos para AeroGalaxy, una empresa dedicada al turismo espacial y misiones de investigación. El proyecto consiste en desplegar un entorno de base de datos usando Docker, configurar PostgreSQL y pgAdmin, y crear las estructuras iniciales para el sistema de gestión de vuelos, tripulaciones, pasajeros y cargas espaciales.

Objetivos del Proyecto
Desplegar un contenedor con PostgreSQL v14.

Desplegar un contenedor con pgAdmin v4.

Configurar la conexión entre pgAdmin y PostgreSQL.

Crear la base de datos aerogalaxy.

Definir al menos dos tablas con instrucciones DDL.

Insertar registros de ejemplo usando DML.

🛠️ Tecnologías Utilizadas
Docker

PostgreSQL 14

pgAdmin 4

SQL (DDL y DML)

Pasos de Implementación
1. Despliegue de Contenedores
PostgreSQL:
bash
docker run --name postgres-aerogalaxy \
  -e POSTGRES_USER=aerogalaxy \
  -e POSTGRES_PASSWORD=aerogalaxy_db \
  -p 5432:5432 \
  -d postgres:14
pgAdmin:
bash
docker run --name pgadmin-aerogalaxy \
  -e PGADMIN_DEFAULT_EMAIL=usuario@aerogalaxy.com \
  -e PGADMIN_DEFAULT_PASSWORD=galaxy#445 \
  -p 8080:80 \
  -d dpage/pgadmin4:4
2. Configuración de Conexión
Acceder a pgAdmin en: http://localhost:8080

Agregar un nuevo servidor PostgreSQL con:

Host: postgres-aerogalaxy (nombre del contenedor) o IP del contenedor

Port: 5432

Usuario: aerogalaxy

Contraseña: aerogalaxy_db

3. Creación de la Base de Datos
En pgAdmin o mediante consola SQL:

sql
CREATE DATABASE aerogalaxy;
4. Creación de Tablas (DDL)
Ejemplo de tablas para el sistema:

sql
CREATE TABLE nave (
    nave_id SERIAL PRIMARY KEY,
    mision_id INT,
    tipo tipo_nave_enum DEFAULT 'destructor sayayin',
    nombre VARCHAR(100),
    FOREIGN KEY (mision_id) REFERENCES mision(id_mision)
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
5. Inserción de Datos (DML)
Ejemplo de inserción en usuario:

sql
INSERT INTO usuario (nombre, condicion) VALUES
('Luke Skywalker', 'Caballero Jedi - Maestro de la Fuerza'),
('Princesa Leia Organa', 'Líder de la Alianza Rebelde - Senadora'),
('Han Solo', 'Contrabandista - Capitán del Halcón Milenario'),
('Darth Vader', 'Lord Sith - Comandante Imperial'),
('Yoda', 'Gran Maestro Jedi - Consejero'),
('Obi-Wan Kenobi', 'Caballero Jedi - Mentor'),
('Chewbacca', 'Copiloto Wookiee - Guerrero'),
('R2-D2', 'Droide Astromecánico - Navegador'),
('C-3PO', 'Droide de Protocolo - Traductor'),
('Lando Calrissian', 'Administrador de Ciudad Nube - General'),
('Boba Fett', 'Cazarrecompensas Mandaloriano'),
('Padmé Amidala', 'Ex Reina de Naboo - Senadora'),
('Mace Windu', 'Maestro Jedi - Miembro del Consejo'),
('Jabba the Hutt', 'Señor del Crimen de Tatooine'),
('Rey', 'Basurera de Jakku - Jedi en entrenamiento');

Video de Demostración
Puedes ver el video completo del despliegue y configuración en:
https://youtu.be/98CpacL9T08?si=krg7LYmAOdjplj1f
