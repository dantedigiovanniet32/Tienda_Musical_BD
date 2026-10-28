<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8">
<title>Productos</title>
<style>
  body { font-family: Arial, sans-serif; margin: 20px; }
  table { border-collapse: collapse; width: 100%; }
  th, td { border: 1px solid #ccc; padding: 6px 8px; text-align: left; font-size: 14px; }
  th { background: #eee; }
  img { max-width: 80px; max-height: 80px; }
</style>
</head>
<body>
<h1>Productos</h1>

<?php
$pdo = new PDO('mysql:host=127.0.0.1;dbname=data_base;charset=utf8mb4', 'root', '');
$productos = $pdo->query("SELECT * FROM productos ORDER BY id_producto")->fetchAll(PDO::FETCH_ASSOC);
?>

<table>
  <tr>
    <th>ID</th><th>Imagen</th><th>Modelo</th><th>Código</th><th>Precio</th>
  </tr>
  <?php foreach ($productos as $p): ?>
  <tr>
    <td><?= $p['id_producto'] ?></td>
    <td><?php if ($p['imagen_directorio']): ?><img src="<?= $p['imagen_directorio'] ?>" alt=""><?php endif; ?></td>
    <td><?= htmlspecialchars($p['modelo']) ?></td>
    <td><?= $p['codigo'] ?></td>
    <td>$<?= number_format($p['precio_venta'], 2) ?></td>
  </tr>
  <?php endforeach; ?>
</table>

</body>
</html>
