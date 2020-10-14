<?php


// Загрузка картинки на сервер
$path = "/img/products/";

// Обработка запроса
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Загрузка файла и вывод сообщения
    if (!copy($_FILES['picture']['tmp_name'], $_SERVER['DOCUMENT_ROOT'] . $path . $_FILES['picture']['name']))
        echo 'Что-то пошло не так';
    else
        echo 'Загрузка удачна ' . $_SERVER['DOCUMENT_ROOT'] . $path . $_FILES['picture']['name'];
}

$title = trim($_POST['title']);
$p_price = trim($_POST['price']);
$p_count = trim($_POST['count']);
$p_seze = trim($_POST['size']);
$img_url = $path . $_FILES['picture']['name'];

if (empty($title) || empty($p_price) || empty($p_count) || empty($p_seze) || empty($img_url)) {
    exit("Не все поля заполнены");
}

// Подключение к bd
require_once('db.php');

// добавление товара
$result = $mysqli->query("INSERT INTO `products`(`title`, `p_price`, `p_count`, `p_seze` , `img_url`) VALUES ('$title','$p_price','$p_count','$p_seze' ,'$img_url')");


if ($result) {
    exit("<script>window.location.href='/admin/admin.php'</script>");
} else {
    exit("Не удалось добавить товар в базу данных");
}
