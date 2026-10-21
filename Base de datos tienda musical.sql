create database musica;

use musica;

create table sucursales(
ID_sucursal int primary key auto_increment not null,
nombre varchar(25),
ID_calle int ,
usuario varchar(25),
contrasenia int,

foreign key (ID_calle) references calles(ID_calle)
);

create table categorias(
ID_categoria int primary key auto_increment not null,
nombre varchar(25),
cant_subcategorias int
);

create table calles(
ID_calle int primary key auto_increment not null,
nombre varchar(25),
altura int(4),
descripcion varchar(50),
ID_localidad int ,

foreign key (ID_localidad) references localidades(ID_localidad)
);

create table localidades(
ID_localidad int primary key auto_increment not null,
nombre varchar(25),
poblacion int,
codigo_postal int(4),
ID_provincia int,

foreign key (ID_provincia) references provincias(ID_provincia)
);

create table subcategorias(
ID_subcategoria int primary key auto_increment not null,
nombre varchar(25),
ID_categoria int,

foreign key (ID_categoria) references categorias(ID_categoria)
);

create table productos(
ID_producto int primary key auto_increment not null,
modelo varchar(25),
codigo int,
descripcion varchar(50),
precio_venta int,
ID_subcategoria int,
ID_marca int,
ID_artista int,
ID_proveedor int,
foreign key (ID_subcategoria) references subcategorias(ID_subcategoria),
foreign key (ID_marca) references marcas(ID_marca),
foreign key (ID_proveedor) references proveedores(ID_proveedor),
foreign key (ID_artista) references artistas(ID_artista)
);

create table marcas(
ID_marca int primary key auto_increment not null,
nombre varchar(25)
);

create table provincias(
ID_provincia int primary key auto_increment not null,
nombre varchar(25),
IVA int
);

create table ventas(
ID_venta int primary key auto_increment not null,
ID_sucursal int,
ID_cliente int,
ID_forma int,
fecha date,
tipo varchar(25),
ID_empleado int,
ID_producto int,
cantidad int,
precio_total int,

foreign key (ID_sucursal) references sucursales(ID_sucursal),
foreign key (ID_cliente) references clientes(ID_cliente),
foreign key (ID_forma) references formas_pago(ID_forma),
foreign key (ID_empleado) references empleados(ID_empleado),
foreign key (ID_producto) references productos(ID_producto)
);

create table empleados(
ID_empleado int primary key auto_increment not null,
nombre varchar(25),
apellido varchar(25),
sueldo int,
ID_sucursal int,
puesto int,

foreign key (ID_sucursal) references sucursales(ID_sucursales)
);

create table clientes(
ID_cliente int primary key auto_increment not null,
nombre varchar(25),
apellido varchar(25),
DNI int (8),
ID_calle int,
correo int,

foreign key (ID_calle) references calles(ID_calle)
);

create table formas_pago(
ID_forma int primary key auto_increment not null,
forma varchar(25),
proveedora varchar(25)
);

create table historial_precios(
ID_historial int primary key auto_increment not null,
ID_producto int,
precio_anterior int,
fecha_cambio date,

foreign key (ID_producto) references productos(ID_producto)
);

create table inventario(
ID_inventario int primary key auto_increment not null,
ID_producto int,
cantidad int,
ID_sucursal int,

foreign key (ID_producto) references productos(ID_producto),
foreign key (ID_sucursal) references sucursales(ID_sucursal)
);

create table puestos(
ID_puesto int primary key auto_increment not null,
nombre varchar(25),
sueldo int
);

create table proveedores(
ID_proveedor int primary key auto_increment not null,
nombre varchar(25),
ID_calle int,
correo int,

foreign key (ID_calle) references calles(ID_calle)
);

create table artistas(
ID_artista int primary key auto_increment not null,
nombre varchar(25),
genero_principal varchar(25),
RUAM varchar(25)
);

