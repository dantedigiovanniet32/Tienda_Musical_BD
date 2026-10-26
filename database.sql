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
