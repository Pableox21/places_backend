
CREATE TABLE horarios (
                idHorario INT NOT NULL,
                hora_inicio TIME NOT NULL,
                dia TIME NOT NULL,
                hora_fin TIME NOT NULL,
                PRIMARY KEY (idHorario)
);


CREATE TABLE lugares_turisticos (
                idLugares INT NOT NULL,
                nombre VARCHAR DEFAULT 300 NOT NULL,
                descripcion VARCHAR DEFAULT 500 NOT NULL,
                latitud DECIMAL NOT NULL,
                longitud DECIMAL NOT NULL,
                departamento VARCHAR DEFAULT 300 NOT NULL,
                provincia VARCHAR DEFAULT 300 NOT NULL,
                municipio VARCHAR DEFAULT 300 NOT NULL,
                ciudad VARCHAR DEFAULT 300 NOT NULL,
                ubicacion VARCHAR DEFAULT 300 NOT NULL,
                idHorario INT NOT NULL,
                PRIMARY KEY (idLugares)
);


CREATE TABLE funcionalidades (
                id_funcionalidade INT NOT NULL,
                nombre VARCHAR DEFAULT 50 NOT NULL,
                PRIMARY KEY (id_funcionalidade)
);


CREATE TABLE roles (
                id_rol INT NOT NULL,
                nombres VARCHAR DEFAULT 100 NOT NULL,
                PRIMARY KEY (id_rol)
);


CREATE TABLE privilegios (
                id_rol INT NOT NULL,
                id_funcionalidade INT NOT NULL,
                PRIMARY KEY (id_rol, id_funcionalidade)
);


CREATE TABLE personas (
                id_persona INT NOT NULL,
                apellidos VARCHAR DEFAULT 100 NOT NULL,
                email VARCHAR DEFAULT 100 NOT NULL,
                genero VARCHAR DEFAULT 50 NOT NULL,
                direccion VARCHAR DEFAULT 200 NOT NULL,
                nombres VARCHAR DEFAULT 100 NOT NULL,
                celular INT NOT NULL,
                telefono_fijo INT NOT NULL,
                fecha_nacimiento DATE NOT NULL,
                CI VARCHAR DEFAULT 50 NOT NULL,
                PRIMARY KEY (id_persona)
);


CREATE TABLE usuarios (
                id_persona INT NOT NULL,
                usuario VARCHAR DEFAULT 50 NOT NULL,
                contrasena VARCHAR NOT NULL,
                PRIMARY KEY (id_persona)
);


CREATE UNIQUE INDEX usuarios_idx
 ON usuarios
 ( usuario );

CREATE TABLE favoritos (
                idLugares INT NOT NULL,
                id_persona INT NOT NULL,
                PRIMARY KEY (idLugares, id_persona)
);


CREATE TABLE comentarios (
                idComentarios INT NOT NULL,
                calificacion VARCHAR DEFAULT 500 NOT NULL,
                id_persona INT NOT NULL,
                comentario VARCHAR DEFAULT 500 NOT NULL,
                fechaComentario DATE NOT NULL,
                idLugares INT NOT NULL,
                idREComentarios INT NOT NULL,
                PRIMARY KEY (idComentarios)
);


CREATE TABLE Fotos (
                idFotos INT NOT NULL,
                descripcion VARCHAR DEFAULT 300 NOT NULL,
                url VARCHAR NOT NULL,
                idLugares INT NOT NULL,
                idComentarios INT NOT NULL,
                PRIMARY KEY (idFotos)
);


CREATE TABLE cuentas (
                id_persona INT NOT NULL,
                id_rol INT NOT NULL,
                PRIMARY KEY (id_persona, id_rol)
);


ALTER TABLE lugares_turisticos ADD CONSTRAINT horarios_lugares_turisticos_fk
FOREIGN KEY (idHorario)
REFERENCES horarios (idHorario)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Fotos ADD CONSTRAINT lugares_turisticos_fotos_fk
FOREIGN KEY (idLugares)
REFERENCES lugares_turisticos (idLugares)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comentarios ADD CONSTRAINT lugares_turisticos_comentarios_fk
FOREIGN KEY (idLugares)
REFERENCES lugares_turisticos (idLugares)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE favoritos ADD CONSTRAINT lugares_turisticos_favoritos_fk
FOREIGN KEY (idLugares)
REFERENCES lugares_turisticos (idLugares)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE privilegios ADD CONSTRAINT funcionalidades_privilegios_fk
FOREIGN KEY (id_funcionalidade)
REFERENCES funcionalidades (id_funcionalidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE cuentas ADD CONSTRAINT roles_cuentas_fk
FOREIGN KEY (id_rol)
REFERENCES roles (id_rol)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE privilegios ADD CONSTRAINT roles_privilegios_fk
FOREIGN KEY (id_rol)
REFERENCES roles (id_rol)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE usuarios ADD CONSTRAINT personas_usuarios_fk
FOREIGN KEY (id_persona)
REFERENCES personas (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE cuentas ADD CONSTRAINT usuarios_cuentas_fk
FOREIGN KEY (id_persona)
REFERENCES usuarios (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comentarios ADD CONSTRAINT usuarios_comentarios_fk
FOREIGN KEY (id_persona)
REFERENCES usuarios (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE favoritos ADD CONSTRAINT usuarios_favoritos_fk
FOREIGN KEY (id_persona)
REFERENCES usuarios (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Fotos ADD CONSTRAINT comentarios_fotos_fk
FOREIGN KEY (idComentarios)
REFERENCES comentarios (idComentarios)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comentarios ADD CONSTRAINT comentarios_comentarios_fk
FOREIGN KEY (idREComentarios)
REFERENCES comentarios (idComentarios)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
