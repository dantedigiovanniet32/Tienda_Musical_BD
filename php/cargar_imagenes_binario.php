<?php
require_once __DIR__ . '/conexion.php';

$carpeta = dirname(__DIR__) . '/images';
if (!is_dir($carpeta)) {
    exit('La carpeta images no existe.');
}

$contador = 0;
$iterador = new FilesystemIterator($carpeta, FilesystemIterator::SKIP_DOTS);

foreach ($iterador as $archivo) {
    if (!$archivo->isFile()) {
        continue;
    }

    $ext = strtolower($archivo->getExtension());
    if (!in_array($ext, ['png', 'jpg', 'jpeg', 'gif', 'webp'], true)) {
        continue;
    }

    $nombreArchivo = $archivo->getFilename();
    $contenido = file_get_contents($archivo->getPathname());

    if ($contenido === false) {
        continue;
    }

    $stmt = $conexion->prepare('UPDATE productos SET imagen_blob = ? WHERE nombre_img LIKE ? OR nombre_img = ?');
    $blob = null;
    $like = '%' . $nombreArchivo . '%';
    $stmt->bind_param('bss', $blob, $like, $nombreArchivo);
    $stmt->send_long_data(0, $contenido);

    if ($stmt->execute()) {
        $contador++;
    }

    $stmt->close();
}

echo "Se cargaron $contador imágenes en la base de datos.\n";
