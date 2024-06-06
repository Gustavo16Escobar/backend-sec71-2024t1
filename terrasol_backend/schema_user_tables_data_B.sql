CREATE DATABASE ciisa_backend_v1_eva2_B;
CREATE USER 'ciisa_backend_v1_eva2_B'@'localhost' IDENTIFIED BY 'l4cl4v3-c11s4';
GRANT ALL PRIVILEGES ON ciisa_backend_v1_eva2_B . * TO 'ciisa_backend_v1_eva2_B'@'localhost';
FLUSH PRIVILEGES;

USE ciisa_backend_v1_eva2_B;

CREATE TABLE categoria_servicio (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE, -- COSTRAINT
    imagen TEXT NOT NULL,
    texto TEXT NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT FALSE
);

INSERT INTO categoria_servicio (id, nombre, imagen, texto, activo) VALUES 
(1, 'Parcelas', 'https://instagram.fscl35-1.fna.fbcdn.net/v/t51.29350-15/401321686_672984534973103_839303226120565269_n.heic?stp=dst-jpg_e35_s1080x1080&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMjAweDEyMDAuc2RyLmYyOTM1MCJ9&_nc_ht=instagram.fscl35-1.fna.fbcdn.net&_nc_cat=111&_nc_ohc=rUFo40wWercQ7kNvgFIlSrm&edm=ANTKIIoBAAAA&ccb=7-5&oh=00_AfA5CfXkADZck841EwphR9zK38pzE6tncDLCPiGqRUVb-w&oe=6638C159&_nc_sid=cf751b', 'Especializados en la venta de parcelas de 5000 metros cuadrados.', true),
(2, 'Casas en Parcelas', 'https://instagram.fscl35-1.fna.fbcdn.net/v/t51.29350-15/435520809_3615791345302050_8352826681605198519_n.heic?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi45NjB4OTYwLnNkci5mMjkzNTAifQ&_nc_ht=instagram.fscl35-1.fna.fbcdn.net&_nc_cat=106&_nc_ohc=meuCXidc6CUQ7kNvgGkSHtF&edm=ANTKIIoBAAAA&ccb=7-5&oh=00_AfBhTqFTr4Z4bvRjpnFLvUOFlOgif1v4MJLraIjskro6vQ&oe=6638B9BC&_nc_sid=cf751b', 'Disponemos de parcelas con la construcción hecha de la casa soñada.', true),
(3, 'Financiamiento', 'https://instagram.fscl35-1.fna.fbcdn.net/v/t51.29350-15/405813698_872745981244612_7720596082863161741_n.heic?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMDgweDEwODAuc2RyLmYyOTM1MCJ9&_nc_ht=instagram.fscl35-1.fna.fbcdn.net&_nc_cat=104&_nc_ohc=3YvV2HQfnjIQ7kNvgG6-88z&edm=ANTKIIoBAAAA&ccb=7-5&oh=00_AfCZ3zK3eIUCO95Q0kaDs1COr7HlXav7kL09dq-Vvs7SVg&oe=6638BD91&_nc_sid=cf751b', 'La empresa ofrece crédito directo sin necesidad de pasar por bancos, avales o requisitos complicados.', true);

CREATE TABLE info_contacto (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE, -- COSTRAINT
    icono VARCHAR(20),
    texto TEXT NOT NULL,
    texto_adicional TEXT,
    activo BOOLEAN NOT NULL DEFAULT FALSE
);

INSERT INTO info_contacto (id, nombre, texto, texto_adicional, activo) VALUES 
(1, 'facebook', 'Tu parcela en el sur de Chile', 'https://www.facebook.com/tuparcelaenelsurdechile?mibextid=ZbWKwL',true),
(2, 'instagram', 'terrasol_parcelas', 'https://www.instagram.com/terrasol_parcelas?igsh=eG51a2w4NGx5ODJu',true);

CREATE TABLE imagen (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE, -- COSTRAINT
    imagen TEXT NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT FALSE
);

