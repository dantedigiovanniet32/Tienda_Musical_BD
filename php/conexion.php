<?php
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

try {
    $conexion = new mysqli('localhost', 'root', '', 'tienda_musical');
    $conexion->set_charset('utf8mb4');
} catch (mysqli_sql_exception $error) {
    error_log('Error de conexión a tienda_musical: ' . $error->getMessage());
    http_response_code(503);
    exit('La base de datos no está disponible. Importa database.sql y revisa php/conexion.php.');
}