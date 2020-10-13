<?php
session_start();
if (!isset($_SESSION['id']) or $_SESSION['isAdmin'] == 0) {
    header("Location: lk.php");
}
$title = 'Панель администратора';
require_once("../components/headerAdmin.php"); //Подключение файла
?>
<style>
    .file-preview {
        max-width: 150px;
    }

    .file-preview img {
        width: 100%;
        margin: 10px;
    }
</style>
<div class="container">
    <h1 class="text-center">Добавление товара</h1>
    <div class="row mt-4 justify-content-center">

        <form class="col-8" action="/components/add_product_obr.php" method="POST" enctype="multipart/form-data">
            <div class="input-group flex-nowrap mb-1">
                <div class="input-group-prepend icon">
                    <span class="input-group-text icon" id="addon-wrapping"><i class="fas fa-heading"></i></span>
                </div>
                <input type="text" class="form-control" name="title" placeholder="Название товара">
            </div>
            <div class="input-group flex-nowrap mb-1">
                <div class="input-group-prepend icon">
                    <span class="input-group-text icon" id="addon-wrapping"><i class="fas fa-tag"></i></span>
                </div>
                <input type="text" class="form-control" name="price" placeholder="Цена">
            </div>
            <div class="input-group flex-nowrap mb-1">
                <div class="input-group-prepend icon">
                    <span class="input-group-text" id="addon-wrapping"><i class="far fa-comment"></i></span>
                </div>
                <input type="text" class="form-control" name="count" placeholder="Коллитество в коробке">
            </div>
            <div class="input-group flex-nowrap mb-1">
                <div class="input-group-prepend icon">
                    <span class="input-group-text" id="addon-wrapping"><i class="fas fa-window-minimize"></i></span>
                </div>
                <input type="text" class="form-control" name="size" placeholder="Размер пряника">
            </div>
            <input type="file" class="form-control-file mb-1 form-image" name="picture">
            <div id='formPreview' class="file-preview"></div>
            <input type="submit" class="btn btn-primary btn-block" value="Добавить">
        </form>
    </div>
    <?php
    require_once("../components/footerAdmin.php"); //Подключение файла
    ?>