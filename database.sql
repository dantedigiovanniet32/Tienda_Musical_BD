drop database if exists tienda_musical;
create database tienda_musical;
use tienda_musical;

drop table if exists usuarios;
create table usuarios (
    id int unsigned auto_increment primary key,
    nombre varchar(100) not null,
    correo varchar(190) not null unique,
    password_hash varchar(255) not null,
    creado_en timestamp not null default current_timestamp
);
drop table if exists provincias;
CREATE TABLE provincias (
    id_provincia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    iva DECIMAL(5,2)
);
drop table if exists localidades_barrios;
CREATE TABLE localidades_barrios (
    id_localidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    poblacion INT,
    codigo_postal VARCHAR(20),
    id_provincia INT,
    FOREIGN KEY (id_provincia) REFERENCES provincias(id_provincia)
);
drop table if exists calle;
CREATE TABLE calle (
    id_calle INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    altura INT,
    descripcion VARCHAR(255),
    id_localidad INT,
    FOREIGN KEY (id_localidad) REFERENCES localidades_barrios(id_localidad)
);
drop table if exists sucursales;
CREATE TABLE sucursales (
    id_sucursal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_calle INT,
    usuario VARCHAR(50),
    contrasenia VARCHAR(255),
    cude VARCHAR(50),
    correo VARCHAR(100),
    telefono VARCHAR(50),
    FOREIGN KEY (id_calle) REFERENCES calle(id_calle)
);
drop table if exists proveedores;
CREATE TABLE proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_calle INT,
    correo VARCHAR(100),
    FOREIGN KEY (id_calle) REFERENCES calle(id_calle)
);
drop table if exists clientes;
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    dni VARCHAR(20),
    id_calle INT,
    correo VARCHAR(100),
    FOREIGN KEY (id_calle) REFERENCES calle(id_calle)
);
drop table if exists categoria;
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    cant_subcategorias INT
);
drop table if exists subcategoria;
CREATE TABLE subcategoria (
    id_subcategoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);
drop table if exists marcas;
CREATE TABLE marcas (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);
drop table if exists artista;
CREATE TABLE artista (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    genero_principal VARCHAR(50),
    ruam VARCHAR(50)
);
drop table if exists productos;
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_img varchar(500),
    imagen_blob MEDIUMBLOB NULL,
    modelo VARCHAR(100),
    codigo VARCHAR(50),
    descripcion VARCHAR(255),
    precio_venta DECIMAL(10,2),
    id_subcategoria INT,
    id_marca INT,
    id_artista INT,
    id_proveedor INT,
    FOREIGN KEY (id_subcategoria) REFERENCES subcategoria(id_subcategoria),
    FOREIGN KEY (id_marca) REFERENCES marcas(id_marca),
    FOREIGN KEY (id_artista) REFERENCES artista(id_artista),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

drop table if exists inventario;
CREATE TABLE inventario (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    cantidad INT,
    id_sucursal INT,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);
drop table if exists historial_precios;
CREATE TABLE historial_precios (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    precio_anterior DECIMAL(10,2),
    fecha_cambio DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
drop table if exists formas_pago;
CREATE TABLE formas_pago (
    id_forma INT AUTO_INCREMENT PRIMARY KEY,
    forma VARCHAR(50),
    proveedora VARCHAR(100)
);
drop table if exists puestos;
CREATE TABLE puestos (
    id_puesto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    sueldo DECIMAL(10,2)
);
drop table if exists empleados;
CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    id_sucursal INT,
    id_puesto INT,
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal),
    FOREIGN KEY (id_puesto) REFERENCES puestos(id_puesto)
);
drop table if exists ventas;
CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_sucursal INT,
    id_cliente INT,
    id_forma INT,
    fecha DATE,
    tipo VARCHAR(20),
    id_empleado INT,
    id_producto INT,
    cantidad INT,
    precio_total DECIMAL(10,2),
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_forma) REFERENCES formas_pago(id_forma),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO categoria (id_categoria, nombre, cant_subcategorias) VALUES
(1, 'Baterias Acústicas', 1),
(2, 'Guitarras', 2),
(3, 'Teclados', 1),
(4, 'Audio Profesional', 2),
(5, 'Accesorios', 2);

INSERT INTO subcategoria (id_subcategoria, nombre, id_categoria) VALUES
(1, 'Baterias Acústicas', 1),
(2, 'Guitarras Eléctricas', 2),
(3, 'Guitarras Clásicas', 2),
(4, 'Pianos y Teclados', 3),
(5, 'Auriculares y Monitores', 4),
(6, 'Baquetas y Accesorios', 5),
(7, 'Micrófonos', 4),
(8, 'Ukuleles', 2);

INSERT INTO marcas (id_marca, nombre) VALUES
(1, 'Pearl'),
(2, 'Tama'),
(3, 'Fender'),
(4, 'Casio'),
(5, 'Audio-Technica'),
(6, 'Shure'),
(7, 'Leonard'),
(8, 'Hofner');

INSERT INTO artista (id_artista, nombre, genero_principal, ruam) VALUES
(1, 'Pearl', 'Percusión', 'PEARL-01'),
(2, 'Tama', 'Percusión', 'TAMA-01'),
(3, 'Fender', 'Rock', 'FENDER-01'),
(4, 'Casio', 'Teclado', 'CASIO-01'),
(5, 'Audio-Technica', 'Audio', 'AUDIO-TECH-01'),
(6, 'Shure', 'Audio', 'SHURE-01'),
(7, 'Leonard', 'Guitarra', 'LEONARD-01');

