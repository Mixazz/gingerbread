<?php
session_start();
if (!isset($_SESSION['id']) or $_SESSION['isAdmin'] == 0) {
    header("Location: index.php");
}
$title = 'Все товары';
require_once("../components/headerAdmin.php"); //Подключение файла
?>
<div class="container">
    <div class="row">
        <div class="col-12">
            <!-- <?php if ($_SESSION['message_danger']) : ?>
                <div class="alert alert-danger" role="alert">
                    <?= $_SESSION['message_danger'] ?>
                </div>
            <?php unset($_SESSION['message_danger']);
                    endif; ?>
            <?php if ($_SESSION['message']) : ?>
                <div class="alert alert-success" role="alert">
                    <?= $_SESSION['message'] ?>
                </div>
            <?php unset($_SESSION['message']);
            endif; ?> -->
            <h1 class="text-center"><?= $title ?></h1>
        </div>

        <div class="col-12">
            <table class="table table-hover mt-3 products-table">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Название</th>
                        <th scope="col">Колличество</th>
                        <th scope="col">Размер</th>
                        <th scope="col">Цена</th>
                        <th scope="col">Показать/скрыть</th>
                        <th scope="col">Управление</th>

                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="/js/adminShowProducts.js" type="module"></script>
<?php
require_once('../components/footerAdmin.php');
?>