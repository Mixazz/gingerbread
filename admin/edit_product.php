<?php
session_start();
if (!isset($_SESSION['id']) or $_SESSION['isAdmin'] == 0) {
    exit('Недостаточно прав');
}
$productId = $_GET['id'];


require_once("../components/db.php");
$result = $mysqli->query("SELECT `id`, `title`, `p_count`, `p_seze`, `p_price`, `img_url`, `show_product` FROM `products` WHERE `id` = '$productId'");
$product = $result->fetch_assoc();

?>

<?php
session_start();
if (!isset($_SESSION['id']) or $_SESSION['isAdmin'] == 0) {
    header("Location: index.php");
}
$title = 'Панель администратора';
require_once("../components/headerAdmin.php"); //Подключение файла
?>
<div class="container">
    <h1 class="text-center">Изменить товар <?= $product["title"] ?></h1>
    <div class="row mt-4 justify-content-center">
        <div class="col-3">
            <img class="w-100" src="<?= $product["img_url"] ?>" alt="">
        </div>
        <form class="col-9" action="/components/edit_product_obr.php" method="POST" enctype="multipart/form-data">
            <div class="input-group flex-nowrap mb-3">
                <div class="input-group-prepend icon">
                    <span class="input-group-text icon" id="addon-wrapping"><i class="fas fa-heading"></i></span>
                </div>
                <input type="text" class="form-control" name="title" placeholder="Название товара" value="<?= $product["title"] ?>">
            </div>
            <div class="input-group flex-nowrap mb-3">
                <div class="input-group-prepend icon">
                    <span class="input-group-text icon" id="addon-wrapping"><i class="fas fa-tag"></i></span>
                </div>
                <input type="text" class="form-control" name="price" placeholder="Цена" value="<?= $product["p_price"] ?>">
            </div>
            <div class="input-group flex-nowrap mb-3">
                <div class="input-group-prepend icon">
                    <span class="input-group-text" id="addon-wrapping"><i class="far fa-comment"></i></span>
                </div>
                <input type="text" class="form-control" name="count" placeholder="Коллитество в коробке" value="<?= $product["p_count"] ?>">
            </div>
            <div class="input-group flex-nowrap mb-3">
                <div class="input-group-prepend icon">
                    <span class="input-group-text" id="addon-wrapping"><i class="fas fa-window-minimize"></i></span>
                </div>
                <input type="text" class="form-control" name="size" placeholder="Размер пряника" value="<?= $product["p_seze"] ?>">
            </div>
            <div class="input-group flex-nowrap mb-3">
                <div class="form-group">
                    <select id="my-select" class="form-control" name="show">
                        <option value="1" <?= $product["show_product"] == 1 ? 'selected' : '' ?>>Показать</option>
                        <option value="0" <?= $product["show_product"] == 0 ? 'selected' : '' ?>>Скрыть</option>
                    </select>
                </div>
            </div>
            <input type="file" class="form-control-file mb-3" name="picture">
            <input type="text" class="form-control-file mb-3" name="id" value="<?= $product["id"] ?>" hidden>
            <input type="submit" class="btn btn-primary btn-block" value="Изменить">
            <!-- <button class="btn  btn-danger w-100 mt-1">Удалить</button> -->
        </form>
    </div>
    <?php
    require_once("../components/footerAdmin.php"); //Подключение файла
    ?>