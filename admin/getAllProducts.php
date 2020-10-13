<?php
session_start();
if (!isset($_SESSION['id']) || $_SESSION['isAdmin'] == 0) {
    exit('Недостаточно прав');
}
require_once('../components/db.php');

$result = $mysqli->query("SELECT `id`, `title`, `p_count`, `p_seze`, `p_price`, `img_url`, `show_product` FROM `products` WHERE 1");

for ($products = []; $row = $result->fetch_assoc(); $products[] = $row);
$response = json_encode($products);
exit($response);
