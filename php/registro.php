<?php
require_once __DIR__ . '/sesion.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: ../registro.php');
    exit();
}

if (!csrf_valido()) {
    header('Location: ../registro.php?estado=csrf');
    exit();
}

$nombre = trim((string) ($_POST['nombre'] ?? ''));
$correo = strtolower(trim((string) ($_POST['correo'] ?? '')));
$password = (string) ($_POST['password'] ?? '');
$passwordConfirm = (string) ($_POST['password_confirm'] ?? '');

if ($nombre === '' || strlen($nombre) > 100 || !filter_var($correo, FILTER_VALIDATE_EMAIL)
    || strlen($correo) > 190 || strlen($password) < 8 || strlen($password) > 72) {
    header('Location: ../registro.php?estado=datos');
    exit();
}

if (!hash_equals($password, $passwordConfirm)) {
    header('Location: ../registro.php?estado=coinciden');
    exit();
}

require_once __DIR__ . '/conexion.php';
$passwordHash = password_hash($password, PASSWORD_DEFAULT);

try {
    $insertar = $conexion->prepare('INSERT INTO usuarios (nombre, correo, password_hash) VALUES (?, ?, ?)');
    $insertar->bind_param('sss', $nombre, $correo, $passwordHash);
    $insertar->execute();
} catch (mysqli_sql_exception $error) {
    if ($error->getCode() === 1062) {
        header('Location: ../registro.php?estado=existe');
        exit();
    }

    error_log('Error al registrar usuario: ' . $error->getMessage());
    header('Location: ../registro.php?estado=conexion');
    exit();
}

header('Location: ../login.php?estado=registro');
exit();