<div class="shop-page-numbers" aria-label="Navegación de cuenta">
  <?php if (isset($_SESSION['usuario_id'])): ?>
    <a href="cuenta.php"><span>1</span><small>Mi cuenta</small></a>
    <form action="php/logout.php" method="post">
      <input type="hidden" name="csrf_token" value="<?= h($_SESSION['csrf_token']) ?>" />
      <button type="submit"><span>2</span><small>Cerrar sesión</small></button>
    </form>
  <?php else: ?>
    <a href="registro.php"><span>1</span><small>Registrarse</small></a>
    <a href="login.php"><span>2</span><small>Iniciar sesión</small></a>
  <?php endif; ?>
</div>