INSERT INTO imagen (id, nombre, imagen, activo) VALUES 
(1, 'Imagen Parcela', 'https://instagram.fscl35-1.fna.fbcdn.net/v/t51.29350-15/401321686_672984534973103_839303226120565269_n.heic?stp=dst-jpg_e35_s1080x1080&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMjAweDEyMDAuc2RyLmYyOTM1MCJ9&_nc_ht=instagram.fscl35-1.fna.fbcdn.net&_nc_cat=111&_nc_ohc=rUFo40wWercQ7kNvgFIlSrm&edm=ANTKIIoBAAAA&ccb=7-5&oh=00_AfA5CfXkADZck841EwphR9zK38pzE6tncDLCPiGqRUVb-w&oe=6638C159&_nc_sid=cf751b', true),
(2, 'Imagen Casa en Parcela', 'https://instagram.fscl35-1.fna.fbcdn.net/v/t51.29350-15/435520809_3615791345302050_8352826681605198519_n.heic?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi45NjB4OTYwLnNkci5mMjkzNTAifQ&_nc_ht=instagram.fscl35-1.fna.fbcdn.net&_nc_cat=106&_nc_ohc=meuCXidc6CUQ7kNvgGkSHtF&edm=ANTKIIoBAAAA&ccb=7-5&oh=00_AfBhTqFTr4Z4bvRjpnFLvUOFlOgif1v4MJLraIjskro6vQ&oe=6638B9BC&_nc_sid=cf751b', true),
(3, 'Imagen Financiamiento', 'https://instagram.fscl35-1.fna.fbcdn.net/v/t51.29350-15/405813698_872745981244612_7720596082863161741_n.heic?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMDgweDEwODAuc2RyLmYyOTM1MCJ9&_nc_ht=instagram.fscl35-1.fna.fbcdn.net&_nc_cat=104&_nc_ohc=3YvV2HQfnjIQ7kNvgG6-88z&edm=ANTKIIoBAAAA&ccb=7-5&oh=00_AfCZ3zK3eIUCO95Q0kaDs1COr7HlXav7kL09dq-Vvs7SVg&oe=6638BD91&_nc_sid=cf751b', true);


CREATE TABLE historia (
    id INT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    texto TEXT,
    activo BOOLEAN NOT NULL DEFAULT FALSE
);

INSERT INTO historia (id, tipo, texto, activo) VALUES 
(1, 'titulo', 'Terrasol Parcelas no solo ofrece tierras, sino también un estilo de vida.', true),
(2, 'subtitulo', 'Inicios', true),
(3, 'parrafo', 'Terrasol Parcelas emerge como un referente en el mercado inmobiliario de la zona centro sur de Chile, ofreciendo una oportunidad única para aquellos que buscan invertir en la naturaleza y la tranquilidad de este idílico paisaje. Especializados en la venta de parcelas de 5000 metros cuadrados, Terrasol Parcelas facilita el acceso a la propiedad de tierras con una inversión inicial accesible, comenzando desde tan solo 1 millón de pesos.', true),
(4, 'imagen', '', true),
(5, 'subtitulo', 'Nos diferenciamos', true),
(6, 'parrafo', 'Lo que diferencia a Terrasol Parcelas es su enfoque innovador y centrado en el cliente. Con el objetivo de brindar una experiencia completa y transparente, la empresa ofrece un tour virtual de las parcelas, permitiendo a los clientes explorar y visualizar cada rincón de sus futuras propiedades desde la comodidad de sus hogares. Además, para aquellos que buscan una solución integral, Terrasol Parcelas también ofrece la opción de adquirir parcelas que incluyen casas, proporcionando una alternativa llave en mano para aquellos que desean una vida en armonía con la naturaleza sin sacrificar comodidades modernas.', true),
(7, 'imagen', '', true);

CREATE TABLE historia_imagen (
    id INT PRIMARY KEY,
    historia_id INT NOT NULL,
    imagen_id INT NOT NULL,
    FOREIGN KEY (historia_id) REFERENCES historia (id),
    FOREIGN KEY (imagen_id) REFERENCES imagen (id)
);

