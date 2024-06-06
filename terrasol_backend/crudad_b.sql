-- CREATE
INSERT INTO categoria_servicio (id, nombre, imagen, texto, activo) VALUES (0, 'NOMBRE', 'URL IMAGEN', 'TEXTO', true);
INSERT INTO info_contacto (id, nombre, texto, texto_adicional, activo) VALUES (0, 'NOMBRE', 'TEXTO', 'TEXTO ADICIONAL', true);
INSERT INTO imagen (id, nombre, imagen, activo) VALUES (0, 'NOMBRE', 'URL IMAGEN', true);
INSERT INTO historia (id, tipo, texto, activo) VALUES (0, 'TIPO', 'TEXTO', true);
INSERT INTO historia_imagen (id, historia_id, imagen_id) VALUES (0, 0, 0);
INSERT INTO pregunta_frecuente (id, pregunta, respuesta, activo) VALUES (0, 'PREGUNTA', 'RESPUESTA', true);
INSERT INTO parcela_tipo (id, nombre, activo) VALUES (0, 'TIPO', true);
INSERT INTO parcela_lote (id, nombre, activo) VALUES (0, 'TIPO', true);
INSERT INTO parcela_servicio (id, nombre, activo) VALUES (0, 'TIPO', true);
INSERT INTO parcela (id, nombre, parcela_lote_id, parcela_tipo_id, numeracion_interna, terreno_ancho, terreno_largo, terreno_despejado_arboles, ubicacion_latitud_gm, ubicacion_longitud_gm, activo) VALUES (0, 'Nombre', 0, 0, 'Numeracion', 100, 50, TRUE, -36.502028, -72.231966, 1500000, 15000000,TRUE);
INSERT INTO parcela_servicio_parcela (id, parcela_id, parcela_servicio_id) VALUES (0, 0, 0);

-- READ
SELECT id, nombre, imagen, texto, activo FROM categoria_servicio;
SELECT id, nombre, texto, texto_adicional, activo FROM info_contacto;
SELECT id, nombre, imagen, activo FROM imagen;
SELECT id, tipo, texto, activo FROM historia;
SELECT id, historia_id, imagen_id FROM historia_imagen;
SELECT id, pregunta, respuesta, activo FROM pregunta_frecuente;
SELECT id, nombre, activo FROM parcela_tipo;
SELECT id, nombre, activo FROM parcela_lote;
SELECT id, nombre, activo FROM parcela_servicio;
SELECT id, nombre, parcela_lote_id, parcela_tipo_id, numeracion_interna, terreno_ancho, terreno_largo, terreno_despejado_arboles, ubicacion_latitud_gm, ubicacion_longitud_gm, activo FROM parcela;
SELECT id, parcela_id, parcela_servicio_id FROM parcela_servicio_parcela;


-- UPDATE
UPDATE categoria_servicio SET nombre = 'Nuevo nombre', imagen = 'Nueva url imagen', texto = 'Nuevo texto' WHERE id = 0;
UPDATE info_contacto SET nombre = 'Nuevo nombre', texto = 'Nuevo texto', texto_adicional = 'Nuevo texto adicional' WHERE id = 0;
UPDATE imagen SET nombre = 'Nuevo nombre', imagen = 'Nueva url imagen' WHERE id = 0;
UPDATE historia SET tipo = 'Nuevo tipo', texto = 'Nuevo texto' WHERE id = 0;
UPDATE historia_imagen SET historia_id = 'Nuevo id', imagen_id = 'Nuevo id' WHERE id = 0;
UPDATE pregunta_frecuente SET pregunta = 'Nueva pregunta', respuesta = 'Nueva respuesta' WHERE id = 0;
UPDATE parcela_tipo SET nombre = 'Nuevo nombre' WHERE id = 0;
UPDATE parcela_lote SET nombre = 'Nuevo nombre' WHERE id = 0;
UPDATE parcela_servicio SET nombre = 'Nuevo nombre' WHERE id = 0;
UPDATE parcela SET nombre = 'Nuevo nombre', parcela_lote_id = 'Nuevo id', parcela_tipo_id = 'Nuevo id', numeracion_interna = 'Nueva numeracion', terreno_ancho = 'Nuevo ancho', terreno_largo = 'Nuevo largo', terreno_despejado_arboles = 'True/False', ubicacion_latitud_gm = 'Nueva lat', ubicacion_longitud_gm = 'Nueva lon', pie = 'Nuevo pie', valor = 'Nuevo valor' WHERE id = 0;
UPDATE parcela_servicio_parcela SET parcela_id = 'Nuevo id', parcela_servicio_id = 'Nuevo id' WHERE id = 0;

-- DESACTIVATE
UPDATE categoria_servicio SET activo = false WHERE id = 0;
UPDATE info_contacto SET activo = false WHERE id = 0;
UPDATE imagen SET activo = false WHERE id = 0;
UPDATE historia SET activo = false WHERE id = 0;
UPDATE historia_imagen SET activo = false WHERE id = 0;
UPDATE pregunta_frecuente SET activo = false WHERE id = 0;
UPDATE parcela_tipo SET activo = false WHERE id = 0;
UPDATE parcela_lote SET activo = false WHERE id = 0;
UPDATE parcela_servicio SET activo = false WHERE id = 0;
UPDATE parcela SET activo = false WHERE id = 0;

-- ACTIVATE
UPDATE categoria_servicio SET activo = true WHERE id = 0;
UPDATE info_contacto SET activo = true WHERE id = 0;
UPDATE imagen SET activo = true WHERE id = 0;
UPDATE historia SET activo = true WHERE id = 0;
UPDATE historia_imagen SET activo = true WHERE id = 0;
UPDATE pregunta_frecuente SET activo = true WHERE id = 0;
UPDATE parcela_tipo SET activo = true WHERE id = 0;
UPDATE parcela_lote SET activo = true WHERE id = 0;
UPDATE parcela_servicio SET activo = true WHERE id = 0;
UPDATE parcela SET activo = true WHERE id = 0;

-- DELETE
DELETE FROM categoria_servicio WHERE id = 0;
DELETE FROM info_contacto WHERE id = 0;
DELETE FROM imagen WHERE id = 0;
DELETE FROM historia WHERE id = 0;
DELETE FROM historia_imagen WHERE id = 0;
DELETE FROM pregunta_frecuente WHERE id = 0; 
DELETE FROM parcela_tipo WHERE id = 0; 
DELETE FROM parcela_lote WHERE id = 0;
DELETE FROM parcela_servicio WHERE id = 0;
DELETE FROM parcela WHERE id = 0;
DELETE FROM parcela_servicio_parcela WHERE id = 0;