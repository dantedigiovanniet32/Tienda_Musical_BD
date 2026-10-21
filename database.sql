drop database if exists tienda_musical;
create database tienda_musical;
use tienda_musical;

drop table usuarios;
create table usuarios (
    id int unsigned auto_increment primary key,
    nombre varchar(100) not null,
    correo varchar(190) not null unique,
    password_hash varchar(255) not null,
    creado_en timestamp not null default current_timestamp
);