
<?php
require_once __DIR__ . '/php/sesion.php';
require_once __DIR__ . '/php/conexion.php';

function formatear_precio($precio): string
{
    return '$' . number_format((float) $precio, 2, ',', '.');
}

$idProducto = isset($_GET['id']) ? (int) $_GET['id'] : 1;

$stmt = $conexion->prepare(
    "SELECT p.id_producto, p.nombre_img, p.modelo, p.descripcion, p.precio_venta, p.codigo,
            m.nombre AS marca, s.nombre AS subcategoria
     FROM productos p
     LEFT JOIN marcas m ON m.id_marca = p.id_marca
     LEFT JOIN subcategoria s ON s.id_subcategoria = p.id_subcategoria
     WHERE p.id_producto = ?"
);
$stmt->bind_param('i', $idProducto);
$stmt->execute();
$producto = $stmt->get_result()->fetch_assoc();

if (!$producto) {
    $producto = $conexion->query(
        "SELECT p.id_producto, p.nombre_img, p.modelo, p.descripcion, p.precio_venta, p.codigo,
                m.nombre AS marca, s.nombre AS subcategoria
         FROM productos p
         LEFT JOIN marcas m ON m.id_marca = p.id_marca
         LEFT JOIN subcategoria s ON s.id_subcategoria = p.id_subcategoria
         ORDER BY p.id_producto ASC
         LIMIT 1"
    )->fetch_assoc();
}

$imagenPrincipal = $producto['nombre_img'] ?? 'images/image-27-13.png';
?>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Compra | Tienda de Música</title>
    <meta name="description" content="Detalle del producto y compra" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="styles.css" />
  </head>
  <body class="shop-body">
    <div class="container shop-shell thin-shell">
      <nav class="shop-topbar">
        <a class="shop-brand" href="index.php">Tienda de Música</a>
        <?php include __DIR__ . '/php/navegacion-cuenta.php'; ?>
        <a class="shop-category-btn" href="ejemplo-de-categoria.php">Categoría</a>
      </nav>

      <main class="product-page-main">
        <div class="product-gallery-panel">
          <div class="main-product-image">
            <img src="<?= h($imagenPrincipal) ?>" alt="<?= h($producto['modelo'] ?? 'Producto') ?>" />
          </div>
        </div>

        <div class="purchase-panel">
          <h1><?= h($producto['modelo'] ?? 'Producto') ?></h1>
          <div class="purchase-price"><?= formatear_precio($producto['precio_venta'] ?? 0) ?></div>

          <div class="purchase-actions">
            <button class="btn btn-light btn-arrow">‹</button>
            <button class="btn btn-light btn-arrow">›</button>
            <button class="btn btn-success btn-buy">Agregar al carrito</button>
          </div>
        </div>
      </main>

      <section class="description-section">
        <h2>Descripcion</h2>
        <p><?= h($producto['descripcion'] ?? 'Descripción del producto.') ?></p>
        <ul class="feature-list">
          <li>Marca: <?= h($producto['marca'] ?? 'Sin marca') ?></li>
          <li>Modelo: <?= h($producto['modelo'] ?? 'Sin modelo') ?></li>
          <li>Código: <?= h($producto['codigo'] ?? 'Sin código') ?></li>
          <li>Categoría: <?= h($producto['subcategoria'] ?? 'Sin categoría') ?></li>
        </ul>
      </section>

      <footer class="footer-main">
        <div class="footer-checker"></div>
        <div class="container footer-inner">
          <div class="footer-grid">
            <div class="footer-column">
              <div class="footer-brand">Tienda de Música</div>
              <p class="footer-description">
                Instrumentos, audio profesional y equipos para músicos, estudios y presentaciones en vivo.
              </p>
            </div>

            <div class="footer-column">
              <h3>Explorar</h3>
              <ul class="footer-links">
                <li><a href="index.php">Inicio</a></li>
                <li><a href="ejemplo-de-categoria.php">Categorías</a></li>
                <li><a href="compra.php">Productos</a></li>
                <li><a href="registro.php">Registrarse</a></li>
              </ul>
            </div>

            <div class="footer-column">
              <h3>Soporte</h3>
              <ul class="footer-links">
                <li><a href="login.php">Iniciar sesión</a></li>
                <li><a href="#">Envíos</a></li>
                <li><a href="#">Garantías</a></li>
                <li><a href="#">Contacto</a></li>
              </ul>
            </div>

            <div class="footer-column text-center">
              <h3>Creadores</h3>
              <ul class="footer-creators">
                <li>Leonel Alvarez</li>
                <li>Dante Di Giovanni</li>
                <li>Tomas Torres</li>
                <li>Tomas Lopez</li>
              </ul>
            </div>
          </div>

          <div class="footer-bottom">
            <div class="footer-copy">© 2026 Tienda de Música. Todos los derechos reservados.</div>
            <div class="social-row">
              <span class="social-icon">f</span>
              <span class="social-icon">◎</span>
              <span class="social-icon">in</span>
              <span class="social-icon">▶</span>
            </div>
          </div>
        </div>
      </footer>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
