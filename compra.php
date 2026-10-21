
<?php require_once __DIR__ . '/php/sesion.php'; ?>
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
          <div class="gallery-strip">
            <img src="images/image-27-13.png" alt="Vista 1" />
            <img src="images/image-28-14.png" alt="Vista 2" />
            <img src="images/image-29-15.png" alt="Vista 3" />
          </div>
          <div class="main-product-image">
            <img src="images/image-27-13.png" alt="Batería Pearl Master Maple" />
          </div>
        </div>

        <div class="purchase-panel">
          <h1>Bateria Pearl Master Maple Complete Series 3 Cuerpos 923XSP Satin Natural Burst</h1>
          <div class="purchase-price">$4.578.195,98</div>

          <div class="purchase-actions">
            <button class="btn btn-light btn-arrow">‹</button>
            <button class="btn btn-light btn-arrow">›</button>
            <button class="btn btn-success btn-buy">Agregar al carrito</button>
          </div>
        </div>
      </main>

      <section class="description-section">
        <h2>Descripcion</h2>
        <p>
          Al crear Maple Complete Series, Pearl ha creado una representación de los 25 años de historia de Masters. El sonido que hizo de Masters una leyenda brilla hacia adelante. Con características mejoradas y un precio más bajo, Master Maple Complete es la declaración de percusión total para el baterista profesional.
        </p>
        <ul class="feature-list">
          <li>Marca: Pearl</li>
          <li>Modelo: Master Maple Complete Series</li>
          <li>Material: Maple</li>
          <li>Cuerpos: 3</li>
          <li>Medidas: B 22" x 16", TT 12" x 8", TF 16" x 16"</li>
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
