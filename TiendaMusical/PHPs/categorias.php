<?php
// Barra de categorias con sus subcategorias, todo sacado de la base de datos
include 'conexion.php';

$sql = "SELECT c.id_categoria, c.nombre AS categoria, s.id_subcategoria, s.nombre AS subcategoria
        FROM categoria c
        LEFT JOIN subcategoria s ON s.id_categoria = c.id_categoria
        ORDER BY c.id_categoria, s.id_subcategoria";

$resultado = $conexion->query($sql);

// Se guardan las categorias con sus subcategorias en un arreglo
$categorias = array();

while ($fila = $resultado->fetch_assoc()) {
    $id = $fila['id_categoria'];

    if (!isset($categorias[$id])) {
        $categorias[$id] = array(
            'nombre' => $fila['categoria'],
            'subcategorias' => array()
        );
    }

    if ($fila['id_subcategoria'] != null) {
        $categorias[$id]['subcategorias'][] = array(
            'id' => $fila['id_subcategoria'],
            'nombre' => $fila['subcategoria']
        );
    }
}
?>

<nav class="navbar navbar-expand-lg navbar-light bg-white barra-categorias">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menuCategorias"
                aria-controls="menuCategorias" aria-expanded="false" aria-label="Categorias">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="menuCategorias">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link fw-bold" href="index.php?vista=usuario">Todos</a>
                </li>
            </ul>

            <ul class="navbar-nav">
                <?php foreach ($categorias as $categoria) { ?>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                            <?php echo htmlspecialchars($categoria['nombre']); ?>
                        </a>
                        <ul class="dropdown-menu">
                            <?php foreach ($categoria['subcategorias'] as $sub) { ?>
                                <li>
                                    <a class="dropdown-item" href="index.php?vista=usuario&sub=<?php echo $sub['id']; ?>">
                                        <?php echo htmlspecialchars($sub['nombre']); ?>
                                    </a>
                                </li>
                            <?php } ?>
                        </ul>
                    </li>
                <?php } ?>
            </ul>
        </div>
    </div>
</nav>

<?php $conexion->close(); ?>
