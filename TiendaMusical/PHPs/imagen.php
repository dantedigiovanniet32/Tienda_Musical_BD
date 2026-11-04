<?php
// Muestra la imagen de un producto leyendo la ruta que esta guardada en la base de datos
include 'conexion.php';

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

$sql = "SELECT imagen_directorio FROM productos WHERE id_producto = $id";
$resultado = $conexion->query($sql);
$producto = $resultado->fetch_assoc();

if (!$producto || $producto['imagen_directorio'] == "") {
    http_response_code(404);
    exit;
}

// Se arma la ruta completa: carpeta de las imagenes + ruta guardada en la base
$archivo = $carpeta_imagenes . $producto['imagen_directorio'];

if (!file_exists($archivo)) {
    http_response_code(404);
    exit;
}

// Segun la extension se indica el tipo de imagen
$extension = strtolower(pathinfo($archivo, PATHINFO_EXTENSION));

if ($extension == "png") {
    header("Content-Type: image/png");
} elseif ($extension == "webp") {
    header("Content-Type: image/webp");
} elseif ($extension == "gif") {
    header("Content-Type: image/gif");
} else {
    header("Content-Type: image/jpeg");
}

readfile($archivo);
$conexion->close();
?>
