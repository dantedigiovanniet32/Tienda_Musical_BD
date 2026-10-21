<?php
require_once __DIR__ . '/sesion.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: ../login.php');
    exit();
}

if (!csrf_valido()) {
    header('Location: ../login.php?estado=csrf');
    exit();
}

$correo = strtolower(trim((string) ($_POST['correo'] ?? '')));
$password = (string) ($_POST['password'] ?? '');

if (!filter_var($correo, FILTER_VALIDATE_EMAIL) || $password === '') {
    header('Location: ../login.php?estado=datos');
    exit();
}

require_once __DIR__ . '/conexion.php';

$consulta = $conexion->prepare('SELECT id, nombre, password_hash FROM usuarios WHERE correo = ? LIMIT 1');
$consulta->bind_param('s', $correo);
$consulta->execute();
$consulta->bind_result($usuarioId, $nombre, $passwordHash);

if (!$consulta->fetch() || !password_verify($password, $passwordHash)) {
    header('Location: ../login.php?estado=datos');
    exit();
}

$consulta->close();
session_regenerate_id(true);
$_SESSION['usuario_id'] = $usuarioId;
$_SESSION['usuario_nombre'] = $nombre;
$_SESSION['csrf_token'] = bin2hex(random_bytes(32));

header('Location: ../cuenta.php');
exit();