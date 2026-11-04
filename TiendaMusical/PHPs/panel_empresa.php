<?php
session_start();
include 'conexion.php';

$logueado = isset($_SESSION['empresa']) && $_SESSION['empresa'] == 1;
?>

<main class="container py-4">

<?php if (!$logueado) { ?>

    <!-- No inicio sesion: se muestra el login y el formulario de registro -->
    <div class="row g-4">

        <div class="col-md-6">
            <div class="card border-dark">
                <div class="card-header bg-dark text-white">
                    <h2 class="h5 mb-0">Iniciar sesion (Empresa)</h2>
                </div>
                <div class="card-body">
                    <?php if (isset($_GET['error'])) { ?>
                        <div class="alert alert-danger py-2">CUDE o contrasenia incorrectos.</div>
                    <?php } ?>

                    <form action="PHPs/login.php" method="POST">
                        <div class="mb-3">
                            <label class="form-label">CUDE</label>
                            <input type="text" class="form-control" name="cude" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Contrasenia</label>
                            <input type="password" class="form-control" name="contrasenia" required>
                        </div>
                        <button type="submit" class="btn btn-dark w-100">Entrar</button>
                    </form>

                    <p class="text-muted small mt-3 mb-0">Datos de prueba: CUDE 1234 / contrasenia 1234</p>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card border-secondary">
                <div class="card-header bg-secondary text-white">
                    <h2 class="h5 mb-0">Registrar sucursal</h2>
                </div>
                <div class="card-body">
                    <?php if (isset($_GET['registro']) && $_GET['registro'] == 'ok') { ?>
                        <div class="alert alert-success py-2">Sucursal registrada correctamente.</div>
                    <?php } ?>
                    <?php if (isset($_GET['registro']) && $_GET['registro'] == 'error') { ?>
                        <div class="alert alert-danger py-2">No se pudo registrar la sucursal.</div>
                    <?php } ?>

                    <form action="PHPs/insert_sucursal.php" method="POST">
                        <div class="mb-2">
                            <label class="form-label">Nombre</label>
                            <input type="text" class="form-control" name="nombre" required>
                        </div>
                        <div class="mb-2">
                            <label class="form-label">CUDE</label>
                            <input type="text" class="form-control" name="cude" required>
                        </div>
                        <div class="mb-2">
                            <label class="form-label">Correo electronico</label>
                            <input type="email" class="form-control" name="correo" required>
                        </div>
                        <div class="mb-2">
                            <label class="form-label">Contrasenia</label>
                            <input type="password" class="form-control" name="contrasenia" required>
                        </div>
                        <div class="mb-2">
                            <label class="form-label">Telefono</label>
                            <input type="tel" class="form-control" name="telefono" required>
                        </div>
                        <button type="submit" class="btn btn-secondary">Guardar sucursal</button>
                    </form>
                </div>
            </div>
        </div>

    </div>

<?php } else { ?>

    <!-- Sesion iniciada: panel con los tres botones -->
    <div class="panel-empresa">
        <div class="d-flex justify-content-between align-items-center mb-4 border-bottom border-dark pb-2">
            <div>
                <h2 class="h4 mb-0">Panel de la empresa</h2>
                <small>Sucursal: <?php echo htmlspecialchars($_SESSION['empresa_nombre']); ?></small>
            </div>
            <a href="PHPs/logout.php" class="btn btn-outline-dark btn-sm">Cerrar sesion</a>
        </div>

        <h3 class="h6 text-uppercase">Productos</h3>
        <div class="row g-3">
            <div class="col-md-4">
                <button type="button" class="btn btn-dark w-100 py-3">Anadir producto</button>
            </div>
            <div class="col-md-4">
                <button type="button" class="btn btn-dark w-100 py-3">Modificar producto</button>
            </div>
            <div class="col-md-4">
                <button type="button" class="btn btn-dark w-100 py-3">Eliminar producto</button>
            </div>
        </div>
    </div>

<?php } ?>

</main>

<?php $conexion->close(); ?>
