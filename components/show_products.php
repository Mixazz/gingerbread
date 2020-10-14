<?php
require_once('db.php');
$category = $_GET['category'];
$page = $_GET['page'];
$show_product = true;
// Выборка по категории
// SELECT * FROM `products` JOIN `category-products` ON `products`.`id`=`category-products`.`id_product` WHERE `category-products`.`id_caregory`=9

if ($_GET['category'] == 1000) {

    $result = $mysqli->query("SELECT * FROM `products` WHERE `products`.`show_product`=$show_product LIMIT $page, 13");
    $products = [];
    while ($row = $result->fetch_assoc()) {

        $products[] = $row;
    }
    exit(json_encode($products));
}
$result = $mysqli->query("SELECT * FROM `products` JOIN `category-products` ON `products`.`id`=`category-products`.`id_product` WHERE `category-products`.`id_caregory`=$category AND `products`.`show_product`=$show_product LIMIT $page, 13");
$products = [];
while ($row = $result->fetch_assoc()) {

    $products[] = $row;
}
exit(json_encode($products));
