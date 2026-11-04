<?php
// Muestra los productos: todos, o filtrados por una subcategoria
include 'conexion.php';

$subcategoria = isset($_GET['sub']) ? (int)$_GET['sub'] : 0;

$sql = "SELECT p.id_producto, p.modelo, p.codigo, p.precio_venta,
               m.nombre AS marca, s.nombre AS subcategoria
        FROM productos p
        LEFT JOIN marcas m ON m.id_marca = p.id_marca
        LEFT JOIN subcategoria s ON s.id_subcategoria = p.id_subcategoria";

if ($subcategoria > 0) {
    $sql = $sql . " WHERE p.id_subcategoria = $subcategoria";
}

$sql = $sql . " ORDER BY s.nombre, p.modelo";

$resultado = $conexion->query($sql);

// Titulo de la seccion
if ($subcategoria > 0) {
    $consulta = $conexion->query("SELECT nombre FROM subcategoria WHERE id_subcategoria = $subcategoria");
    $fila = $consulta->fetch_assoc();
    $titulo = $fila['nombre'];
} else {
    $titulo = "Todos los productos";
}
?>

<main class="container-fluid px-4 py-4">
    <h2 class="h4 mb-1"><?php echo htmlspecialchars($titulo); ?></h2>
    <p class="text-muted mb-4"><?php echo $resultado->num_rows; ?> productos</p>

    <div class="row g-4">

        <?php if ($resultado->num_rows == 0) { ?>
            <div class="col-12">
                <div class="alert alert-secondary mb-0">No hay productos cargados en esta subcategoria.</div>
            </div>
        <?php } ?>

        <?php while ($producto = $resultado->fetch_assoc()) { ?>
            <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                <div class="card h-100 tarjeta-producto">

                    <!-- La imagen se pide a la base de datos con imagen.php -->
                    <img src="PHPs/imagen.php?id=<?php echo $producto['id_producto']; ?>"
                         class="card-img-top imagen-producto"
                         alt="<?php echo htmlspecialchars($producto['modelo']); ?>">

                    <div class="card-body d-flex flex-column">
                        <p class="text-muted small mb-1"><?php echo htmlspecialchars($producto['subcategoria']); ?></p>
                        <h3 class="h6 card-title mb-1"><?php echo htmlspecialchars($producto['modelo']); ?></h3>
                        <p class="text-muted small mb-2"><?php echo htmlspecialchars($producto['marca']); ?></p>
                        <p class="precio mt-auto mb-0">$ <?php echo number_format($producto['precio_venta'], 2, ',', '.'); ?></p>
                    </div>

                </div>
            </div>
        <?php } ?>

    </div>
</main>

<?php $conexion->close(); ?>
