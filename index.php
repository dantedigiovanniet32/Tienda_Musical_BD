
<?php
require_once __DIR__ . '/php/sesion.php';
require_once __DIR__ . '/php/conexion.php';

function formatear_precio($precio): string
{
    return '$' . number_format((float) $precio, 2, ',', '.');
}

$productos = $conexion->query(
    "SELECT p.id_producto, p.nombre_img, p.modelo, p.descripcion, p.precio_venta
     FROM productos p
     ORDER BY p.id_producto ASC"
)->fetch_all(MYSQLI_ASSOC);

$productos_baterias = $conexion->query(
    "SELECT p.id_producto, p.nombre_img, p.modelo, p.descripcion, p.precio_venta
     FROM productos p
     INNER JOIN subcategoria s ON s.id_subcategoria = p.id_subcategoria
     WHERE s.id_subcategoria = 1
     ORDER BY p.id_producto ASC
     LIMIT 2"
)->fetch_all(MYSQLI_ASSOC);

if (empty($productos)) {
    $productos = [];
}

if (empty($productos_baterias)) {
    $productos_baterias = [];
}
?>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Tienda de Música</title>
    <meta name="description" content="Instrumentos musicales y audio profesional" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="styles.css" />
  </head>
  <body class="shop-body">
    <div class="container shop-shell">
      <nav class="shop-topbar">
        <a class="shop-brand" href="index.php">Tienda de Música</a>
        <?php include __DIR__ . '/php/navegacion-cuenta.php'; ?>
        <a class="shop-category-btn" href="ejemplo-de-categoria.php">Categoría</a>
      </nav>

      <main class="shop-main">
        <h1 class="main-title">Instrumentos Musicales y<br />Audio Profesional</h1>

        <div class="info-button-wrap">
          <a href="#ofertas" class="btn btn-dark btn-rounded">Más info.</a>
        </div>

        <div class="hero-visual-grid">
          <div class="visual-card large-card">
            <img src="images/hero-image-264.png" alt="Guitarra eléctrica" />
          </div>
          <div class="visual-card compact-card">
            <img src="images/hero-image-367.png" alt="Instrumento de madera" />
          </div>
        </div>

        <section id="ofertas" class="offers-section">
          <h2>OFERTAS</h2>
          <div class="offers-grid">
            <?php foreach ($productos as $producto): ?>
              <a class="offer-card product-card-link" href="compra.php?id=<?= (int) $producto['id_producto'] ?>">
                <img src="<?= h($producto['nombre_img']) ?>" alt="<?= h($producto['modelo']) ?>" />
                <div class="offer-meta">
                  <h3><?= h($producto['modelo']) ?></h3>
                  <div class="offer-price-row">
                    <span class="offer-discount">Oferta</span>
                    <strong><?= formatear_precio($producto['precio_venta']) ?></strong>
                  </div>
                </div>
              </a>
            <?php endforeach; ?>
          </div>
        </section>

        <section class="catalog-mini-section">
          <div class="section-heading">
            <h2>Baterias Acusticas</h2>
          </div>

          <div class="mini-product-grid">
            <?php foreach ($productos_baterias as $producto): ?>
              <a class="mini-product-card product-card-link" href="compra.php?id=<?= (int) $producto['id_producto'] ?>">
                <img src="<?= h($producto['nombre_img']) ?>" alt="<?= h($producto['modelo']) ?>" />
                <h3><?= h($producto['modelo']) ?></h3>
                <p><?= h($producto['descripcion']) ?></p>
              </a>
            <?php endforeach; ?>
          </div>
        </section>

        <section class="category-section">
          <h2>Categorias</h2>
          <div class="category-row">
            <div class="category-box"><span>Guitarras</span></div>
            <div class="category-box"><span>Baterias</span></div>
            <div class="category-box"><span>Teclados</span></div>
            <div class="category-box"><span>Controladores DJ</span></div>
            <div class="category-box"><span>Micrófonos</span></div>
            <div class="category-box"><span>Equipo de Sonido</span></div>
            <div class="category-box"><span>Vinilos</span></div>
          </div>
        </section>
      </main>

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