INSERT INTO historia_imagen (id, historia_id, imagen_id) VALUES 
(1, 4, 1), 
(2, 7, 2);

CREATE TABLE pregunta_frecuente (
    id INT PRIMARY KEY,
    pregunta TEXT NOT NULL,
    respuesta TEXT NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT FALSE    
);

INSERT INTO pregunta_frecuente (id, pregunta, respuesta, activo) VALUES 
(1, '¿Cómo solicito una cotización?', 'Puedes contactarnos por mensaje directo en instagram o facebook y nos pides la cotización.',true),
(2, '¿Cómo veo una parcela o casa?', 'Puedes solicitar visita virtual por mensaje directo en instagram o facebook',true),
(3, '¿Cómo veo los temas de financiamiento directo?', 'Puedes contactarnos por mensaje directo en instagram o facebook y nos indicas que buscas financiamientos.',true);

CREATE TABLE parcela_tipo(
    id INT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT FALSE    
);

INSERT INTO parcela_tipo (id, nombre, activo) VALUES 
(1, 'Solo Parcela', true),
(2, 'Parcela con Casa', true);

CREATE TABLE parcela_lote (
    id INT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT FALSE
);

INSERT INTO parcela_lote (id, nombre, activo) VALUES 
(1, 'San Nicolás', true),
(2, 'Brisas de Parral', true);

CREATE TABLE parcela_servicio (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT FALSE
);

INSERT INTO parcela_servicio (id, nombre, activo) VALUES 
(1, 'Rol Propio', true),
(2, 'Agua potable', true),
(3, 'Factibilidad de luz', true),
(4, 'Gas natural', true),
(5, 'Fibra óptica', true),
(6, 'Gas', true),
(7, 'Pozo', true),
(8, 'Alcantarillado', true),
(9, 'Áreas comunes', true),
(10, 'Camino Pavimentado al Parcelado', true),
(11, 'Camino Ripeado al Parcelado', true),
(12, 'Camino Pavimentado interior', true),
(13, 'Camino Ripeado interior', true),
(14, 'Camino Ripeado interior', true),
(15, 'Terrenos aptos para el cultivo y agricultura', true);

CREATE TABLE parcela (
    id INT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    parcela_lote_id INT NOT NULL,
    parcela_tipo_id INT NOT NULL,
    numeracion_interna VARCHAR(10),
    terreno_ancho INT,
    terreno_largo INT,
    terreno_despejado_arboles BOOLEAN DEFAULT FALSE,
    ubicacion_latitud_gm DOUBLE NOT NULL,
    ubicacion_longitud_gm DOUBLE NOT NULL,
    pie INT NOT NULL,
    valor INT NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (parcela_lote_id) REFERENCES parcela_lote (id),
    FOREIGN KEY (parcela_tipo_id) REFERENCES parcela_tipo (id)
);

INSERT INTO parcela (id, nombre, parcela_lote_id, parcela_tipo_id, numeracion_interna, terreno_ancho, terreno_largo, terreno_despejado_arboles, ubicacion_latitud_gm, ubicacion_longitud_gm, pie, valor, activo) VALUES 
(1, 'San Nicolás - A1', 1, 1, 'A1', 100, 50, TRUE, -36.502028, -72.231966, 1500000, 15990000, TRUE);

CREATE TABLE parcela_servicio_parcela (
    id INT PRIMARY KEY,
    parcela_id INT NOT NULL,
    parcela_servicio_id INT NOT NULL,
    FOREIGN KEY (parcela_id) REFERENCES parcela (id),
    FOREIGN KEY (parcela_servicio_id) REFERENCES parcela_servicio (id)
);

INSERT INTO parcela_servicio_parcela (id, parcela_id, parcela_servicio_id) VALUES 
(1,1,1),
(2,1,2),
(3,1,3),
(4,1,7),
(5,1,9);