<?php
// Pagina principal: muestra la vista del usuario o la vista de la empresa
$vista = "usuario";

if (isset($_GET['vista']) && $_GET['vista'] == "empresa") {
    $vista = "empresa";
}

include 'Paginas/encabezado.html';

if ($vista == "empresa") {
    include 'PHPs/panel_empresa.php';
} else {
    include 'PHPs/categorias.php';
    include 'PHPs/productos.php';
}

include 'Paginas/pie.html';
?>
