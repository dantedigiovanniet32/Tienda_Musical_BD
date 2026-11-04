<?php
// Cierra la sesion de la empresa
session_start();
session_destroy();

header("Location: ../index.php?vista=empresa");
exit;
?>
