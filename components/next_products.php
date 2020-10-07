<?php
require_once('db.php');
// Выборка по категории
// SELECT * FROM `products` JOIN `category-products` ON `products`.`id`=`category-products`.`id_product` WHERE `category-products`.`id_caregory`=9
$result = $mysqli->query("SELECT * FROM `products` WHERE 1 LIMIT 12, 12");
$products = [];
while ($row = $result->fetch_assoc()) {

    $products[] = $row;
}
exit(json_encode($products));
