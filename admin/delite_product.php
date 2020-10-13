<?php
session_start();
if (!isset($_SESSION['id']) or $_SESSION['isAdmin'] == 0) {
    exit('Недостаточно прав');
}
$productId = $_GET['id'];


require_once("../components/db.php");


$delite = $mysqli->query("DELETE FROM `products` WHERE `id` = '$productId'");

if ($delite) {
    $_SESSION['message'] = 'Товар успешно удален';
    exit("ok");
} else {
    exit("Не удалось удалить товар");
}
