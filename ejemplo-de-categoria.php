
<?php require_once __DIR__ . '/php/sesion.php'; ?>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Baterias Acústicas | Tienda de Música</title>
    <meta name="description" content="Catálogo de baterías acústicas" />
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

      <main class="catalog-layout">
        <aside class="catalog-sidebar">
          <div class="catalog-filter">
            <h2>MARCA</h2>
            <div class="filter-arrow">›</div>
          </div>

          <div class="catalog-cards">
            <article class="catalog-item">
              <img src="images/image-120.png" alt="Bateria Pearl" />
              <div class="catalog-item-meta">
                <h3>Bateria Pearl</h3>
                <span class="badge-sale">43% OFF</span>
                <strong>$2.244.574,89</strong>
              </div>
            </article>

            <article class="catalog-item">
              <img src="images/image-132.png" alt="Bateria Thunder" />
              <div class="catalog-item-meta">
                <h3>Bateria Thunder</h3>
                <span class="badge-sale">43% OFF</span>
                <strong>$2.244.574,89</strong>
              </div>
            </article>

            <article class="catalog-item">
              <img src="images/image-138.png" alt="Bateria Acústica" />
              <div class="catalog-item-meta">
                <h3>Bateria Acústica</h3>
                <span class="badge-sale">20% OFF</span>
                <strong>$2.544.574,89</strong>
              </div>
            </article>

            <article class="catalog-item">
              <img src="images/image-144.png" alt="Bateria Pearl" />
              <div class="catalog-item-meta">
                <h3>Bateria Pearl</h3>
                <span class="badge-sale">70% OFF</span>
                <strong>$1.244.574,89</strong>
              </div>
            </article>
          </div>
        </aside>

        <section class="catalog-main-area">
          <h1>Baterias Acusticas</h1>

          <div class="catalog-grid">
            <article class="prod-box">
              <img src="images/image-120.png" alt="Bateria Thunder Azul" />
              <h3>Bateria Thunder Azul</h3>
              <span class="badge-sale">43% OFF</span>
              <strong>$2.244.574,89</strong>
            </article>

            <article class="prod-box">
              <img src="images/image-126.png" alt="Bateria Pearl" />
              <h3>Bateria Pearl</h3>
              <span class="badge-sale">43% OFF</span>
              <strong>$2.244.574,89</strong>
            </article>

            <article class="prod-box">
              <img src="images/image-132.png" alt="Bateria Thunder" />
              <h3>Bateria Thunder</h3>
              <span class="badge-sale">43% OFF</span>
              <strong>$2.244.574,89</strong>
            </article>

            <article class="prod-box">
              <img src="images/image-138.png" alt="Bateria Acústica" />
              <h3>Bateria Acústica</h3>
              <span class="badge-sale">20% OFF</span>
              <strong>$2.544.574,89</strong>
            </article>

            <article class="prod-box">
              <img src="images/image-144.png" alt="Bateria Pearl" />
              <h3>Bateria Pearl</h3>
              <span class="badge-sale">70% OFF</span>
              <strong>$1.244.574,89</strong>
            </article>

            <article class="prod-box">
              <img src="images/image-150.png" alt="Bateria Pearl" />
              <h3>Bateria Pearl</h3>
              <span class="badge-sale">60% OFF</span>
              <strong>$1.600.574,89</strong>
            </article>
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
