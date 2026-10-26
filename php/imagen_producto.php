<?php
require_once __DIR__ . '/conexion.php';

$idProducto = isset($_GET['id']) ? (int) $_GET['id'] : 0;
if ($idProducto <= 0) {
    http_response_code(400);
    exit('ID de producto inválido.');
}

$stmt = $conexion->prepare('SELECT imagen_blob, nombre_img FROM productos WHERE id_producto = ? LIMIT 1');
$stmt->bind_param('i', $idProducto);
$stmt->execute();
$resultado = $stmt->get_result()->fetch_assoc();

if (!$resultado || empty($resultado['imagen_blob'])) {
    $ruta = __DIR__ . '/../images/' . basename($resultado['nombre_img'] ?? 'image-27-13.png');
    if (is_file($ruta)) {
        $ext = strtolower(pathinfo($ruta, PATHINFO_EXTENSION));
        $mime = [
            'png' => 'image/png',
            'jpg' => 'image/jpeg',
            'jpeg' => 'image/jpeg',
            'gif' => 'image/gif',
            'webp' => 'image/webp',
            'svg' => 'image/svg+xml',
        ];
        header('Content-Type: ' . ($mime[$ext] ?? 'image/png'));
        readfile($ruta);
        exit;
    }

    http_response_code(404);
    exit('Imagen no disponible.');
}

$nombreArchivo = strtolower((string) basename($resultado['nombre_img'] ?? 'producto.png'));
$ext = pathinfo($nombreArchivo, PATHINFO_EXTENSION);
$mime = [
    'png' => 'image/png',
    'jpg' => 'image/jpeg',
    'jpeg' => 'image/jpeg',
    'gif' => 'image/gif',
    'webp' => 'image/webp',
    'svg' => 'image/svg+xml',
];

header('Content-Type: ' . ($mime[$ext] ?? 'image/png'));
header('Cache-Control: private, max-age=3600');
echo $resultado['imagen_blob'];
exit;
