<?php
$servidor = "localhost";
$usuario = "root";
$password = "";
$base_datos = "data_base";

// Carpeta donde estan las imagenes de los productos.
// Puede estar en cualquier lugar de la computadora.
$carpeta_imagenes = "C:/Users/dante/Desktop/New folder/imagenes/";

$conexion = new mysqli($servidor, $usuario, $password, $base_datos);

if ($conexion->connect_error) {
    die("Error de conexion: " . $conexion->connect_error);
}
$conexion->set_charset("utf8mb4");
?>
