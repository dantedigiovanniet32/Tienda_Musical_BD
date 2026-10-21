<?php
require_once __DIR__ . '/php/sesion.php';

if (isset($_SESSION['usuario_id'])) {
  header('Location: cuenta.php');
  exit();
}

$mensajes = [
  'datos' => 'Correo o contraseña incorrectos.',
  'csrf' => 'La solicitud venció. Intenta nuevamente.',
  'conexion' => 'No fue posible completar la operación. Intenta más tarde.',
  'registro' => 'Tu cuenta quedó creada. Ya puedes iniciar sesión.',
  'salida' => 'Sesión cerrada correctamente.',
  'sesion' => 'Inicia sesión para continuar.',
];
$mensaje = $mensajes[$_GET['estado'] ?? ''] ?? '';
$esExito = in_array($_GET['estado'] ?? '', ['registro', 'salida'], true);
?>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Iniciar sesión | Tienda de Música</title>
    <meta name="description" content="Iniciar sesión en la tienda de música" />
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

      <main class="auth-page">
        <div class="auth-card">
          <h1>Iniciar sesión</h1>
          <p>Accede a tu cuenta para continuar con tus compras y favoritos.</p>

          <form class="auth-form" action="php/logica_login.php" method="post">
            <input type="hidden" name="csrf_token" value="<?= h($_SESSION['csrf_token']) ?>" />
            <div class="mb-3">
              <label for="email" class="form-label">Correo</label>
              <input type="email" class="form-control" id="email" name="correo" placeholder="tuemail@ejemplo.com" autocomplete="email" required />
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Contraseña</label>
              <input type="password" class="form-control" id="password" name="password" placeholder="••••••••" autocomplete="current-password" required />
            </div>
            <?php if ($mensaje !== ''): ?>
              <p class="auth-message<?= $esExito ? ' is-success' : '' ?>" role="status" aria-live="polite"><?= h($mensaje) ?></p>
            <?php endif; ?>
            <button type="submit" class="btn btn-dark w-100">Entrar</button>
          </form>

          <div class="auth-footer text-center">
            ¿No tienes cuenta? <a href="registro.php">Regístrate</a>
          </div>
        </div>
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
