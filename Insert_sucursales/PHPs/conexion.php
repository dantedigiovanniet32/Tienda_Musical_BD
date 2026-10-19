<?php
// .config
$servidor = "localhost";
//$port = '3306';
$usuario = "root";
$password = "";

//no olvidar, igual al nombre de la base de datos, #create database login_sql
$base_datos = "login_sql";

$conexion = new mysqli($servidor, $usuario, $password, $base_datos);
//$conexion = mysqliconnection(server, port, usuario, password, database)
//mysqsli_query($conexion, consulta)

if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}
