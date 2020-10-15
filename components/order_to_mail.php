<?php
$name = $_POST["name"];
$phone = $_POST["phone"];
$msg = $_POST["msg"];
$data_order = $_POST["data-order"];
$data_order = json_decode($data_order);
$summ = 0;
$order_message =  '<h3>Ваш заказ</h3><br>';
$order_message = $order_message . "Имя - $name<br>";
$order_message = $order_message . "Телефон - $name<br>";
$order_message = $order_message . "Сообщение - $name<br>";
$order_message = $order_message . "Имя - $name<br>";
$order_message = $order_message . "<b>Заказ:</b><br>";
for ($i = 0; $i < count($data_order); $i++) {
  $data = json_decode($data_order[$i]);
  $summ += $data->price * $data->count;
  $order_message = $order_message . "$data->title - Количество $data->count шт - Цена $data->price за штуку -  общая цена " . $data->price * $data->count . " руб<br>";
}
$order_message = $order_message . "Общая сумма заказа $summ рублей";

exit($order_message);
