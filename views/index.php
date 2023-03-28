<?php
session_start();
?>

<!DOCTYPE HTML>
<html lang="es">
<head>
    <meta charset="utf-8"/>
    <title>MONOTICKET</title>
    <!-- Cargamos los estilos -->
    <link rel="stylesheet" href="assets/css/styles.css"/>
    <link rel="stylesheet" href="assets/css/modal.css"/>
    <link rel="stylesheet" href="assets/css/tooltip.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/movie.js"></script>
    <script src="js/review.js"></script>
    <script src="js/acordeon.js"></script>
</head>
<body>
<div id="container">
    <!-- CABECERA -->
    <?php include 'layout/header.php'; ?>

    <!-- Seccion nosotros -->
    <?php include 'complements/about.php'; ?>

    <!-- Seccion peliculas -->
    <?php include 'movie.php'; ?>

    <!-- Modal de comentarios -->
    <?php include 'review.php'; ?>

    <!-- PIE DE PAGINA -->
    <?php include 'views/layout/footer.php'; ?>

</div>
</body>

</html>