INSERT INTO proveedores (id_proveedor, nombre, id_calle, correo) VALUES
(1, 'ProMusic Argentina', NULL, 'ventas@promusic.com.ar'),
(2, 'Sonido Norte', NULL, 'info@sonidonorte.com'),
(3, 'Tienda Instrumental', NULL, 'contacto@instrumental.com.ar'),
(4, 'Distribuidora Casio', NULL, 'ventas@casioar.com'),
(5, 'Audio Total', NULL, 'info@audiototal.com.ar');

INSERT INTO productos (id_producto, nombre_img, modelo, codigo, descripcion, precio_venta, id_subcategoria, id_marca, id_artista, id_proveedor) VALUES
(1, 'images/image-120.png', 'Bateria Pearl', 'BAT-PEARL-120', 'Batería acústica Pearl de gama premium con sonido balanceado y gran respuesta.', 2244574.89, 1, 1, 1, 1),
(2, 'images/image-126.png', 'Bateria Pearl Roadshow', 'BAT-PEARL-126', 'Kit de batería con gran potencia para escenarios y estudios.', 2244574.89, 1, 1, 1, 1),
(3, 'images/image-132.png', 'Bateria Thunder', 'BAT-THUNDER-132', 'Batería Thunder con estética sobria y excelente punch en bajo.', 2244574.89, 1, 2, 2, 2),
(4, 'images/image-138.png', 'Bateria Acústica', 'BAT-ACUSTICA-138', 'Batería acústica ideal para práctica y grabaciones profesionales.', 2544574.89, 1, 1, 1, 1),
(5, 'images/image-144.png', 'Bateria Pearl Studio', 'BAT-PEARL-144', 'Modelo compacto con excelente proyectividad y durabilidad.', 1244574.89, 1, 1, 1, 1),
(6, 'images/image-150.png', 'Bateria Pearl Pro', 'BAT-PEARL-150', 'Versión pro con acabado premium y mejor respuesta de ataque.', 1600574.89, 1, 1, 1, 3),
(7, 'images/image-27-13.png', 'Pearl Master Maple', 'BAT-MASTER-27', 'Batería Pearl Master Maple completa con 3 cuerpos y acabado satin natural burst.', 4578195.98, 1, 1, 1, 1),
(8, 'images/image-28-14.png', 'Pearl Master Maple Vista 2', 'BAT-MASTER-28', 'Vista lateral de batería Pearl con diseño clásico y sonido voluminoso.', 4578195.98, 1, 1, 1, 1),
(9, 'images/image-29-15.png', 'Pearl Master Maple Vista 3', 'BAT-MASTER-29', 'Detalle del diseño premium para bateristas profesionales.', 4578195.98, 1, 1, 1, 1),
(10, 'images/image-268.png', 'Baquetas Pro', 'ACC-BAQUETAS-268', 'Baquetas profesionales para ensayos, show en vivo y estudio.', 16999.00, 6, 1, 1, 5),
(11, 'images/image-274.png', 'Piano Casio Grand', 'TECL- CASIO-274', 'Piano digital Casio con teclas sensibles y gran variedad de sonidos.', 799999.00, 4, 4, 4, 4),
(12, 'images/image-280.png', 'Guitarra Eléctrica Fender', 'GTR-FENDER-280', 'Guitarra eléctrica Fender con cuerpo sólida y tono clásico.', 1599999.00, 2, 3, 3, 3),
(13, 'images/image-287.png', 'Guitarra Eléctrica Leonard', 'GTR-LEONARD-287', 'Modelo de guitarra eléctrica con estilo vintage y excelente respuesta.', 1399999.00, 2, 7, 7, 3),
(14, 'images/image-293.png', 'Ukulele Soprano', 'GTR-UKULELE-293', 'Ukulele soprano ideal para principiantes y presentaciones acústicas.', 89999.00, 8, 8, 7, 2),
(15, 'images/image-299.png', 'Auriculares de Monitor', 'AUD-AURIC-299', 'Auriculares de monitor para ensayos y grabaciones con aislamiento acústico.', 349999.00, 5, 5, 5, 5),
(16, 'images/hero-image-264.png', 'Guitarra Eléctrica Deluxe', 'GTR-HERO-264', 'Guitarra eléctrica con acabado premium para uso profesional.', 1849999.00, 2, 3, 3, 3),
(17, 'images/hero-image-367.png', 'Instrumento de Madera', 'ACC-MADERA-367', 'Accesorio y soporte de madera para instrumentos y estudio.', 149999.00, 6, 2, 2, 2),
(18, 'images/image-13-361.png', 'Bateria Pearl JR Roadshow', 'BAT-JR-361', 'Batería compacta con estilo y potencia para principiantes.', 1999999.00, 1, 1, 1, 1),
(19, 'images/image-14-374.png', 'Bateria Tama Stage Star', 'BAT-TAMA-374', 'Batería Tama Stage Star en verde lime con gran presencia visual y sonora.', 2149999.00, 1, 2, 2, 2),
(20, 'images/image-22-402.png', 'Micrófono Shure SM58', 'MIC-SM58-402', 'Micrófono dinámico profesional para voz, ensayos y shows.', 499999.00, 7, 6, 6, 5);
