<?php
// Registra una sucursal nueva
include 'conexion.php';

$nombre = $_POST['nombre'] ?? '';
$cude = $_POST['cude'] ?? '';
$correo = $_POST['correo'] ?? '';
$contrasenia = $_POST['contrasenia'] ?? '';
$telefono = $_POST['telefono'] ?? '';

$sql = "INSERT INTO sucursales (nombre, contrasenia, cude, correo, telefono)
        VALUES ('$nombre', '$contrasenia', '$cude', '$correo', '$telefono')";

if ($conexion->query($sql)) {
    $conexion->close();
    header("Location: ../index.php?vista=empresa&registro=ok");
    exit;
}

$conexion->close();
header("Location: ../index.php?vista=empresa&registro=error");
exit;
?>
