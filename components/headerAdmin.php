<?php
session_start();
?>
<!doctype html>
<html lang="ru">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title><?= $title ?></title>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">Админка Anutacookie</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <?php if ($_SESSION['isAdmin']) : ?>
                        <a class="nav-item nav-link" href="add_product.php">Добавить товар</a>
                        <a class="nav-item nav-link" href="admin.php">Все товары</a>
                    <?php endif; ?>

                </div>
            </div>
            <?php if (isset($_SESSION['id'])) : ?>
                <a href="/components/exit.php" class="btn btn-primary">Выйти</a>
            <?php else : ?>
                <a href="index.php" class="btn btn-primary mr-1">Войти</a>
                <a href="reg.php" class="btn btn-primary">Реристрация</a>
            <?php endif; ?>
        </div>
    </nav>