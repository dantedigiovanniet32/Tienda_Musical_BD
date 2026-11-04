<?php
// Inicio de sesion de la empresa con CUDE y contrasenia
session_start();
include 'conexion.php';

$cude = $_POST['cude'] ?? '';
$contrasenia = $_POST['contrasenia'] ?? '';

$sql = "SELECT id_sucursal, nombre, contrasenia FROM sucursales WHERE cude = '$cude'";
$resultado = $conexion->query($sql);

if ($resultado->num_rows == 1) {
    $sucursal = $resultado->fetch_assoc();

    if ($sucursal['contrasenia'] == $contrasenia) {
        $_SESSION['empresa'] = 1;
        $_SESSION['empresa_id'] = $sucursal['id_sucursal'];
        $_SESSION['empresa_nombre'] = $sucursal['nombre'];

        $conexion->close();
        header("Location: ../index.php?vista=empresa");
        exit;
    }
}

$conexion->close();
header("Location: ../index.php?vista=empresa&error=1");
exit;
?>
