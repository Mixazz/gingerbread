<?php
require_once('db.php');
if (!$_GET['category']) {
    exit("Неверные данные");
}


if ($_GET['category'] == 1000) {
    $result = $mysqli->query("SELECT * FROM `products` WHERE 1 LIMIT 0, 13");
    $products = [];
    while ($row = $result->fetch_assoc()) {

        $products[] = $row;
    }
    exit(json_encode($products));
}

$categody_id = $_GET['category'];
$result = $mysqli->query("SELECT * FROM `products` JOIN `category-products` ON `products`.`id`=`category-products`.`id_product` WHERE `category-products`.`id_caregory`=$categody_id LIMIT 0, 13");
$products = [];
while ($row = $result->fetch_assoc()) {

    $products[] = $row;
}
exit(json_encode($products));
