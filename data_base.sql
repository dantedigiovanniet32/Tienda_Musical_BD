CREATE DATABASE data_base;
USE data_base;

CREATE TABLE provincias (
    id_provincia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    iva DECIMAL(5,2)
);

CREATE TABLE localidades_barrios (
    id_localidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    poblacion INT,
    codigo_postal VARCHAR(20),
    id_provincia INT,
    FOREIGN KEY (id_provincia) REFERENCES provincias(id_provincia)
);

CREATE TABLE calle (
    id_calle INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    altura INT,
    descripcion VARCHAR(255),
    id_localidad INT,
    FOREIGN KEY (id_localidad) REFERENCES localidades_barrios(id_localidad)
);

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

CREATE TABLE proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_calle INT,
    correo VARCHAR(100),
    FOREIGN KEY (id_calle) REFERENCES calle(id_calle)
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    dni VARCHAR(20),
    id_calle INT,
    correo VARCHAR(100),
    FOREIGN KEY (id_calle) REFERENCES calle(id_calle)
);

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY,
    nombre VARCHAR(100),
    cant_subcategorias INT
);

INSERT INTO categoria (id_categoria, nombre, cant_subcategorias) VALUES
(1, 'Guitarras', 4),
(2, 'Pianos', 4),
(3, 'Reproductores', 3),
(4, 'Bajos', 3),
(5, 'Baterias', 5),
(6, 'Otros Instrumentos', 9),
(7, 'Audio', 4),
(8, 'Accesorios', 3);

CREATE TABLE subcategoria (
    id_subcategoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

INSERT INTO subcategoria (nombre, id_categoria) VALUES
('Criollas', 1),
('Acusticas', 1),
('Electroacusticas', 1),
('Electricas', 1),
('Teclados', 2),
('Pianos Digitales', 2),
('Sintetizadores', 2),
('Pianos de Cola', 2),
('Vinilos', 3),
('CDs', 3),
('Cassettes', 3),
('Electricos', 4),
('Acusticos', 4),
('Pedales', 4),
('Acusticas', 5),
('Electroacusticas', 5),
('Banquetas', 5),
('Platillos', 5),
('Percucion', 5),
('Acordeones', 6),
('Clarinetes', 6),
('Flautas Traversas', 6),
('Flautas Dulces', 6),
('Saxos', 6),
('Trombones', 6),
('Trompetas', 6),
('Ukeleles', 6),
('Violines', 6),
('Auriculares', 7),
('Parlantes', 7),
('Microfonos', 7),
('Placas de Audio', 7),
('Fundas', 8),
('Cuerdas', 8),
('Estuches', 8);

CREATE TABLE marcas (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE artista (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    genero_principal VARCHAR(50),
    ruam VARCHAR(50)
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
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

CREATE TABLE inventario (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    cantidad INT,
    id_sucursal INT,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);

CREATE TABLE historial_precios (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    precio_anterior DECIMAL(10,2),
    fecha_cambio DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE formas_pago (
    id_forma INT AUTO_INCREMENT PRIMARY KEY,
    forma VARCHAR(50),
    proveedora VARCHAR(100)
);

CREATE TABLE puestos (
    id_puesto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    sueldo DECIMAL(10,2)
);

CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    id_sucursal INT,
    id_puesto INT,
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal),
    FOREIGN KEY (id_puesto) REFERENCES puestos(id_puesto)
);

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